{ pkgs, lib, config, ... }: 

{
  imports = [
    ./plugins/config/nvim-notify.nix
    ./plugins/config/nvim-cmp.nix
    ./plugins/config/nvim-dap.nix
    ./plugins/config/vim-illuminate.nix
    #./plugins/config/treesitter.nix
    ./plugins/config/nvim-colorizer.nix
    ./plugins/config/nvim-autopairs.nix
    #./plugins/config/indent-blankline.nix

    ./plugins/dashboard-nvim.nix
    ./plugins/neo-tree.nix
    ./plugins/bufferline.nix
    ./plugins/lualine.nix
      
    ./plugins/telescope.nix
     
    ./plugins/ledger.nix
    ./plugins/which-key.nix

    ./plugins/mappings.nix
 
    #./plugins/mini.nix
  ];

  options = {
    nixvim.enable = lib.mkEnableOption "Enable nixvim module";
  };
  config = lib.mkIf config.nixvim.enable {
    programs.nixvim = {
      enable = true;
      defaultEditor = true;

      # You can easily change to a different colorscheme.
      # Add your colorscheme here and enable it.
      # Don't forget to disable the colorschemes you arent using
      #
      # If you want to see what colorschemes are already installed, you can use `:Telescope colorschme`.
      colorschemes = {
        everforest.settings.transparent_background = 2;
        catppuccin = {
	  enable = true;
	  settings = {
	    transparent_background = true;
	    styles = {
	      comments = [ "italic" ];
	    };
	  };
	};
      };

      # https://nix-community.github.io/nixvim/NeovimOptions/index.html?highlight=globals#globals
      globals = {
        # Set <space> as the leader key
        # See `:help mapleader`
        mapleader = " ";
        maplocalleader = " ";

        # Set to true if you have a Nerd Font installed and selected in the terminal
        have_nerd_font = true;
      };

      # [[ Setting options ]]
      # See `:help vim.opt`
      # NOTE: You can change these options as you wish!
      #  For more options, you can see `:help option-list`
      # https://nix-community.github.io/nixvim/NeovimOptions/index.html?highlight=globals#opts
      opts = {
	#did_load_filetypes = 1;

	#filetype.extension.liq = "liquidsoap";
	
	wrap = false;
	linebreak = true;
	virtualedit = "block";
	undofile = true;
	swapfile = false;
	encoding = "utf-8";
	fileformat = "unix";

        # Show line numbers
        number = true;
        # You can also add relative line numbers, to help with jumping.
        #  Experiment for yourself to see if you like it!
        relativenumber = true;

        # Enable mouse mode, can be useful for resizing splits for example!
        mouse = "a";
	mousefocus = true;

        # Don't show the mode, since it's already in the statusline
        showmode = false;

	clipboard = "unnamedplus";

	shiftwidth = 2;
	tabstop = 2;
	softtabstop = 2;
	smartindent = true;
	cindent = true;
	smarttab = true;

	fillchars = {
	  vert = "│";
	  fold = "⠀";
	  eob = " "; # -- suppress ~ at EndOfBuffe;
	  diff = "⣿"; # -- alternatives = ⣿ ░ ─ 
	  msgsep = "‾";
	  foldopen = "▾";
	  foldsep = "│";
	  foldclose = "▸";
	};

        # Enable smart indenting (see https://stackoverflow.com/questions/1204149/smart-wrap-in-vim)
        breakindent = true;

	# Enable incremental searching

        # Enable ignorecase + smartcase for better searching
	ignorecase = true;
	smartcase = true; # Don't ignore case with capitals
	hlsearch = true;
	incsearch = true;
	grepprg = "rg"; # --vimgrep"
        grepformat = "%f:%l:%c:%m";
	
	# Keep signcolumn on by default
	signcolumn = "yes";

	# Decrease update time
	updatetime = 100;

	# Decrease mapped sequence wait time
	# Displays which-key popup sooner
	timeoutlen = 300;

	# Configure how new splits should be opened
	splitright = true;
	splitbelow = true;
	
	# Enable chars list
        #list = true; # Show invisible characters (tabs, eol, ...)
	#listchars = "eol:↲,tab:|->,lead:·,space: ,trail:•,extends:→,precedes:←,nbsp:␣";

	# Preview subsitutions live, as you type!
        inccommand = "split";

	# Show which line your cursor is on
        cursorline = true;

	# Minimal number of screen lines to keep above and below the cursor
	scrolloff = 3;
      };

#     extraConfigLua = ''
#	local parser_config = require("nvim-treesitter.parsers").get_parser_configs()
#
#	parser_config.liquidsoap = {
#	  filetype = "liquidsoap",
#	}
#'';

      plugins = {
        #lualine.enable = true;
	#sleuth = {
	#  enable = true;
	#};
      };
    };
  };
}
