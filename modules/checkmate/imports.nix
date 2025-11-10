{ inputs, ... }:
let

  im =
    sub:
    let
      path = "${inputs.target}/${sub}";
    in
    if builtins.pathExists path then inputs.import-tree path else { };

in
{
  imports = [
    (im "checkmate.nix")
    (im "checkmate/modules")
  ];
}
