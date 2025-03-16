inputs:
let
  functor =
    _: target: newModule:
    inputs.flake-parts.lib.mkFlake
      {
        inputs = inputs // {
          inherit target;
          self = inputs.self // {
            inputs = inputs.self.inputs // {
              inherit target;
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
