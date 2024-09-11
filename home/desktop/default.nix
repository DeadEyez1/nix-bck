{ pkgs, ... }: {
  # TODO for DE/WM cosmic & other later

  imports = [
    ./hyprland
  ];

  qt = {
    enable = true;
    platformTheme.name = "kde";
  };
}