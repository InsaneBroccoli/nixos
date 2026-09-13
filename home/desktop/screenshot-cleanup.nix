{ ... }:

{
  systemd.user.tmpfiles = {
    # niri's screenshot-path (home/niri/dots/config.kdl); keep it scoped to
    # Screenshots, since an e rule ages out everything under the given dir
    rules = [ "e %h/Pictures/Screenshots - - - 30d" ];
  };
}
