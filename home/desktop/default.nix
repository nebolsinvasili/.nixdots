{
  lib,
  config,
  ...
}: {
  imports = [
    ./polybar
  ];

  options = {
    desktop.enable = lib.mkEnableOption "Enable desktop module";
  };
  config = lib.mkIf config.desktop.enable {
    polybar.enable = lib.mkDefault false;
  };
}
