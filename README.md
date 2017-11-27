# fish-trash

[![Build Status](https://travis-ci.org/arbourd/fish-trash.svg?branch=master)](https://travis-ci.org/arbourd/trash)

A [fish](https://fishshell.com/) utility to move files to macOS trash, so you don't have to call `rm -rf`.

## Install

With [fisherman](https://github.com/fisherman/fisherman)

```sh
$ fisher arbourd/fish-trash
```

## Usage

```sh
$ trash [file ...]
```

## "Put Back" feature in macOS

Put Back functionality is not available with `trash` because it does not use Finder's API to trash items. Consider using [ali-rantakari/trash](https://github.com/ali-rantakari/trash) if needed.


## See Also

- [ali-rantakari/trash](https://github.com/ali-rantakari/trash)
- [arbourd/trashOS](https://github.com/arbourd/trashOS)


## License

MIT
