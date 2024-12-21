{ pkgs, unstable, inputs, ... }: {
  nixpkgs.config.allowUnfree = true;

  home.packages = with pkgs; [
    # Desktop apps
    firefox
    imv
    kitty
    mpv
    vesktop

    # CLI utils
    bat
    bottom
    fzf
    gitmoji-cli
    neofetch
    ripgrep
    stow
    unzip
    zip
    zoxide

    # Coding stuff
    python311
    gnumake
    gcc
    nodejs_23

    # WM/DE stuff
    xdg-desktop-portal-hyprland

    # Other
    bemoji
  ];
}
