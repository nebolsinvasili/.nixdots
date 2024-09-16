{ lib, pkgs, systemSettings, userSettings, etc-nixos, ... }:

{

  imports = [
    ../../system/hardware/bootloader.nix
  ];

  
  
  ## Bootloader
  #boot.loader = {
  #  efi = {
  #    canTouchEfiVariables = if (systemSettings.bootMode == "uefi") then true else false;
  #  };
  #  grub = {
  #    enable = true;
  #    device = systemSettings.grubDevice;
  #    efiSupport = if (systemSettings.bootMode == "uefi") then true else false;
  #    useOSProber = true;
  #  };
  #};

  # Networking
  networking = {
    hostName = systemSettings.hostname; # Define your hostname.
    networkmanager.enable = true; # Use networkmanager
  };

  # Timezone and locale
  time.timeZone = systemSettings.timezone; # Set your time zone.
  i18n.defaultLocale = systemSettings.locale; # Select internationalisation properties.
  i18n.extraLocaleSettings = {
    LC_ADDRESS = systemSettings.locale;
    LC_IDENTIFICATION = systemSettings.locale;
    LC_MEASUREMENT = systemSettings.locale;
    LC_MONETARY = systemSettings.locale;
    LC_NAME = systemSettings.locale;
    LC_NUMERIC = systemSettings.locale;
    LC_PAPER = systemSettings.locale;
    LC_TELEPHONE = systemSettings.locale;
    LC_TIME = systemSettings.locale;
  };

  # User account
  users.users.${userSettings.username} = {
    isNormalUser = true;
    description = userSettings.name;
    extraGroups = [ "networkmanager" "wheel" "input" ];
    packages = with pkgs; [
      
    ];
    uid = 1000;
  };

  # System packages
  environment.systemPackages = with pkgs; [
    home-manager
    neofetch
    neovim
    ranger
    htop
    wget
    git
  ];
  
  # Setting shells.
  environment.shells = with pkgs; [ bash zsh fish ];
  users.defaultUserShell = pkgs.zsh;
  programs.zsh.enable = true;
  
  # Allow non-root users to specify the allow_other or allow_root mount options.
  programs.fuse.userAllowOther = true;
  
  # Enable CUPS to print documents.
  services.printing.enable = true;

  system.stateVersion = "24.05";
}
