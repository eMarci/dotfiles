#!/usr/bin/env bash

contains() {
    local target="$1"
    shift
    local arr=("$@")

    for elem in "${arr[@]}"; do
        if [[ $elem == $target ]]; then
            return 0
        fi
    done

    return 1
}

main() {
    local container_name="$1"

    local ALL="$(docker network ls --format json | jq -s 'map(.Name)')"

    local CONNECTED
    CONNECTED="$(docker container inspect "$container_name" | jq '.[].NetworkSettings.Networks | keys')" || return 1
    local CONN_ARR=()
    mapfile -t CONN_ARR <<<"$(jq -r '.[]' <<<"$CONNECTED")"

    local MERGED="$(jq -r -n --argjson all "$ALL" --argjson connected "$CONNECTED" '$connected + ($all - $connected) | .[]')"

    local NETS=()
    mapfile -t NETS <<<"$MERGED"

    local CONN_COUNT="$(jq 'length' <<<"$CONNECTED")"

    local START_CMD=''
    if (( CONN_COUNT > 0 )); then
        START_CMD='--bind=start:select'
        for (( i=1; i<CONN_COUNT; i++  )); do
            START_CMD="${START_CMD}+up+select"
        done
        START_CMD="${START_CMD}+first"
    fi

    local SELECTED
    SELECTED="$(docker network inspect "${NETS[@]}" | jq -r 'map(.Name) | .[]' | fzf --bind 'enter:transform: [[ $FZF_SELECT_COUNT -gt 0 ]] && echo accept || echo abort' --height=~30% --tmux=center,30%,border-native --multi --sync ${START_CMD})"

    local SELECTED_ARR=()
    mapfile -t SELECTED_ARR <<<"$SELECTED"

    local selected
    for selected in "${SELECTED_ARR[@]}"; do
        if [[ -n $selected ]] && ! contains "$selected" "${CONN_ARR[@]}"; then
            docker network connect "$selected" "$container_name" 
        fi
    done

    local connected
    for connected in "${CONN_ARR[@]}"; do
        if [[ -n $connected ]] && ! contains "$connected" "${SELECTED_ARR[@]}"; then
            docker network disconnect "$connected" "$container_name"
        fi
    done
}

main "$@"
