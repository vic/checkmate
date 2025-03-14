{ inputs, ... }:
{
  perSystem = (
    { ... }:
    {
      imports = [ inputs.mate.modules.perSystem.nix-unit ];
      nix-unit = {
        inherit inputs;
      };
    }
  );

  flake.modules.perSystem.nix-unit =
    { lib, ... }:
    {
      nix-unit.tests.checkmate-core."test lib works" = {
        expr = lib.removeSuffix ".nix" "hello.nix";
        expected = "hello";
      };
    };
}
