{ inputs, outputs, config, pkgs, pkgs-stable, ... }:

{
  imports =
    [ 
      ./hardware-configuration.nix
      inputs.home-manager.nixosModules.home-manager

      ../modules/virt.nix
    ];

  # Bootloader.
  boot.kernelPackages = pkgs.linuxPackages_zen;
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot = {
      extraModulePackages = with config.boot.kernelPackages; [ v4l2loopback ];
      extraModprobeConfig = ''
        options v4l2loopback devices=1 video_nr=1 card_label="OBS Cam" exclusive_caps=1
      '';
  };

  networking = {
    hostName = "nixos";
    networkmanager.enable = true;
    firewall = {
      enable = true;
      allowedTCPPorts = [ 7777 9993 9994 ];
      allowedUDPPorts = [ 53 67 ];
    };
  };

  security.rtkit.enable = true;
  security.polkit.enable = true;
  security.sudo.package = pkgs.sudo.override { withInsults = true; };

  services = {
    xserver = {
      enable = true;
      xkb = {
        layout = "us";
        variant = "";
      };
      excludePackages = with pkgs; [ xterm ];
      videoDrivers = ["amdgpu"];
    };

    pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
      jack.enable = true;
      extraConfig.pipewire-pulse."92-low-latency" = {
        context.modules = [
          {
            name = "libpipewire-module-protocol-pulse";
            args = {
              pulse.min.req = "32/48000";
              pulse.default.req = "32/48000";
              pulse.max.req = "32/48000";
              pulse.min.quantum = "32/48000";
              pulse.max.quantum = "32/48000";
            };
          }
        ];
        stream.properties = {
          node.latency = "32/48000";
          resample.quality = 1;
        };
      };
    };

    gvfs.enable = true;
    flatpak.enable = true;
  };

  hardware = {
    graphics = {
      enable = true;
      enable32Bit = true;
    };
    pulseaudio.enable = false;
    bluetooth = {
      enable = true;
      powerOnBoot = true;
    };
  };

  # Set your time zone.
  time.timeZone = "Asia/Jakarta";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  users.users.vixo = {
    isNormalUser = true;
    description = "vixo";
    extraGroups = [ "networkmanager" "wheel" "gamemode" "libvirtd" "kvm" "docker" "adbusers" "lxd"];
    shell = pkgs.zsh;
  };

  systemd = {
    user = {
      services.polkit-gnome-authentication-agent-1 = {
        description = "polkit-gnome-authentication-agent-1";
        wantedBy = [ "graphical-session.target" ];
        wants = [ "graphical-session.target" ];
        after = [ "graphical-session.target" ];
        serviceConfig = {
            Type = "simple";
            ExecStart = "${pkgs.polkit_gnome}/libexec/polkit-gnome-authentication-agent-1";
            Restart = "on-failure";
            RestartSec = 1;
            TimeoutStopSec = 10;
          };
      };

      tmpfiles.rules = [
        "L %t/discord-ipc-0 - - - - app/com.discordapp.Discord/discord-ipc-0"
      ];
    };
  };

  home-manager = {
    extraSpecialArgs = { 
      inherit inputs outputs;
      inherit pkgs-stable;
    };
    users = {
      vixo = import ../home/home.nix;
    };
  };

  programs = {
    zsh.enable = true;
    adb.enable = true;

    nh = {
      enable = true;
      clean.enable = true;
      clean.extraArgs = "--keep-since 5d --keep 5";
      flake = "/home/vixo/.dotfiles/";
    };

    steam = {
      enable = true;
      remotePlay.openFirewall = true;
      dedicatedServer.openFirewall = true;
      localNetworkGameTransfers.openFirewall = true;
    };

    gamemode.enable = true;
    gamescope.enable = true;
    hyprland = {
      enable = true;
      xwayland.enable = true;
    };
  };

  fonts.packages = with pkgs; [
    fira-code
    fira-code-symbols
    fira-code-nerdfont
    mona-sans
  ];
  
  stylix = {
    enable = true;
    image = /home/vixo/Pictures/Wallpapers/anime-boy-chill.jpg;
    base16Scheme = "${pkgs.base16-schemes}/share/themes/catppuccin-mocha.yaml";
    polarity = "dark";
    cursor = {
      package = pkgs.banana-cursor;
      name = "Banana";
      size = 24;
    };
  };

  xdg.portal = {
    enable = true;
    config.common.default = "gtk";
    extraPortals = with pkgs; [
      xdg-desktop-portal-gtk
    ];
  };

  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [
    vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
    wget
  ];

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  system.stateVersion = "24.05";
}
