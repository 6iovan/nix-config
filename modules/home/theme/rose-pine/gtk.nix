{ pkgs, ... }:
{
  gtk = {
    enable = true;
    theme = {
      package = pkgs.rose-pine-gtk-theme;
      name = "rose-pine-moon";
    };

    iconTheme = {
      package = pkgs.rose-pine-icon-theme;
      name = "rose-pine-moon";
    };

    font = {
      name = "Noto Sans CJK SC";
      size = 12;
    };
  };
}
