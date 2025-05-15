# =====================
# Environment Variables
# =====================
export PATH="$PATH:$HOME/.local/share/JetBrains/Toolbox/scripts"
export EDITOR="nvim"


# ==========
# Completion
# ==========
autoload -Uz compinit

# Enable menu-style completion selection
zstyle ':completion:*' menu select
# Enable case-insensitive completion
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
# Enable sudo completions
zstyle ':completion::complete:*' gain-privileges 1

completions_dir="$HOME/.zsh/completions"
fpath=($completions_dir $fpath)
type pnpm > /dev/null && pnpm completion zsh > $completions_dir/_pnpm
type uv > /dev/null && uv generate-shell-completion zsh > $completions_dir/_uv

rm -f ~/.zcompdump; compinit


# ============
# Key bindings
# ============
bindkey  "^[[H"   beginning-of-line
bindkey  "^[[F"   end-of-line
bindkey  "^[[3~"  delete-char
bindkey "^[[1;5C" forward-word
bindkey "^[[1;5D" backward-word


# =======
# History
# =======
HISTFILE=~/.zsh_history
HISTSIZE=100000
SAVEHIST=100000
setopt HIST_SAVE_NO_DUPS
setopt INC_APPEND_HISTORY


# =======
# Plugins
# =======
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh


# =======
# Aliases
# =======
alias ls="eza -l --group-directories-first"
alias sc="systemctl --user"


# ======
# Prompt
# ======
eval "$(starship init zsh)"
