{ pkgs ? import <nixpkgs> {} }:

with pkgs;

let
  build = writeTextFile {
    name = "cl-wordreference-build.lisp";
    text = ''
      (require '#:asdf)
      (declaim (optimize (speed 3) (debug 0) (safety 0) (space 0) (compilation-speed 0)))
      (let* ((asdf:*central-registry* (cons (truename ".") asdf:*central-registry*))
             (uiop:*image-dump-hook* (cons (lambda () (asdf:clear-system system)) uiop:*image-dump-hook*)))
        (asdf:make :cl-wordreference))
    '';
  };
  lisp-bundle = (import ./bundle.nix { inherit pkgs; }).lisp-bundle;
  clwrapper = lispPackages.clwrapper;
in
stdenv.mkDerivation {
  name = "wordref";
  version = "0.0.1";
  src = ./.;
  buildInputs = [
    lisp-bundle
  ];
  buildPhase = ''
    ASDF_OUTPUT_TRANSLATIONS="(:output-translations :ignore-inherited-configuration (t \"$(pwd)\"))"
    export ASDF_OUTPUT_TRANSLATIONS
    NIX_LISP_SKIP_CODE=1 source "${clwrapper}/bin/common-lisp.sh" || true
    WORDREF=wordref ${clwrapper}/bin/common-lisp.sh --load "${build}"
  '';
  installPhase = ''
    mkdir -p "$out/bin"
    cp wordref "$out/bin"
  '';
  dontStrip = true;
}
