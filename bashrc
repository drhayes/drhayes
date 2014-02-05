# Customize to your needs...
export PATH=~/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/sbin:/usr/X11/bin:/usr/local/git/bin:/usr/local/mysql/bin:/usr/local/share/npm/bin:/usr/local/bin:$PATH
launchctl setenv PATH $PATH

# Autojump!
. /usr/local/etc/autojump.bash

# Long-running commands growlnotify on completion
#. ~/src/drhayes/preexec.bash
#. ~/src/drhayes/long-running.bash

# Sexy bash prompt
. ~/src/drhayes/sexy_bash_prompt.bash

# Make less search case insensitive by default
alias less='less -i'

# git aliases
alias ga='git add'
alias gs='git status'
alias gc='git commit'
alias gd='git diff'
alias gca='git commit -a'
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

PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
