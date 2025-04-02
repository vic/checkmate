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
      { pkgs, self', ... }:
      {
        packages.fmt = self'.formatter;
        packages.test = self'.checks.nix-unit;
        packages.test-fmt = self'.checks.treefmt;

        packages.default = pkgs.writeShellApplication {
          name = "flake-check";
          text = ''
            (
             if test -f checkmate/flake.nix; then
               cd checkmate
             fi
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
