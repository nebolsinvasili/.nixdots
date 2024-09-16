# shell.nix
let
  pkgs = import <nixpkgs> {};
in pkgs.mkShell {
  packages = with pkgs; [
    python310
    (poetry.override { python3 = python310; })
  ];
}
