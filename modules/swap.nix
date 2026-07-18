{ ... }:

{
  # needs further setup resum= and resume_offset=
  swapDevices = [{
    device = "/swap/swapfile";
    size = 32 * 1024;
  }];
}
