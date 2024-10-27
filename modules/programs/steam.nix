{ user, pkgs, inputs, ... }:
{
  programs.steam = {
    enable = true;
    dedicatedServer.openFirewall = true;
    gamescopeSession.enable = true;
    package = pkgs.steam.override {
      extraPkgs = pkgs: with pkgs; [
        xorg.libXcursor
        xorg.libXi
        xorg.libXinerama
        xorg.libXScrnSaver
        libpng
        libpulseaudio
        libvorbis
        stdenv.cc.cc.lib
        libkrb5
        keyutils
      ];
    };
  };

  environment.systemPackages = with pkgs; [
    (lutris.override {
      extraLibraries = pkgs: [
      ];
    })
    gamescope
  ];

  programs.gamescope = {
    enable = true;
    capSysNice = true;
  };


  hardware.xone.enable = true;
}
