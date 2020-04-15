alias be="bundle exec"
alias "weather=curl 'http://wttr.in/45227'"

set -x PATH $HOME/.rbenv/shims $PATH
set -x EDITOR vim

# disable spring system wide
# https://github.com/rails/rails/issues/26158
set -x DISABLE_SPRING 1

. ~/.config/fish/secrets.fish
