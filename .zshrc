export NVM_DIR="~/.nvm"
source ~/.nvm/nvm.sh

unsetopt PROMPT_SP
PROMPT='%~ $ '

pop() {
  mkdir "$(date +%Y-%m-%d)-$1" && cd $_
  echo "$(date '+%H:%M') START" >> devnotes.md
  /usr/local/bin/code . devnotes.md
}
