{user, ...}:
{
  home-manager.users.${user} = {
    programs.kitty = {
      enable = true;
            # theme = "Catppuccin-Macchiato";
      theme = "GitHub Light High Contrast";
      settings = {
        background = "#000000";
        background_opacity = "0.2";
        background_blur = 7;
        confirm_os_window_close = 0;
        enable_audio_bell = "no";
        font_family = "Liga SFMono Nerd Font";
        font_size = if user == "hermes" then "16.9" else "11";
        disable_ligatures = "cursor";
      };
    };
  };
}
