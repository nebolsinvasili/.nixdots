{ 
  systemSettings, 
  ... 
}:

{

  networking = {
    hostName = systemSettings.hostname;
    networkmanager.enable = true;
  };

}
