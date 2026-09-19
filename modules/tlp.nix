{ ... }:

{
  services.tlp = {
    enable = true;
    settings = {
      # intel_pstate runs in active/HWP mode, so `performance` would pin the
      # frequency floor to the ceiling and take the EPP knob away. `powersave`
      # exposes the full HWP range; EPP and dynamic boost do the steering.
      # These are TLP's own defaults, pinned so an upstream change cannot move
      # them silently.
      CPU_SCALING_GOVERNOR_ON_AC = "powersave";
      CPU_SCALING_GOVERNOR_ON_BAT = "powersave";
      CPU_HWP_DYN_BOOST_ON_AC = 1;
      CPU_ENERGY_PERF_POLICY_ON_AC = "balance_performance";
      CPU_ENERGY_PERF_POLICY_ON_BAT = "balance_power";

      # EC power-limit and fan profile; low-power trades burst for runtime.
      PLATFORM_PROFILE_ON_AC = "performance";
      PLATFORM_PROFILE_ON_BAT = "low-power";

      START_CHARGE_THRESH_BAT0 = 40;
      STOP_CHARGE_THRESH_BAT0 = 80;
    };
  };
}
