{ config, inputs, pkgs, vars, ... }:
{
  imports = [ 
    inputs.home-manager.nixosModules.home-manager
  ];
  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    extraSpecialArgs = { inherit inputs vars; };
    users = {
      ${vars.username} = import ../home/default.nix;
    };
  };  
}
