{pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    git
    gcc
    gnumake
    zsh
    vim
    curl 
    wget 
    tmux 
    direnv 
    nix-direnv 
    nixpkgs-fmt 
    gh 

    # Python stack
    python3
    python3Packages.pip 
    python3Packages.virtualenv
    ruff
    mypy
    pyright
    jupyter
  ];

  programs.direnv.enable = true;
  programs.direnv.nix-direnv.enable = true;
}