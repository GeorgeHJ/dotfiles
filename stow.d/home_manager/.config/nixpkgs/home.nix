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
    ksuperkey
    nodePackages.readability-cli
    nushell
    par
    python310Packages.autopep8
    python310Packages.flake8
    python310Packages.isort
    python310Packages.pycodestyle
    python310Packages.pydocstyle
    shellcheck
    spotify-tui
    tuir
    vim-vint
    zsh-fast-syntax-highlighting
  ];

  programs.man.enable=false;
  programs.pandoc.enable=true;
  # Nushell
  programs.nushell.enable=true;
  programs.nushell.settings.line_editor={
    edit_mode = "vi";
    keyseq_timeout_ms = 10;
    history_duplicates = "ignoreconsecutive";
  };
  programs.nushell.settings.prompt = "starship prompt";
  programs.starship.enable=true;
}
