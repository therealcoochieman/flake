{ user, ... }:
{
  home-manager.users.${user} = {
    programs.neovim = {
      enable = true;
    };
    home.file.".config/nvim" = {
      source = ../../.config/nvim;
      recursive = true;
    };
  };
}
