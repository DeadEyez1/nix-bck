{ config, pkgs, ... }: {
  programs.obs-studio = {
    enable = true;
    plugins = with pkgs.obs-studio-plugins; [
      wlrobs
      obs-backgroundremoval
      obs-pipewire-audio-capture
    ];
  };

  home.packages = with pkgs; [
    blender
    gimp
    krita
    kdenlive
    audacity
  ];
}