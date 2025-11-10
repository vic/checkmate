{ inputs, ... }:
{
  flake.tests."test target lib works" = {
    expr = inputs.target.lib.dup 12;
    expected = 24;
  };
}
