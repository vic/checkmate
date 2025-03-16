{
  inputs.dep.url = "github:nix-systems/x86_64-linux"; # example dependency

  outputs = _inputs: {

    # Example
    flakeModules.nix-unit =
      { inputs, ... }:
      {
        perSystem = (
          { lib, ... }:
          {
            nix-unit.tests = {
              checkmate."test access inputs via target" = {
                expr = lib.removePrefix "x86_64-" (lib.elemAt (import inputs.target.inputs.dep) 0);
                expected = "linux";
              };
            };
          }
        );
      };

  };

}
