#!/usr/bin/env bash
printf 'Window name: '

name=""
while IFS= read -rsn1 char; do
    if [[ $char == $'\e' ]]; then
        exit 0
    elif [[ $char == $'\n' || $char == $'\r' || -z $char ]]; then
        break
    elif [[ $char == $'\x7f' || $char == $'\b' ]]; then
        if [[ -n $name ]]; then
            name="${name%?}"
            printf '\b \b'
        fi
    else
        name+="$char"
        printf '%s' "$char"
    fi
done

if [[ -n $name ]]; then
    tmux new-window -n "$name"
else
    tmux new-window
fi
