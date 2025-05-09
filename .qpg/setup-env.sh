#!/bin/bash
# Environment setup for QPG with post-quantum support

export GNUPGHOME="/home/phaedrus/.qpg"
export PATH="/opt/qpg/bin:$PATH"
export LD_LIBRARY_PATH="/opt/qpg/lib:$LD_LIBRARY_PATH"

# Alias for easy use
alias qpg='/opt/qpg/bin/qpg'
alias qpg-agent='/opt/qpg/bin/gpg-agent'
alias qpg-connect-agent='/opt/qpg/bin/gpg-connect-agent'

# Set custom home for QPG
qpg --homedir="${GNUPGHOME}" "$@"
