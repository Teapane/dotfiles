export EDITOR=vim

#git branch and emoji
export PS1="\u \w\[\033[32m\]\$(parse_git_branch)\[\033[00m\] 🐳  "
#git branch
parse_git_branch() {
git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}


if [ -f "$HOME/.bashrc" ]; then
  . "$HOME/.bashrc"
fi

alias be="bundle exec"
alias gc="git checkout"
alias gcd="git checkout dev"
alias gpr="git pull --rebase"
alias gdd="git diff dev"
alias glog='git log --graph --abbrev-commit --decorate --date=relative --format=format:"%C(bold blue)%h%C(reset) - %C(bold green)(%ar)%C(reset) %C(white)%s%C(reset) %C(dim white)- %an%C(reset)%C(bold yellow)%d%C(reset)" --all'
alias mdb='mix ecto.create && mix ecto.migrate'
alias mps='mix phoenix.server'
alias clean= 'npm set progress=false && rm -rf node_modules && npm install'

[[ -s "$HOME/.avn/bin/avn.sh" ]] && source "$HOME/.avn/bin/avn.sh" # load avn
export PATH="$HOME/.exenv/bin:$PATH"
eval "$(exenv init -)"
