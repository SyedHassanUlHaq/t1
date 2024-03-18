{ lib, jq, stdenv, rvv-codegen, linkerScript, elaborateConfigJson }:

{ caseName, xLen ? 32, fp ? false, ... }@inputs:
let
  caseNameEscaped = builtins.replaceStrings [ "." ] [ "_" ] caseName;
in
stdenv.mkDerivation (rec {
  name = "codegen.${caseNameEscaped}";

  dontUnpack = true;

  nativeBuildInputs = [ jq ];

  NIX_CFLAGS_COMPILE = [
    "-mabi=ilp32f"
    "-march=rv32gcv"
    "-mno-relax"
    "-static"
    "-mcmodel=medany"
    "-fvisibility=hidden"
    "-nostdlib"
    "-fno-PIC"
    "-I${../../../tests/codegen/override_include}"
    "-I${rvv-codegen}/include"
    "-T"
    "${linkerScript}"
  ];

  configurePhase = ''
    export vLen=$(jq --exit-status --raw-output ".parameter.vLen" ${elaborateConfigJson})

    set -e
    is32BitLen=$(jq -r '.parameter.extensions[] | test("^\\w+ve32\\w*$")' ${elaborateConfigJson})
    if [[ "$is32BitLen" = "true" ]] ; then
      export xLen=32
    else
      export xLen=64
    fi

    echo "Set vLen=$vLen xLen=$xLen"
  '';

  buildPhase = ''
    runHook preBuild

    ${rvv-codegen}/bin/single \
      -VLEN "$vLen" \
      -XLEN "$xLen" \
      -repeat 16 \
      -testfloat3level 2 \
      -configfile ${rvv-codegen}/configs/${caseName}.toml \
      -outputfile ${caseNameEscaped}.S

    ${stdenv.targetPlatform.config}-cc ${caseNameEscaped}.S -o ${name}.elf

    runHook postBuild
  '';

  installPhase = ''
    runHook preInstall

    mkdir -p $out/bin
    cp ${name}.elf $out/bin
    cp ${caseNameEscaped}.S $out/bin  # for debugging

    jq --null-input \
      --arg name ${caseNameEscaped} \
      --arg type intrinsic \
      --argjson xLen "$xLen" \
      --argjson vLen "$vLen" \
      --argjson fp ${lib.boolToString fp} \
      --arg elfPath "$out/bin/${name}.elf" \
      '{ "name": "${name}", "type": $type, "xLen": $xLen, "vLen": $vLen, "fp": $fp, "elf": { "path": $elfPath } }' \
      > $out/${name}.json

    runHook postInstall
  '';

  meta.description = "Test case '${caseNameEscaped}', generated by [rvv-codegen](https://github.com/ksco/riscv-vector-tests).";

  dontFixup = true;
} // inputs)
