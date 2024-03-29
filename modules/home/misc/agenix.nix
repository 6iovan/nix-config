{ pkgs, flake, ... }:
let
  inherit (flake) inputs;
in
{
  imports = [
    inputs.agenix.homeManagerModules.default
  ];

  home.packages = with pkgs; [
    inputs.agenix.packages.${stdenv.hostPlatform.system}.default
  ];

  age = {
    secrets = {
      "ai-provider-key.env.age" = {
        file = ../../../secrets/ai-provider-key.env.age;
      };
    };
  };
}
