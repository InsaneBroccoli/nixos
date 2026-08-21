{
  description = "Nix Hyprland lua";
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    pixie-sddm = {
      url = "github:xCaptaiN09/pixie-sddm";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs @ {
    self, nixpkgs, pixie-sddm, ...
  }: 

  let
    mkHost = hostDir: let
      vars = import (hostDir + /vars.nix);
    in nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = {inherit inputs vars;};
        modules = [
          (hostDir + /configuration.nix)
        ];
    };
  in {
    nixosConfigurations = {
      think-pad = mkHost ./hosts/think-pad;
    };
  };
}
