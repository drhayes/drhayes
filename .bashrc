export GOPATH=~/go
export PATH=~/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/sbin:/usr/X11/bin:/usr/local/git/bin:/usr/local/mysql/bin:/usr/local/share/npm/bin:/usr/local/bin:~/src/AppRunner:$GOPATH/bin:$PATH
export EDITOR=vim
#launchctl setenv PATH $PATH

# I want lots of colors.
set t_Co=256

# TensorFlow setup.
export WORKON_HOME=~/envs

# yarn path.
#export PATH="$PATH:`yarn global bin`"

# Sensible bash
if [ -f ~/src/drhayes/sensible.bash ]; then
  . ~/src/drhayes/sensible.bash
fi

# Helpful epi-screamer stuff.
if [ -f ~/src/drhayes/epi-screamer.bash ]; then
  . ~/src/drhayes/epi-screamer.bash
fi

# Long-running commands growlnotify on completion
#. ~/src/drhayes/preexec.bash
#. ~/src/drhayes/long-running.bash

# Sexy bash prompt
. ~/src/drhayes/sexy_bash_prompt.bash

# Pull request helpers
#. ~/src/drhayes/pull.bash

# DevDB env
#. ~/bin/dev_db.sh


# Autocomplete git branch names
if [ -f ~/src/drhayes/git-completion.bash ]; then
  . ~/src/drhayes/git-completion.bash
fi

if [ -f ~/.aws-keys ]; then
  . ~/.aws-keys
fi

# Set tab title to CWD
function set_tab_title {
  echo -n -e "\033]0;${PWD##*/}\007"
}
PROMPT_COMMAND="set_tab_title ; $PROMPT_COMMAND"

# Make less search case insensitive by default and use colors
alias less='less -Ri'

# git aliases
alias ga='git add'
alias gs='git status'
alias gc='git commit -v'
alias gd='git diff'
alias gca='git commit -av'
alias gl="git log --graph --date=relative --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset%n%w(0,4,4)%-b%n%n%-N'"
alias gp='git push'
# pretty visual git history
alias git-pretty="git log --graph --oneline --all --decorate"

alias ws="http-server"
alias weather="curl http://wttr.in/78752"

function mkd() {
  mkdir -p "$@" && cd "$@"
}

# First, npm install -g consolehighlighter
# https://github.com/nyteshade/ConsoleHighlighter
function seeJsCode() {
  consoleHighlight $1 | less -r
}
alias js=seeJsCode

# Quick way to rebuild the Launch Services database and get rid
# of duplicates in the Open With submenu.
alias fixopenwith='/System/Library/Frameworks/CoreServices.framework/Frameworks/LaunchServices.framework/Support/lsregister -kill -r -domain local -domain system -domain user'

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

export NVM_DIR="/Users/drhayes/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

# alias to love
alias love="/Applications/love.app/Contents/MacOS/love"

# alias to aseprite
alias aseprite="/Applications/Aseprite.app/Contents/MacOS/aseprite"

# tabtab source for serverless package
# uninstall by removing these lines or running `tabtab uninstall serverless`
[ -f /Users/drhayes/.nvm/versions/node/v8.5.0/lib/node_modules/serverless/node_modules/tabtab/.completions/serverless.bash ] && . /Users/drhayes/.nvm/versions/node/v8.5.0/lib/node_modules/serverless/node_modules/tabtab/.completions/serverless.bash
# tabtab source for sls package
# uninstall by removing these lines or running `tabtab uninstall sls`
[ -f /Users/drhayes/.nvm/versions/node/v8.5.0/lib/node_modules/serverless/node_modules/tabtab/.completions/sls.bash ] && . /Users/drhayes/.nvm/versions/node/v8.5.0/lib/node_modules/serverless/node_modules/tabtab/.completions/sls.bash
