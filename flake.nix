{
  description = "NixOS System Flake Configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    home-manager = {
      url = github:nix-community/home-manager;
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # Official Hyprland Flake
    hyprland = {
      url = "github:hyprwm/Hyprland";
      inputs.nixpkgs.follows = "nixpkgs";
      # Requires "hyprland.nixosModules.default" to be added the host modules
    };

    sf-mono-liga-src = {
      url = "github:shaunsingh/SFMono-Nerd-Font-Ligaturized";
      flake = false;
    };

  };

  outputs = { self, nixpkgs, home-manager, hyprland, sf-mono-liga-src, ... } @ inputs:
    {
      nixosConfigurations = {
        homepc = nixpkgs.lib.nixosSystem {
          specialArgs = {
            inherit inputs hyprland sf-mono-liga-src;
            user = "hermes";
          };

          modules = [
            ./hosts/homepc
            home-manager.nixosModules.home-manager
            {
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;
            }
          ];
        };

        proteus = nixpkgs.lib.nixosSystem {
          specialArgs = {
            inherit inputs hyprland sf-mono-liga-src;
            user = "proteus";
          };

          modules = [
            ./hosts/proteus
            home-manager.nixosModules.home-manager
            {
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;
            }
          ];
        };
      };
    };
}
