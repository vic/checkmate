inputs:
let
  functor =
    _: newInputs: newModule:
    inputs.flake-parts.lib.mkFlake
      {
        inputs =
          inputs
          // newInputs
          // {
            target = newInputs.self;
            checkmate = inputs.self // {
              inputs = inputs.self.inputs // {
                target = newInputs.self;
              };
            };
          };
      }
      {
        imports = [
          newModule
          ./flakeModule.nix
        ];
      };

  flake = inputs.flake-parts.lib.mkFlake { inherit inputs; } ./flakeModule.nix;

in
flake // { __functor = functor; }
