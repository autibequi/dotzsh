export LANGUAGE=en_US.UTF-8
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8

HISTSIZE=5000               #How many lines of history to keep in memory
HISTFILE=~/.zsh_history     #Where to save history to disk
SAVEHIST=5000               #Number of history entries to save to disk
HISTDUP=erase               #Erase duplicates in the history file
setopt    appendhistory     #Append history to the history file (no overwriting)
setopt    sharehistory      #Share history across terminals
setopt    incappendhistory  #Immediately append to the history file, not just when a term is killed
setopt HIST_IGNORE_ALL_DUPS
setopt no_share_history     #Disable history sharing

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
zplug "k4rthik/git-cal", as:command, frozen:1, rename-to:"gcal", defer:3
zplug "zsh-users/zsh-autosuggestions"
zplug "zsh-users/zsh-completions"
zplug "b4b4r07/zsh-vimode-visual", use:"*.zsh", defer:3

# Async Loader
zplug "mafredri/zsh-async", from:"github", use:"async.zsh"

# Agnostic Shell Plugins
zplug 'rupa/z', use:'*.sh'
zplug "junegunn/fzf-bin", as:command, from:gh-r, rename-to:"fzf", frozen:1
zplug "jhawthorn/fzy", as:command, rename-to:fzy, hook-build:"make && make install"
zplug "raylee/tldr", as:command, use:"tldr"

# Themes
zplug 'dracula/zsh', as:theme
# zplug denysdovhan/spaceship-prompt, use:spaceship.zsh, from:github, as:theme

# Load Plugins
zplug load

# Adds an empty space between commands
PS1=$'\n\n'"$PS1"

#################
#  ASYNC LOAD   #
#################
async_load() {
  # Load Scripts
  for f in ~/zsh/scripts/*.sh; do source $f; done
  for f in ~/zsh/alias/*.sh; do source $f; done

  # Import/Create .localrc file
  source ~/.localrc || touch ~/.localrc

  # ZPlug update
  zplug check || zplug install
}

# Initialize a new worker (with notify option)
async_start_worker init
async_register_callback init async_load
async_job init