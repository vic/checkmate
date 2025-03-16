{ inputs, ... }:
let
  flakeModule = {
    systems = import inputs.systems;
    imports = [
      inputs.flake-parts.flakeModules.flakeModules
      ./perSystem-lib.nix
      ./tests.nix
      ./treefmt.nix
    ];
  };
in
{
  imports = [ flakeModule ];
  flake.flakeModules.default = flakeModule;

  flake.lib.mkFlake =
    newInputs: newModule:
    inputs.flake-parts.mkFlake
      {
        inputs = inputs // newInputs // { target = newInputs.self; };
      }
      {
        imports = [
          newModule
          flakeModule
        ];
      };
}
