{ inputs, ... }:
{
  perSystem = (
    { pkgs, ... }:
    let
      treefmt = inputs.treefmt-nix.lib.evalModule pkgs {
        projectRootFile = "flake.nix";
        programs.nixfmt.enable = true;
        programs.nixfmt.excludes = [ ".direnv" ];
        programs.deadnix.enable = true;
        programs.mdformat.enable = true;
        programs.yamlfmt.enable = true;
      };
      treefmt-wrapper = treefmt.config.build.wrapper;
      treefmt-check = treefmt.config.build.check inputs.mate;
    in
    {
      packages.checkmate-treefmt = treefmt-wrapper;
      checks.checkmate-treefmt = treefmt-check;
    }
  );
}
