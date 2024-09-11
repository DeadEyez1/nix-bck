{ pkgs, inputs, ... }: {
  # imports = [ ./tmodloader.nix ];
  home.packages = with pkgs; [
    wineWowPackages.staging
    winetricks

    adwsteamgtk
    lutris
    protonup-qt

    osu-lazer-bin
    heroic
    modrinth-app
  ];
}