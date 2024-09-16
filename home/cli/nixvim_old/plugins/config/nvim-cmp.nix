{
  programs.nixvim = {
    plugins = {
      cmp = {
        enable = true;
        autoEnableSources = false;
        settings = {
          completion = {
            completeopt = "menu,menuone,noinsert";
          };
          formatting.expandable_indicator = true;

          sources = [
            {
              name = "nvim_lsp";
            }
            {
              name = "luasnip";
            }
            {
              name = "path";
            }
            {
             name = "buffer";
            }
          ];

          window = {
            completion.scrollbar = true;
          };

          # For an understanding of why these mappings were
          # chosen, you will need to read `:help ins-completion`
          #
          # No, but seriously, Please read `:help ins-completion`, it is really good!
        };
      };
      cmp-nvim-lsp.enable = true;
      cmp-path.enable = true;
      cmp-buffer.enable = true; 
      cmp-latex-symbols.enable = true;
    };
    keymaps = [
      {
        action = "cmp.mapping.select_next_item()";
        key = "<C-n>";
        options = {
          desc = "Select the [n]ext item";
        };
      }
    ];
          
          # Select the [p]revious item
          #"<C-p>" = "cmp.mapping.select_prev_item()";
          
          # Scroll the documentation window [b]ack / [f]orward
          #"<C-b>" = "cmp.mapping.scroll_docs(-4)";
          #"<C-f>" = "cmp.mapping.scroll_docs(4)";
          
          # Accept ([y]es) the completion.
          #  This will auto-import if your LSP supports it.
          #  This will expand snippets if the LSP sent a snippet.
          #"<C-y>" = "cmp.mapping.confirm { select = true }";
          
          # If you prefer more traditional completion keymaps,
          # you can uncomment the following lines.
          # "<CR>" = "cmp.mapping.confirm { select = true }";
          # "<Tab>" = "cmp.mapping.select_next_item()";
          # "<S-Tab>" = "cmp.mapping.select_prev_item()";

          # Manually trigger a completion from nvim-cmp.
          #  Generally you don't need this, because nvim-cmp will display
          #  completions whenever it has completion options available.
          #"<C-Space>" = "cmp.mapping.complete {}";

          # Think of <c-l> as moving to the right of your snippet expansion.
          #  So if you have a snippet that's like:
          #  function $name($args)
          #    $body
          #  end
          #
          # <c-l> will move you to the right of the expansion locations.
          # <c-h> is similar, except moving you backwards.
          #"<C-l>" = ''
          #  cmp.mapping(function()
          #    if luasnip.expand_or_locally_jumpable() then
          #      luasnip.expand_or_jump()
          #    end
          #  end, { 'i', 's' })
          #'';
          #"<C-h>" = ''
          #  cmp.mapping(function()
          #    if luasnip.locally_jumpable(-1) then
          #      luasnip.jump(-1)
          #    end
          #  end, { 'i', 's' })
          #'';

          # For more advanced Luasnip keymaps (e.g. selecting choice nodes, expansion) see:
          #    https://github.com/L3MON4D3/LuaSnip?tab=readme-ov-file#keymaps
  };
}
