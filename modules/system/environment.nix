{
  pkgs, 
  ...
}: 

{

  environment = {
    variables = {
      EDITOR = "nvim";
    };
    sessionVariables = {
    };
  };
}
