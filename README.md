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

On your github action:

```yaml
on:
  pull_request:
  push:
    branches: [main]
jobs:
  flake-check:
    name: nix flake check
    runs-on: ubuntu-latest
    steps:
      - uses: cachix/install-nix-action@v30
      - run: nix flake check -L github:vic/checkmate --override-input target github:$GITHUB_REPOSITORY/
$GITHUB_SHA
```

As a fully working example, see:

https://github.com/vic/import-tree
