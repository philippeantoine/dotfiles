export PS1="\W \$ "

# bootstrap a new project folder
pop() {
  mkdir "$(date +%Y-%m-%d)-$1" && cd $_
  echo "$(date '+%H:%M') START" >> devnotes.md
  /usr/local/bin/code . devnotes.md
}
