# this file is only for environment variables that are shell-independent
export GOPATH=$HOME/code/go
#export PATH=$PATH:$HOME/code/go/bin:$HOME/scripts:$HOME/.cabal/bin:$HOME/.local/bin:$HOME/.gem/ruby/2.3.0/bin
export PATH="$(getconf PATH)"
export EDITOR='vim'
export PAGER='less -R'
export NVM_DIR="$HOME/.nvm"
source "$NVM_DIR/nvm.sh"
export PATH="/usr/local/opt/mongodb@3.4/bin:$PATH"
export PATH="/usr/local/opt/redis@2.8/bin:$PATH"
export PATH="$PATH:/usr/local/bin"
#export BROWSER='/usr/bin/google-chrome-stable'
