{
  inputs.nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
  outputs = { nixpkgs, ... }:
    let
      systems = [ "x86_64-linux" "aarch64-linux" ];
      eachSystem = fn:
        nixpkgs.lib.genAttrs systems (s: fn nixpkgs.legacyPackages.${s});
    in { packages = eachSystem (pkgs: import ./packages.nix pkgs); };
}
