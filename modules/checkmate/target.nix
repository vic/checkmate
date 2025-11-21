{ lib, ... }:
{
  flake-file.inputs.target.url = lib.mkDefault "github:vic/checkmate?dir=templates/success";
}
