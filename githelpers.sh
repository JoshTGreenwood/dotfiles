#!/bin/bash

# stolen from Gary Bernhardt
function pretty_git_log() {
  HASH="%C(yellow)%h%C(reset)"
  RELATIVE_TIME="%C(green)%ar%C(reset)"
  AUTHOR="%C(bold blue)%an%C(reset)"
  REFS="%C(red)%d%C(reset)"
  SUBJECT="%C()%s%C(reset)"
  FORMAT="$HASH{$RELATIVE_TIME{$AUTHOR{$REFS $SUBJECT"
  git log --graph --pretty="tformat:$FORMAT" $* |
  column -t -s "{" |
  less -FXRS # F: dont page when you dont need to X: dont clear screen after quit  R: pass color S: truncate long lines
}
