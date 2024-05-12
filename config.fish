alias be="bundle exec"
alias "weather=curl 'http://wttr.in/45227'"

set -x EDITOR vim

source /usr/local/opt/asdf/libexec/asdf.fish
direnv hook fish | source

# disable spring system wide
# https://github.com/rails/rails/issues/26158
set -x DISABLE_SPRING 1

. ~/.config/fish/secrets.fish

