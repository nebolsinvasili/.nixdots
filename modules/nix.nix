{
  userSettings,
  pkgs,
  ...
}:
{
  
  nix = {
    package = pkgs.nixFlakes;
    extraOptions = "experimental-features = nix-command flakes";
    settings = {
      auto-optimise-store = true;
      http-connections = 50;
      warn-dirty = false;
      log-lines = 50;
      sandbox = "relaxed";
      trusted-users = [
        "${userSettings.username}"
      ];
      substituters = [
        "https://nix-community.cachix.org"
        "https://hyprland.cachix.org"
      ];
    };
    
    gc = {
      automatic = false;
      dates = "weekly";
      options = "--delete-older-than 7d";
    };
  };
  
  nixpkgs.config.allowUnfree = true;

}
