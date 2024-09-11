{ pkgs, inputs, ... }: {
  wayland.windowManager.hyprland = {
    enable = true;
    
    settings = {
      monitor = ",preferred,auto,1";
      
      exec-once = [
        "hyprpanel"
        "[workspace 10 silent] easyeffects"
        "wl-paste --type text --watch cliphist store"
        "wl-paste --type image --watch cliphist store"
      ];

      input = {
        follow_mouse = 1;
        sensitivity = 0;
        accel_profile = "flat";
      };

      general = {
        gaps_in = 3;
        gaps_out = 5;
        border_size = 0;
        layout = "dwindle";
      };

      dwindle = {
        pseudotile = true;
        preserve_split = true;
      };

      master = {
        new_status = "master";
        new_on_top = true;
      };

      decoration = {
        rounding = 7;
        inactive_opacity = 0.7;
        drop_shadow = true;
        shadow_range = 15;
        shadow_render_power = 9;
        # "col.shadow" = "rgba(15, 15, 15, 1)"; 

        blur = {
          enabled = true;
          xray = false;
          size = 3;
          passes = 4;
          vibrancy = 1;
          vibrancy_darkness = 0.2;
        };
      };

      animations = {
        enabled = true;
        # bezier = "myBezier, 0.05, 0.9, 0.1, 1.05";
        # animation = [
        #   "windows, 1, 7, myBezier"
        #   "windowsOut, 1, 7, default, popin 80%"
        #   # "border, 1, 10, default"
        #   # "borderangle, 1, 8, default"
        #   "fade, 1, 7, default"
        #   "workspaces, 1, 6, default"
        # ];
        bezier = [
          "wind, 0.25, 0.96, 0.1, 1.05"
          "winOut, 0.5, 0.4, 0, 1"
          "liner, 1, 1, 1, 1"
        ];
        animation = [
          "windows, 1, 6, wind, slide"
          "windowsIn, 1, 6, wind, slide"
          "windowsOut, 1, 5, winOut, slide"
          "windowsMove, 1, 5, wind, popin 80%"
          "border, 1, 1, liner"
          "borderangle, 1, 30, liner, loop"
          "fade, 1, 10, default"
          "workspaces, 1, 5, wind, slidefade 80%"
        ];
      };

      bind = [
        "SUPER, A, exec, rofi -show drun"
        "SUPER, F, exec, librewolf"
        "SUPER, Q, exec, kitty"
        "SUPER, E, exec, nautilus"
        "SUPER, V, exec, cliphist list | rofi -dmenu | cliphist decode | wl-copy"
        ", XF86Tools, exec, spotify"
        ", XF86Calculator, exec, gnome-calculator"

        "SUPER, D, togglefloating"
        "SUPER SHIFT, Q, killactive"
        "SUPER, Tab, cyclenext"
        "SUPER, Tab, bringactivetotop"

        "SUPER, M, exec, wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle" # mute mic

        "SUPER, Print, exec, hyprshot -m window"
        ", PRINT, exec, hyprshot -m output"
        "SUPER SHIFT, PRINT, exec, hyprshot -m region"

        "SUPER, mouse_down, workspace, e-1"
        "SUPER, mouse_up, workspace, e+1"
        "SUPER, Left, workspace, e-1"
        "SUPER, Right, workspace, e+1"
      ] ++ (
        # workspaces
        # binds $mod + [shift +] {1..10} to [move to] workspace {1..10}
        builtins.concatLists (builtins.genList (
          x: let
            ws = let
              c = (x + 1) / 10;
            in
              builtins.toString (x + 1 - (c * 10));
          in [
            "SUPER, ${ws}, workspace, ${toString (x + 1)}"
            "SUPER SHIFT, ${ws}, movetoworkspace, ${toString (x + 1)}"
          ]
        )
        10)
      );

      bindm = [
        "SUPER, mouse:272, movewindow"
        "SUPER, mouse:273, resizewindow"
      ];

      bindl = [
        ", XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
        ", XF86AudioPlay, exec, playerctl play-pause"
        ", XF86AudioPrev, exec, playerctl previous"
        ", XF86AudioNext, exec, playerctl next"
      ];

      bindle = [
        ", XF86AudioRaiseVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+"
        ", XF86AudioLowerVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"
      ];

      windowrulev2 = [
        "tag +unfocused, title:^(Waydroid)$"
        "float, title:^(Waydroid)$"

        "float, title:^(Picture-in-Picture)$"
        "pin, title:^(Picture-in-Picture)$"

        "size 250 35%, title:Unity"
        # "move cursor 5% 5%, title:Unity"

        "opacity 0.0 override, class:^(xwaylandvideobridge)$"
        "noanim, class:^(xwaylandvideobridge)$"
        "noinitialfocus, class:^(xwaylandvideobridge)$"
        "maxsize 1 1, class:^(xwaylandvideobridge)$"
        "noblur, class:^(xwaylandvideobridge)$"

        "float, title:^(Osu!)$"
        "size, 1600 900, title:^(Osu!)$"
      ];
    };
  };

}