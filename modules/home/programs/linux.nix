{ pkgs, ... }:
{
  imports = [
    ./pcmanfm.nix
    ./fcitx.nix
  ];

  home.packages = with pkgs; [
    pavucontrol
  ];
}
