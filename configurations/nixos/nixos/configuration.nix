{
  flake,
  lib,
  pkgs,
  ...
}:
{
  system.stateVersion = lib.versions.majorMinor lib.version;

  nixpkgs.hostPlatform = "x86_64-linux";
  time.timeZone = "Asia/Shanghai";
  i18n.defaultLocale = "zh_CN.UTF-8";

  environment.systemPackages = with pkgs; [
    vim
  ];

  fonts = {
    packages = with pkgs; [
      noto-fonts-color-emoji
      noto-fonts-cjk-sans
      noto-fonts-cjk-serif
      nerd-fonts.fira-code
      font-awesome
    ];
    fontDir.enable = true;
    fontconfig = {
      enable = true;
      defaultFonts = {
        emoji = [ "Noto Color Emoji" ];
        monospace = [
          "FiraCode Nerd Font Mono"
          "Noto Sans Mono CJK SC"
          "Font Awesome 7 Free"
        ];
        sansSerif = [
          "Noto Sans CJK SC"
          "Font Awesome 7 Free"
        ];
        serif = [
          "Noto Serif CJK SC"
          "Font Awesome 7 Free"
        ];
      };
    };
  };

  users = {
    groups = {
      netdev = { };
      power = { };
    };
    users.${flake.config.me.username} = {
      isNormalUser = true;
      extraGroups = [
        "wheel"
        "networkmanager"
        "video"
        "audio"
        "kvm"
        "libvirtd"
      ];
    };
  };

  networking = {
    nameservers = [
      "8.8.8.8"
      "1.1.1.1"
    ];
    useDHCP = false;
    dhcpcd.enable = false;
    networkmanager = {
      enable = true;
      dns = "none";
      wifi.powersave = true;
    };
    firewall = {
      enable = true;
      allowedTCPPorts = [ ];
      allowedUDPPorts = [ ];
      checkReversePath = false;
      trustedInterfaces = [ "mihomo" ];
    };
  };

  powerManagement = {
    enable = true;
    # scsiLinkPolicy = "med_power_with_dipm";
  };

  security = {
    polkit.enable = true;
    rtkit.enable = true;
    doas = {
      enable = true;
      wheelNeedsPassword = false;
    };
  };

  services = {
    gvfs.enable = true;
    udisks2.enable = true;
    devmon.enable = true;
    upower.enable = true;
    blueman.enable = true;
    fwupd.enable = true;
    thermald.enable = true;
    fstrim.enable = true;
    hdapsd.enable = true;
    auto-cpufreq.enable = true;

    pipewire = {
      enable = true;
      audio.enable = true;
      alsa = {
        enable = true;
        support32Bit = true;
      };
      pulse.enable = true;
      jack.enable = true;
      wireplumber.enable = true;
    };
  };
}
