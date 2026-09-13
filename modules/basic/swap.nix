{ config, lib, ... }:

{
  zramSwap = {
    enable = true;
    priority = 100;
    algorithm = "lz4";
    memoryPercent = 50;
  };

  # Both sysctls assume swap lives in RAM; a host that turns zram off and adds
  # disk swap must not inherit them.
  boot.kernel.sysctl = lib.mkIf config.zramSwap.enable {
    # zram pages are cheap to fault back in, so read-around is pure waste.
    "vm.page-cluster" = 0;
    # 60 is tuned for disk-backed swap; with zram the kernel should prefer
    # compressing idle anonymous pages over dropping page cache.
    "vm.swappiness" = 150;
  };
}
