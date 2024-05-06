{ pkgs, writeShellApplication, ... }:
writeShellApplication {
  name = "sshot";
  text = builtins.readFile ./run.sh;
  runtimeInputs = with pkgs; [ coreutils libnotify grim slurp ];
}
