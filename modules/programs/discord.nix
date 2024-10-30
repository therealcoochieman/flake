{ user, pkgs, ... }:
{
  users.users.${user} = {
    packages = with pkgs; [
      (discord.override {
        withVencord = true;
        withOpenASAR = true;
      })
    ];
  };

  environment.systemPackages = with pkgs; [
    vesktop
  ];
}
