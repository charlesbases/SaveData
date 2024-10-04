#!/usr/bin/env bash

set -e


version=
selected=


env_path=".env"
game_path='steamapps/common/Cyberpunk 2077'


install() {
  echo -e "\033[32minstall\033[0m\n"

  local mod_path=

  # move mod_path to game_path
  for mod in "${selected[@]}"; do
  	echo -e "\033[34m$mod\033[0m"

  	mod_path="./$version/$mod"
  	find $mod_path -type f -print | while read file; do
  	  echo "  ${file/$mod_path/}"
    done

  	if [[ -d $mod_path ]]; then
  	  ls $mod_path | while read dir; do
        cp -r "$mod_path/$dir" "$game_path"
  	  done
  	fi
  done
}


uninstall() {
  echo -e "\033[32muninstall\033[0m\n"

  # remove mod file from game_path
  for mod in "${selected[@]}"; do
  	echo -e "\033[34m$mod\033[0m"

  	mod_path="./$version/$mod"
  	find $mod_path -type f -print | while read file; do
  	  echo "  ${file/$mod_path/}"
  	  rm -f "$game_path/${file/$mod_path/}"
    done
  done
}


# set the steam installation path
if [[ ! -f ".env" ]]; then
  read -r -p "Please enter the steam installation path: " steam_path
  echo "STEAM_PATH='$steam_path'" > $env_path
fi
source $env_path
if [[ ! -d "$STEAM_PATH" ]]; then
  echo -e "\033[31minvalid steam installation path\033[0m"
  rm -f $env_path
  exit
fi
game_path="$STEAM_PATH/$game_path/"


# select version
PS3="version: "
select opt in $(find . -maxdepth 1 -type d ! -name '.*' -exec basename {} \;); do
  if [[ $opt ]]; then
  	version=$opt
  	break
  fi
  exit
done
echo -e "\033[32m$version\033[0m\n"


# select mod
PS3="select mod: "
select opt in $(find $version -maxdepth 1 -type d ! -name "$version" -exec basename {} \;); do
  case $opt in
    "")
      exit
    ;;
    "ALL")
      selected=($(find $version -maxdepth 1 -type d ! -name "$version" ! -name "ALL" -exec basename {} \;))
    ;;
    *)
      selected=$opt
    ;;
  esac
  break
done
echo -e "\033[32m$selected\033[0m\n"


# install or uninstall
PS3="option: "
select opt in "install" "uninstall"; do
  case $opt in
    "install")
      install
    ;;
    "uninstall")
      uninstall
    ;;
  esac
  exit
done


