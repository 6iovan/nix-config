{ flake, lib, ... }:
let
  inherit (flake) config inputs;
  inherit (inputs) self;
in
{

  imports = [
    {
      home-manager = {
        users.${config.me.username} = { };
        sharedModules = [
          self.homeModules.default
          self.homeModules.linux-only
        ];
      };
    }
    ../options
    ../shared
    # ./hyprland
    # ./virt-manager.nix
    # ./xdg.nix
  ]
  ++ self.lib.load {
    src = ./.;
  };

}
