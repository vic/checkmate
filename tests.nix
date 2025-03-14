{ inputs, ... }:
{
  imports = [
    inputs.target.flakeModules.nix-unit
    inputs.nix-unit.modules.flake.default
  ];

  perSystem = (
    { lib, ... }:
    {
      let
        fixedInputs = {
          inherit (inputs) flake-parts nix-unit nixpkgs nixpkgs-lib;
        };
      in
      nix-unit.inputs = fixedInputs;

      # Tests are defined by target, and imported bellow by `inputs.target.flakeModules.nix-unit`.
      # See example/flake.nix or https://github.com/vic/import-tree/tree/main/checks/default.nix
      nix-unit.tests = { };
    }
  );
}
