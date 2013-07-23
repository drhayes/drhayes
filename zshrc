# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

skip_global_compinit=1

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="cloud"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
#DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git python autojump node npm sublime osx history-substring-search)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...
export PATH=/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/usr/local/sbin:/usr/X11/bin:/usr/local/git/bin:/usr/local/share/npm/bin:~/bin
export NODE_PATH="/usr/local/lib/node_modules"
export PYTHONPATH=$PYTHONPATH:/usr/local/google_appengine

# Git aliases
alias gs="git status"
alias gc="git commit"
alias gca="git commit -a"

# Utilities
alias serveme="http-server"
alias unhide="chflags nohidden $1"

# Long-running commands growlnotify on completion
if growlnotify -h &>/dev/null; then
    preexec() {
        zsh_growl_cmd=$1
        zsh_growl_time=`date +%s`
    }

    precmd() {
        if (( $? == 0 )); then
            zsh_growl_status=done
        else
            zsh_growl_status=fail
        fi
        if [[ "${zsh_growl_cmd}" != "" ]]; then
            if (( `date +%s` - ${zsh_growl_time} > 5 )); then
                growlnotify -m ${zsh_growl_cmd} ${zsh_growl_status}
            fi
        fi
        zsh_growl_cmd=
    }
fi

