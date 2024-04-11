{
  # imports = [
  #   /etc/nixos/hardware-configuration.nix
  # ];
  description = "AbrA-K's nixos flake";

  inputs = {
    nixpkgs.url = "github:NixOs/nixpkgs/nixos-unstable";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { self, home-manager, nixpkgs, ... }:
  let
    lib = nixpkgs.lib;
  in {
  nixosConfigurations = {
      KadaZen = lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          ./hypr/hyprland.nix
          ./nushell/nu.nix
          ./hardware-configuration.nix
          ./old-config.nix
          ./syncthing.nix
          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.abra = import ./home.nix;
          }
        ];
      };
      KadaZen-gnome = lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          ./gnome-config.nix
          ./hardware-configuration.nix
          ./old-config.nix
          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.abra = import ./home.nix;
          }
        ];
      };
    };
  };
}
