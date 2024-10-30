{ user, pkgs, ... }:
let
  theme = builtins.toFile "rofi-theme.rasi" ''
    * {
        bg0:    #2E3440F2;
        bg1:    #3B4252;
        bg2:    #4C566A80;
        bg3:    #88C0D0F2;
        fg0:    #D8DEE9;
        fg1:    #ECEFF4;
        fg2:    #D8DEE9;
        fg3:    #4C566A;
    }
    * {
        background-color:   transparent;
        text-color:         @fg0;

        margin:     0px;
        padding:    0px;
        spacing:    0px;
    }

    window {
        location:       center;
        width:          480;
        border-radius:  24px;
    
        background-color:   @bg0;
    }

    mainbox {
        padding:    12px;
    }

    inputbar {
        background-color:   @bg1;
        border-color:       @bg3;

        border:         2px;
        border-radius:  16px;

        padding:    8px 16px;
        spacing:    8px;
        children:   [ prompt, entry ];
    }

    prompt {
        text-color: @fg2;
    }

    entry {
        placeholder:        "Search";
        placeholder-color:  @fg3;
    }

    message {
        margin:             12px 0 0;
        border-radius:      16px;
        border-color:       @bg2;
        background-color:   @bg2;
    }

    textbox {
        padding:    8px 24px;
    }

    listview {
        background-color:   transparent;

        margin:     12px 0 0;
        lines:      8;
        columns:    1;

        fixed-height: false;
    }

    element {
        padding:        8px 16px;
        spacing:        8px;
        border-radius:  16px;
    }

    element normal active {
        text-color: @bg3;
    }

    element alternate active {
        text-color: @bg3;
    }

    element selected normal, element selected active {
        background-color:   @bg3;
    }

    element-icon {
        size:           1em;
        vertical-align: 0.5;
    }

    element-text {
        text-color: inherit;
    }
  '';
in
{
  home-manager.users.${user} = {
    programs.rofi = {
      enable = true;
      package = pkgs.rofi-wayland;
      terminal = "${pkgs.kitty}/bin/kitty";
      plugins = with pkgs; [
        rofi-power-menu
      ];
      font = "Liga SFMono Nerd Font";
      theme = theme;
      extraConfig = {
        modes = "window,drun,run,ssh,combi,power-menu:${pkgs.rofi-power-menu}/bin/rofi-power-menu";
      };
    };
  };
}
