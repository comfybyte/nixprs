{ stdenvNoCC, fetchzip, nerd-font-patcher, lib, ... }:
stdenvNoCC.mkDerivation rec {
  pname = "scientifica-nerd-font";
  version = "2.3";

  src = fetchzip {
    url =
      "https://github.com/nerdypepper/scientifica/releases/download/v${version}/scientifica.tar";
    sha256 = "sha256-1+dL7wQp+y3U/PDMJQaYeRzvOoNWgHoeja4E9AMccnM=";
  };
  nativeBuildInputs = [ nerd-font-patcher ];
  buildPhase = ''
    mkdir -p "$out"/share/fonts/truetype
    for file in $(ls "$src"/ttf | grep .ttf); do nerd-font-patcher -c -q --out "$out"/share/fonts/truetype "$src"/ttf/"$file"; done;
  '';

  meta = with lib; {
    description = "tall, condensed, bitmap font for geeks. (Nerd Font patched)";
    homepage = "https://github.com/nerdypepper/scientifica";
    license = licenses.ofl;
    platforms = platforms.unix;
  };
}
