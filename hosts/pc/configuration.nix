{ lib, pkgs, systemSettings, userSettings, etc-nixos, ... }:
{
  imports = [
    ../../modules/programs
    ../../modules/system
    ../../modules/desktop
    ../../modules/nix.nix
    ../../modules/services.nix
  ];

  users.users = {
    ${userSettings.username} = {
      isNormalUser = true;
      description = userSettings.username;
      initialPassword = "qwerty";
      shell = pkgs.zsh;
      extraGroups = [
        "networkmanager"
        "wheel"
        "input"
      ];
    };
  };

  environment.systemPackages = with pkgs; [
    home-manager
    xclip
    neofetch
    yazi
    htop
    wget
    nitrogen
  ];

  system.stateVersion = "24.05";
}
