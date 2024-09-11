{config, pkgs, ...}: {
  programs.git = {
    enable = true;
    userName = "DeadEyez";
    userEmail = "self@deadeyez.my.id";
    extraConfig = { init.defaultBranch = "main"; };
  };
}