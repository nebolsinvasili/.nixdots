#
# Run: nix develop . -c $SHELL
#
{
  inputs = {
    flake-utils.url = "github:numtide/flake-utils";
    nixpkgs.url = "github:nixos/nixpkgs/nixos-24.05";
    systems.url = "github:nix-systems/default";
    poetry2nix = {
      url = "github:nix-community/poetry2nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = {
    nixpkgs,
    systems,
    poetry2nix,
    ...
  }: 
  let
    forEachSystem = nixpkgs.lib.genAttrs (import systems);
  in {
    packages = forEachSystem (system: 
    let
      pkgs = nixpkgs.legacyPackages.${system};
      p2nix = poetry2nix.lib.mkPoetry2Nix {inherit pkgs;};
      python = pkgs.python311;
      poetry = (pkgs.poetry.override { inherit python; });
    in {
      default = p2nix.mkPoetryApplication {
        projectDir = ./.;
        preferWheels = true;
        checkPhase = ''
          ruff
          pytest
        '';
      };
      devShells.poetry = pkgs.mkShell {
	      packages = [
	        python
	        poetry
	      ];
      };
    });
  };
}
