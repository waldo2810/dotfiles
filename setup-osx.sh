#!/bin/bash

option=$1
dotfiles_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
config_source_dir="$dotfiles_dir/.config"
config_dir="$HOME/.config"

create_config_dir() {
    echo "Creating dir in $config_dir..."
    mkdir -p "$config_dir"
}

setup_nvim() {
    create_config_dir
    local target="$config_dir/nvim"

    if [ -L "$target" ]; then
        echo "Neovim symlink already exists, removing..."
        rm "$target"
    elif [ -e "$target" ]; then
        echo "Warning: $target exists but is not a symlink. Backing up..."
        mv "$target" "${target}.backup.$(date +%s)"
    fi

    echo "Creating Neovim symbolic link..."
    ln -s "$config_source_dir/nvim" "$target"
    echo "Neovim configuration linked successfully"
}

setup_tmux() {
    create_config_dir
    local target="$config_dir/tmux"

    if [ -L "$target" ]; then
        echo "Tmux symlink already exists, removing..."
        rm "$target"
    elif [ -e "$target" ]; then
        echo "Warning: $target exists but is not a symlink. Backing up..."
        mv "$target" "${target}.backup.$(date +%s)"
    fi

    echo "Creating Tmux symbolic link..."
    ln -s "$config_source_dir/tmux" "$target"
    echo "Tmux configuration linked successfully"

    # Also link tmux-sessionizer script
    local bin_dir="$HOME/.local/bin"
    mkdir -p "$bin_dir"
    local sessionizer_target="$bin_dir/tmux-sessionizer"

    if [ -L "$sessionizer_target" ]; then
        rm "$sessionizer_target"
    elif [ -e "$sessionizer_target" ]; then
        mv "$sessionizer_target" "${sessionizer_target}.backup.$(date +%s)"
    fi

    ln -s "$dotfiles_dir/scripts/tmux-sessionizer.sh" "$sessionizer_target"
    chmod +x "$dotfiles_dir/scripts/tmux-sessionizer.sh"
    echo "Tmux sessionizer script linked to $bin_dir"
}

setup_all() {
    echo "Setting up all configurations..."
    setup_nvim
    setup_tmux
    echo "All configurations set up successfully"
}

echo "Setting up $option..."

case "$option" in
    nvim)
        setup_nvim
        ;;
    tmux)
        setup_tmux
        ;;
    all)
        setup_all
        ;;
    *)
        echo "Unknown option: $option"
        echo "Usage: $0 {nvim|tmux|all}"
        exit 1
        ;;
esac

echo "Set up for $option completed"
