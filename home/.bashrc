eval "$(direnv hook bash)"

export PATH=/usr/local/sbin:~/bin:~/go/bin:$PATH
source ~/.idg_profile

export PATH="$HOME/.exenv/bin:$PATH"
eval "$(exenv init -)"

export GOROOT=$(go env GOROOT)
export GOPATH=$HOME/go

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

#dev = 'master' in this case; to ignore master and delete what is merged into current HEAD
# git branch --merged | grep -v "\*" | xargs -n 1 git branch -d
# can print branches before deleting `xargs -n 1 echo git branch`
alias git clean="git branch --merged dev | grep -v "\* dev" | xargs -n 1 git branch -d"

alias ms="mix phoenix.server"
alias mt="mix test"
#Sometimes erlang binaries hang around, so remove them and recompile
alias mdc=" rm -rf _build; mix do deps.get, compile"

