{ inputs, ... }:
{
  systems = import inputs.systems;
  imports = [
    ./perSystem-lib.nix
    ./tests.nix
    ./treefmt.nix
  ];

  flake.templates.default = {
    description = "Sample flake";
    path = ./templates/default;
  };
}
