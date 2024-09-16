{
  lib,
  config,
  ...
}: {
  imports = [
  
  ];

  options = {
    rice.enable = lib.mkEnableOption "Enable rice module";
  };
  config = lib.mkIf config.rice.enable {
  
  };
}
