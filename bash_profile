if [ -f ~/.bashrc ]; then
   source ~/.bashrc
fi

if [ -f ~/.profile ]; then
  source ~/.profile
fi

[ -s "/Users/drhayes/.nvm/nvm.sh" ] && . "/Users/drhayes/.nvm/nvm.sh" # This loads nvm

# The next line updates PATH for the Google Cloud SDK.
source '/Users/drhayes/google-cloud-sdk/path.bash.inc'

# The next line enables bash completion for gcloud.
source '/Users/drhayes/google-cloud-sdk/completion.bash.inc'

# When IP changes in VM and I want epiquery on laptop to talk to VM, modify this file.
alias nat="sudo vim /Library/Preferences/VMware\ Fusion/vmnet8/nat.conf"
# Restart the connection stuff after changing above.
alias nat2="sudo /Applications/VMware\ Fusion.app/Contents/Library/vmnet-cli --stop && sudo /Applications/VMware\ Fusion.app/Contents/Library/vmnet-cli --start"
