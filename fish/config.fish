if status is-interactive
    # Enable native Vi key bindings (automatically manages block/beam cursor shapes)
    set -g fish_key_bindings fish_vi_key_bindings
end

# Add ~/.local/bin to your path for your custom scripts
fish_add_path ~/.local/bin

# Mesa performance tweaks for gaming (OpenGL multithreading)
set -gx mesa_glthread true

# Hybrid GPU offloader (runs command on the dedicated AMD GPU)
alias prime-run="env DRI_PRIME=1"
