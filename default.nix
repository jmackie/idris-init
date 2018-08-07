let
    # Pin nixpkgs version.
    bootstrap = import <nixpkgs> {};
    nixpkgs = builtins.fromJSON (builtins.readFile ./nixpkgs.json);
    src = bootstrap.fetchFromGitHub {
        owner = "NixOS";
        repo  = "nixpkgs";
        inherit (nixpkgs) rev sha256;
    };
    pkgs = import src {};

    # Idris dependencies.
    idris = with pkgs.idrisPackages; with-packages [
        base
        prelude
        contrib
    ];
in
with pkgs; stdenv.mkDerivation {
    name = "hello";
    src = ./.;
    buildInputs = [
        idris
    ];
    builder = writeText "builder.sh" ''
        source $stdenv/setup
        mkdir -p $out/bin
        ${idris}/bin/idris -o $out/bin/$name $src/Hello.idr
    '';
}
