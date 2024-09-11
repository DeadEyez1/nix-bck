{ pkgs, pkgs-stable, inputs, ... }:
{
  home.packages = (with pkgs; [
    floorp

    google-chrome
    brave
    tor-browser
  ]) ++ (with pkgs-stable; [
    librewolf
    # floorp
  ]) ++ ([
    inputs.zen-browser.packages.${pkgs.system}.specific
  ]);
}