{ ... }:

{
  systemd.user.tmpfiles = {
    # e = clean contents only, never creates or removes the dir; an entry
    # survives while any of its a/b/c/m timestamps is newer than 30d.
    rules = [ "e %h/Downloads - - - 30d" ];
  };
}
