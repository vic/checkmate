# Checkmate - A flake checker (treefmt & nix-unit) for testing other flakes with zero dependencies.

Checks include:

- treefmt - nixfmt, deadnix, mdformat, yamlfmt. See `treefmt.nix`.

- nix-unit - The flake being checked (ie, `inputs.target`) is expected to expose `flakeModules.checkmate`:

> See [import-tree](https://github.com/vic/import-tree/blob/main/checks/checkmate.nix) or [example](https://github.com/vic/checkmate/blob/main/example/checkmate.nix)

```shell
# Generate a new project including github CI action
nix flake new -t github:vic/checkmate
```

### Running treefmt on your code

```shell
# formatting your code
nix run github:vic/checkmate#treefmt -- $PWD

# see if code is formatted
nix run github:vic/checkmate#treefmt -- --ci $PWD
```

### Running nix-unit tests locally

```shell
# Since nix-unit runs on a sandbox the following will not work (probably a nix-unit issue?)
# nix run github:vic/checkmate#check-nix-unit --override-input target path:$PWD -L

# Instead you'll need to have to make a commit and run: (--refresh ensures you test the latest commit)
nix run github:vic/checkmate#check-nix-unit --override-input target git:$PWD -L --refresh
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

