#!/bin/bash

source $1

trim() {
    local var="$*"
    # remove leading whitespace characters
    var="${var#"${var%%[![:space:]]*}"}"
    # remove trailing whitespace characters
    var="${var%"${var##*[![:space:]]}"}"   
    echo -n "$var"
}

count=0
last_cmd=""
while [ $count -lt ${#Command[@]} ]; do
    if [ -e /home/techio/.bash_history ]; then
        hist_cmd=$(trim $(tail -n 1 /home/techio/.bash_history))
    else
        hist_cmd=""
    fi
    if [ "$last_cmd" != "$hist_cmd" ]; then
        last_cmd="$hist_cmd"
        if [ "$hist_cmd" == "do_it" ]; then
            /scripts/ttyecho -n /dev/ttyS0 "${Command[$count]}"
        else
            if [ "$hist_cmd" == "${Command[$count]}" ]; then
                echo
                if [ -n "${Comment[$count]}" ]; then
                    echo " ==> ${Comment[$count]} <=="
                fi
                count=$(( $count + 1 ))
                if [ $count -lt ${#Command[@]} ]; then
                    echo " ==> Next command: ${Command[$count]} <=="
                else
                    echo " ==> You have reached the end of this lesson <=="
                fi
                /scripts/ttyecho -n /dev/ttyS0 ""
            fi
        fi
    fi
    sleep 0.1
done


while true; do
    sleep 30
done
