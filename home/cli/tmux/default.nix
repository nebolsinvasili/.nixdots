{
  pkgs,
  lib,
  config,
  ...
}:
{
  options = {
    tmux.enable = lib.mkEnableOption "Enable tmux module";
  };
  config = lib.mkIf config.tmux.enable {
    programs.tmux = {
      enable = true;
      terminal = "screen-256color";
      mouse = true;
      baseIndex = 1;
      prefix = "C-a";
      keyMode = "vi";
      shortcut = "a";
      historyLimit = 10000;
      shell = "${pkgs.zsh}/bin/zsh";
      plugins = with pkgs.tmuxPlugins; [
        yank
        sensible
        tmux-fzf
        vim-tmux-navigator
        {
          plugin = catppuccin;
	  extraConfig = ''
            set -g @catppuccin_status_background "default"

            set -g @catppuccin_window_left_separator ""
            set -g @catppuccin_window_right_separator " "
            set -g @catppuccin_window_middle_separator " █"
	    set -g @catppuccin_window_number_position "right"
	    set -g @catppuccin_window_default_fill "number"
	    set -g @catppuccin_window_default_text "#W"
	    set -g @catppuccin_window_current_fill "number"
	    set -g @catppuccin_window_current_text "#W#{?window_zoomed_flag,(),}"
	    set -g @catppuccin_status_modules_right "directory meetings date_time"
	    set -g @catppuccin_status_modules_left "session"
	    set -g @catppuccin_status_left_separator  " "
	    set -g @catppuccin_status_right_separator " "
	    set -g @catppuccin_status_right_separator_inverse "no"
	    set -g @catppuccin_status_fill "icon"
	    set -g @catppuccin_status_connect_separator "no"
	    set -g @catppuccin_directory_text "#{b:pane_current_path}"
	    set -g @catppuccin_meetings_text "#($HOME/.config/tmux/scripts/cal.sh)"
	    set -g @catppuccin_date_time_text "%H:%M"
	  '';
        }
      ];
      extraConfig = ''
        set -g status-position top
      '';
    };

    home.packages = with pkgs; [
      # https://github.com/edr3x/tmux-sessionizer?tab=readme-ov-file#tmux-sessionizer
      tmux-sessionizer
      # Script to find files with tmux in vim
      (writeShellScriptBin "tmux-sessionizer-script" ''
        if [[ $# -eq 1 ]]; then
            selected=$1
        else
            selected=$(find ~/projects ~/tests ~/ztm -mindepth 1 -maxdepth 1 -type d | fzf)
        fi

        if [[ -z $selected ]]; then
            exit 0
        fi

        selected_name=$(basename "$selected" | tr . _)
        tmux_running=$(pgrep tmux)

        if [[ -z $TMUX ]] && [[ -z $tmux_running ]]; then
            tmux new-session -s $selected_name -c $selected
            exit 0
        fi

        if ! tmux has-session -t=$selected_name 2> /dev/null; then
            tmux new-session -ds $selected_name -c $selected
        fi

        if [[ -z $TMUX ]]; then
            nvim "$selected"
            tmux kill-session -t $selected_name
        else
            nvim "$selected"
            tmux kill-session -t $selected_name
        fi
        '')
      ];
  };
}
