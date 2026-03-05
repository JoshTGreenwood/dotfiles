. ~/.config/fish/secrets.fish

alias be="bundle exec"
alias weather="curl 'http://wttr.in/45227'"

set -x EDITOR nvim
set -x DISABLE_SPRING 1 # disable spring system wide https://github.com/rails/rails/issues/26158

mise activate fish | source
direnv hook fish | source
starship init fish | source
