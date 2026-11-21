# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

source /usr/share/cachyos-zsh-config/cachyos-config.zsh

_tui_cmds=(nmtui nvim vim lazygit btop htop yazi lf ranger less man)

_tui_preexec() {
  local cmd=${${(z)1}[1]}
  if (( ${_tui_cmds[(Ie)$cmd]} )); then
    kitten @ set-spacing padding=0 2>/dev/null
    _tui_active=1
  fi
}

_tui_precmd() {
  if (( _tui_active )); then
    kitten @ set-spacing padding=default 2>/dev/null
    _tui_active=0
  fi
}

autoload -Uz add-zsh-hook
add-zsh-hook preexec _tui_preexec
add-zsh-hook precmd _tui_precmd

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
