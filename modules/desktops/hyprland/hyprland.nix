#
#  Hyprland Configuration
#  Enable with "hyprland.enable = true;"
#

{ config, lib, pkgs, hyprland, user, ... }:

{
  options = {
    hyprland = {
      enable = lib.mkOption {
        type = lib.types.bool;
        default = false;
      };
    };
  };

  config = lib.mkIf (config.hyprland.enable) {
    xdg.portal = {
      enable = true;
      extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
    };

    nix.settings = {
      substituters = [ "https://hyprland.cachix.org" ];
      trusted-public-keys = [ "hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc=" ];
    };

    environment = {
      sessionVariables = {
        WLR_NO_HARDWARE_CURSORS = "1";
        # LIBVA_DRIVER_NAME = "nvidia";
        XDG_SESSION_TYPE = "wayland";
        # GBM_BACKEND = "nvidia-drm";
        # __GLX_VENDOR_LIBRARY_NAME = "nvidia";
        NIXOS_OZONE_WL = "1";
      };

      systemPackages = with pkgs; [
        hyprpaper
        xwayland
      ];

    };

    programs = {
      hyprland.enable = true;
    };

    home-manager.users.${user} =
      {
        imports = [
          hyprland.homeManagerModules.default
        ];
        wayland.windowManager.hyprland = {
          enable = true;
          xwayland.enable = true;
          settings = {
            "$mod" = "SUPER";
            "$term" = "kitty";
            bind = import ./bindings.nix;
            general = {
              border_size = 2;
              gaps_in = 3;
              gaps_out = 6;
              "col.active_border" = "0x99";
              "col.inactive_border" = "0x66";
              resize_on_border = true;
              hover_icon_on_border = false;
              layout = "dwindle";
            };
            decoration = import ./decoration.nix;
            monitor = [
              "DP-3, 3840x2160@160, 1920x0,1"
              "HDMI-A-1, 1920x1080, 0x0,auto"
            ];
            animations = import ./animations.nix;
            exec-once = import ./exec-once.nix { inherit pkgs; };
          };
          extraConfig = ''
            workspace = 1,monitor:DP-3
          '';
        };

        # hyprpaper setup
        home.file.".config/hypr/hyprpaper.conf".text = ''
          preload = ~/.config/wallpaper.png
          wallpaper = ,~/.config/wallpaper.png
        '';
      };
  };

}
