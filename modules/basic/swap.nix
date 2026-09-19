{ config, lib, ... }:

{
  zramSwap = {
    enable = true;
    priority = 100;
    algorithm = "lz4";
    memoryPercent = 50;
  };

  # Both sysctls assume swap lives in RAM; a host using disk swap must not
  # inherit them. zram pages are cheap to fault back in, so read-around is
  # waste, and the kernel should compress idle pages before dropping cache.
  boot.kernel.sysctl = lib.mkIf config.zramSwap.enable {
    "vm.page-cluster" = 0;
    "vm.swappiness" = 150;
  };
}
