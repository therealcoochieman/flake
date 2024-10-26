{ pkgs, user, ... }:
{
  users.users.${user} = {
    shell = pkgs.zsh;
  };

  programs.zsh.enable = true;

  home-manager.users.${user} = {
    programs.zsh = {
      initExtraBeforeCompInit = ''
        # p10k instant prompt
                P10K_INSTANT_PROMPT="$XDG_CACHE_HOME/p10k-instant-prompt-''${(%):-%n}.zsh"
                [[ ! -r "$P10K_INSTANT_PROMPT" ]] || source "$P10K_INSTANT_PROMPT"
      '';
      enable = true;
      enableCompletion = true;
      autosuggestion.enable = true;
      syntaxHighlighting.enable = true;
      #oh-my-zsh.enable = true;
      plugins = with pkgs; [
        {
          file = "powerlevel10k.zsh-theme";
          name = "powerlevel10k";
          src = "${zsh-powerlevel10k}/share/zsh-powerlevel10k";
        }
      ];
      initExtra = ''
                [[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
                bindkey "''${key[Up]}" up-line-or-search
                autoload -Uz history-search-end
        zle -N history-beginning-search-backward-end history-search-end
        zle -N history-beginning-search-forward-end history-search-end
        bindkey "$terminfo[kcuu1]" history-beginning-search-backward-end
        bindkey "$terminfo[kcud1]" history-beginning-search-forward-end
      '';
      shellAliases = {
        rebuild = "sudo nixos-rebuild switch --flake";
      };
    };
  };
}
