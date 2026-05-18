source /usr/share/cachyos-fish-config/cachyos-config.fish

export EDITOR=nvim
export PATH="$HOME/.cargo/bin:$PATH"

fish_add_path /home/x4eros/.spicetify
source (/usr/bin/starship init fish --print-full-init | psub)

fzf_configure_bindings --directory=ctrl-f --variables=ctrl-alt-v
set fzf_fd_opts --hidden
