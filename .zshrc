# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=/Users/dvhau/.oh-my-zsh

ZSH_THEME="dracula"

plugins=(
  git
  zsh-syntax-highlighting
  zsh-autosuggestions
  zsh-z
)

source $ZSH/oh-my-zsh.sh

export EDITOR='nvim'

# Improve CLI
alias cat='bat'
alias help='tldr'
alias du="ncdu --color dark -rr -x --exclude .git --exclude node_modules"
alias vim='nvim'
alias vi='nvim'

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

export FZF_DEFAULT_COMMAND='rg --files --hidden'

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
[ -f ~/.bundler-exec.sh ] && source ~/.bundler-exec.sh
export PATH="/usr/local/opt/openssl/bin:$PATH"
export PATH="./bin:$PATH"
