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

# Check if zgen is installed
if [[ ! -d ~/.zgen ]]; then
  git clone https://github.com/tarjoilija/zgen.git "${HOME}/.zgen"
fi

# load zgen
source "${HOME}/.zgen/zgen.zsh"

# if the init script doesn't exist
if ! zgen saved; then

  # oh-my-zsh
  zgen oh-my-zsh
  zgen oh-my-zsh plugins/git
  zgen oh-my-zsh plugins/colorize

  # github
  zgen load zdharma/fast-syntax-highlighting
  zgen load zsh-users/zsh-history-substring-search
  zgen load Tarrasch/zsh-bd
  zgen load zsh-users/zsh-autosuggestions
  zgen load zsh-users/zsh-completions
  zgen load b4b4r07/zsh-vimode-visual

  # async
  zgen load mafredri/zsh-async

  # agnostic
  zgen load rupa/z
  zgen load junegunn/fzf-bin
  zgen load jhawthorn/fzy
  zgen load raylee/tldr
  zgen load dracula/zsh dracula

  # generate the init script from plugins above
  zgen save
fi

# Set Theme
ZSH_THEME="dracula"

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
}

# Initialize a new worker (with notify option)
async_start_worker init
async_register_callback init async_load
async_job init