{
  inputs.empty.url = "github:vic/empty-flake"; # example dependency

  outputs = _inputs: {

    # Example
    flakeModules.nix-unit =
      { ... }: # you can access inputs.target.inputs.empty from here
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
