{
  description = "selamat datang di nix";
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    u.url = "github:numtide/flake-utils";
  };
  outputs = inputs: inputs.u.lib.eachDefaultSystem (system:
    let
      pkgs = inputs.nixpkgs.legacyPackages.${system};

    in
    {
      devShells = {
        # nix develop 
        # empty
        default = pkgs.mkShell {
          buildInputs = [ ];
        };
        # nix develop .#python
        # same-thing: nix-shell -p python3
        python = pkgs.mkShell {
          buildInputs = [ pkgs.python3 ];
        };
        # nix develop .#nodejs
        # same-thing: nix-shell -p nodejs
        nodejs = pkgs.mkShell {
          buildInputs = [ pkgs.nodejs pkgs.nodePackages.yarn pkgs.nodePackages.pnpm ];
        };
        # nix develop .#go
        # same-thing: nix-shell -p go
        go = pkgs.mkShell {
          buildInputs = [ pkgs.go ];
        };
      };
    }
  );
}
