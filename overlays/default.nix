{ flake, ... }:
let
  inherit (flake) inputs;
  inherit (inputs) self;
  packages = self + /packages;
in
final: prev:
let
  # Auto-import all packages from the packages directory
  entries = builtins.readDir packages;

  # Convert directory entries to package definitions
  makePackage =
    name: type:
    let
      # Remove .nix extension for package name
      pkgName =
        if type == "regular" && builtins.match ".*\\.nix$" name != null then
          builtins.replaceStrings [ ".nix" ] [ "" ] name
        else
          name;
    in
    {
      name = pkgName;
      value = final.callPackage (packages + "/${name}") { };
    };

  # Import everything in packages directory
  packageOverlays = builtins.listToAttrs (
    builtins.attrValues (builtins.mapAttrs makePackage entries)
  );

in
packageOverlays
// {
  nixpkgs-stable = import inputs.nixpkgs-stable { inherit (prev) system config; };

  nur = import inputs.nur {
    nurpkgs = prev;
    pkgs = prev;
  };

  inherit ((inputs.nix4vscode.overlays.default final prev)) nix4vscode;
}
