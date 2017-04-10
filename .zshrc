# 256 colors now!
# already defined in iTerms settings, redundant
#export TERM='xterm-256color'

# # # # # # # # # 
# H I S T O R Y # 
# # # # # # # # # 

# Store History in File
HISTSIZE=1000
SAVEHIST=1000
HISTFILE=~/.history

# Make History Ignore History Commands
setopt HIST_NO_STORE 

# Ignore Duplicates
# (Removes the older Entry)
setopt HIST_IGNORE_ALL_DUPS

# Append to the History Immediately Instead of when Exiting
setopt INC_APPEND_HISTORY

# All Shells Share the Same History
setopt SHARE_HISTORY

# Keep Aliases in Separate File
if [[ -r ~/.aliasrc ]]; then
	. ~/.aliasrc
fi

# enable auto-correction
setopt CORRECT

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# commandline is set to vi-mode, so map esc to jk
bindkey -M viins 'jk' vi-cmd-mode

# vi style incremental search
bindkey '^R' history-incremental-search-backward
bindkey '^S' history-incremental-search-forward
bindkey '^P' history-search-backward
bindkey '^N' history-search-forward  

# change directory by only typing the name
setopt AUTO_CD

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="oolong"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to disable command auto-correction.
# DISABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git vi-mode brew django pip python rvm osx)

#source ~/.bash_profile
source $ZSH/oh-my-zsh.sh

# User configuration
# export PATH=$PATH:/Users/josef_privat/.rvm/gems/ruby-2.1.1/bin:/opt/local/bin:/opt/local/sbin:/Users/josef_privat/.rvm/gems/ruby-2.1.1@global/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/Users/josef_privat/.rvm/bin
# the above seems like a very inefficient way of setting the path variable ...

# Avoid Duplicates in Path
typeset -U path
path=(/bin /sbin /usr/sbin /usr/local/bin /usr/bin ~/.rvm/bin ~/.rvm/gems/ruby-2.1.1/bin ~/rvm/gems/ruby-2.1.1@global/bin)
# /opt/local/bin and /opt/local/sbin have been renamed in order to avoid conflict with Homebrew

# path to python
# PYTHONPATH="/opt/local/bin/python":"${PYTHONPATH}"
PYTHONPATH="/Library/Python/2.7/site-packages/":"${PYTHONPATH}"
export PYTHONPATH

# You may need to manually set your language environment
export LANG=de_CH.UTF-8

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='mvim'
fi

# Compilation flags
export ARCHFLAGS="-arch x86_64"

# Search History with arrow keys
# http://furbo.org/2014/09/03/the-terminal/
# bindkey '"":history-search-backward'
# bindkey '"":history-search-forward'

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"
#
# php Path
export PATH=/usr/local/php5/bin:$PATH
# liip install. php.ini to be found in
# /usr/local/php5/php.d/99-liip-developer.ini
#
# alias for browser-sync (with p5.js)
alias bs='browser-sync start --server --files "*.js, *.html, *.css"'

# source nvm-plugin
source ~/.zsh-nvm/zsh-nvm.plugin.zsh
