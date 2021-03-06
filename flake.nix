{
  description = "cl-wordreference";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils}:
    flake-utils.lib.eachDefaultSystem
      (system:
        let
          pkgs = nixpkgs.legacyPackages.${system};
        in
          {
            defaultPackage = import ./default.nix { inherit pkgs; };
            devShell = import ./shell.nix { inherit pkgs; };
          });
}
