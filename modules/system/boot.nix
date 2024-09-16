{ systemSettings, ... }:
{
  # Bootloader.
  boot.loader.systemd-boot.enable = false;
  boot.loader.efi = {
    canTouchEfiVariables = if (systemSettings.bootMode == "bios") then false else true;
    efiSysMountPoint = systemSettings.bootMountPath; # ← use the same mount point here.
  };
  boot.loader.grub = {
    enable = true;
    efiSupport = if (systemSettings.bootMode == "bios") then false else true;
    device = systemSettings.grubDevice;
    useOSProber = true;
    default = 2;
  };
}
