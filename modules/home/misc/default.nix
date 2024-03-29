{ pkgs, ... }:
{
  imports = [
    ./agenix.nix
    # ./ssh.nix
  ];
  home.packages = with pkgs; [
    screenshot
  ];
}
