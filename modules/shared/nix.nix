{
  flake,
  pkgs,
  lib,
  ...
}:
let
  inherit (flake) inputs;
  inherit (inputs) self;
in
{
  nixpkgs = {
    config = {
      allowUnfree = true;
      allowUnfreePredicate = _: true;
    };
    overlays = lib.attrValues self.overlays;
  };

  nix = {
    package = pkgs.lixPackageSets.stable.lix;
    nixPath = [ "nixpkgs=${inputs.nixpkgs}" ];

    registry = {
      nixpkgs.flake = inputs.nixpkgs;
      # nixpkgs-stable.flake = inputs.nixpkgs-stable;
    };

    settings = {
      max-jobs = "auto";

      experimental-features = [
        "nix-command"
        "flakes"
        # "pipe-operators"
      ];

      substituters = [
        "https://cache.nixos.org/?priority=10"
        "https://nix-community.cachix.org"
        "https://cache.garnix.io"
        "https://hyprland.cachix.org"
        "https://cache.numtide.com"
      ];

      trusted-public-keys = [
        "cache.nixos.org-1:6NCHdD59X431o0gWypbMrAURkbJ16ZPMQFGspcDShjY="
        "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
        "cache.garnix.io:CTFPyKSLcx5RMJKfLo5EEPUObbA78b0YQ2DTCJXqr9g="
        "hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc="
        "niks3.numtide.com-1:DTx8wZduET09hRmMtKdQDxNNthLQETkc/yaX7M4qK0g="
      ];

      trusted-users = [
        flake.config.me.username
        "root"
        "@wheel"
        "@admin"
      ];
    };
  };
}
