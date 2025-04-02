{
  perSystem.nix-unit.tests = {
    checkmate."test fails" = {
      expr = 11;
      expected = 99;
    };
  };
}
