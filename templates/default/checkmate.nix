{ inputs, ... }:
let
  self = inputs.target;
in
# dep = self.inputs.dep; # access dependencies using target
{
  perSystem = (
    { lib, ... }:
    {
      nix-unit.tests = {
        "test something" = {
          expr = self.lib.dup 33;
          expected = 66;
        };
      };
    }
  );
}
