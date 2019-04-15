# _____ ____  _   _
# |__  / ___|| | | |
#   / /\___ \| |_| |
#  / /_ ___) |  _  |
# /____|____/|_| |_|
# Language Setup
LANGUAGE=en_US.UTF-8
LANG=en_US.UTF-8
LC_ALL=en_US.UTF-8

# History Settings
HISTSIZE=5000               # How many lines of history to keep in memory
HISTFILE=~/.zsh_history     # Where to save history to disk
SAVEHIST=5000               # Number of history entries to save to disk
HISTDUP=erase               # Erase duplicates in the history file

setopt appendhistory     		# Append history to the history file (no overwriting)
setopt sharehistory      		# Share history across terminals
setopt incappendhistory  		# Immediately append to the history file, not just when a term is killed
setopt HIST_IGNORE_ALL_DUPS # Hist
setopt no_share_history     # Disable history sharing

# Misc
TIPZ_TEXT=' 🤖 Hey, you could use this alias too:'

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
	# Speed Up Script
	# zgen load seletskiy/zsh-zgen-compinit-tweak

  # Github
  zgen load zdharma/fast-syntax-highlighting
  zgen load zsh-users/zsh-history-substring-search
  zgen load zsh-users/zsh-autosuggestions
  zgen load zsh-users/zsh-completions src
  zgen load b4b4r07/zsh-vimode-visual
  zgen load mafredri/zsh-async

	# Oh My ZSH plugins
	zgen oh-my-zsh plugins/sudo

  # Theme
	zgen load miekg/lean

  # Generate the init script from plugins above
  zgen save
	echo "Compiling new init.zsh"
  zcompile ${ZDOTDIR:-${HOME}}/.zgen/init.zsh
fi

# Load settings
source ${ZDOTDIR:-${HOME}}/.zgen/init.zsh

#     _    ______   ___   _  ____
#    / \  / ___\ \ / / \ | |/ ___|
#   / _ \ \___ \\ V /|  \| | |
#  / ___ \ ___) || | | |\  | |___
# /_/   \_\____/ |_| |_| \_|\____|
async_load() {
	# Theme Load
	autoload -Uz promptinit && promptinit && prompt lean

  # Import/Create .localrc file
  source ~/.localrc || touch ~/.localrc

	# Load Scripts
	for f in ~/zsh/scripts/*.sh; do source $f; done
	for f in ~/zsh/alias/*.sh; do source $f; done

	# Mostly Shell
	zgen load Tarrasch/zsh-bd
	zgen load agkozak/zsh-z
	zgen load junegunn/fzf-bin
	zgen load raylee/tldr
	zgen load molovo/tipz
}

# Initialize a new worker (with notify option)
async_start_worker init
async_job init
async_register_callback init async_load
