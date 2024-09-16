{ pkgs, ... }:
{
  programs.nixvim ={
    plugins.treesitter = {
      enable = true;
      settings = {
        # NOTE: You can set whether `nvim-treesitter` should automatically install the grammars.
        auto_install = false;
        ensure_installed = "all";
        indent = {
          enable = true;
        };
        highlight.enable = true;
        parser_install_dir = {
          __raw = "vim.fs.joinpath(vim.fn.stdpath('data'), 'treesitter.parser')";
        };
        sync_install = false;
      };
    };
  };
}
