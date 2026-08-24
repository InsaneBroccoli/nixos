{ config, inputs, pkgs, vars, hostDir, ... }:

{
  imports = [ 
    inputs.home-manager.nixosModules.home-manager
  ];

  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    extraSpecialArgs = { inherit inputs vars; };
    users = {
      ${vars.username} = hostDir + /home-configuration.nix;
    };
  };  
}
