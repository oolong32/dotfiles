# Set architecture flags
export ARCHFLAGS="-arch x86_64"

# Ensure user-installed binaries take precedence
export PATH=/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin

# Setting PATH for Python 3.3
# uninstalled. will need to replace this after new install.
#PATH="/System/Library/Frameworks/Python.framework/Versions/3.3/bin:${PATH}"

# make history ignore the commands 'history' and 'clear'
export HISTIGNORE="clear:history:hi"

# set vim as editor
export EDITOR="vim"

# set commandline to vim-mode
set -o vi

# ruby version manager, the apes on the moon know why.
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

# include .profile and .bashrc if they exits.
test -f ~/.profile && source ~/.profile
test -f ~/.bashrc && source ~/.bashrc

# Tell grep to highlight matches
export GREP_OPTIONS='--color=auto'

# colorful ls output by default
alias ls='ls -G'

# ls aliases
alias la='ls -A'
alias ll='ls -alF'
alias l='ls -CF'

# alias for history
alias hi='history'

# Absturz von Python in Zusammenhang mit YouCompleteMe verhindern
export DYLD_FORCE_FLAT_NAMESPACE=1

# alias wetterbericht
alias wetter='curl -4 wttr.in'

# alias for browser-sync (with p5.js)
alias bs='browser-sync start --server --files "*.js, *.html, *.css"'

# gpg key
export GPGKEY=E9764561

# commandline prompt
# see theme file
