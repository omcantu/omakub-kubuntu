#!/bin/bash

# Only ask for default desktop app choices when running Gnome
# Replacing check for Gnome with KDE since this is for Kubuntu
# TODO: make sure that these apps do not require GNOME specifically
if [[ "$XDG_CURRENT_DESKTOP" == *"KDE"* ]]; then
  echo "KDE detected, skipping desktop app choices..."
  OPTIONAL_APPS=("1password" "Spotify" "Zoom" "Dropbox")
  DEFAULT_OPTIONAL_APPS='1password,Spotify,Zoom'
  export OMAKUB_FIRST_RUN_OPTIONAL_APPS=$(gum choose "${OPTIONAL_APPS[@]}" --no-limit --selected $DEFAULT_OPTIONAL_APPS --height 7 --header "Select optional apps" | tr ' ' '-')
fi

AVAILABLE_LANGUAGES=("Ruby on Rails" "Node.js" "Go" "PHP" "Python" "Elixir" "Rust" "Java")
SELECTED_LANGUAGES="Ruby on Rails","Node.js"
export OMAKUB_FIRST_RUN_LANGUAGES=$(gum choose "${AVAILABLE_LANGUAGES[@]}" --no-limit --selected "$SELECTED_LANGUAGES" --height 10 --header "Select programming languages")

AVAILABLE_DBS=("MySQL" "Redis" "PostgreSQL")
SELECTED_DBS="MySQL,Redis"
export OMAKUB_FIRST_RUN_DBS=$(gum choose "${AVAILABLE_DBS[@]}" --no-limit --selected "$SELECTED_DBS" --height 5 --header "Select databases (runs in Docker)")
