{ pkgs, config, inputs, ...}: {
  imports = [
    ./git.nix
  ];

  programs.zsh = {
    enable = true;
    autosuggestion.enable = true;
    plugins = [
      {
        name = "zsh-nix-shell";
        file = "nix-shell.plugin.zsh";
        src = pkgs.fetchFromGitHub {
          owner = "chisui";
          repo = "zsh-nix-shell";
          rev = "v0.8.0";
          sha256 = "1lzrn0n4fxfcgg65v0qhnj7wnybybqzs4adz7xsrkgmcsr0ii8b7";
        };
      }
    ];
  };

  programs.kitty = {
    enable = true;
    shellIntegration = { enableZshIntegration = true; }; 
    theme = "Catppuccin-Mocha";
    settings = {
      enable_audio_bell = false;
    };
    environment = {
      "EDITOR" = "nano";
    };
  };

  programs.starship = {
    enable = true;
    enableZshIntegration = true;
  };

  home.packages = with pkgs; [
    btop
    fastfetch
    scrcpy
    alacritty
  ];
}