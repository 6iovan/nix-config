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
    (modulesPath + "/installer/scan/detected.nix")
    (modulesPath + "/installer/scan/not-detected.nix")
    ./configuration.nix
    ./hardware-configuration.nix
    nixos-hardware.nixosModules.common-cpu-intel # contains gpu-intel
    nixos-hardware.nixosModules.common-gpu-nvidia-disable
    self.nixosModules.default
  ];
}
