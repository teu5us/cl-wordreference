{ pkgs ? import <nixpkgs> {} }:

with pkgs;

let
  lisp-bundle = (import ./bundle.nix { inherit pkgs; }).lisp-bundle;
  clwrapper = lispPackages.clwrapper;
in
stdenv.mkDerivation {
  name = "wordref";
  version = "0.0.1";
  src = ./.;
  buildInputs = [
    lisp-bundle
    openssl.out
  ];
  buildPhase = ''
    ASDF_OUTPUT_TRANSLATIONS="(:output-translations :ignore-inherited-configuration (t \"$(pwd)\"))"
    export ASDF_OUTPUT_TRANSLATIONS
    export CL_SOURCE_REGISTRY=$CL_SOURCE_REGISTRY:$(pwd)
    make LISP=${clwrapper}/bin/common-lisp.sh WORDREF=./wordref
  '';
  installPhase = ''
    mkdir -p "$out/bin"
    cp wordref "$out"/bin/
  '';
  dontConfigure = true;
  dontPatch = true;
  dontStrip = true;
}
