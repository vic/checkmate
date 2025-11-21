{
  flake.flakeModule =
    { inputs, lib, ... }:
    {

      imports = [
        (inputs.flake-file.flakeModules.dendritic or { })
        (inputs.import-tree ./checkmate)
      ];

      flake-file.inputs.checkmate = {
        url = lib.mkDefault "github:vic/checkmate";
        inputs = {
          den.follows = "den";
          flake-aspects.follows = "flake-aspects";
          flake-file.follows = "flake-file";
          flake-parts.follows = "flake-parts";
          import-tree.follows = "import-tree";
          nix-unit.follows = "nix-unit";
          nixpkgs.follows = "nixpkgs";
          nixpkgs-lib.follows = "nixpkgs";
          systems.follows = "systems";
          target.follows = "target";
          treefmt-nix.follows = "treefmt-nix";
        };
      };
    };
}
