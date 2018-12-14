export LANGUAGE=en_US.UTF-8
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8


#  _________  _   _
# |__  / ___|| | | |
#   / /\___ \| |_| |
#  / /_ ___) |  _  |
# /____|____/|_| |_|
HISTSIZE=5000               # How many lines of history to keep in memory
HISTFILE=~/.zsh_history     # Where to save history to disk
SAVEHIST=5000               # Number of history entries to save to disk
HISTDUP=erase               # Erase duplicates in the history file
setopt    appendhistory     # Append history to the history file (no overwriting)
setopt    sharehistory      # Share history across terminals
setopt    incappendhistory  # Immediately append to the history file, not just when a term is killed
setopt HIST_IGNORE_ALL_DUPS # Hist
setopt no_share_history     # Disable history sharing


#  _________ _____ _   _
# |__  / ___| ____| \ | |
#   / / |  _|  _| |  \| |
#  / /| |_| | |___| |\  |
# /____\____|_____|_| \_|
# Load zgen only if a user types a zgen command
zgen () {
	if [[ ! -s ${ZDOTDIR:-${HOME}}/.zgen/zgen.zsh ]]; then
		git clone --recursive https://github.com/tarjoilija/zgen.git ${ZDOTDIR:-${HOME}}/.zgen
	fi
	source ${ZDOTDIR:-${HOME}}/.zgen/zgen.zsh
	zgen "$@"
}

if [[ ! -s ${ZDOTDIR:-${HOME}}/.zgen/init.zsh ]]; then

  # Mostly Shell
  zgen load Tarrasch/zsh-bd
  zgen load agkozak/zsh-z
  zgen load junegunn/fzf-bin
  zgen load jhawthorn/fzy
  zgen load raylee/tldr
  zgen load molovo/tipz


  # github
  zgen load zdharma/fast-syntax-highlighting
  zgen load zsh-users/zsh-history-substring-search
  zgen load zsh-users/zsh-autosuggestions
  zgen load zsh-users/zsh-completions src
  zgen load b4b4r07/zsh-vimode-visual

  # async
  zgen load mafredri/zsh-async

  # theme
  zgen load dracula/zsh dracula

  # generate the init script from plugins above
  zgen save
  zcompile ${ZDOTDIR:-${HOME}}/.zgen/init.zsh
fi

# Load settings
source ${ZDOTDIR:-${HOME}}/.zgen/init.zsh

# Theme
autoload -Uz promptinit && promptinit && prompt purer
PS1=$'\n\n'"$PS1"  # Adds an empty space between commands

#     _    ______   ___   _  ____
#    / \  / ___\ \ / / \ | |/ ___|
#   / _ \ \___ \\ V /|  \| | |
#  / ___ \ ___) || | | |\  | |___
# /_/   \_\____/ |_| |_| \_|\____|
async_load() {
  # Import/Create .localrc file
  source ~/.localrc || touch ~/.localrc

  # Load Scripts
  for f in ~/zsh/scripts/*.sh; do source $f; done
  for f in ~/zsh/alias/*.sh; do source $f; done
}

# Initialize a new worker (with notify option)
async_start_worker init
async_register_callback init async_load
async_job init

#  __  __ ___ ____   ____
# |  \/  |_ _/ ___| / ___|
# | |\/| || |\___ \| |
# | |  | || | ___) | |___
# |_|  |_|___|____/ \____|

# Superdupper hack to speed up startup
# https://carlosbecker.com/posts/speeding-up-zsh/
{
	autoload -Uz compinit
	if [ $(date +'%j') != $(stat -f '%Sm' -t '%j' ~/.zcompdump) ]; then
		compinit
	else
		compinit -C
	fi
} &!

# TIPZ Config
TIPZ_TEXT='  Hey, you could use this alias too:'
