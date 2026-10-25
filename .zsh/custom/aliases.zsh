# first, get aliases from .bash/aliases if it exists
if [ -f ~/.bash/aliases ]; then
    source ~/.bash/aliases
fi

# everything below this line is for zsh only
alias incognito='HISTFILE=/dev/null zsh'
alias find='noglob find'
alias findn='noglob find . -name'

# new functions
function mcd() { md $1; cd $1 }


# global aliases
alias -g G='| grep'
alias -g L='| less'
alias -g W='| wc -l'
alias -g H='| head -n 10'
alias -g T='| tail -n 10'
alias -g P='| pv -qL 10'
alias -g V='| vim -'
alias -g NE='2> /dev/null'