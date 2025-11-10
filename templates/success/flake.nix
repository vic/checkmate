{
  inputs.dep.url = "github:nix-systems/x86_64-linux"; # example dependency
  outputs = _: { flakeModules.checkmate = ./checkmate.nix; };
}
