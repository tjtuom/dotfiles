set -xg PATH $HOME/bin:/usr/local/bin:$PATH
set -xg PATH $HOME/.local/bin:$PATH

source $OMF_CONFIG/aliases.fish

# Rust
. "$HOME/.cargo/env"

