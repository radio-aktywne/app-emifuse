#!/bin/bash

# Activate runtime shell
# shellcheck source=/dev/null
. /env/activate

# Run as non-root user
# Use tini to handle signals
su-exec app tini -s -- "$@"
