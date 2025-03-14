{ inputs, ... }:
{
  imports = [
    inputs.target.flakeModules.nix-unit
    inputs.flake-parts.flakeModules.flakeModules
    inputs.nix-unit.modules.flake.default
    ./treefmt.nix
  ];

  systems = import inputs.systems;

  flake.flakeModules.default = ./default.nix;

  perSystem = (
    { lib, ... }:
    {
      nix-unit.inputs =
        (lib.removeAttrs inputs [ "target" ]) // inputs.target.inputs // { self = inputs.target; };

      # Tests are defined by target, and imported bellow by `inputs.target.flakeModules.nix-unit`.
      # See example/flake.nix or https://github.com/vic/import-tree/tree/main/checks/default.nix
      nix-unit.tests = { };
    }
  );
}
