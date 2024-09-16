{
  programs.nixvim = {
    plugins.illuminate = {
      enable = true;
      providers = [
        "lsp"
        "treesitter"
        "regex"
      ];
    };  
  };
}
