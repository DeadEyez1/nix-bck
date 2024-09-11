{config, pkgs, ...}:
{
  imports = [ ./discord.nix ];

  home.packages = with pkgs; [
    vesktop
    ferdium
    telegram-desktop
  ];
}