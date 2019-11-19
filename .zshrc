# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=/Users/haudao/.oh-my-zsh

ZSH_THEME="dracula"

plugins=(
  git
  zsh-syntax-highlighting
  zsh-autosuggestions
  z.lua
)


source $ZSH/oh-my-zsh.sh
source $HOME/.secrets

export EDITOR='vim'

# Improve CLI
alias cat='bat'
alias help='tldr'
alias du="ncdu --color dark -rr -x --exclude .git --exclude node_modules"
alias vim='nvim'
alias vi='nvim'

# Load nvm
export NVM_DIR="$HOME/.nvm"
if [[ -e ~/.nvm/alias/default ]]; then
  PATH="${PATH}:${HOME}/.nvm/versions/node/v$(cat ~/.nvm/alias/default)/bin"
fi
nvm() {
  [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
  [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"
  nvm "$@"
}


# Load rbenv
if [[ -s ~/.rbenv/shims/ruby ]]; then
  PATH="${HOME}/.rbenv/shims:${PATH}"
fi
rbenv() {
  eval "$(command rbenv init -)"
  rbenv "$@"
}
export SKIP_NPM_BUILD=true

alias herostag='hero $@ --context solomon.ehrocks.com'
alias heroprod='hero $@ --context david.ehrocks.com'
alias hero2stag='herocli --server hero2.staging.ehrocks.com:443'
alias hero2prod='herocli --server hero2.ehrocks.com:443'

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
[ -f ~/.bundler-exec.sh ] && source ~/.bundler-exec.sh
export PATH="/usr/local/opt/openssl/bin:$PATH"
