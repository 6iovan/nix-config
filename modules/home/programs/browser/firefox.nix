{ flake, pkgs, ... }:
let
  inherit (flake) inputs;
in
{
  imports = [ inputs.betterfox.modules.homeManager.betterfox ];

  programs.firefox = {
    enable = true;
    languagePacks = [
      "zh-CN"
      "en-US"
    ];
    betterfox = {
      enable = true;

      profiles.default = {
        enableAllSections = true;
        settings = {
          fastfox.enable = true;
          peskyfox.enable = true;
          securefox.enable = true;
          smoothfox.sharpen-scrolling.enable = true;
        };
      };
    };

    profiles.default = {
      settings = {
        "intl.locale.requested" = "zh-CN,en-US";
        "browser.tabs.insertAfterCurrent" = true;
        "browser.tabs.insertRelatedAfterCurrent" = true;
        "extensions.autoDisableScopes" = 0; # enable all extensions by default
      };
      extensions =
        let
          # TODO 🚨
          ignoreVulnerabilities =
            pkg:
            pkg.overrideAttrs (oldAttrs: {
              meta = oldAttrs.meta // {
                knownVulnerabilities = [ ];
              };
            });
        in
        {
          packages = with pkgs.nur.repos.rycee.firefox-addons; [
            ublock-origin
            firefox-color
            octotree
            refined-github
            bitwarden
            buster-captcha-solver
            (ignoreVulnerabilities immersive-translate)
          ];
        };
      search = {
        force = true;
        default = "google";
        engines =
          let
            nixSnowflakeIcon = "${pkgs.nixos-icons}/share/icons/hicolor/scalable/apps/nix-snowflake.svg";
          in
          {
            "Nix Packages" = {
              urls = [
                {
                  template = "https://search.nixos.org/packages";
                  params = [
                    {
                      name = "type";
                      value = "packages";
                    }
                    {
                      name = "channel";
                      value = "unstable";
                    }
                    {
                      name = "query";
                      value = "{searchTerms}";
                    }
                  ];
                }
              ];
              icon = nixSnowflakeIcon;
              definedAliases = [ "@np" ];
            };
            "Nix Options" = {
              urls = [
                {
                  template = "https://search.nixos.org/options";
                  params = [
                    {
                      name = "channel";
                      value = "unstable";
                    }
                    {
                      name = "query";
                      value = "{searchTerms}";
                    }
                  ];
                }
              ];
              icon = nixSnowflakeIcon;
              definedAliases = [ "@no" ];
            };
            "Home Manager Options" = {
              urls = [
                {
                  template = "https://home-manager-options.extranix.com/";
                  params = [
                    {
                      name = "query";
                      value = "{searchTerms}";
                    }
                    {
                      name = "release";
                      value = "master";
                    }
                  ];
                }
              ];
              icon = nixSnowflakeIcon;
              definedAliases = [ "@nhm" ];
            };

            "Github" = {
              urls = [ { template = "https://github.com/search?q={searchTerms}&type=repositories"; } ];
              iconMapObj."16" = "https://github.com/favicon.ico";
              definedAliases = [ "@gh" ];
            };
            google.metaData.alias = "@g";
          };
      };
    };
  };
}
