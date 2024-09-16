{ lib, config, pkgs, userSettings, ... }:

{
  imports = [
    ./plugins/ui/dashboard/default.nix
  ];

  options = {
    neovim.enable = lib.mkEnableOption "Enable neovim module";
  };

  config = lib.mkIf config.neovim.enable { 
    programs.neovim = {
      enable = true;
      defaultEditor = true;
      
      extraLuaConfig = ''
      ${builtins.readFile ./init.lua}
      ${builtins.readFile ./options.lua}
      '';
      
      extraConfig = ''
      '';
      
      viAlias = true;
      vimAlias = true;
      vimdiffAlias = true;
    };
  };
} 
