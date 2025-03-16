{ inputs, ... }:
let
  self = inputs.target;
  dep = self.inputs.dep; # access dependencies using target
in
{
  perSystem = (
    { lib, ... }:
    {
      nix-unit.tests = {
        checkmate."test access inputs via target" = {
          expr = lib.removePrefix "x86_64-" (lib.elemAt (import dep) 0);
          expected = "linux";
        };
      };
    }
  );
}
