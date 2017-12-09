# Check if zplug is installed
if [[ ! -d ~/.zplug ]]; then
  git clone https://github.com/zplug/zplug ~/.zplug
  source ~/.zplug/init.zsh && zplug update --self
fi

# Load ZPlug
source ~/.zplug/init.zsh



# Themes
zplug 'themes/sorin', from:oh-my-zsh

# ZPlug update
zplug check || zplug install

# Load Plugins
zplug load
