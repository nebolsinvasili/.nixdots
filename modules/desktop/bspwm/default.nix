{
  pkgs, 
  ...
}: 

{

  services.xserver.windowManager.bspwm = {
      enable = true;
      configFile = ./bspwmrc;
      sxhkd.configFile = ./sxhkdrc;
  };
} 
