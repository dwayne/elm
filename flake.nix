{
  description = "It provides a wrapper script to unify all the Elm tools I use in my projects.";

  outputs = { self, flake-utils, nixpkgs }:
    flake-utils.lib.eachDefaultSystem(system:
      let
        pkgs = import nixpkgs { inherit system; };
        elm = pkgs.callPackage ./elm.nix {};
      in
      {
        packages.default = elm;
        apps.default = flake-utils.lib.mkApp { drv = elm; };
      }
    );
}
