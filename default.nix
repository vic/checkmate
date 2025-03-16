{ inputs, ... }:
{
  imports = [
    inputs.flake-parts.flakeModules.flakeModules
    ./perSystem-lib.nix
    ./tests.nix
    ./treefmt.nix
  ];

  systems = import inputs.systems;
  flake.flakeModules.default = ./default.nix;
}
