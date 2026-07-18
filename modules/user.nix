{ pkgs, ... }:

{
  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.dario = {
    isNormalUser = true;
    description = "dario";
    extraGroups = ["networkmanager" "wheel" ]; # Enable ‘sudo’ for the user.
  };
}
