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
    git-credential-manager
    gnome-keyring
    libsecret
    neofetch
    ripgrep
    stow
    unzip
    zip
    zoxide

    # Coding stuff
    gcc
    gnumake
    lua51Packages.lua
    lua51Packages.luarocks
    python311
    rustc
    nodejs_23

    # WM/DE stuff
    xdg-desktop-portal-hyprland

    # Other
    bemoji
  ];
}
