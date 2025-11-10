{ inputs, ... }:
{
  systems = import inputs.systems;
  imports = [
    ./tests.nix
    ./treefmt.nix
  ];

  perSystem =
    { pkgs, self', ... }:
    {
      packages.fmt = self'.formatter;

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
}
