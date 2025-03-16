{
  outputs = _: {
    lib.dup = x: x * 2;
    flakeModules.checkmate = ./checkmate.nix;
  };
}
