# =====================
# Environment Variables
# =====================
export EDITOR="nvim"
eval "$(/opt/homebrew/bin/brew shellenv)"


# ==========
# Completion
# ==========
autoload -Uz compinit
rm -f ~/.zcompdump; compinit

# Enable menu-style completion selection
zstyle ':completion:*' menu select
# Enable case-insensitive completion
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
# Enable sudo completions
zstyle ':completion::complete:*' gain-privileges 1

type pnpm > /dev/null && eval "$(pnpm completion zsh)"
type uv > /dev/null && eval "$(uv generate-shell-completion zsh)"


# ============
# Key bindings
# ============
bindkey  "^[[H"   beginning-of-line
bindkey  "^[[F"   end-of-line
bindkey  "^[[3~"  delete-char
bindkey "^[[1;3C" forward-word
bindkey "^[[1;3D" backward-word


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
source "$HOMEBREW_PREFIX/share/zsh-autosuggestions/zsh-autosuggestions.zsh"
source "$HOMEBREW_PREFIX/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"


# =======
# Aliases
# =======
alias ls="eza -l --group-directories-first"


# ======
# Prompt
# ======
eval "$(starship init zsh)"
