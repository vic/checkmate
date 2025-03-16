{ inputs, ... }:
let
  flakeModule = {
    systems = import inputs.systems;
    imports = [
      ./perSystem-lib.nix
      ./tests.nix
      ./treefmt.nix
    ];
  };

  # Tests are defined by target, and imported bellow by `inputs.target.flakeModules.nix-unit`.
  # See example/flake.nix or https://github.com/vic/import-tree/tree/main/checks/default.nix
  targetTest = inputs.target.flakeModules.nix-unit or { };
in
{
  imports = [
    flakeModule
    targetTest
  ];

  flake.flakeModules.default = flakeModule;
}
