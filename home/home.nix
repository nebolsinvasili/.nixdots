{
  inputs,
  pkgs,
  userSettings,
  ...
}: 

{
  
  home.username = userSettings.username;
  home.homeDirectory = "/home/"+userSettings.username;
  home.sessionVariables = {
    EDITOR = userSettings.editor;
    SPAWNEDITOR = userSettings.spawnEditor;
    TERM = userSettings.term;
    BROWSER = userSettings.browser;
  };
  home.stateVersion = "24.05";

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  imports = [
    ./apps
    ./cli
    ./rice
    ./system
    ./desktop
    #./tools
    #./virt
  ];

  apps.enable = true;
  cli.enable = true;
  rice.enable = true;
  system.enable = true;
  desktop.enable = true;
  #tools.enable = false;
  #virt.enable = false;

  nixpkgs = {
    config = {
      allowUnfree = true;
    };
  };
  
  home.packages = with pkgs; [
    neovim
    #inputs.nixvim.packages.${pkgs.system}.default
  ];

  # Add support for .local/bin
  home.sessionPath = [
    "$HOME/.local/bin"
  ];
}
