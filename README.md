# Checkmate - A flake checker (treefmt & nix-unit) for testing other flakes with zero dependencies.

Checks include:

- treefmt - nixfmt, deadnix, mdformat, yamlfmt. See `treefmt.nix`.

- nix-unit - The flake being checked (ie, `inputs.target`) is expected to expose `flakeModules.checkmate`:

````nix
# Example
flakeModules.checkmate =
  { inputs, ... }:
  let
    self = inputs.target; # your flake being tested
    some-dep = self.inputs.some-dep; # access your flake dependencies via the target.
  in
  {
    perSystem = (
      { lib, pkgs, ... }:
      {
        nix-unit.tests = {
          "test lib works" = {
            expr = lib.removeSuffix ".nix" "hello.nix";
            expected = "hello";
          };
        };

        # add any other derivations to check
        # checks.<name> = <derivation>;
      }
    );
  };

### Running treefmt on your code

```shell
# formatting your code
nix run github:vic/checkmate#treefmt -- $PWD

# see if code is formatted
nix run github:vic/checkmate#treefmt -- --ci $PWD
````

### Running nix-unit tests locally

```shell
nix run github:vic/checkmate#check-nix-unit --override-input target path:$PWD -L
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
