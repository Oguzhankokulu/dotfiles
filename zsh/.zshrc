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

# --- Random Fastfetch ASCII Art ---

LOGO_DIR="$HOME/.config/fastfetch/logos"

# Find a random file
RANDOM_LOGO=$(find "$LOGO_DIR" -type f | shuf -n 1)

if [ -f "$RANDOM_LOGO" ]; then
    fastfetch --logo "$RANDOM_LOGO" --logo-type file --logo-color-1 red --logo-color-2 white
else
    fastfetch
fi
export PATH="$HOME/.local/bin:$PATH"

export PATH=$PATH:/home/oguzhan/.spicetify
export PATH=$HOME/.spicetify:$PATH
