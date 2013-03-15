# webpass command: generates a password for every website

function webpass {
    #usage: webpass <website>

    website=$1
    stty -echo
    read -p "Password: " password
    echo
    stty echo

    echo "$password$website" | sha1sum - | cut -d" " -f1 | xxd -r -p | base64 | tr -d -c [:alnum:]
    echo
}

# automatically ls after cd'ing into a new directory

function cd {
    builtin cd "$@" && ls --color=auto
}

function random.org {
    curl "http://www.random.org/integers/?num=1&min=""$1""&max=""$2""&col=1&base=10&format=plain&rnd=new"
}

function tree {
    if [[ $1 == '-f' ]];
        then ls -R "${@:2}" | sed -e 's/:$//' -e 's/[^-][^\/]*\//--/g' -e 's/^/   /' -e 's/-/|/';
    else
        ls -R "$@" | grep ':$' | sed -e 's/:$//' -e 's/[^-][^\/]*\//--/g' -e 's/^/   /' -e 's/-/|/'
    fi
}

function pacsize {
     pacman -Qi $(pacman -Qq) | grep 'Name\|Size' | cut -d: -f2 | paste - - | column -t | sort -nk2
}

# usage: plays back a text-to-speech recording of the argument(s)

#function say { 
#	if [[ "${1}" =~ -[a-z]{2} ]];
#		then local lang=${1#-}; 
#			local text="${*#$1}"; 
#		else local lang=${LANG%_*}; 
#			local text="$*";
#	fi;
# 	clvc "http://translate.google.com/translate_tts?ie=UTF-8&tl=${lang}&q=${text}" &> /dev/null ; 
#}

# directory-specific message

function message {
    if [[ $PWD == /home/ryan/git/* ]];
        then parse_git_branch
    fi
    if [[ $PWD == /data/Dropbox ]];
        then dropbox status | tr '\n' ' '
    fi
}

function parse_git_dirty {
    if [[ $(git status 2> /dev/null | tail -n1) != nothing* ]];
        then echo -n "*"
    fi
}

function parse_git_branch {
    git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e "s/* \(.*\)/\1$(parse_git_dirty)/" | tr '\n' ' '
}
