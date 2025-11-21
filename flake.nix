# DO-NOT-EDIT. This file was auto-generated using github:vic/flake-file.
# Use `nix run .#write-flake` to regenerate it.
{

  outputs = inputs: inputs.flake-parts.lib.mkFlake { inherit inputs; } (inputs.import-tree ./modules);

  inputs = {
    checkmate = {
      inputs = {
        den.follows = "den";
        flake-aspects.follows = "flake-aspects";
        flake-file.follows = "flake-file";
        flake-parts.follows = "flake-parts";
        import-tree.follows = "import-tree";
        nix-unit.follows = "nix-unit";
        nixpkgs.follows = "nixpkgs";
        nixpkgs-lib.follows = "nixpkgs";
        systems.follows = "systems";
        target.follows = "target";
        treefmt-nix.follows = "treefmt-nix";
      };
      url = "github:vic/checkmate";
    };
    den.url = "github:vic/den";
    flake-aspects.url = "github:vic/flake-aspects";
    flake-file.url = "github:vic/flake-file";
    flake-parts = {
      inputs.nixpkgs-lib.follows = "nixpkgs-lib";
      url = "github:hercules-ci/flake-parts";
    };
    import-tree.url = "github:vic/import-tree";
    nix-unit = {
      inputs = {
        flake-parts.follows = "flake-parts";
        nixpkgs.follows = "nixpkgs";
      };
      url = "github:nix-community/nix-unit";
    };
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    nixpkgs-lib.follows = "nixpkgs";
    systems.url = "github:nix-systems/default";
    target.url = "github:vic/checkmate?dir=templates/success";
    treefmt-nix = {
      inputs.nixpkgs.follows = "nixpkgs";
      url = "github:numtide/treefmt-nix";
    };
  };

}
