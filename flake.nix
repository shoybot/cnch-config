{
  description = "Ninja profile configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-26.05";
    home-manager = {
      url = "github:nix-community/home-manager/release-26.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { nixpkgs, home-manager, ... }:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
    in {
      homeConfigurations."ninja" = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        modules = [{
          home.username = "ninja";
          home.homeDirectory = "/home/ninja";
          home.stateVersion = "26.05";
          targets.genericLinux.enable = true;
          targets.genericLinux.gpu.enable = true;
          programs.home-manager.enable = true;

          # Packages & settings for ninja only
          home.packages = with pkgs; [ git vim ripgrep ];
        }];
      };
    };
}
