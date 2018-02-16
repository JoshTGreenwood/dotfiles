alias be="bundle exec"
alias run_circle_failures="circle | grep 'spec/' | cut -f 1 -d ' ' | uniq | xargs bundle exec rspec"
alias vim=nvim

set PATH $HOME/.rbenv/shims $PATH
function e
  emacsclient -t
end
set EDITOR e
set VISUAL e
