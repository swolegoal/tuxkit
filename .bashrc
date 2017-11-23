# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

if [[ $TERM == "dvtm-256color" ]]; then
    TERM="xterm-color"
fi

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=20000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
#[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color) color_prompt=yes;;
    dvtm) color_prompt=yes; TERM="xterm";;
esac

if [[ $TERM == 'xterm-color' || $TERM == 'xterm' ]] ; then
    export TERM='xterm-256color'
fi

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
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    #PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# start ssh-agent in the background
eval "$(ssh-agent -s)"

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'

    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    #alias fgrep='fgrep --color=auto'
    #alias egrep='egrep --color=auto'
fi

 # handy functions
    function colors {
        for C in {0..255}; do
            tput setab $C
            echo -n "$C "
        done

        tput sgr0
        echo '
        '
    }

 # more handy aliases
 alias rebash='source ~/.profile'
 alias rebashrc='source ~/.bashrc'
 alias colormysql=$(echo -e 'mysql --prompt="\x1B[31m\\u\x1B[34m@\x1B[32m\\h\x1B[0m:\x1B[36m\\d>\x1B[0m "')
 alias nload='nload -o 500000 -i 500000'
 alias nload4g='nload -o 15360 -i 71680'
 alias nloadtg='nload -o 1768 -i 1768'
 alias attach='tmux attach -t'
 alias tls='tmux ls'
 alias lsg='git branch'
 alias bashrc-edit='vim -p ~/.bashrc ~/.profile'
 alias merge='git merge'
 alias gls='git branch'
 alias checkout="git checkout"
 alias clone="git clone"
 alias add="git add"
 alias commit="git commit"
 alias push="git push"
 alias dir='ls --color=auto'
 alias cls='clear'
 alias trn='tmux rename-session -t'
 alias trename='tmux rename-session -t'
 alias tnew='tmux new -s'
 alias lls='ls --color=auto'
 alias lah='ls -lah --color=auto'
 alias llss='ls -lah --color=always | less -r'
 alias lS='sl -a'
 alias Ls='sl -F'
 alias pull='git pull'
 alias status='git status'
 alias redisrl='redis_ns_manage --keep SESSION'
 alias gmv='git mv'
 alias vim='vim -p'
 alias lsof-tmpl='lsof | head -n 1 && lsof | grep vim | grep tmpl'
 alias profile-edit='vim -p ~/.profile ~/.bashrc'
 alias diff-master='git diff origin/master'
 alias lsvim='clear && ps aux | head -n1 && ps aux | grep vim'
 alias errlog='tail -f /var/log/apache2/error.log | fold'
 alias fetch='git fetch'
 alias ggr='git log --graph --decorate --oneline'
 alias secret_bash='export HISTFILE="/dev/null"'
 alias rbm='git pull --rebase origin master&& echo "The deed is done." | toilet -w 80 --gay -t --font smmono9'
 alias rbmp='git pull --rebase origin master && \
             dialog --no-nl-expand --yesno "Forcefully push to origin?" 6 20 && \
                 git push --force'
 alias rbb='git fetch origin; git pull --rebase origin'
 alias lsalias='grep -rn alias ~/.bashrc'
 alias hdiff='git diff HEAD'
 alias oshit='git reset HEAD~'
 alias lsalias='grep -rn alias ~/.bashrc'

 alias socker='source /usr/bin/tsocks on'

 alias icanhaz="curl icanhazip.com"
 alias xrsc-load='xrdb ~/.Xresources'
 alias fontlet='ls /usr/share/figlet/fonts'

# some more ls aliases
#alias ll='ls -l'
#alias la='ls -A'
#alias l='ls -CF'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

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
export INPUTRC=~/.inputrc
