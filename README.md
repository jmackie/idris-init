# idris-init

Boilerplate for an [Idris][idris-lang] application with `nix` managing the build + dependencies.

## Pinning nixpkgs

For reproducibility you'll probably want to lock down a version of `nixpkgs`. Note that if you drift too far from the publicly cached channels builds can become quite expensive.

```sh
nix-prefetch-git https://github.com/NixOS/nixpkgs.git <REVISION> > nixpkgs.json
```

Where `<REVISION>` may be omitted, in which case `master` will be used.

## Building

```sh
nix-build
```

## Running

```sh
./result/bin/hello
```

## Hacking

```sh
nix-shell
idris Hello.idr
```

[idris-lang]: https://www.idris-lang.org/
