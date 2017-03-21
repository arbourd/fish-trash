# trash

[![Build Status](https://travis-ci.org/arbourd/trash.svg?branch=master)](https://travis-ci.org/arbourd/trash)

A [fish](https://fishshell.com/) utility to move files to macOS trash, so you don't have to call `rm -rf`.

## Install

With [fisherman](https://github.com/fisherman/fisherman)

```sh
$ fisher arbourd/trash
```

## Usage

```sh
$ trash [FILE]
```

## "Put Back" feature in macOS

Put Back functionality is not available with `trash` because it does not use Finder's API to trash items. Consider using [ali-rantakari/trash](https://github.com/ali-rantakari/trash) if needed.

## License

MIT
