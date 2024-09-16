{
  programs.nixvim = {
    plugins.lualine = {
      enable = true;
      settings = {
        extensions = ["fzf"];
        sections = {
          lualine_a = ["mode"];
          lualine_b = [
            "branch"
            {
              icon = "";
            } 
          ];
          lualine_c = [
            "filename"
            "diff"
          ];
          lualine_x = [
            "encoding"
            "filetype"
          ];
          lualine_y = ["progress"];
          lualine_z = [
            {
              __unkeyed-1 = "location";
            }
          ];
        };
        options = {
          always_divide_middle = true;
          globalstatus = true;
          ignore_focus = ["neo-tree"];
          theme = "auto";
          component_separators = {
            left = "|";
            right = "|";
          };
          section_separators = {
            left =  "█"; # 
            right = "█"; # 
          };
        };
      };   
    };
  };
}
