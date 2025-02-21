{
  description = "A package and application that unifies multiple Elm tools.";

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
