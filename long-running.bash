# Source this, and then run notify_when_long_running_commands_finish_install
#
# Relies on http://www.twistedmatrix.com/users/glyph/preexec.bash.txt
# Full credit to http://code.mumak.net/2012/01/undistract-me.html
# Modified slightly for OSX support and blacklist (see the egrep loop in the
# precmd() function

if [ -f ~/src/drhayes/preexec.bash ]; then
    . ~/src/drhayes/preexec.bash
else
    echo "Could not find preexec.bash"
fi

LONG_RUNNING_COMMAND_TIMEOUT=10

function notify_when_long_running_commands_finish_install() {
    local RUNNING_COMMANDS_DIR=~/.cache/running-commands
    mkdir -p $RUNNING_COMMANDS_DIR
    for pid_file in $RUNNING_COMMANDS_DIR/*; do
        local pid=$(basename $pid_file)
        # If $pid is numeric, then check for a running bash process.
        case $pid in
        ''|*[!0-9]*) local numeric=0 ;;
        *) local numeric=1 ;;
        esac

        if [[ $numeric -eq 1 ]]; then
            local command=$(ps -o command= $pid)
            if [[ $command != $BASH ]]; then
                rm -f $pid_file
            fi
        fi
    done

    _LAST_COMMAND_STARTED_CACHE=$RUNNING_COMMANDS_DIR/$$

    function precmd () {

        if [[ -r $_LAST_COMMAND_STARTED_CACHE ]]; then

            local last_command_started=$(head -1 $_LAST_COMMAND_STARTED_CACHE)
            local last_command=$(tail -n +2 $_LAST_COMMAND_STARTED_CACHE)

            if [[ -n $last_command_started ]]; then
                local now=$(date -u +%s)
                local time_taken=$(( $now - $last_command_started ))
                if [[ $time_taken -gt $LONG_RUNNING_COMMAND_TIMEOUT ]]; then
                  if [ `echo "$last_command" | egrep -c "less|more|vi|vim|man|ssh"` == 1 ] ; then 
                    exit 0
                  else
                    growlnotify \
                        -m "$last_command completed in $time_taken seconds" \
                        "Command complete:"
                  fi
                fi
            fi
            # No command is running, so clear the cache.
            echo -n > $_LAST_COMMAND_STARTED_CACHE
        fi
    }

    function preexec () {
        date -u +%s > $_LAST_COMMAND_STARTED_CACHE
        echo "$1" >> $_LAST_COMMAND_STARTED_CACHE
    }

    preexec_install
}
