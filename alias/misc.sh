# Plain Alias
alias sch="history | cut -c 8- | fzf -s -p 'COMMAND HISTORY SEARCH > '"
alias zrl='zgen reset; source ~/.zshrc'
alias zfresh='rm -rf ~/.zgen && zrl'
alias zed='vim ~/zsh'
alias led="vim ~/.localrc"
alias bensh="repeat 5 time zsh -i -c exit" # Benchmark Shell
alias f='fzf-tmux --color=16 -m -d 20'
alias ta='tmux attach -t init || tmux new -s init'

# Conditional Alias
hash exa &> /dev/null && alias ls=exa
hash colorls &> /dev/null && alias cls=colorls

# Ultimate Port Killer
portkill() {
  kill $2 $(lsof -t -i:$1)
}
