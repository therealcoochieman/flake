{ user, pkgs, ... }:
{
  home-manager.users.${user} = {
    programs.neovim = {
      enable = true;
    };
    home.file.".config/nvim" = {
      source = ../../.config/nvim;
      recursive = true;
    };
    home.packages = with pkgs; [ clang-tools rust-analyzer nil nixpkgs-fmt ];
  };
}
