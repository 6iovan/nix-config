{ lib, ... }:
let
  userSubmodule = lib.types.submodule {
    options = {
      username = lib.mkOption {
        type = lib.types.str;
      };
      fullname = lib.mkOption {
        type = lib.types.str;
      };
      email = lib.mkOption {
        type = lib.types.str;
      };
      sshKey = lib.mkOption {
        type = lib.types.str;
        description = ''
          SSH public key
        '';
      };
      sshKeyPath = lib.mkOption {
        type = lib.types.str;
        description = ''
          $HOME/.ssh/id_ed25519
        '';
      };
    };
  };
in
{
  imports = [
    ../me.nix
  ];
  options = {
    me = lib.mkOption {
      type = userSubmodule;
    };
  };
}
