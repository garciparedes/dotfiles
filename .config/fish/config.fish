# Ignore Fish Greeting message
set fish_greeting
set SPACEFISH_PROMPT_ADD_NEWLINE false

# Shell setup
set -x TERM xterm-256color

# Android settings
set -x ANDROID_HOME /usr/local/share/android-sdk
set -x ANDROID_NDK_HOME /usr/local/share/android-ndk

# VIM setup
set -x VISUAL vim
set -x EDITOR $VISUAL
alias vi=vim
alias vimwiki="vim -c VimwikiIndex"

# Pager setup
set -x PAGER "less -RF"

# bat setup
set -x BAT_THEME "TwoDark"
alias bat=batcat

# fd setup
alias fd=fdfind

# FZF setup
set -x FZF_DEFAULT_COMMAND 'rg --files --hidden'
set -x FZF_CTRL_T_COMMAND $FZF_DEFAULT_COMMAND

# Virtualenv setup
# status --is-interactive; and source (pyenv init -|psub)
set -x VIRTUAL_ENV_DISABLE_PROMPT 1

# PATH setup
set -x PATH $HOME/bin:$PATH
set -x PATH /usr/local/sbin:$PATH
set -x PATH $HOME/.cargo/bin:$PATH
set -x PATH $HOME/.pyenv/bin:$PATH

# Ubuntu-specific aliases
alias pbcopy='xclip -selection clipboard'
alias pbpaste='xclip -selection clipboard -o'
alias open='xdg-open'

# Global aliases
alias nodejs=node
alias charm='pycharm-professional'

# DS aliases
alias r='r --save'
alias matlab='octave'
alias ipy='jupyter console --kernel=python3'
alias ir='jupyter console --kernel=ir'
alias ioctave='jupyter console --kernel=octave'

# Environment setup commands
pyenv init - | source
pyenv virtualenv-init - | source
starship init fish | source
