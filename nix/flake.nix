{
  imports = [
    /etc/nixos/hardware-configuration.nix
  ]
  description = "AbrA-K's nixos flake";

  inputs = {
    nixpkgs.url = "github:NixOs/nixpkgs/nixos-unstable";
  };

  outputs = { self, nixpkgs, ... }:
  let
    lib = nixpkgs.lib;
  in {
  nixosConfigurations = {
      KadaZen = lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          ./old-config.nix
        ];
      }
    };
  };
}
