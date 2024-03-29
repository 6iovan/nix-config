{ flake, pkgs, ... }:
let
  inherit (flake) inputs;
in
{
  xdg.configFile."nvim/init.lua".source = ./config/init.lua;
  xdg.configFile."nvim/lua/".source = ./config/lua;
  programs.neovim = {
    enable = true;
    defaultEditor = true;
    viAlias = true;
    vimAlias = true;
  };
  home.packages = with pkgs; [
    gcc
    lua51Packages.lua
    lua51Packages.luarocks
    nodejs
    tree-sitter
  ];
}
