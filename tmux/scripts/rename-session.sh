#!/usr/bin/env bash
current=$(tmux display-message -p '#S')
printf 'Session name [%s]: ' "$current"

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

tmux rename-session -- "${name:-$current}"
