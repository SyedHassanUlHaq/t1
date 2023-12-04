# This file was generated by nvfetcher, please do not modify it manually.
{ fetchgit, fetchurl, fetchFromGitHub, dockerTools }:
{
  arithmetic = {
    pname = "arithmetic";
    version = "3792445857a590893cfb7bb9f0e4a10adb8b22a7";
    src = fetchFromGitHub {
      owner = "sequencer";
      repo = "arithmetic";
      rev = "3792445857a590893cfb7bb9f0e4a10adb8b22a7";
      fetchSubmodules = false;
      sha256 = "sha256-fBbfP05a0bk4yS1g3fGtzdi5U1dsjIXzJDBi97J2gQY=";
    };
    date = "2023-10-23";
  };
  berkeley-hardfloat = {
    pname = "berkeley-hardfloat";
    version = "b3c8a38c286101973b3bc071f7918392343faba7";
    src = fetchFromGitHub {
      owner = "ucb-bar";
      repo = "berkeley-hardfloat";
      rev = "b3c8a38c286101973b3bc071f7918392343faba7";
      fetchSubmodules = false;
      sha256 = "sha256-3j6K/qFuH8PqJT6zHVTIphq9HWxmSGoIqDo9GV1bxmU=";
    };
    date = "2023-10-25";
  };
  cde = {
    pname = "cde";
    version = "52768c97a27b254c0cc0ac9401feb55b29e18c28";
    src = fetchFromGitHub {
      owner = "chipsalliance";
      repo = "cde";
      rev = "52768c97a27b254c0cc0ac9401feb55b29e18c28";
      fetchSubmodules = false;
      sha256 = "sha256-bmiVhuriiuDFFP5gXcP2kKwdrFQ2I0Cfz3N2zed+IyY=";
    };
    date = "2023-08-05";
  };
  chisel = {
    pname = "chisel";
    version = "9d3a977dfcdb8c1d24281688f969c3de37d0067f";
    src = fetchFromGitHub {
      owner = "chipsalliance";
      repo = "chisel";
      rev = "9d3a977dfcdb8c1d24281688f969c3de37d0067f";
      fetchSubmodules = false;
      sha256 = "sha256-LeT6FvnKWxb/xLxOBpRHgWtHBzMRtCKU+FlOZtGrNLY=";
    };
    date = "2023-11-16";
  };
  rocket-chip = {
    pname = "rocket-chip";
    version = "aa183271e978d708d9c75617bd1e261b755b6726";
    src = fetchFromGitHub {
      owner = "chipsalliance";
      repo = "rocket-chip";
      rev = "aa183271e978d708d9c75617bd1e261b755b6726";
      fetchSubmodules = false;
      sha256 = "sha256-2yjMHC52c9oxL1dVPYIxzXjax9YQTA+d58x7YI95rZU=";
    };
    date = "2023-11-14";
  };
  rocket-chip-inclusive-cache = {
    pname = "rocket-chip-inclusive-cache";
    version = "7f391c5e4cba3cdd4388efb778bd80da35d5574a";
    src = fetchFromGitHub {
      owner = "chipsalliance";
      repo = "rocket-chip-inclusive-cache";
      rev = "7f391c5e4cba3cdd4388efb778bd80da35d5574a";
      fetchSubmodules = false;
      sha256 = "sha256-mr3PA/wlXkC/Cu/H5T6l1xtBrK9KQQmGOfL3TMxq5T4=";
    };
    date = "2023-08-15";
  };
  tilelink = {
    pname = "tilelink";
    version = "cd177e4636eb4a20326795a66e9ab502f9b2500a";
    src = fetchFromGitHub {
      owner = "sequencer";
      repo = "tilelink";
      rev = "cd177e4636eb4a20326795a66e9ab502f9b2500a";
      fetchSubmodules = false;
      sha256 = "sha256-PIPLdZSCNKHBbho0YWGODSEM8toRBlOYC2gcbh+gqIY=";
    };
    date = "2023-08-11";
  };
}
