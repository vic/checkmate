# Checkmate - A flake checker (treefmt & nix-unit) for testing other flakes with zero dependencies.

Checks include:

- treefmt - nixfmt, deadnix, mdformat, yamlfmt. See `treefmt.nix`.

- nix-unit - The flake being checked (ie, `inputs.mate`) is expected to expose the following attribute:

```nix
# example from mate/flake.nix

# Expose a `nix-unit` module with `perSystem` class.
# see https://flake.parts/options/flake-parts-modules.html
modules.perSystem.nix-unit = { lib, ... }:
{
  nix-unit.tests.checkmate-mate."test lib works" = {
    expr = lib.removePrefix "hello" "hello.nix";
    expected = ".nix";
  };
};
```

### CI Usage

```
# On your github action
nix check github:checkmate --override-input mate path:$PWD
```
