# Add RVM to PATH for scripting
PATH=$PATH:$HOME/.rvm/bin 

export NVM_DIR="/Users/jrenner/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

# git backup dotfiles
# see: https://developer.atlassian.com/blog/2016/02/best-way-to-store-dotfiles-git-bare-repo/
alias config='/usr/bin/git --git-dir=/Users/jrenner/.myconfig/ --work-tree=/Users/jrenner'
