{ inputs, lib, config, pkgs, ...}: {
  imports = [
    ./apps
    ./desktop
  ];

  nixpkgs = {
    overlays = [
      # If you want to use overlays exported from other flakes:
      # neovim-nightly-overlay.overlays.default

      # Or define it inline, for example:
      # (final: prev: {
      #   hi = final.hello.overrideAttrs (oldAttrs: {
      #     patches = [ ./change-hello-to-hi.patch ];
      #   });
      # })
    ];
    config = {
      allowUnfree = true;
      # Workaround for https://github.com/nix-community/home-manager/issues/2942
      allowUnfreePredicate = _: true;
    };
  };

  home = {
    username = "vixo";
    homeDirectory = "/home/vixo";
    stateVersion = "24.05";
  };

  xdg = {
    mimeApps = {
      enable = true;
      defaultApplications = {
        "text/html" = "librewolf.desktop";
        "x-scheme-handler/http" = "librewolf.desktop";
        "x-scheme-handler/https" = "librewolf.desktop";
        "x-scheme-handler/about" = "librewolf.desktop";
        "x-scheme-handler/unknown" = "librewolf.desktop";
        "image/jpg" = "org.gnome.eog.desktop;";
        "image/png" = "org.gnome.eog.desktop;";
        "image/jpeg" = "org.gnome.eog.desktop;";
        "inode/directory" = "org.gnome.Nautilus.desktop;";
        "text/plain" = "codium.desktop";
        "video/mp4" = "vlc.desktop";
      };
    };
  };

  programs.home-manager.enable = true;

  # Nicely reload system units when changing configs
  systemd.user.startServices = "sd-switch";
}