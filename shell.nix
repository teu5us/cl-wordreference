{ pkgs ? import <nixpkgs> {} }:

with pkgs;

mkShell {
  buildInputs = [
    openssl.out
  ];
  LD_LIBRARY_PATH = lib.makeLibraryPath [ openssl.out ];
}
