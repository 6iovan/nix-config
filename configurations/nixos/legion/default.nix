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
    { networking.hostName = "legion"; } # Legion 5 15ITH6

    (modulesPath + "/installer/scan/not-detected.nix")
    (nixos-hardware + "/common/cpu/intel/tiger-lake")
    (nixos-hardware + "/common/gpu/nvidia/prime.nix")
    (nixos-hardware + "/common/gpu/nvidia/ampere")
    (nixos-hardware + "/common/pc/laptop")
    (nixos-hardware + "/common/pc/ssd")

    ../common-configuration.nix
    ./hardware-configuration.nix
    self.nixosModules.default
  ];

}
