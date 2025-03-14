{
  outputs = _inputs: {

    # Example
    flakeModules.nix-unit =
      { inputs, ... }:
      {
        perSystem = (
          { lib, ... }:
          {
            nix-unit = {
              inherit inputs;
              tests.checkmate-mate."test lib works" = {
                expr = lib.removeSuffix ".nix" "hello.nix";
                expected = "hello";
              };
            };
          }
        );
      };

  };

}
