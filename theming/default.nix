{ pkgs, user, ... }:
{
  home-manager.users.${user} = {
    home.file.".config/wallpaper.png".source = ./wallpaper2.png;
  };
}
