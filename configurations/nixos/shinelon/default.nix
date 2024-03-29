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
    { networking.hostName = "shinelon"; }

    (modulesPath + "/installer/scan/not-detected.nix")
    (nixos-hardware + "/common/cpu/intel/haswell")
    (nixos-hardware + "/common/gpu/nvidia/disable.nix")
    (nixos-hardware + "/common/pc/laptop")
    (nixos-hardware + "/common/pc/laptop/hdd")
    (nixos-hardware + "/common/pc/ssd")

    ../common-configuration.nix
    ./hardware-configuration.nix
    self.nixosModules.default
  ];
}
