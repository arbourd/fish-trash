#  trash(1) -- Moves files to the trash

## SYNOPSIS

`trash` [*file*]

## DESCRIPTION

`trash` moves files to the *~/.Trash* folder, so you don't need to call *rm -rf*

Intended to be used with macOS, but could be used with any Unix OS with *~/.Trash* aliased.

## OPTIONS

  * `-h`, `--help`:
    Show usage

  * `-v`, `--version`:
    Show version

## EXAMPLES

Trash a `.DS_Store`:

    $ trash ~/.DS_Store
