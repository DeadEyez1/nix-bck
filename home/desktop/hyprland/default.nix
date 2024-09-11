{ pkgs, pkgs-stable, ... }: {
  imports = [
    ./hyprland.nix
    ./ags
  ];
  
  home.packages = with pkgs; [
    nautilus
    gnome-calculator

    cliphist
    wl-clipboard
    wl-clip-persist
    hyprshot
    rofi-wayland

    playerctl
  ];

  #TODO change me after merge
  services.hyprpaper = {
    package = pkgs-stable.hyprpaper;
  };

  home.sessionVariables = {
    HYPRSHOT_DIR = "$HOME/Pictures/Screenshots";
    SDL_VIDEODRIVER = "wayland";
    NIXOS_OZONE_WL = "1";
  };
}