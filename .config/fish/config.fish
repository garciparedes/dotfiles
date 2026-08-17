# Ignore Fish Greeting message
set fish_greeting
set SPACEFISH_PROMPT_ADD_NEWLINE false

# Shell setup
set -x TERM xterm-256color

# GPG setup
set -gx GPG_TTY (tty)

# Brew Setup
set -x HOMEBREW_NO_ENV_HINTS true

# Android settings
set -x ANDROID_HOME /usr/local/share/android-sdk
set -x ANDROID_NDK_HOME /usr/local/share/android-ndk

# Finch Setup
set -x DOCKER_HOST unix:///Applications/Finch/lima/data/finch/sock/finch.sock
set -x DOCKER_CONFIG $HOME/.finch
set -x CDK_DOCKER finch
alias finch-clean='finch system prune -af --volumes && finch builder prune -af'

# VIM setup
set -x VISUAL vim
set -x EDITOR $VISUAL
alias vi=vim
alias vimwiki="vim -c VimwikiIndex"

# Pager setup
set -x PAGER "less -RF"

# pager setup
set -x MANPAGER "col -bx | bat --language=man"
set -x PAGER "bat --language=md"

# FZF setup
set -x FZF_DEFAULT_COMMAND "rg --files --hidden -g '!.git'"
set -x FZF_CTRL_T_COMMAND $FZF_DEFAULT_COMMAND

# direnv setup
set -x DIRENV_LOG_FORMAT ''

# Pyenv setup
# status --is-interactive; and source (pyenv init -|psub)
set -x VIRTUAL_ENV_DISABLE_PROMPT 1
set -Ux PYENV_ROOT $HOME/.pyenvs
set -U fish_user_paths $PYENV_ROOT/bin $fish_user_paths

# PATH setup
set -x PATH $PATH $HOME/bin
set -x PATH $PATH /usr/local/sbin
set -x PATH $PATH $HOME/.cargo/bin
set -x PATH $PATH $HOME/.pyenv/bin

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
status is-login; and pyenv init --path | source
pyenv init - | source
starship init fish | source
