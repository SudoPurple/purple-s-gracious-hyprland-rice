# Disable the default Fish welcome greeting
set -g fish_greeting

if status is-interactive
    # Enable native Vi key bindings (automatically manages block/beam cursor shapes)
    set -g fish_key_bindings fish_vi_key_bindings

    # Set the correct path for Starship config
    set -gx STARSHIP_CONFIG ~/.config/starship/starship.toml

    # Initialize Starship prompt
    starship init fish | source

    # Initialize Zoxide (smart cd)
    zoxide init fish | source

    # Initialize Fzf (fuzzy finder) key bindings and completions
    fzf --fish | source
end

# Add ~/.local/bin to your path for your custom scripts
fish_add_path ~/.local/bin

# Modern replacement aliases for ls (using eza)
alias ls="eza --icons=always --color=always --group-directories-first"
alias la="eza -a --icons=always --color=always --group-directories-first"
alias ll="eza -lh --icons=always --color=always --group-directories-first"
alias lt="eza --tree --icons=always --color=always"

# Mesa performance tweaks for gaming (OpenGL multithreading)
set -gx mesa_glthread true

# Hybrid GPU offloader (runs command on the dedicated AMD GPU)
alias prime-run="env DRI_PRIME=1"
