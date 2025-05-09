#!/bin/bash
# Script to activate QPG environment

# Save original values if not already saved
if [ -z "$ORIGINAL_PATH" ]; then
    export ORIGINAL_PATH="$PATH"
    export ORIGINAL_GNUPGHOME="${GNUPGHOME:-$HOME/.gnupg}"
    export ORIGINAL_LD_LIBRARY_PATH="$LD_LIBRARY_PATH"
    export ORIGINAL_PKG_CONFIG_PATH="$PKG_CONFIG_PATH"
    export ORIGINAL_MANPATH="$MANPATH"
fi

# Set QPG environment variables
export PATH="/opt/qpg/bin:$PATH"
export GNUPGHOME="$HOME/.qpg"
export LD_LIBRARY_PATH="/opt/qpg/lib:/opt/qpg/lib64:$LD_LIBRARY_PATH"
export PKG_CONFIG_PATH="/opt/qpg/lib/pkgconfig:/opt/qpg/lib64/pkgconfig:$PKG_CONFIG_PATH"
export MANPATH="/opt/qpg/share/man:$MANPATH"

echo "QPG environment activated. Using QPG from /opt/qpg"
echo "Run 'deactivate-qpg' to restore original environment"

# Define deactivation function
deactivate-qpg() {
    export PATH="$ORIGINAL_PATH"
    export GNUPGHOME="$ORIGINAL_GNUPGHOME"
    export LD_LIBRARY_PATH="$ORIGINAL_LD_LIBRARY_PATH"
    export PKG_CONFIG_PATH="$ORIGINAL_PKG_CONFIG_PATH"
    export MANPATH="$ORIGINAL_MANPATH"
    echo "Original GPG environment restored"
    unset -f deactivate-qpg
}
