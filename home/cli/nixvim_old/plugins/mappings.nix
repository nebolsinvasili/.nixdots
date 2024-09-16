{
  programs.nixvim = {
    keymaps = [
      # -- Normal --
      # -- Standard Operations
      {
        key = "j";
        action = "v:count == 0 ? 'gj' : 'j'";
        options = {
          expr = true;
          silent = true;
          desc = "Move cursor down";
        };
      }
      {
        key = "j";
        action = "j";
        options = {
          desc = "Move cursor down";
        };
      }
      {
        key = "k";
        action = "v:count == 0 ? 'gk' : 'k'";
        options = {
          expr = true;
          silent = true;
          desc = "Move cursor up";
        };
      }
      {
        key = "k";
        action = "k";
        options = {
          desc = "Move cursor up";
        };
      }
      {
        key = "C-s";
        action = "<Cmd>w<CR>";
        options = {
          desc = "Save";
        };
      }
      {
        key = "<Leader>q";
        action = "<Cmd>confirm q<CR>";
        options = {
          desc = "Quit Window";
        };
      }
      {
        key = "<Leader>Q";
        action = "<Cmd>confirm qall<CR>";
        options = {
          desc = "Exit Nixvim";
        };
      }
      {
        key = "<Leader>n";
        action = "<Cmd>enew<CR>";
        options = {
          desc = "New File";
        };
      }
      {
        key = "<C-S>";
        action = "<Cmd>silent! update! | redraw<CR>";
        options = {
          desc = "Force write";
        };
      }
      {
        key = "<C-Q>";
        action = "<Cmd>q!<CR>";
        options = {
          desc = "Force quit";
        };
      }
      
      # -- Tabs
      # Tabs
      {
        mode = "n";
        key = "<leader><tab>l";
        action = "<cmd>tablast<cr>";
        options = {
          silent = true;
          desc = "Last tab";
        };
      }
      {
        mode = "n";
        key = "<leader><tab>f";
        action = "<cmd>tabfirst<cr>";
        options = {
          silent = true;
          desc = "First Tab";
        };
      }
      {
        mode = "n";
        key = "<leader><tab><tab>";
        action = "<cmd>tabnew<cr>";
        options = {
          silent = true;
          desc = "New Tab";
        };
      }
      {
        mode = "n";
        key = "<leader><tab>]";
        action = "<cmd>tabnext<cr>";
        options = {
          silent = true;
          desc = "Next Tab";
        };
      }
      {
        mode = "n";
        key = "<leader><tab>d";
        action = "<cmd>tabclose<cr>";
        options = {
          silent = true;
          desc = "Close tab";
        };
      }
      {
        mode = "n";
        key = "<leader><tab>[";
        action = "<cmd>tabprevious<cr>";
        options = {
          silent = true;
          desc = "Previous Tab";
        };
      }
      
      # -- Window
      # Windows
      {
        mode = "n";
        key = "<leader>ww";
        action = "<C-W>p";
        options = {
          silent = true;
          desc = "Other window";
        };
      }
      {
        mode = "n";
        key = "<leader>wd";
        action = "<C-W>c";
        options = {
          silent = true;
          desc = "Delete window";
        };
      }

      # -- Split windows
      {
        key = "<leader>w|";
        action = "<Cmd>vsplit<CR>";
        options = {
          desc = "Vertical Split";
        };
      }
      {
        key = "<leader>w-";
        action = "<Cmd>split<CR>";
        options = {
          desc = "Horizontal Split";
        };
      }

      # -- Comments
      {
        key = "<leader>/";
        action = "gcc";
        options = {
          remap = true;
          desc = "Toggle comment line";
        };
      }
      {
        key = "<leader>/";
        action = "gc";
        options = {
          remap = true;
          desc = "Toggle comment";
        };
      }

      # -- Split navigation
      # -- Move
      {
        key = "<C-H>";
        action = "<C-w>h";
        options = {
          desc = "Move to left split";
        };
      }
      {
        key = "<C-J>";
        action = "<C-w>j";
        options = {
          desc = "Move to below split";
        };
      }
      {
        key = "<C-K>";
        action = "<C-w>k";
        options = {
          desc = "Move to above split";
        };
      }
      {
        key = "<C-L>";
        action = "<C-w>l";
        options = {
          desc = "Move to right split";
        };
      }
      
      # -- Resize
      {
        key = "<C-Up>";
        action = "<Cmd>resize -2<CR>";
        options = {
          desc = "Resize split up";
        };
      }
      {
        key = "<C-Down>";
        action = "<Cmd>resize +2<CR>";
        options = {
          desc = "Resize split down";
        };
      }
      {
        key = "<C-Left>";
        action = "<Cmd>vertical resize -2<CR>";
        options = {
          desc = "Resize split left";
        };
      }
      {
        key = "<C-Right>";
        action = "<Cmd>vertical resize +2<CR>";
        options = {
          desc = "Resize split right";
        };
      }
      {
        mode = "v";
        key = "J";
        action = ":m '>+1<CR>gv=gv";
        options = {
          silent = true;
          desc = "Move up when line is highlighted";
        };
      }
      {
        mode = "v";
        key = "K";
        action = ":m '<-2<CR>gv=gv";
        options = {
          silent = true;
          desc = "Move down when line is highlighted";
        };
      }
      
      # Copy stuff to system clipboard with <leader> + y or just y to have it just in vim
      {
        mode = ["n" "v"];
        key = "<leader>y";
        action = "\"+y";
        options = {
          desc = "Copy to system clipboard";
        };
      }
      {
        mode = ["n" "v"];
        key = "<leader>Y";
        action = "\"+Y";
        options = {
          desc = "Copy to system clipboard";
        };
      }

      # Delete to void register
      {
        mode = ["n" "v"];
        key = "<leader>D";
        action = "\"_d";
        options = {
          desc = "Delete to void register";
        };
      }

    ];
  };
}
