#!/bin/sh

print_usage() {
    # Prints script usage

    cat <<EOF
Usage: $0 [-l PORT]
    -l, --live             port to listen on for live streams (default: 9000)
EOF
}

live='9000'

while [ "$#" -gt 0 ]; do
    case "$1" in
    -l | --live)
        shift
        live="$1"
        ;;
    -h | --help)
        print_usage
        exit
        ;;
    esac
    shift
done

FUSION_SOURCE_LIVE_PORT="$live" liquidsoap fusion.liq
