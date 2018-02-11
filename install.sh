#!/bin/bash

### install dotfiles on linux

# @1: srcfile
# @2: dstfile
backup_and_install_file()
{
	[ $# -ne 2 ] && return

	[ ! -f "$1" ] && { echo "Do not exist $1!"; return; }
	[ ! -d "${2%/*}" ] && { echo "Do not exist ${2%/*}!"; return; }

	if [ -f "$2" ]; then
		echo "backup old $2 to $2.bak"
		mv "$2" "$2.bak"
	fi

	cp "$1" "$2"
}

# bash
echo "install .bashrc for bash"
backup_and_install_file "bash/bashrc" "$HOME/.bashrc"

# git
echo "install .gitconfig for git"
backup_and_install_file "git/gitconfig" "$HOME/.gitconfig"
echo "please update name and email in $HOME/.gitconfig munally."

# vim
echo "install .vimrc for vim"
backup_and_install_file "vim/vimrc" "$HOME/.vimrc"
[ ! -d ~/.vim/bundle/Vundle.vim ] && \
	git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

# tmux
echo "install .tmux.conf for tmux"
backup_and_install_file "tmux/tmux.conf" "$HOME/.tmux.conf"
[ ! -d ~/.tmux/plugins/tpm ] && \
	git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
