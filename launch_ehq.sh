#!/bin/bash

function new_tab() {
  TAB_NAME=$1
  COMMAND=$2
  osascript \
    -e "tell application \"Terminal\"" \
    -e "tell application \"System Events\" to keystroke \"t\" using {command down}" \
    -e "do script \"printf '\\\e]1;$TAB_NAME\\\a'; $COMMAND\" in front window" \
    -e "end tell" > /dev/null
}

new_tab "EHQ - Participation" "cd ~/app/ehq_participation; bundle exec unicorn_rails -c config/unicorn.rb"
new_tab "EHQ - Admin" "cd ~/app/ehq_admin; bundle exec unicorn_rails -c config/unicorn.rb"
new_tab "EHQ - Platform" "cd ~/app/ehq_platform; bundle exec unicorn_rails -c config/unicorn.rb"
new_tab "EHQ - Reporting" "cd ~/app/ehq_reporting; bundle exec unicorn_rails -c config/unicorn.rb"
