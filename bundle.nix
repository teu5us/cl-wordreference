{ pkgs }:

with pkgs;

with (import (fetchFromGitHub {
  owner = "Teu5us";
  repo = "ql2nix";
  rev = "af815da56ca5a38b748f397e9e893e14e77a9a86";
  sha256 = "1f9w72l3lrckr4zj9i8xhv16nwywbh2zp2yr1wb7g6nhcll01h40";
}) { inherit pkgs; });

{
  inherit ql2nix;
  lisp-bundle = mkNixlispBundle {
    buildInputs = [ openssl.out ];
    envVars = {
      LD_LIBRARY_PATH = lib.makeLibraryPath [ openssl.out ];
    };
    qlDist = ./qlDist.nix;
  };
}
