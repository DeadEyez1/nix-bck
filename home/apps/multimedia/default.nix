{config, pkgs, ...}: {
  imports = [
    ./spicetify.nix
    ./easyeffects.nix
    ./prod.nix
  ];

  home.packages = with pkgs; [
    ffmpeg
    stremio
    vlc
    mousai
    songrec
    komikku
    eog
    pavucontrol
    qpwgraph
  ];

}