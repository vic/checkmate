{ ... }:
{
  flake-file.inputs = {
    target.url = "path:..";
    checkmate-modules.url = "github:vic/checkmate?dir=modules/checkmate";
    checkmate-modules.flake = false;
  };
  # imports = [ (inputs.import-tree inputs.checkmate-modules) ];
}
