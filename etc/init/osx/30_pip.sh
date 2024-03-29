#!/bin/bash

# Stop script if errors occur
trap 'echo Error: $0:$LINENO stopped; exit 1' ERR INT
set -eu

# Load vital library that is most important and
# constructed with many minimal functions
# For more information, see etc/README.md
. "$DOTPATH"/etc/lib/vital.sh

# This script is only supported with OS X
if ! is_osx; then
    log_fail "error: this script is only supported with osx"
    exit 1
fi

if has "pip3"; then
    if ! pip3 install -r "$DOTPATH"/etc/init/assets/requirements.txt ; then
        log_fail "error: failed to pip3 install"
        exit 1
    fi

else
    log_fail "error: require: pip3"
    exit 1
fi

log_pass "pip3: tapped successfully"
