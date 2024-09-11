{ pkgs, pkgs-stable, ...}: {
  home.packages = (with pkgs; [
    vscodium
    # vscode
    
    nodejs_22
    corepack_22
    bun

    godot_4
    ]) ++ (with pkgs-stable; [
    # zed-editor
  ]);
}