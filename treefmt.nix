{ inputs, ... }:
{
  imports = [ inputs.treefmt-nix.flakeModule ];

  perSystem = {
    treefmt = {
      projectRoot = inputs.target;
      projectRootFile = "flake.nix";
      programs.nixfmt.enable = true;
      programs.nixfmt.excludes = [ ".direnv" ];
      programs.deadnix.enable = true;
      programs.mdformat.enable = true;
      programs.yamlfmt.enable = true;
    };
  };

}
