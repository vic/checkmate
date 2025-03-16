{ inputs, ... }:
{
  systems = import inputs.systems;
  imports = [
    ./perSystem-lib.nix
    ./tests.nix
    ./treefmt.nix
  ];
}
