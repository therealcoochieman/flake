[
  # launch predefined apps
  "$mod, RETURN, exec, $term"
  "$mod, X, exec, firefox"
  "$mod, SPACE, exec, rofi"

  # window management
  "$mod SHIFT, Q, killactive"
  "$mod SHIFT, E, exit"
  # focus
  "$mod, h, movefocus, l"
  "$mod, j, movefocus, d"
  "$mod, k, movefocus, u"
  "$mod, l, movefocus, r"
  # move
  "$mod SHIFT, h, movewindow, l"
  "$mod SHIFT, j, movewindow, d"
  "$mod SHIFT, k, movewindow, u"
  "$mod SHIFT, l, movewindow, r"
  # resize
  "$mod CTRL, h, resizeactive, -20 0"
  "$mod CTRL, j, resizeactive, 0 20"
  "$mod CTRL, k, resizeactive, 0 -20"
  "$mod CTRL, l, resizeactive, 20 0"

  # window mode
  "$mod, F, fullscreen"
  "$mod SHIFT, SPACE, togglefloating"


  # idk what that is
  ", Print, exec, grimblast copy area"
]
++ (
  # workspaces
  # binds $mod + [shift +] {1..10} to [move to] workspace {1..10}
  builtins.concatLists (builtins.genList
    (
      x:
      let
        ws =
          let
            c = (x + 1) / 10;
          in
          builtins.toString (x + 1 - (c * 10));
      in
      [
        "$mod, ${ws}, workspace, ${toString (x + 1)}"
        "$mod SHIFT, ${ws}, movetoworkspace, ${toString (x + 1)}"
      ]
    )
    10)
)
