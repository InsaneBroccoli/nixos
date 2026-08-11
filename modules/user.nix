{ vars, ... }:

{
  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.${vars.username} = {
    isNormalUser = true;
    description = vars.username;
    extraGroups = ["networkmanager" "wheel" ]; # Enable ‘sudo’ for the user.
  };
}
