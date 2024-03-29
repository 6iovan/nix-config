{
  pkgs,
  config,
  lib,
  ...
}:
let
  x = config.age.secrets."ai-provider-key.env.age".path;
  y = "$HOME/.ai-provider-key.env";
in
{
  home.packages = with pkgs; [
    aider-chat
    gemini-cli
    opencode
  ];

  home.activation.setupEnvFromAgenix = lib.hm.dag.entryAfter [ "writeBoundary" ] ''
    cat "${x}" > "${y}"
  '';

  programs.fish = {
    enable = true;
    functions."原神启动" = ''
      env $(cat ${y}) fish
    '';
  };
}
