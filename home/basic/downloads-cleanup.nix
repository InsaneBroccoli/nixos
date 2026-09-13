{ ... }:

{
  systemd.user.tmpfiles = {
    # e = clean contents of an existing dir only (never creates or removes it);
    # an entry is kept while any of its a/b/c/m timestamps is newer than 30d
    rules = [ "e %h/Downloads - - - 30d" ];
  };
}
