{ config, pkgs, hostname, version, ... }: {
  imports = [
    ./hardware-configuration.nix
    ./local-packages.nix
    ../../nixos
  ];

  environment.systemPackages = [ pkgs.home-manager ];
  networking.hostName = hostname;
  system.stateVersion = version;
}
