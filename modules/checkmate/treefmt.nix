{ inputs, ... }:
{
  perSystem =
    { self', lib, ... }:
    {
      packages.fmt = self'.formatter;
      treefmt = {
        projectRoot = inputs.target;
        projectRootFile = "flake.nix";
        programs = {
          mdformat.enable = lib.mkDefault true;
          yamlfmt.enable = lib.mkDefault true;
          nixfmt.enable = lib.mkDefault true;
          deadnix.enable = lib.mkDefault true;
          nixf-diagnose.enable = lib.mkDefault true;
          prettier.enable = lib.mkDefault true;
        };
        settings.on-unmatched = lib.mkDefault "fatal";
        settings.global.excludes = [
          "LICENSE"
          "flake.lock"
          "*/flake.lock"
          ".envrc"
          ".direnv/*"
          "*/.gitignore"
          ".github/ISSUE_TEMPLATE/*"
        ];
      };
    };

}
