{ config, pkgs, user, ... }:
{
  home-manager.users.${user} = {
    home.packages = [ pkgs.libnotify ];
    services.dunst = {
      enable = true;
    };
  };
}
