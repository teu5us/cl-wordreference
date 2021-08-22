{ pkgs ? import <nixpkgs> {} }:

with pkgs;
with (import ./bundle.nix { inherit pkgs; });

mkShell {
  buildInputs = [
    ql2nix
    lisp-bundle
  ];
  shellHook = ''
    export CL_SOURCE_REGISTRY=$CL_SOURCE_REGISTRY:${./.}
  '';
}
