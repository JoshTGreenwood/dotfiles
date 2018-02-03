alias be="bundle exec"
alias run_circle_failures="circle | grep 'spec/' | cut -f 1 -d ' ' | uniq | xargs bundle exec rspec"

set PATH $HOME/.rbenv/shims $PATH
alias e="emacsclient -t"
set EDITOR e
set VISUAL e
