{ pkgs, userSettings, ... }:

{

  home.username = userSettings.username;
  home.homeDirectory = "/home/"+userSettings.username;

  programs.home-manager.enable = true;

  home.sessionVariables = {
    EDITOR = userSettings.editor;
    SPAWNEDITOR = userSettings.spawnEditor;
    TERM = userSettings.term;
    BROWSER = userSettings.browser;
  };

  
  imports = [
    ../../system/app/zsh/zsh.nix
    ../../system/app/terminal/alacritty/alacritty.nix
    ../../system/app/tmux/tmux.nix
  ];
  
  home.packages = with pkgs; [
  
  ];
  
  home.file = {
  
  };

  home.stateVersion = "24.05";

}
