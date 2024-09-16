{
  pkgs,
  lib,
  config,
  ...
}:

let
  colors = builtins.readFile ./colors.ini;
  modules = builtins.readFile ./modules.ini;
  sh_weather = ./weather.sh;

in {
  options = {
    polybar.enable = lib.mkEnableOption "Enable polybar module";
  };
  config = lib.mkIf config.polybar.enable {
    services.polybar = {
      enable = true;
      script = "";
      package = pkgs.polybar.override {
        alsaSupport = true;
        iwSupport = true;
        githubSupport = true;
      };
      config = ./config.ini;
      extraConfig = colors + modules;
    };
  };
}
