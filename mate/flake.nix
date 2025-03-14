{
  outputs = _: {

    # Expose a `nix-unit` module with `perSystem` class.
    # see https://flake.parts/options/flake-parts-modules.html
    modules.perSystem.nix-unit =
      { lib, ... }:
      {
        nix-unit.tests.checkmate-mate."test lib works" = {
          expr = lib.removePrefix "hello" "hello.nix";
          expected = ".nix";
        };
      };
  };
}
