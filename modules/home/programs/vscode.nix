{ pkgs, ... }:
{
  programs.vscode = {
    enable = true;
    profiles.default = {
      extensions = pkgs.nix4vscode.forVscode [
        "MS-CEINTL.vscode-language-pack-zh-hans"
        "mvllow.rose-pine"

        "golang.go"
        "jnoortheen.nix-ide"
        "ms-python.python"
        "rust-lang.rust-analyzer"
        "sumneko.lua"
        "yzhang.markdown-all-in-one"

        "mkhl.direnv"
        "eamodio.gitlens"
        "esbenp.prettier-vscode"
        "vscode-icons-team.vscode-icons"
        "kamikillerto.vscode-colorize"

        # "asvetliakov.vscode-neovim"
        # "AI-Smith.nvim-ui-modes"

        "kilocode.Kilo-Code"
        "saoudrizwan.claude-dev"
      ];
      userSettings = {
        "update.mode" = "none";
        "update.showReleaseNotes" = false;
        "extensions.autoUpdate" = false;
        "extensions.autoCheckUpdates" = false;
        "extensions.ignoreRecommendations" = true;

        "editor.fontSize" = 16;
        "editor.fontFamily" = "'FiraCode Nerd Font Mono', 'monospace', monospace";
        "editor.fontLigatures" = true;
        "editor.tabSize" = 2;
        "editor.rulers" = [
          80
          100
        ];
        "editor.insertSpaces" = true;
        "editor.formatOnPaste" = false;
        "editor.formatOnType" = false;
        "editor.formatOnSave" = true;
        "editor.formatOnSaveMode" = "modifications";
        "editor.bracketPairColorization.enabled" = true;
        "editor.defaultFormatter" = "esbenp.prettier-vscode";

        "[go]"."editor.defaultFormatter" = "golang.go";
        "[nix]"."editor.defaultFormatter" = "jnoortheen.nix-ide";
        "[python]"."editor.defaultFormatter" = "ms-python.python";
        "[rust]"."editor.defaultFormatter" = "rust-lang.rust-analyzer";
        "[lua]"."editor.defaultFormatter" = "sumneko.lua";
        "[markdown]"."editor.defaultFormatter" = "esbenp.prettier-vscode";

        "files.trimFinalNewlines" = true;
        "files.trimTrailingWhitespace" = true;

        "git.autofetch" = true;
        "git.enableCommitSigning" = true;
        "git.enableSmartCommit" = true;
        "git.openRepositoryInParentFolders" = "always";

        "search.exclude" = {
          "**/.direnv" = true;
          "**/.git" = true;
          "**/node_modules" = true;
          "*.lock" = true;
          "tmp" = true;
        };

        "extensions.experimental.affinity" = {
          "asvetliakov.vscode-neovim" = 1;
        };

        "vscode-neovim.compositeKeys" = {
          "jk" = {
            "command" = "vscode-neovim.escape";
          };
        };
      };
    };
  };
}
