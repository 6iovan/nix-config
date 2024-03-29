{ flake, ... }:
let
  inherit (flake) config inputs;
  inherit (inputs) self;
in
{

  imports = [
    {
      home-manager = {
        backupFileExtension = "backup";
        users.${config.me.username} = { };
        sharedModules = [
          self.homeModules.default
          self.homeModules.linux-only
        ];
      };
    }
    ../shared/agenix.nix
    ../shared/nix.nix
    ./hyprland
    ./mihomo.nix
    ./virt-manager.nix
    ./xdg.nix

  ];

}
