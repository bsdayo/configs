# ==========
# Completion
# ==========
autoload -Uz compinit
compinit

# Enable menu-style completion selection
zstyle ':completion:*' menu select
# Support sudo completions
zstyle ':completion::complete:*' gain-privileges 1

completions_dir="$HOME/.zsh/completions"
source "$completions_dir/pnpm.zsh"


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


# =====
# Paths
# =====
export PATH="$PATH:$HOME/.local/share/JetBrains/Toolbox/scripts"


# =======
# Aliases
# =======
alias ls="eza -l --group-directories-first"
alias sc="systemctl --user"


# ======
# Prompt
# ======
eval "$(starship init zsh)"
