#!/bin/bash

BASE_DIR=${1:-"$HOME/Projects"}

if [ ! -d "$BASE_DIR" ]; then
  echo "Base directory does not exist: $BASE_DIR"
  exit 1
fi

while true; do
  cd "$BASE_DIR" || exit 1

  mapfile -t projects < <(find . -maxdepth 1 -type d ! -name '.' | sed 's|^\./||')

  if [ ${#projects[@]} -eq 0 ]; then
    echo "No projects found in $BASE_DIR"
    exit 1
  fi

  echo "Select a project (or type 0 to exit):"

  select project in "${projects[@]}"; do
    if [[ "$REPLY" == "0" ]]; then
      echo "Exiting."
      exit 0
    elif [[ -n "$project" ]]; then
      echo "You selected: $project"
      break
    else
      echo "Invalid selection, try again."
    fi
  done

  cd "$BASE_DIR/$project" || { echo "Project directory not found: $project"; continue; }

  if [ ! -d ".git" ]; then
    echo "'$project' is not a git repository."
    continue
  fi

  user_name=$(git config user.name)
  user_email=$(git config user.email)

  echo "Git user for project '$project':"
  echo "Name:  $user_name"
  echo "Email: $user_email"

  echo
  read -p "Do you want to check another project? (y/n): " yn
  case $yn in
      [Yy]* ) ;;
      * ) echo "Bye!"; exit 0;;
  esac
done
