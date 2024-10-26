{ config, options, lib, pkgs, user, ... }:
{
  systemd.user.services = {
    sunshine = {
      description = "Sunshine server";
      wantedBy = [ "graphical-session.target" ];
      startLimitIntervalSec = 500;
      startLimitBurst = 5;
      partOf = [ "graphical-session.target" ];
      wants = [ "graphical-session.target" ];
      after = [ "graphical-session.target" ];


      serviceConfig = {
        ExecStart = "${config.security.wrapperDir}/sunshine";
        Restart = "on-failure";
        RestartSec = "5s";
      };
    };
  };

  security.wrappers.sunshine = {
    owner = "root";
    group = "root";
    capabilities = "cap_sys_admin+p";
    source = "${pkgs.sunshine}/bin/sunshine";
  };

  users.groups.input.members = [ ${user} ];
  services.udev.extraRules = ''
    KERNEL=="uinput", SUBSYSTEM=="misc", OPTIONS+="static_node=uinput", TAG+="uaccess"
  '';

  services.avahi.publish.enable = true;
  services.avahi.publish.userServices = true;

  networking.firewall = {
    enable = true;
    allowedTCPPorts = [ 47984 47989 47990 48010 ];
    allowedUDPPortRanges = [
      { from = 47998; to = 48000; }
      #{ from = 8000; to = 8010; }
    ];
  };
}
