# Checkmate - A flake checker (treefmt & nix-unit) for testing other flakes with zero dependencies.

Checks include:

- treefmt - nixfmt, deadnix, mdformat, yamlfmt. See `treefmt.nix`.

- nix-unit - The flake being checked (ie, `inputs.target`) is expected to expose `flakeModules.nix-unit`:

```nix
# Example
flakeModules.nix-unit =
  { inputs, ... }:
  {
    perSystem = (
      { lib, ... }:
      {
        nix-unit.tests = {
          checkmate."test lib works" = {
            expr = lib.removeSuffix ".nix" "hello.nix";
            expected = "hello";
          };
        };
      }
    );
  };
```

### CI Usage

```
# On your github action
nix check github:checkmate --override-input target path:$PWD
```
