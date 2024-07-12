{
  outputs = { nixpkgs, ... }:
    let
      systems = [ "x86_64-linux" "aarch64-linux" ];
      eachSystem = fn:
        nixpkgs.lib.genAttrs systems (s: fn nixpkgs.legacyPackages.${s});
    in { packages = eachSystem (pkgs: import ./packages pkgs); };

  inputs.nixpkgs.url = "github:nixos/nixpkgs/nixos-23.11";

  nixConfig = {
    extra-substituters = [ "https://comfybyte.cachix.org" ];
    extra-trusted-public-keys = [
      "comfybyte.cachix.org-1:MDOWRaQIVADC1iluO91OiGrC0gIG+iIe0koTGhYLycg="
    ];
  };
}
