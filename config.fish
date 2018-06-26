alias be="bundle exec"
alias run_circle_failures="circle | grep 'spec/' | cut -f 1 -d ' ' | uniq | xargs bundle exec rspec"
alias vim=nvim

set PATH $HOME/.rbenv/shims $PATH

# this was necessary to install capybara-webkit
set PATH "/usr/local/opt/qt@5.5/bin" $PATH

# always use emacsclient
function e
  emacsclient -t
end
set EDITOR e
set VISUAL e

. ~/.config/fish/secrets.fish
