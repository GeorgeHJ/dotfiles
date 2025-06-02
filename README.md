# My Dotfiles

## Dependencies

To manage dotfiles easily, requires the following tools:

* `git`
* `stow`

## Structure

This is the old structure:

``` txt
.
├── README.md
└── stow.d
    └── package
```

This is the new structure:

```txt
.
├── README.md
└── package
```

The aim is to migrate to this simplified structure, when there is time to work
through the inevitable disruption this will cause.

## Important Packages

The following packages are *important* have have dedicated documentation:

* [nvim](stow.d/nvim/README.md)
