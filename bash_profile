if [ -f ~/.bashrc ]; then
   source ~/.bashrc
fi

if [ -f ~/.profile ]; then
  source ~/.profile
fi

# [ -s "/Users/drhayes/.nvm/nvm.sh" ] && . "/Users/drhayes/.nvm/nvm.sh" # This loads nvm

# The next line enables bash completion for gcloud.
source '/Users/drhayes/google-cloud-sdk/completion.bash.inc'

# When IP changes in VM and I want epiquery on laptop to talk to VM, modify this file.
alias nat="sudo vim /Library/Preferences/VMware\ Fusion/vmnet8/nat.conf"
# Restart the connection stuff after changing above.
alias nat2="sudo /Applications/VMware\ Fusion.app/Contents/Library/vmnet-cli --stop && sudo /Applications/VMware\ Fusion.app/Contents/Library/vmnet-cli --start"

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash"

# added by Anaconda2 4.0.0 installer
export PATH="/Users/drhayes/anaconda/bin:$PATH"

# The next line updates PATH for the Google Cloud SDK.
if [ -f /Users/drhayes/Downloads/google-cloud-sdk/path.bash.inc ]; then
  source '/Users/drhayes/Downloads/google-cloud-sdk/path.bash.inc'
fi

# The next line enables shell command completion for gcloud.
if [ -f /Users/drhayes/Downloads/google-cloud-sdk/completion.bash.inc ]; then
  source '/Users/drhayes/Downloads/google-cloud-sdk/completion.bash.inc'
fi
