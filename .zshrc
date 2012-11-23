# aliases
# on mac there's no "readlink -f", this does the same
if [[ $OSTYPE =~ '^darwin' ]]; then
    readlink() {
        if [[ $*[1] == '-f' ]]; then
            python -c 'import os, sys; print os.path.realpath(sys.argv[1])' $*[2]

        else
            /usr/bin/readlink $*
        fi
    }
fi

alias prove6="prove --exec perl6"

# Set up the prompt

autoload -Uz promptinit
promptinit
prompt adam1 blue red green

setopt histignorealldups sharehistory

# vi key bindings
bindkey -v

# bind ↑ to search history backward
bindkey '\e[A' history-beginning-search-backward
# bind ↓ to search history forward
bindkey '\e[B' history-beginning-search-forward
# ctrl-r
bindkey "^R" history-incremental-search-backward
# ctrl-f
bindkey "^F" history-incremental-search-forward
# ctrl-a
bindkey "^A" beginning-of-line
# ctrl-e
bindkey "^E" end-of-line

# Keep 1000 lines of history within the shell and save it to ~/.zsh_history:
HISTSIZE=1000
SAVEHIST=1000
HISTFILE=~/.zsh_history

# Use modern completion system
autoload -Uz compinit
compinit
zstyle ':completion:*' auto-description 'specify: %d'
zstyle ':completion:*' completer _expand _complete _correct _approximate
zstyle ':completion:*' format 'Completing %d'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' menu select=2
if [[ $OSTYPE =~ '^darwin' ]]; then
    eval "$(gdircolors -b)"
else
    eval "$(dircolors -b)"
fi
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Z}' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=* l:|=*'
zstyle ':completion:*' menu select=long
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle ':completion:*' use-compctl false
zstyle ':completion:*' verbose true

zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'
zstyle ':completion:*:kill:*' command 'ps -u $USER -o pid,%cpu,tty,cputime,cmd'

# completion cache (for things like list of available deb packages for apt)
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path ~/.zsh/cache

# git command completion
zstyle ':completion:*:*:git*:*' use-fallback false
####################################

# show git branch in PS1
setopt prompt_subst
autoload -Uz vcs_info
zstyle ':vcs_info:*' actionformats \
    '%F{5}(%f%s%F{5})%F{3}-%F{5}[%F{2}%b%F{3}|%F{1}%a%F{5}]%f '
zstyle ':vcs_info:*' formats       \
    '%F{5}(%f%s%F{5})%F{3}-%F{5}[%F{2}%b%F{5}]%f '
zstyle ':vcs_info:(sv[nk]|bzr):*' branchformat '%b%F{1}:%F{3}%r'

zstyle ':vcs_info:*' enable git cvs svn

# or use pre_cmd, see man zshcontrib
vcs_info_wrapper() {
  vcs_info
  if [ -n "$vcs_info_msg_0_" ]; then
    echo "%{$fg[grey]%}${vcs_info_msg_0_}%{$reset_color%}$del"
  fi
}
RPROMPT=$'$(vcs_info_wrapper)'
####################################

# perlbrew
[[ -f ~/perl5/perlbrew/etc/bashrc ]] && source ~/perl5/perlbrew/etc/bashrc
####################################

