{
  pkgs,
  lib,
  config,
  userSettings,
  ...
}:

{
  options = {
    shell.enable = lib.mkEnableOption "Enable Shell module";
  };
  config = lib.mkIf config.shell.enable {
    programs = {
      zsh = {
        enable = true;
        dotDir = ".config/zsh";
        enableCompletion = true;
        autosuggestion.enable = true;
        syntaxHighlighting.enable = true;
        shellGlobalAliases = {
          g = "git";
          ga = "git add";
          gaa = "git add .";
          gb = "git branch";
          gc = "git commit";
          gcm = "git commit --message";
          gco = "git checkout";
          gd = "git diff";
          gi = "git init";
          gp = "git pull";
          gs = "git status";
          nb = "nix-build";
          nd = "nix develop";
          nr = "nix run";
          ns = "nix-shell";
          
	  ls = "exa -lha";
          vi = "nvim";
	  vim = "nvim";
      	  
	  c = "clear";
      	  q = "exit";
      
      	  nixrebuild = "sudo nixos-rebuild switch --flake " + "${userSettings.dotfilesDir}";
      	  nixupdate = "home-manager switch --flake " + "${userSettings.dotfilesDir}";
	  nixlist = "sudo nix-env -p /nix/var/nix/profiles/system --list-generations";
      	  nixdelete = "sudo nix-collect-garbage -d";
	};
	
	history = {
	  ignoreAllDups = true;
	  path = "${config.xdg.dataHome}/zsh/history";
	  save = 10000;
	  size = 10000;
	  share = true;
	};
	historySubstringSearch = {
	  enable = true;
	};
        
        plugins = with pkgs; [
        
	];
        
        oh-my-zsh = {
          enable = true;
	  plugins = [ 
            "sudo"
            "git"
            "docker"
            "colored-man-pages"
            "command-not-found"
            "history-substring-search"
          ];

          extraConfig = ''
	    export EDITOR='nvim'
            export TERMINAL='kitty'
            export BROWSER='firefox'
            export TERM="xterm-256color"
            
	    PROMPT='%F{blue}  %1~%f%F{grey} ∮%  '
      
            if command -v tmux &> /dev/null && [ -n "$PS1" ] && [[ ! "$TERM" =~ screen ]] && [[ ! "$TERM" =~ tmux ]] && [ -z "$TMUX" ]; then
              exec tmux
            fi

	          function y() {
	            local tmp="$(mktemp -t "yazi-cwd.XXXXXX")"
	            yazi "$@" --cwd-file="$tmp"
	            if cwd="$(cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
		            builtin cd -- "$cwd"
	            fi
	            rm -f -- "$tmp"
            }
	        '';
        };
      };
    };
  };
}
