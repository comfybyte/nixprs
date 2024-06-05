{ stdenv, fetchurl, pkgs, ... }:
let version = "3.1.9";
in stdenv.mkDerivation {
  inherit version;
  pname = "zpix-pixel-nerd-font";

  src = fetchurl {
    url =
      "https://github.com/SolidZORO/zpix-pixel-font/releases/download/v${version}/zpix.ttf";
    sha256 = "2Kgw4Zqs/pibfQ3kXwUGV+g7GEDMurD4YApTUtus+eM=";
  };
  dontUnpack = true;

  nativeBuildInputs = [ pkgs.nerd-font-patcher ];
  buildPhase = ''
    mkdir -p "$out/share/fonts/truetype"
    nerd-font-patcher -c -q --out "$out/share/fonts/truetype" "$src"
  '';
}
