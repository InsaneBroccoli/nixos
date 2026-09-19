{ ... }:

{
  systemd.user.tmpfiles = {
    # niri's screenshot-path (home/niri/dots/config.kdl); an e rule ages out
    # everything under the given dir, so keep it scoped to Screenshots.
    rules = [ "e %h/Pictures/Screenshots - - - 30d" ];
  };
}
