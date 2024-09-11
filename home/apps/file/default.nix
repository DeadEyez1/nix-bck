{config, pkgs, ...}: 
{
  home.packages = with pkgs; [
    file-roller
    udiskie
    gnome-disk-utility
    
    motrix
    qbittorrent
  ];
}