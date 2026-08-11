{
  description = "Nix Hyprland lua";
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };
  outputs = inputs @ {
    self, nixpkgs, ...
  }: 
  let
    vars = import ./hosts/think-pad/vars.nix;
  in {
    nixosConfigurations.${vars.hostname} = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      specialArgs = {inherit inputs vars;};
      modules = [
        ./hosts/think-pad/configuration.nix
      ];
    };
  };
}
