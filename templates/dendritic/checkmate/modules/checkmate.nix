{ inputs, ... }:
{
  flake-file.inputs.target.url = "github:vic/checkmate?dir=templates/dendritic";
  imports = [ (inputs.checkmate.flakeModule or { }) ];
}
