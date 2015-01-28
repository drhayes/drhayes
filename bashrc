# Customize to your needs...
export PATH=~/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/sbin:/usr/X11/bin:/usr/local/git/bin:/usr/local/mysql/bin:/usr/local/share/npm/bin:/usr/local/bin:~/src/AppRunner/:$PATH
launchctl setenv PATH $PATH

# Autojump!
. /usr/local/etc/autojump.bash

# Long-running commands growlnotify on completion
#. ~/src/drhayes/preexec.bash
#. ~/src/drhayes/long-running.bash

# Sexy bash prompt
. ~/src/drhayes/sexy_bash_prompt.bash

# Start a local stupid redis
alias start-redis="redis-server /usr/local/etc/redis.conf"

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
alias gl='git log'

alias serveme="http-server"

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
