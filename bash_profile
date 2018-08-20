if [ -f ~/.bashrc ]; then
   source ~/.bashrc
fi

if [ -f ~/.profile ]; then
  source ~/.profile
fi

if [ -f /Users/drhayes/google-cloud-sdk/path.bash.inc ]; then
  source /Users/drhayes/google-cloud-sdk/path.bash.inc
fi

if [ -f /Users/drhayes/google-cloud-sdk/completion.bash.inc ]; then
  source /Users/drhayes/google-cloud-sdk/completion.bash.inc
fi

# [ -s "/Users/drhayes/.nvm/nvm.sh" ] && . "/Users/drhayes/.nvm/nvm.sh" # This loads nvm

# The next line enables bash completion for gcloud.
source '/Users/drhayes/google-cloud-sdk/completion.bash.inc'

test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash"

# added by Anaconda2 4.0.0 installer
export PATH="/Users/drhayes/anaconda/bin:$PATH"

