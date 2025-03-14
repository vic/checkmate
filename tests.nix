{ inputs, lib, ... }:
{
  imports = [ inputs.mate.flakeModules.nix-unit ];

  # Example
  flake.flakeModules.nix-unit =
    { inputs, ... }:
    {
      perSystem = (
        { ... }:
        {
          nix-unit = {
            inherit inputs;
            tests.checkmate-core."test lib works" = {
              expr = lib.removeSuffix ".nix" "hello.nix";
              expected = "hello";
            };
          };
        }
      );
    };

}
