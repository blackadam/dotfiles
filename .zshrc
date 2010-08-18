
# Where everything is.
Z=~/.zsh

# Set up a working environment.
source $Z/environment.zsh

# Set some options.
source $Z/options.zsh

# Define some functions.
source $Z/functions.zsh



# Set the prompt.
if (( C == 256 )); then
    source $Z/prompt_256.zsh
    # Set up some colors for directory listings.
    source $Z/ls_colors_256.zsh
else
    source $Z/prompt.zsh
fi

# Set up some aliases
source $Z/aliases.zsh

# Initialize the completion system.
source $Z/completion.zsh

# Set key bindings
source $Z/keys.zsh

# For yaourt
export color=


