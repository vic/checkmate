{ lib, flake-parts-lib, ... }:
let
  inherit (lib)
    mkOption
    types
    ;
  inherit (flake-parts-lib)
    mkTransposedPerSystemModule
    ;
in
mkTransposedPerSystemModule {
  name = "lib";
  option = mkOption {
    type = types.attrs;
    default = { };
    description = ''
      exposed perSystem lib
    '';
  };
  file = ./perSystem-lib.nix;
}
