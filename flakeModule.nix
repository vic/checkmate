{ inputs, ... }:
{
  systems = import inputs.systems;
  imports = [
    ./tests.nix
    ./treefmt.nix
  ];
}
