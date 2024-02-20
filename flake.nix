{
  description = "Hades nix System";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    home-manager.url = "github:nix-community/home-manager";
    utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, home-manager,utils }@inputs:
    let
    inherit (self.lib) attrValues makeOvveridable singleton optionalAttrs;

      system = "x86_64-linux";
      pkgs = import nixpkgs {
        inherit system;
      };
    in
    {
      # devShells.x86_64-linux = {
      #   default = pkgs.mkShell {
      #     buildInputs = [ ];
      #   };
      #
      #   python = pkgs.mkShell {
      #     buildInputs =
      #       [
      #         pkgs.bat
      #         pkgs.git pkgs.gdu ];
      #   };
      # };

      homeConfigurations = {
        hades = home-manager.lib.homeManagerConfiguration {
          inherit pkgs;
          modules = [ ./home/home.nix ];
        };
      };

      devShells.x86_64-linux = import ./devShells.nix { 
          pkgs = self.legacyPackages.${system};
        # inherit pkgs;   
          };
    };
}
