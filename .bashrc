#
# ~/.bashrc
#

[[ $- != *i* ]] && return

alias c='clear'
alias e='yazi'
alias l='eza -lh  --icons=auto'
alias ls='eza --icons=auto'
alias lsh='eza -a --icons=auto'
alias ll='eza -lha --icons=auto --sort=name --group-directories-first'
alias ld='eza -lhD --icons=auto'
alias grep='grep --color=auto'
alias vim='nvim'
alias sudo='sudo '
alias fastfetch='clear; fastfetch'
alias py='python'
alias mkdir='mkdir -p'
alias tauri='WEBKIT_DISABLE_DMABUF_RENDERER=1 bun tauri dev'
alias tauribuild='bun tauri build --no-bundle'
alias cd="z"
alias android="bun expo run:android"

#export PATH="$HOME/.local/bin:$PATH"
#export WATCHMAN_NO_SPAWN=1

export EDITOR=nvim
export ANDROID_HOME=$HOME/Android/Sdk
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/platform-tools

export JAVA_HOME=/usr/lib/jvm/java-17-openjdk
export PATH=$JAVA_HOME/bin:$PATH

eval "$(starship init bash)"
eval "$(zoxide init bash)"

PS1='[\u@\h \W]\$ '

fastfetch
