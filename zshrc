# Check if zplug is installed
if [[ ! -d ~/.zplug ]]; then
  git clone https://github.com/zplug/zplug ~/.zplug
  source ~/.zplug/init.zsh && zplug update --self
fi

# Load ZPlug
source ~/.zplug/init.zsh

# ZShell Plugins
zplug "zsh-users/zsh-completions"
zplug "zsh-users/zsh-syntax-highlighting"
zplug "plugins/git", from:oh-my-zsh
zplug "plugins/colorize", from:oh-my-zsh

# Agnostic Shell Plugins
zplug 'rupa/z', use:'*.sh'

# Themes
zplug 'themes/sorin', from:oh-my-zsh

# ZPlug update
zplug check || zplug install

# Load Plugins
zplug load
