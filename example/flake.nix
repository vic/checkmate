{
  outputs = _: {

    # Example
    flakeModules.nix-unit =
      { ... }:
      {
        perSystem = (
          { lib, ... }:
          {
            nix-unit.tests = {
              checkmate."test lib works" = {
                expr = lib.removeSuffix ".nix" "hello.nix";
                expected = "hello";
              };
            };
          }
        );
      };

  };

}
