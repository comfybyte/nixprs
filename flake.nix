{
  description = "Some packages and small scripts used on my hosts.";
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };
  outputs = { nixpkgs, flake-utils, ... }:
    let inherit (flake-utils.lib) system eachSystem;
    in eachSystem [ system.x86_64-linux ] (system:
      let pkgs = import nixpkgs { inherit system; };
      in { packages = (import ./packages.nix) pkgs; });
}
