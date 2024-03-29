{ pkgs, flake, ... }:
let
  inherit (flake) inputs;
in
{

  imports = [
    inputs.agenix.nixosModules.default
  ];

  age = {
    identityPaths = [ "/home/fangzirong/.ssh/id_ed25519" ];
    secrets = {
      "github-access-token.age" = {
        file = ../../secrets/github-access-token.age;
      };
    };
  };

}
