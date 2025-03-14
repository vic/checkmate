{ inputs, ... }:
{
  imports = [
    inputs.flake-parts.flakeModules.flakeModules
    inputs.flake-parts.flakeModules.modules
    inputs.nix-unit.modules.flake.default
    ./tests.nix
    ./treefmt.nix
  ];

  systems = import inputs.systems;

  flake.flakeModules.default = ./default.nix;
}
