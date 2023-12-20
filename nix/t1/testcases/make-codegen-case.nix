{ lib, jq, stdenv, rvv-codegen }:

{ caseName, xLen ? 32, vLen ? 1024, fp ? false, ... }@inputs:
stdenv.mkDerivation (rec {
  name = "${caseName}-codegen";

  dontUnpack = true;

  nativeBuildInputs = [ jq rvv-codegen ];

  NIX_CFLAGS_COMPILE = [
    "-mabi=ilp32f"
    "-march=rv32gcv"
    "-mno-relax"
    "-static"
    "-mcmodel=medany"
    "-fvisibility=hidden"
    "-nostdlib"
    "-fno-PIC"
    "-I${rvv-codegen}/include"
  ];

  buildPhase = ''
    runHook preBuild

    single \
      -VLEN ${toString vLen} \
      -XLEN ${toString xLen} \
      -configfile ${rvv-codegen}/configs/${caseName}.toml \
      -outputfile ${caseName}.S

    ${stdenv.targetPlatform.config}-cc ${caseName}.S -o ${name}.elf

    runHook postBuild
  '';

  installPhase = ''
    runHook preInstall

    mkdir -p $out/bin
    cp ${name}.elf $out/bin

    jq --null-input \
      --arg name ${caseName} \
      --arg type intrinsic \
      --argjson xLen ${toString xLen} \
      --argjson vLen ${toString vLen} \
      --argjson fp ${lib.boolToString fp} \
      --arg elfPath "$out/bin/${name}.elf" \
      '{ "name": "${name}", "type": $type, "xLen": $xLen, "vLen": $vLen, "fp": $fp, "elf": { "path": $elfPath } }' \
      > $out/${name}.json

    runHook postInstall
  '';

  dontFixup = true;
} // inputs)
