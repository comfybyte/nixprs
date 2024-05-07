{ writeShellApplication, coreutils, libnotify, grim, slurp, ... }:
writeShellApplication {
  name = "sshot";
  text = builtins.readFile ./run.sh;
  runtimeInputs = [ coreutils libnotify grim slurp ];
}
