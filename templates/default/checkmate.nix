{ inputs, ... }:
let
  self = inputs.target;
in
{
  perSystem.nix-unit.tests = {
    "test something" = {
      expr = self.lib.dup 33;
      expected = 66;
    };
  };
}
