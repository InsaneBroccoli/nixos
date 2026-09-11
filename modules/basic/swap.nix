{ ... }:

{
  zramSwap = {
    enable = true;
    priority = 100;
    algorithm = "lz4";
    memoryPercent = 50;
  };

  boot.kernel.sysctl."vm.page-cluster" = 0;
}
