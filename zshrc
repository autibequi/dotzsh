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
zplug "k4rthik/git-cal", as:command, frozen:1, rename-to:"gcal"

# Agnostic Shell Plugins
zplug 'rupa/z', use:'*.sh'
zplug "junegunn/fzf-bin", as:command, from:gh-r, rename-to:"fzf", frozen:1
zplug "jhawthorn/fzy", as:command, rename-to:fzy, hook-build:"make && make install"
zplug "raylee/tldr", as:command, use:"tldr"

# Themes
zplug 'themes/sorin', from:oh-my-zsh

# ZPlug update
zplug check || zplug install

# Load Plugins
zplug load

# Load Scripts
for f in ~/.zsh/scripts/*.sh; do source $f; done
for f in ~/.zsh/alias/*.sh; do source $f; done
