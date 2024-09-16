{
  lib,
  config,
  ...
}: {
  imports = [
    ./bat
    ./eza
    ./fd
    ./fzf
    ./tmux
    ./git
  ];

  options = {
    cli.enable = lib.mkEnableOption "Enable cli module";
  };
  config = lib.mkIf config.cli.enable {
    bat.enable = lib.mkDefault true;
    eza.enable = lib.mkDefault true;
    fd.enable = lib.mkDefault true;
    fzf.enable = lib.mkDefault true;
    tmux.enable = lib.mkDefault true;
    git.enable = lib.mkDefault true;
  };
}
