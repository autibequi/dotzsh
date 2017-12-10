# Check if zplug is installed
if [[ ! -d ~/.zplug ]]; then
  git clone https://github.com/zplug/zplug ~/.zplug
  source ~/.zplug/init.zsh && zplug update --self
fi

# Load ZPlug
source ~/.zplug/init.zsh

# ZShell Plugins
zplug "zdharma/fast-syntax-highlighting", defer:2
zplug "plugins/git", from:oh-my-zsh
zplug "plugins/colorize", from:oh-my-zsh
zplug "zsh-users/zsh-history-substring-search"
zplug "Tarrasch/zsh-bd"

# Agnostic Shell Plugins
zplug 'rupa/z', use:'*.sh'
zplug "junegunn/fzf-bin", as:command, from:gh-r, rename-to:"fzf", frozen:1
zplug "raylee/tldr", as:command, use:"tldr"

# Themes
zplug 'themes/sorin', from:oh-my-zsh

# ZPlug update
zplug check || zplug install

# Load Plugins
zplug load
