<p align="right">
  <a href="https://github.com/sponsors/vic"><img src="https://img.shields.io/badge/sponsor-vic-white?logo=githubsponsors&logoColor=white&labelColor=%23FF0000" alt="Sponsor Vic"/>
  </a>
  <a href="https://vic.github.io/dendrix/Dendritic-Ecosystem.html#vics-dendritic-libraries"> <img src="https://img.shields.io/badge/Dendritic-Nix-informational?logo=nixos&logoColor=white" alt="Dendritic Nix"/> </a>
  <a href="LICENSE"> <img src="https://img.shields.io/github/license/vic/checkmate" alt="License"/> </a>
  <a href="https://github.com/vic/checkmate/actions">
  <img src="https://github.com/vic/checkmate/actions/workflows/test.yml/badge.svg" alt="CI Status"/> </a>
</p>

# Checkmate - A Dendritic flake checker (treefmt & nix-unit) for testing other flakes with zero dependencies.

> `checkmate` and [vic](https://bsky.app/profile/oeiuwq.bsky.social)'s [dendritic libs](https://vic.github.io/dendrix/Dendritic-Ecosystem.html#vics-dendritic-libraries) made for you with Love++ and AI--. If you like my work, consider [sponsoring](https://github.com/sponsors/vic)

### Checks included by default

- treefmt - nixfmt, deadnix, mdformat, yamlfmt. See `treefmt.nix`.

- nix-unit - The flake being checked (ie, `inputs.target`) is expected to expose `flakeModules.checkmate`:

### Extensible.

Checkmate is a collection of Denritic modules.

### Getting started

```shell
# Generate a new project including github CI action
nix flake new -t github:vic/checkmate
```

### Running flake check locally

```console
nix flake check github:vic/checkmate --override-input target .
```

### Running treefmt on your code

```console
# formatting your code
nix run github:vic/checkmate#fmt --override-input target .

# checking if code is formatted
nix run github:vic/checkmate#fmt --override-input target . -- --ci
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
