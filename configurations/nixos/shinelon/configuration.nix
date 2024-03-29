{
  flake,
  lib,
  pkgs,
  ...
}:
{
  i18n.defaultLocale = "zh_CN.UTF-8";
  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
  system.stateVersion = lib.versions.majorMinor lib.version;
  time.timeZone = "Asia/Shanghai";

  environment.systemPackages = with pkgs; [
    vim
  ];

  fonts = {
    packages = with pkgs; [
      font-awesome
      nerd-fonts.fira-code
      noto-fonts-cjk-sans
      noto-fonts-cjk-serif
      noto-fonts-color-emoji
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
        "audio"
        "kvm"
        "libvirtd"
        "networkmanager"
        "video"
        "wheel"
      ];
    };
  };

  networking = {
    hostName = "shinelon"; # Shinelon QTS5 laptop
    nameservers = [
      "1.1.1.1"
      "8.8.8.8"
    ];
    dhcpcd.enable = false;
    useDHCP = false;
    networkmanager = {
      enable = true;
      wifi.powersave = true;
      dns = "none";
    };
    firewall = {
      enable = true;
      allowedTCPPorts = [ ];
      allowedUDPPorts = [ ];
      checkReversePath = false;
      trustedInterfaces = [ "mihomo" ];
    };
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
    blueman.enable = true;
    devmon.enable = true;
    fwupd.enable = true;
    gvfs.enable = true;
    thermald.enable = true;
    udisks2.enable = true;
    upower.enable = true;

    pipewire = {
      enable = true;
      audio.enable = true;
      alsa = {
        enable = true;
        support32Bit = true;
      };
      jack.enable = true;
      pulse.enable = true;
      wireplumber.enable = true;
    };
  };
}
