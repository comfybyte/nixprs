{
  inputs.nixpkgs.url = "github:nixos/nixpkgs/nixos-23.11";
  outputs = { nixpkgs, ... }:
    let
      systems = [ "x86_64-linux" "aarch64-linux" ];
      eachSystem = fn:
        nixpkgs.lib.genAttrs systems (s: fn nixpkgs.legacyPackages.${s});
    in { packages = eachSystem (pkgs: import ./packages pkgs); };
}
