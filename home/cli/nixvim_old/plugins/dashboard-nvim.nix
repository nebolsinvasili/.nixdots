{
  programs.nixvim = {
    plugins.dashboard = {
    # TODO: search for fix when free
    enable = true;
    settings = {
      theme = "doom";
      config = {
        header = [
  ""
  " ██████╗  █████╗ ███████╗██╗  ██╗██████╗  ██████╗  █████╗ ██████╗ ██████╗  "
  " ██╔══██╗██╔══██╗██╔════╝██║  ██║██╔══██╗██╔═══██╗██╔══██╗██╔══██╗██╔══██╗ "
  " ██║  ██║███████║███████╗███████║██████╔╝██║   ██║███████║██████╔╝██║  ██║ "
  " ██║  ██║██╔══██║╚════██║██╔══██║██╔══██╗██║   ██║██╔══██║██╔══██╗██║  ██║ "
  " ██████╔╝██║  ██║███████║██║  ██║██████╔╝╚██████╔╝██║  ██║██║  ██║██████╔╝ "
  " ╚═════╝ ╚═╝  ╚═╝╚══════╝╚═╝  ╚═╝╚═════╝  ╚═════╝ ╚═╝  ╚═╝╚═╝  ╚═╝╚═════╝  "
  ""
  ];
        center = [
            {
	            icon = "󰈞 ";
              icon_hl = "Titler";
              desc = "Find files";
              desc_hl = "String";
              key = "f";
              keymap = "SPC f f";
              key_hl = "Number";
              action = ":Telescope find_files";
            }
            {
			        icon = "󰱾 ";
              icon_hl = "Title";
              desc = "Open recently";
              desc_hl = "String";
              key = "r";
              keymap = "SPC f r";
              key_hl = "Number";
              action = ":Telescope oldfiles";
            }
            {
	            icon = " ";
              icon_hl = "Title";
              desc = "Find text";
              desc_hl = "String";
              key = "w";
              keymap = "SPC f w";
              key_hl = "Number";
              action = ":Telescope grep_string";
            }
            {
	            icon = " ";
              icon_hl = "Title";
              desc = "Git Braches";
              desc_hl = "String";
              key = "b";
              keymap = "SPC g b";
              key_hl = "Number";
              action = ":Telescope git_branches";
            }
            {
	            icon = "󰈆 ";
              icon_hl = "Title";
              desc = "Quit";
              desc_hl = "String";
              key = "q";
              keymap = "SPC q";
              key_hl = "Number";
              action = "<cmd>qall<CR>";
            }
          ];
        };
      };
    };
  };
}
