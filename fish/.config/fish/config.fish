if test -f /usr/share/cachyos-fish-config/cachyos-config.fish
    source /usr/share/cachyos-fish-config/cachyos-config.fish
end

export EDITOR=nvim
export PATH="$HOME/.cargo/bin:$PATH"
export TERMINAL="ghostty"

fish_add_path /home/x4eros/.spicetify
source (/usr/bin/starship init fish --print-full-init | psub)

fzf_configure_bindings --directory=ctrl-f --variables=ctrl-alt-v
set fzf_fd_opts --hidden

alias hypervisor='sudo modprobe -r kvm_amd kvm
sudo modprobe cpuid_fault_emulation'

alias start-stream="systemctl --user start punktfunk-host punktfunk-scripting.service punktfunk-web.service"
alias stop-stream="systemctl --user stop punktfunk-host punktfunk-scripting.service punktfunk-web.service"
