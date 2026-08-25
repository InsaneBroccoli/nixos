{
  description = "Dario's NixOS";

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
        system = vars.architecture;
        specialArgs = { inherit inputs vars hostDir; };
        modules = [
          (hostDir + /configuration.nix)
        ];
    };
  in {
    nixosConfigurations = {
      think-pad = mkHost ./hosts/think-pad;
      game-box = mkHost ./hosts/game-box;
    };
  };
}
