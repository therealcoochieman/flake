{ pkgs, lib, user, ... }:
{

  home-manager.users.${user} =
    {
      programs.waybar = {
        enable = true;
        package = pkgs.waybar;
        systemd = {
          enable = true;
          target = "hyprland-session.target";
        };
        style = ''${builtins.readFile ./style_trans.css}'';

        settings = lib.importJSON ./config_trans.json;
      };
    };
}
