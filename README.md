# My Dotfiles

<!--toc:start-->
* [My Dotfiles](#my-dotfiles)
  * [Dependencies](#dependencies)
  * [Structure](#structure)
  * [Scripts](#scripts)
  * [Important Packages](#important-packages)
<!--toc:end-->

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

## Scripts

Scripts can be added to the `$PATH` by placing them in `package/.local/bin`.
This means that the little scripts for integrating a tool can live in the same
place.

```txt
.
├── README.md
└── stow.d
    └── package
        ├── .config
        │   └── program_name
        │       └── config_file
        └── .local
            └── bin
                └── script
```

## Important Packages

The following packages are *important* have have dedicated documentation:

* [nvim](stow.d/nvim/README.md)
