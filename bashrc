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
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
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
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
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

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# colored GCC warnings and errors
#export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

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

# 下面这2条会将所有xilinx的那一套编译链加入$PATH中，导致Verilator无法编译
# source /tools/Xilinx/Vivado/2021.2/settings64.sh
# source /tools/Xilinx/xilinx-versal-common-v2021.2/versal-common/environment-setup-cortexa72-cortexa53-xilinx-linux
# source /tools/Xilinx/petalinux-221/settings.sh
export PATH=$PATH:/usr/local/MATLAB/R2021a/bin
export PATH=$PATH:/home/zhe/anaconda3/bin
export PATH=$PATH:/home/zhe/software/pycharm/bin
export PLATFORM_REPO_PATHS=/opt/xilinx/platforms


#export export SYNOPSYS="/tools/Synopsys"
export VCS_TARGET_ARCH="amd64"
# export PATH="/tools/Synopsys/VCS2018/vcs/O-2018.09-SP2/gui/dve/bin:"$PATH
export DVE_HOME="/tools/Synopsys/VCS2018/vcs/O-2018.09-SP2/gui/dve"
# export PATH="/tools/Synopsys/VCS2018/vcs/O-2018.09-SP2/bin:"$PATH
export VCS_HOME="/tools/Synopsys/VCS2018/vcs/O-2018.09-SP2"
#export VCS_ARCH_OVERRIDE="linux"
#verdi
# export PATH="/tools/Synopsys/verdi/verdi/Verdi_O-2018.09-SP2/bin:"$PATH
export VERDI_HOME="/tools/Synopsys/verdi/verdi/Verdi_O-2018.09-SP2"
export LD_LIBRARY_PATH="/tools/Synopsys/verdi/verdi/Verdi_O-2018.09-SP2/share/PLI/lib/LINUX64":$LD_LIBRARY_PATH
export VERDI_DIR="/tools/Synopsys/verdi/verdi/Verdi_O-2018.09-SP2"
export NOVAS_INST_DIR="/tools/Synopsys/verdi/verdi/Verdi_O-2018.09-SP2"
export NPI_PLATFORM="LINUX64_GNU_472"
export LD_LIBRARY_PATH="$NOVAS_INST_DIR/share/NPI/lib/LINUX64_GNU_520":$LD_LIBRARY_PATH
export NOVAS_HOME="/tools/Synopsys/verdi/verdi/Verdi_O-2018.09-SP2"

#LICENSE
export SNPSLMD_LICENSE_FILE="/tools/Synopsys/License/Synopsys.dat"
export SNPSLMD_LICENSE_FILE=27000@zhe-pc
export LM_LICENSE_FILE="/tools/Synopsys/License/Synopsys.dat"

alias lmli="/tools/Synopsys/SCL2018/scl/2018.06/linux64/bin/lmgrd -c /usr/stone/software/License/Synopsys.dat"
#SCL
# export PATH=/tools/Synopsys/SCL2018/scl/2018.06/linux64/bin:$PATH
alias dve="dve -full64 &"
alias vcs64="vcs -full64"
alias verdi="verdi -full64 &"
export PATH=$HOME/bin/:$PATH
