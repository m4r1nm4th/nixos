{ config, pkgs, ... }:

{
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "marin";
  home.homeDirectory = "/home/marin";

  programs = {
    home-manager.enable = true;
    git = {
      enable = true;
      userName = "m4r1nm4th";
      userEmail = "marinjanssen13@gmail.com";
        extraConfig = {
          core.editor = "vim";
        };
    };
    vim = {
      enable = true;
      settings = {
        relativenumber = true;
        number = true;
      };
    };
    zsh = {
      enable = true;
      enableAutosuggestions = true;
      enableCompletion = true;
    };
    vscode = {
      enable = true;
      extensions = with pkgs.vscode-extensions; [
        jnoortheen.nix-ide
        jdinhlife.gruvbox
        vscodevim.vim

        #Python
        ms-python.python 
        ms-toolsai.jupyter 
      ];
      userSettings = {
        "nix.serverPath" = "${pkgs.nixd}/bin/nixd";
        "editor.fontFamily" = "Fira Code";
        "editor.fontLigatures" = "true";
        "editor.fontSize" = 16;
        "workbench.colorTheme" = "Gruvbox Dark Soft";
        "git.suggestSmartCommit" = true;
        "vim.smartRelativeLine" = true;
        "editor.cursorSurroundingLines" = 8;
        "html.format.wrapLineLength" = 80;
        "editor.rulers" = [80];
        "vim.highlightedyank.enable" = true;
        "vim.highlightedyank.color" = "#a9dc7660";
        "vim.highlightedyank.duration" = 250;
        "vim.useSystemClipboard" = true;
      };
    };
  };
    gtk = {
      enable = true;
      theme.name = "adw-gtk3";
      iconTheme.name = "GruvboxPlus";
    };
  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "25.05"; # Please read the comment before changing.

  # The home.packages option allows you to install Nix packages into your
  # environment.
  home.packages = [
    pkgs.nixd
    pkgs.unzip
    pkgs.wget
    pkgs.vlc
    pkgs.vscode
    pkgs.shutter # Screenshots
    pkgs.zathura # document viewer
    pkgs.htop 
    pkgs.chromium pkgs.firefox pkgs.google-chrome
    pkgs.tmux
    pkgs.brave
    pkgs.libreoffice

    # Python Stack 
    pkgs.python3
    pkgs.python3Packages.pip 
    pkgs.python3Packages.ipykernel 
    pkgs.python3Packages.notebook 
    pkgs.ruff
    pkgs.mypy 
    pkgs.pyright
    # # Adds the 'hello' command to your environment. It prints a friendly
    # # "Hello, world!" when run.
    # pkgs.hello

    # # It is sometimes useful to fine-tune packages, for example, by applying
    # # overrides. You can do that directly here, just don't forget the
    # # parentheses. Maybe you want to install Nerd Fonts with a limited number of
    # # fonts?
    # (pkgs.nerdfonts.override { fonts = [ "FantasqueSansMono" ]; })

    # # You can also create simple shell scripts directly inside your
    # # configuration. For example, this adds a command 'my-hello' to your
    # # environment:
    # (pkgs.writeShellScriptBin "my-hello" ''
    #   echo "Hello, ${config.home.username}!"
    # '')
  ];

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
    # # Building this configuration will create a copy of 'dotfiles/screenrc' in
    # # the Nix store. Activating the configuration will then make '~/.screenrc' a
    # # symlink to the Nix store copy.
    # ".screenrc".source = dotfiles/screenrc;

    # # You can also set the file content immediately.
    # ".gradle/gradle.properties".text = ''
    #   org.gradle.console=verbose
    #   org.gradle.daemon.idletimeout=3600000
    # '';
  };

  # Home Manager can also manage your environment variables through
  # 'home.sessionVariables'. These will be explicitly sourced when using a
  # shell provided by Home Manager. If you don't want to manage your shell
  # through Home Manager then you have to manually source 'hm-session-vars.sh'
  # located at either
  #
  #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  ~/.local/state/nix/profiles/profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  /etc/profiles/per-user/marin/etc/profile.d/hm-session-vars.sh
  #
  home.sessionVariables = {
    # EDITOR = "emacs";
  };

}
