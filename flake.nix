{
  description = "Experimental improvements to the Elm command-line application.";

  outputs = { self, flake-utils, nixpkgs }:
    flake-utils.lib.eachDefaultSystem(system:
      let
        pkgs = import nixpkgs { inherit system; };
        elm = import ./elm.nix { stdenv = pkgs.stdenv; };
      in
      {
        packages.default = elm;
      }
    );
}
