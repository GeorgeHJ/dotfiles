{ config, pkgs, ... }:

{
  # Ease installation on non-NixOS Linux
  targets.genericLinux.enable = true;

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home.username = "george";
  home.homeDirectory = "/home/george";

  # This value determines the Home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new Home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update Home Manager without changing this value. See
  # the Home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "21.11";

  # User additions below:
  home.packages = with pkgs; [
    borgbackup
    cava
    ddgr
    dr14_tmeter
    gh
    hugo
    libsixel
    ncspot
    par
    python310Packages.autopep8
    python310Packages.flake8
    python310Packages.isort
    python310Packages.pycodestyle
    python310Packages.pydocstyle
    shellcheck
    spotify-tui
    scss-lint
    sqlfluff
    pgformatter
    tuir
    vim-vint
    zellij
    zsh-fast-syntax-highlighting
  ];

  programs.man.enable=false;
  programs.pandoc.enable=true;
}
