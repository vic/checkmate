{ inputs, ... }:
let
  checkmate =
    inputs.target.flakeModules.checkmate or (
      if builtins.pathExists "${inputs.target}/checkmate.nix" then
        "${inputs.target}/checkmate.nix"
      else
        { }
    );

  newFlake = inputs.flake-parts.lib.mkFlake { inherit inputs; } {
    imports = [
      ./flakeModule.nix
      checkmate
    ];
    perSystem =
      { pkgs, ... }:
      {
        packages.default = pkgs.writeShellApplication {
          name = "flake-check";
          text = ''
            (
             test -f checkmate/flake.nix && cd checkmate || true
             nix flake update target
             nix flake check
            )
          '';
        };
      };
  };
in
{
  imports = [
    ./flakeModule.nix
    checkmate
  ];

  flake.lib.newFlake = newFlake;

  flake.flakeModule = ./flakeModule.nix;

  flake.templates.default = {
    description = "Sample flake";
    path = ./templates/default;
  };
}
