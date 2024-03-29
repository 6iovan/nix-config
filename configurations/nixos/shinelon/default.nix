{
  flake,
  modulesPath,
  ...
}:
let
  inherit (flake) self inputs;
  inherit (inputs) nixos-hardware;
in
{
  imports = [
    (modulesPath + "/installer/scan/not-detected.nix")
    ./configuration.nix
    ./hardware-configuration.nix
    (nixos-hardware + "/common/cpu/intel/haswell")
    nixos-hardware.nixosModules.common-gpu-nvidia-disable
    nixos-hardware.nixosModules.common-pc-laptop
    nixos-hardware.nixosModules.common-pc-laptop-hdd
    nixos-hardware.nixosModules.common-pc-laptop-ssd
    self.nixosModules.default
  ];
}
