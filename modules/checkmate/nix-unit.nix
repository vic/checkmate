{ inputs, lib, ... }:
{
  flake-file.inputs.nix-unit = {
    url = lib.mkDefault "github:nix-community/nix-unit";
    inputs.nixpkgs.follows = lib.mkDefault "nixpkgs";
    inputs.flake-parts.follows = lib.mkDefault "flake-parts";
  };

  imports = [
    (inputs.nix-unit.modules.flake.default or { })
  ];

  perSystem =
    { lib, ... }:
    {
      nix-unit = {
        allowNetwork = lib.mkDefault true;
        inputs = lib.mkDefault inputs;
      };
    };
}
