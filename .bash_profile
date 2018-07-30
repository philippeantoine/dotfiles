export GOPATH=$HOME/go
PATH="/usr/local/bin:${PATH}:./node_modules/.bin:${GOPATH}/bin"
export PATH

# Set CLICOLOR if you want Ansi Colors in iTerm2
export CLICOLOR=1

# Set colors to match iTerm2 Terminal Colors
export TERM=xterm-256color

export PS1="\W \$"

# bootstrap a new project folder
pop() {
  mkdir "$(date +%Y-%m-%d)-$1" && cd $_
  echo "$(date '+%H:%M') START" >> devnotes.md
  /usr/local/bin/code . devnotes.md
}

source .bashrc
