{
  programs.alacritty.settings = {
    general.import = [ "~/.config/alacritty/rose-pine-moon.toml" ];
  };

  xdg.configFile."alacritty/rose-pine-moon.toml".source = ./rose-pine-moon.toml;
}
