{
  xdg.configFile."hypr/".source = ./hypr;

  services = {
    hypridle.enable = true;
    hyprpaper.enable = true;
  };

  programs.hyprlock.enable = true;

}
