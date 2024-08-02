# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
# [ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color|*-256color|alacritty) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1="\$(~/Tools/scripts/ps1.sh)"
else
    PS1="\u@\h⬩ \w\n▸ "
fi
unset color_prompt force_color_prompt

# colored GCC warnings and errors
export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi


# =====[ALIASES]

if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# enable color support of ls and also add handy aliases
alias ll='ls -l'
alias la='ls -lA'

# https://github.com/sharkdp/bat
alias bat=batcat

# https://github.com/sharkdp/fd
alias fd=fdfind

# docker
alias di='docker image ls --format "table {{.ID}}\t{{.Repository}}\t{{.Tag}}"'
alias dc='docker container ls --format "table {{.ID}}\t{{.Names}}\t{{.Image}}\t{{.Status}}"'
alias dca='docker container ls -a --format "table {{.ID}}\t{{.Names}}\t{{.Image}}\t{{.Status}}"'

# =====[USER FUNCTIONS]

zd() {
    result=""
    if [ ! -z "$1" ]; then
        result=$(fdfind -i -t d -a --base-directory ~ $1)
        mapfile -t entries < <(echo "$result")
        if [ ${#entries[@]} -gt 1 ]; then
            # result=$(echo -e "${result}" | dmenu -l 5 -b)
            result=$(echo -e "${result}" | fzf)
        fi
    fi
    cd $result
}


# =====[ENVIRONMENT VARIABLES]

if [ -d "$HOME/.local/bin" ] ; then
    PATH="$HOME/.local/bin:$PATH"
fi

export PYENV_ROOT="$HOME/Tools/pyenv"
export GOROOT="/usr/local/go"
export NVM_DIR="$HOME/.nvm"
export QT_STYLE_OVERRIDE=kvantum
export DENO_INSTALL="/home/zunino@softplan.com.br/.deno"

PATH=$PATH:$HOME/.cargo/bin:$GOROOT/bin:$HOME/go/bin:$PYENV_ROOT/shims:$DENO_INSTALL/bin

[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm

[ -f ~/.fzf.bash ] && source ~/.fzf.bash
. "$HOME/.cargo/env"
