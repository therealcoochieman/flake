{ user, pkgs, ... }:
{
  users.users.${user} = {
    packages = with pkgs; [
      slack
    ];
  };
}
