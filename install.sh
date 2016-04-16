#!/bin/bash

### install dotfiles on linux

repo=$(pwd)
home=${HOME}

install_bin_dir()
{
	[ $# -ne 1 ] && return

	dest=${home}/.$1
	src=${repo}/$1
	if [ -f ${dest} ]; then
		echo "backup old $1 to ${dest}.bak"
		mv ${dest} ${dest}.bak
	fi
	echo "install $1 to ${dest}"
	ln -sf ${src} ${dest}
}

echo "install dotfiles..."

# bash
install_bin_dir "bashrc"

# gitconfig
install_bin_dir "gitconfig"
echo "please update name and email in ${home}/.gitconfig munally."

# vimrc
Install_bin_dir "vimrc"
