{
  flake-file.inputs = {
    target.url = "github:vic/checkmate?dir=templates/dendritic";
    checkmate-modules.url = "github:vic/checkmate?dir=modules/checkmate";
    checkmate-modules.flake = false;
  };
}
