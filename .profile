# this file is only for environment variables that are shell-independent
export GOPATH=$HOME/code/go
#export PATH=$PATH:$HOME/code/go/bin:$HOME/scripts:$HOME/.cabal/bin:$HOME/.local/bin:$HOME/.gem/ruby/2.3.0/bin
export PATH="$(getconf PATH)"
export EDITOR='vim'
export PAGER='less -R'
export NVM_DIR="$HOME/.nvm"
#source "$NVM_DIR/nvm.sh"
#nvm use v10.16.3
export NODE_ENV=development
export PATH="/usr/local/opt/mongodb@3.4/bin:$PATH"
export PATH="/usr/local/opt/redis@3.2/bin:$PATH"
export PATH="/usr/local/bin:$PATH"
#export PYCURL_SSL_LIBRARY=openssl
export SLACK_TOKEN='xoxb-2202707434-388708803239-N5ukvTZdjLOGA5UtN0ZdVJfD'
#export MONGO_URL='mongodb://readOnly:cdYaukQqVV@ds045670-a1.bxp01.fleet.mlab.com:45670/?authSource=production&authMechanism=SCRAM-SHA-1'
export LDFLAGS="-L/usr/local/opt/openssl/lib"
export CPPFLAGS="-I/usr/local/opt/openssl/include"
#export BROWSER='/usr/bin/google-chrome-stable'
export GITHUB_AUTH_TOKEN="372243cdf96aa46f3f0b44b8d7e3ec2d16c9e047"
