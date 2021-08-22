{ pkgs ? import <nixpkgs> {} }:

with pkgs;
with (import ./bundle.nix { inherit pkgs; });

mkShell {
  buildInputs = [
    ql2nix
    lisp-bundle
  ];
}
