{ inputs, lib, ... }:
{
  flake-file.inputs.checkmate.url = lib.mkDefault "github:vic/checkmate";
  imports = [ (inputs.checkmate.flakeModule or { }) ];
}
