{
  programs.nixvim = {
    # Neo-tree is a Neovim plugin to browse the file system
    # https://nix-community.github.io/nixvim/plugins/neo-tree/index.html?highlight=neo-tree#pluginsneo-treepackage
    plugins.neo-tree = {
      enable = true;
      enableDiagnostics = true;
      enableGitStatus = true;
      enableModifiedMarkers = true;
      enableRefreshOnWrite = true;
      closeIfLastWindow = true;
      popupBorderStyle = "rounded"; # Type: null or one of “NC”, “double”, “none”, “rounded”, “shadow”, “single”, “solid” or raw lua code
      buffers = {
        bindToCwd = false;
        followCurrentFile = {
          enabled = true;
        };
      };
      window = {
        width = 40;
        height = 15;
        autoExpandWidth = false;
        mappings = {
          "<space>" = "none";
        };
      };
    };
  keymaps = [
    {
      mode = "n";
      key = "<leader>e";
      action = "<cmd>Neotree toggle reveal_force_cwd<cr>";
      options = {
        silent = true;
        desc = "Explorer NeoTree (root dir)";
      };
    }
    {
      mode = "n";
      key = "<leader>E";
      action = "<cmd>Neotree toggle<CR>";
      options = {
        silent = true;
        desc = "Explorer NeoTree (cwd)";
      };
    }
    {
      mode = "n";
      key = "<leader>be";
      action = ":Neotree buffers<CR>";
      options = {
        silent = true;
        desc = "Buffer explorer";
      };
    }
    {
      mode = "n";
      key = "<leader>ge";
      action = ":Neotree git_status<CR>";
      options = {
        silent = true;
        desc = "Git explorer";
      };
    }
    {
      mode = "n";
      key = "<leader>o";
      action.__raw = ''
      function()
        if vim.bo.filetype == "neo-tree" then
          vim.cmd.wincmd "p"
        else
          vim.cmd.Neotree "focus"
        end
      end
      '';
      options = {
        silent = true;
        desc = "Explorer NeoTree Focus";
      };
    }
  ];
  };
}
