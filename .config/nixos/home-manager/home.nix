{ config, pkgs, ... }: {
	imports = [
		./modules
		./home-packages.nix
	];
	home = {
		username = "lufimio";
		homeDirectory = "/home/lufimio";
		stateVersion = "23.11";
	};

}
