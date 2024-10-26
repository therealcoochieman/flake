{user, ...}:
{
  home-manager.users.${user} = {
    programs.kitty = {
      enable = true;
            # theme = "Catppuccin-Macchiato";
      theme = "Alabaster";
      settings = {
        background_opacity = "0.0";
        background_blur = 7;
        confirm_os_window_close = 0;
        enable_audio_bell = "no";
        font_family = "Liga SFMono Nerd Font";
        font_size = "11";
        disable_ligatures = "cursor";
      };
    };
  };
}
