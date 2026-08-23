[[ $- == *i* ]] && [[ -r /usr/share/blesh/ble.sh ]] && source /usr/share/blesh/ble.sh --noattach

# Omarchy environment (OMARCHY_PATH + PATH), needed even for non-interactive shells
[[ -r /usr/share/omarchy/default/bash/env-bootstrap ]] && source /usr/share/omarchy/default/bash/env-bootstrap

# If not running interactively, don't do anything else (leave this above the rc source)
[[ $- != *i* ]] && return

# All the default Omarchy aliases and functions
# (don't mess with these directly, just overwrite them here!)
source "$OMARCHY_PATH/default/bash/rc"

# Add your own exports, aliases, and functions here.
#
# Make an alias for invoking commands you use constantly
# alias p='python'

# Personal aliases (ported from old dotfiles)
alias c='clear'
alias e='exit'
alias ll='ls -l --color=auto'
alias l.='ls -d .* --color=auto'
alias egrep='grep -E --color=auto'
alias fgrep='grep -F --color=auto'
alias grep='grep --color=auto'
alias ls='eza --all --group-directories-first --icons=always'

# Navigation
alias cfg='cd ~/.config'
alias storage='cd /mnt/storage'

# Safety
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'

# System info
alias pkgs='pacman -Q | wc -l'
alias ports='ss -tulnp'
alias myip='curl -s ifconfig.me'

# tmux with UTF-8
alias tmux='tmux -u'

# Git
alias g='git'
alias ga='git add'
alias gafzf='git ls-files -m -o --exclude-standard | grep -v "__pycache__" | fzf -m --print0 | xargs -0 -o -t git add' # Git add with fzf
alias grmfzf='git ls-files -m -o --exclude-standard | fzf -m --print0 | xargs -0 -o -t git rm' # Git rm with fzf
alias grfzf='git diff --name-only | fzf -m --print0 | xargs -0 -o -t git restore' # Git restore with fzf
alias grsfzf='git diff --name-only | fzf -m --print0 | xargs -0 -o -t git restore --staged' # Git restore --staged with fzf
alias gf='git fetch'
alias gs='git status'
alias gss='git status -s'
alias gup='git fetch && git rebase'
alias gtd='git tag --delete'
alias gtdr='git tag --delete origin'
alias glo='git pull origin'
alias gl='git pull'
alias gb='git branch '
alias gbr='git branch -r'
alias gd='git diff'
alias gco='git checkout '
alias gcob='git checkout -b '
alias gcofzf='git branch | fzf | xargs git checkout' # Select branch with fzf
alias gre='git remote'
alias gres='git remote show'
alias glgg='git log --graph --max-count=5 --decorate --pretty="oneline"'
alias gm='git merge'
alias gp='git push'
alias gpo='git push origin'
alias ggpush='git push origin $(git branch --show-current)'
alias gc='git commit -v'
alias gcm='git commit -m'
alias gcmnv='git commit --no-verify -m'
alias gcanenv='git commit --amend --no-edit --no-verify'

# Commit with ticket ID parsed from the current branch name, with optional push
quick_commit() {
  local branch_name ticket_id commit_message push_flag
  branch_name=$(git branch --show-current)
  ticket_id=$(echo "$branch_name" | awk -F '-' '{print toupper($1"-"$2)}')
  commit_message="$ticket_id: $*"
  push_flag=$1

  if [[ "$push_flag" == "push" ]]; then
    commit_message="$ticket_id: ${*:2}"
    git commit --no-verify -m "$commit_message" && git push
  else
    git commit --no-verify -m "$commit_message"
  fi
}
alias gqc='quick_commit'
alias gqcp='quick_commit push'

# Neovim (falls back to plain nvim if poetry/poetry.lock aren't present)
poetry_run_nvim() {
  if command -v poetry >/dev/null 2>&1 && [ -f "poetry.lock" ]; then
    poetry run nvim "$@"
  else
    nvim "$@"
  fi
}
alias vi='poetry_run_nvim'
alias v='poetry_run_nvim'

# Folders
doc() { cd "$HOME/Documents" || return; }
dow() { cd "$HOME/Downloads" || return; }

# Lazygit
alias lg='lazygit'

[[ ${BLE_VERSION-} ]] && ble-attach
