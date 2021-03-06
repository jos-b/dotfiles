export LANGUAGE="en"
fpath=( "$HOME/.zfunctions" $fpath )
  export ZSH=/Users/joseph/.oh-my-zsh


# Theme setup

export ZSH_THEME="spaceship"


# History
HISTFILE=~/.zsh_history
HISTSIZE=100000
SAVEHIST=100000

setopt autocd                   # Allow changing directories without `cd`
setopt append_history           # Dont overwrite history
setopt extended_history         # Also record time and duration of commands.
setopt share_history            # Share history between multiple shells
setopt hist_expire_dups_first   # Clear duplicates when trimming internal hist.
setopt hist_find_no_dups        # Dont display duplicates during searches.
setopt hist_ignore_dups         # Ignore consecutive duplicates.
setopt hist_ignore_all_dups     # Remember only one unique copy of the command.
setopt hist_reduce_blanks       # Remove superfluous blanks.
setopt hist_save_no_dups        # Omit older commands in favor of newer ones.

# Changing directories
#setopt auto_pushd
setopt pushd_ignore_dups        # Dont push copies of the same dir on stack.
setopt pushd_minus              # Reference stack entries with "-".

setopt extended_glob

alias vim="nvim"

alias grep='() { $(whence -p grep) --color=auto $@ }'
alias egrep='() { $(whence -p egrep) --color=auto $@ }'

alias rm='rm -v'

alias la='ls -a'
alias ll='ls -l'
alias lal='ls -al'
alias d='dirs -v'
alias 1='pu'
alias 2='pu -2'
alias 3='pu -3'
alias 4='pu -4'
alias 5='pu -5'
alias 6='pu -6'
alias 7='pu -7'
alias 8='pu -8'
alias 9='pu -9'
alias pu='() { pushd $1 &> /dev/null; dirs -v; }'
alias po='() { popd &> /dev/null; dirs -v; }'

zshaddhistory() { whence ${${(z)1}[1]} >| /dev/null || return 1 }

bindkey "^a" beginning-of-line
bindkey "^e" end-of-line
bindkey "^f" forward-word
bindkey "^b" backward-word
bindkey "^k" kill-line
bindkey "^d" delete-char
bindkey "^y" accept-and-hold
bindkey "^w" backward-kill-word
bindkey "^u" backward-kill-line
bindkey "^R" history-incremental-pattern-search-backward
bindkey "^F" history-incremental-pattern-search-forward

bindkey "^i" expand-or-complete-prefix

bindkey '^[^?' backward-kill-word
bindkey "^[[1;5C" forward-word
bindkey "^[[1;5D" backward-word



zstyle ':completion:*' rehash true
#zstyle ':completion:*' verbose yes
#zstyle ':completion:*:descriptions' format '%B%d%b'
#zstyle ':completion:*:messages' format '%d'
#zstyle ':completion:*:warnings' format 'No matches for: %d'
#zstyle ':completion:*' group-name ''

# case-insensitive (all), partial-word and then substring completion
zstyle ":completion:*" matcher-list \
  "m:{a-zA-Z}={A-Za-z}" \
  "r:|[._-]=* r:|=*" \
  "l:|=* r:|=*"

zstyle ":completion:*:default" list-colors ${(s.:.)LS_COLORS}

export GPG_TTY=$(tty)



[ -d "$HOME/bin" ] && export PATH="$HOME/bin:$PATH"

[[ -f ~/.zsh_rclocal ]] && source ~/.zsh_rclocal

[[ -f ~/.zsh_functions ]] && source ~/.zsh_functions
[[ -f ~/.zsh_aliases ]] && source ~/.zsh_aliases

source $ZSH/oh-my-zsh.sh

# aliases.exe

export EDITOR="subl -w"
export ELIXIR_EDITOR="subl -w"


setopt correct_all
setopt cdablevars
setopt autocd
setopt ignoreeof
setopt menu_complete

function acronym(){
	for w in `echo $1 | grep -o .`
do grep \^$w /usr/share/dict/words | shuf | head -n1; done
}

export PATH=/bin:$HOME/.cargo/bin:$PATH
export RUST_SRC_PATH="$(rustc --print sysroot)/lib/rustlib/src/rust/src"
autoload -U compinit && compinit

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

setopt monitor

export PIPENV_IGNORE_VIRTUALENVS=1


export PAGER=less

# SSH Agent
if [[ -z "$SSH_AGENT_PID" ]]; then
    ssh-add -K /Users/joseph/ssh-keys/**/id_rsa;
    ssh-add -K;
fi;

source ~/venv/bin/activate
