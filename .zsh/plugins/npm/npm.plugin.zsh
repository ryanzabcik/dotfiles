source "$NVM_DIR/nvm.sh"
nvm use v10.16.3
eval "$(npm completion 2>/dev/null)"
alias npmi='npm i --no-save'
alias bcfix='npm i bcrypt --no-save --build-from-source'
