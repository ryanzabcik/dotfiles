# The following lines were added by Docker Desktop to add commands to your PATH.
export PATH="$PATH:/Users/rzabcik/.docker/bin"
# End of Docker Desktop section.

eval "$(/opt/homebrew/bin/brew shellenv zsh)"
export JAVA_HOME="/opt/homebrew/Cellar/openjdk@21/21.0.12.1"
export PATH="$JAVA_HOME/bin:$PATH"

export PATH="/opt/homebrew/opt/gnu-sed/libexec/gnubin:$PATH" 

export NVM_DIR="$HOME/.nvm"
[ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
[ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"
