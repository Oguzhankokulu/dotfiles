# Created by newuser for 5.9

# Enable completion
autoload -Uz compinit
compinit

zstyle ':completion:*' menu select

# Enable autosuggestions (gray text)
source /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh


# Enable Starship
eval "$(starship init zsh)"


source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# --- Custom Fastfetch Function ---
fastfetch() {
    # 1. If you type extra flags (like fastfetch --help), run standard fastfetch
    if [ $# -gt 0 ]; then
        command fastfetch "$@"
        return
    fi

    # 2. Random Logo Logic
    LOGO_DIR="$HOME/.config/fastfetch/logos"

    # Find a random file (if directory exists)
    if [ -d "$LOGO_DIR" ]; then
        RANDOM_LOGO=$(find "$LOGO_DIR" -type f | shuf -n 1)
    fi

    # 3. Run Fastfetch with the logo
    if [ -n "$RANDOM_LOGO" ] && [ -f "$RANDOM_LOGO" ]; then
        # 'command' prevents the function from calling itself recursively
        command fastfetch --logo "$RANDOM_LOGO" --logo-type file --logo-color-1 red --logo-color-2 white
    else
        command fastfetch
    fi
}

# Run this function once on terminal startup
fastfetch
