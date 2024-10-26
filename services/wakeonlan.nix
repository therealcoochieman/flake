{ config, options, lib, pkgs, ... }:
{
  systemd.user.services = {
    wakeonlan = {
      description = "Reenable wake on lan every boot";
      after = [ "network.target" ];
      serviceConfig = {
        Type = "simple";
        RemainAfterExit = "true";
        ExecStart = "${pkgs.ethtool}/sbin/ethtool -s enp3s0 wol g";
      };
      wantedBy = [ "default.target" ];
    };

  };
}
