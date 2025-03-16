{ inputs, ... }:
{
  imports = [
    inputs.nix-unit.modules.flake.default
  ];

  perSystem = (
    { ... }:
    {
      nix-unit.allowNetwork = true;
      nix-unit.inputs = inputs;
    }
  );
}
