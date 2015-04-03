export GOPATH=$HOME/go
PATH="/usr/local/bin:${PATH}:./node_modules/.bin:${GOPATH}/bin"
export PATH

# Set CLICOLOR if you want Ansi Colors in iTerm2
export CLICOLOR=1

# Set colors to match iTerm2 Terminal Colors
export TERM=xterm-256color

export PS1="\W \$"

source .bashrc
