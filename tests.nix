{ inputs, lib, ... }:
{
  imports = [
    inputs.nix-unit.modules.flake.default
  ];

  perSystem.nix-unit = {
    allowNetwork = lib.mkDefault true;
    inputs = lib.mkDefault inputs;
  };
}
