{ inputs, ... }:
{
  imports = [
    # Tests are defined by target, and imported bellow by `inputs.target.flakeModules.nix-unit`.
    # See example/flake.nix or https://github.com/vic/import-tree/tree/main/checks/default.nix
    inputs.target.flakeModules.nix-unit
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
