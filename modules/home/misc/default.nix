{ pkgs, ... }:
{
  imports = [
    ./ssh.nix
  ];
  home.packages = with pkgs; [
    screenshot
  ];
}
