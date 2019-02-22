# export GOROOT=$(go env GOROOT)
# export GOPATH=$HOME/go

source /usr/local/share/chruby/chruby.sh
source /usr/local/opt/chruby/share/chruby/auto.sh
chruby ruby-2.5.3

#Git aliases
alias gs="git status"
alias gcd="git checkout dev"
alias ga="git add ."
alias gpr="git pull --rebase"
alias gcb="git checkout -b"
alias gb="git branch"
alias gss="git stash"
alias gsp="git stash pop"
alias glog='git log --graph --abbrev-commit --decorate --date=relative --format=format:"%C(bold blue)%h%C(reset) - %C(bold green)(%ar)%C(reset) %C(white)%s%C(reset) %C(dim white)- %an%C(reset)%C(bold yellow)%d%C(reset)" --all'
alias gupdate="git stash; git checkout master; git pull --rebase origin master; git checkout -; git merge master"

#dev = 'master' in this case; to ignore master and delete what is merged into current HEAD
# git branch --merged | grep -v "\*" | xargs -n 1 git branch -d
# can print branches before deleting `xargs -n 1 echo git branch`
alias git clean="git branch --merged dev | grep -v "\* master" | xargs -n 1 git branch -D"

alias ms="mix phoenix.server"
# alias mt="mix test"
#Sometimes erlang binaries hang around, so remove them and recompile
alias mdc=" rm -rf _build; mix do deps.get, compile"

# Run these when you can ping github, visit github, but host won't resolve on Github in term.
# git config --global --unset http.proxy
# git config --global --unset https.proxy

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
