{
  inputs,
  lib,
  ...
}:
{

  flake-file.inputs = {
    flake-file.url = lib.mkDefault "github:vic/flake-file";

    nix-unit = {
      url = lib.mkDefault "github:nix-community/nix-unit";
      inputs.nixpkgs.follows = lib.mkDefault "nixpkgs";
      inputs.flake-parts.follows = lib.mkDefault "flake-parts";
    };

    treefmt-nix = {
      url = lib.mkDefault "github:numtide/treefmt-nix";
      inputs.nixpkgs.follows = lib.mkDefault "nixpkgs";
    };
  };

  imports = [
    (inputs.flake-file.flakeModules.dendritic or { })
    (inputs.nix-unit.modules.flake.default or { })
    (inputs.treefmt-nix.flakeModule or { })
  ];

}
