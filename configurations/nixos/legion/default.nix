{
  flake,
  modulesPath,
  lib,
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
    (nixos-hardware + "/common/cpu/intel/tiger-lake")
    nixos-hardware.nixosModules.common-pc-laptop
    nixos-hardware.nixosModules.common-pc-laptop-ssd
    self.nixosModules.default
  ];

  services.thermald.enable = lib.mkDefault true;

  # hardware.nvidia.prime = {
  #   intelBusId = "PCI:0:2:0";
  #   nvidiaBusId = "PCI:1:0:0";
  # };

}
