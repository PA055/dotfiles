{
  description = "My NixOS Config";
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-24.11";
    nixpkgs-unstable.url = "github:nixos/nixpkgs?ref=nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager/release-24.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    walker.url = "github:abenz1267/walker";
  };

  outputs = { nixpkgs, nixpkgs-unstable, home-manager, ...}@inputs: let
    system = "x86_64-linux";
    user = "lufimio";
    hostname = "laptop";
    version = "24.11";
    unstable = import nixpkgs-unstable { inherit system; };
  in {
    nixosConfigurations.${hostname} = nixpkgs.lib.nixosSystem {
      inherit system;
      specialArgs = {
        inherit inputs version hostname user unstable;
      };
      modules = [ ./hosts/${hostname}/configuration.nix ];
    };

    homeConfigurations.${user} = home-manager.lib.homeManagerConfiguration {
      pkgs = nixpkgs.legacyPackages.${system};
      extraSpecialArgs = {
        inherit unstable inputs user version;
      };
      modules = [ ./home-manager/home.nix ];
    };
  };
}
