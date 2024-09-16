{
  description = "System configuration";
  
  inputs = {
    etc-nixos = {
      url = "/etc/nixos";
      flake = false;
    };
    
    lix-module = {
      url = "https://git.lix.systems/lix-project/nixos-module/archive/2.90.0.tar.gz";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nixpkgs.url = "nixpkgs/nixos-unstable";
    nixpkgs-stable.url = "nixpkgs/nixos-24.05";

    home-manager-unstable = {
      url = "github:nix-community/home-manager/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    home-manager-stable = {
      url = "github:nix-community/home-manager/release-24.05";
      inputs.nixpkgs.follows = "nixpkgs-stable";
    };

    nixvim = {
      url = "github:nebolsinvasili/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs@{ self, etc-nixos, nixvim, ... }:
    let
      # ---- SYSTEM SETTINGS ---- #
      systemSettings = {
        hostname = "nixos";
	system = "x86_64-linux"; # system arch
        profile = "notebook"; # select a profile defined from my profiles directory
        timezone = "Europe/Moscow"; # select timezone
        locale = "ru_RU.UTF-8"; # select locale
        bootMode = "bios"; # uefi or bios
	bootMountPath = if (systemSettings.bootMode == "bios") then "/boot" else "/boot/efi"; # mount path for efi boot partition; only used for uefi boot mode
        grubDevice = "nodev"; # device identifier for grub; only used for legacy (bios) boot mode
        gpuType = "intel"; # amd, intel or nvidia; only makes some slight mods for amd at the moment
      };

      # ----- USER SETTINGS ----- #
      userSettings = rec {
        username = "nebolsinvasili"; # username
        name = "nebolsinvasili"; # name/identifier
        email = "nebolsinvasili@gmail.com"; # email (used for certain configurations)
	dotfilesDir = "~/.nixdots"; # absolute path of the local repo
	homeDirectory = "~/" + "${userSettings.username}";
	wm = "hyprland";#gnome"; # Selected window manager or desktop environment [hyprland];
	# must select one in both ./user/wm/ and ./system/wm/

        # window manager type (hyprland or x11) translator	
        wmType = if ((wm == "hyprland") || (wm == "plasma")) then "wayland" else "X11";

	term = "alacritty"; # Default terminal [ alacritty, kitty ];
	browser = "firefox";
        font = "JetBrains Mono"; # Selected font
        editor = "nvim"; # Default editor;
        # editor spawning translator
        # generates a command that can be used to spawn editor inside a gui
        # EDITOR and TERM session variables must be set in home.nix or other module
        # I set the session variable SPAWNEDITOR to this in my home.nix for convenience
        spawnEditor = if (editor == "emacsclient") then
                        "emacsclient -c -a 'emacs'"
                      else
                        (if ((editor == "vim") ||
                             (editor == "nvim") ||
                             (editor == "nano")) then
                               "exec " + term + " -e " + editor
                         else
                           editor);
      };

      # configure pkgs
      # use nixpkgs if running a server (homelab or worklab profile)
      # otherwise use patched nixos-unstable nixpkgs
    
      pkgs = (if ((systemSettings.profile == "default") || (systemSettings.profile == "notebook")) then
        pkgs-stable
      else
        pkgs-unstable   
      );

      pkgs-stable = import inputs.nixpkgs-stable {
        system = systemSettings.system;
        config = {
          allowUnfree = true;
          allowUnfreePredicate = (_: true);
        };
      };

      pkgs-unstable = import inputs.nixpkgs {
        system = systemSettings.system;
        config = {
          allowUnfree = true;
	  allowUnfreePredicate = (_: true);
        };
      };


      # configure lib
      # use nixpkgs if running a server (homelab or worklab profile)
      # otherwise use patched nixos-unstable nixpkgs
      lib = (if ((systemSettings.profile == "defailt") || (systemSettings.profile == "notebook"))
        then
          inputs.nixpkgs-stable.lib
        else
          inputs.nixpkgs.lib
      );


      # use home-manager-stable if running a server (homelab or worklab profile)
      # otherwise use home-manager-unstable
      home-manager = (if ((systemSettings.profile == "default") || (systemSettings.profile == "notebook"))
        then
          inputs.home-manager-stable
        else
          inputs.home-manager-unstable
      );

  in {
    nixosConfigurations.${systemSettings.hostname} = lib.nixosSystem {
      system = systemSettings.system;
      modules = [
        {
           imports = if (builtins.pathExists "${etc-nixos}/hardware-configuration.nix")
             then [ (import "${etc-nixos}/hardware-configuration.nix") ]
             else [];
           assertions = [
             {
               assertion = builtins.pathExists "${etc-nixos}/hardware-configuration.nix";
               message = "The hardware-configuration file is missing at ${etc-nixos}/hardware-configuration.nix";
             }
           ];
        }
        (./. + "/hosts" + ("/" + systemSettings.profile) + "/configuration.nix")
        inputs.lix-module.nixosModules.default
      ]; # load configuration.nix from selected PROFILE
      specialArgs = {
        # pass config variables from above
        inherit pkgs-stable;
        inherit systemSettings;
        inherit userSettings;
        inherit inputs;
      };
    };
    
    homeConfigurations = {
      ${userSettings.username} = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        modules = [
					(./. + ("/home") + "/home.nix") # load home.nix from selected PROFILE
        ];
	extraSpecialArgs = {
	  # pass config variables from above
          inherit pkgs-stable;
          inherit systemSettings;
          inherit userSettings;
          inherit inputs;
	};
      };
    };
  };
}
