{
  flake.flakeModule =
    { inputs, lib, ... }:
    {
      imports = [
        (inputs.flake-file.flakeModules.dendritic or { })
        (inputs.import-tree ./checkmate)
      ];
      flake-file.inputs.checkmate.url = lib.mkDefault "github:vic/checkmate";
    };
}
