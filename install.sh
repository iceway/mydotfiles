#!/bin/bash

### install dotfiles on linux

# @1: srcfile
# @2: dstfile
backup_and_install_file()
{
	[ $# -ne 2 ] && return
	[ ! -f "$1" ] && return
	[ ! -d "${2%/*}" ] && mkdir -p "${2%/*}"
	[ -f "$2" ] && mv "$2" "$2.bak"

	cp "$1" "$2"
}

# bash
echo "install .bashrc for bash ..."
backup_and_install_file "bash/bashrc" "$HOME/.bashrc"

# git
echo "install .gitconfig for git ..."
backup_and_install_file "git/gitconfig" "$HOME/.gitconfig"
echo "please update name and email in $HOME/.gitconfig munally."

# vim
echo "install .vimrc for vim ..."
backup_and_install_file "vim/vimrc" "$HOME/.vimrc"
ln -sf "$HOME/.vim/plugs/YouCompleteMe/third_party/ycmd/examples/.ycm_extra_conf.py" "$HOME/.ycm_extra_conf.py"
echo "please run vim to install plugins automatically! and please ensure your terminal support 256 colors!"

# tmux
echo "install .tmux.conf for tmux ..."
backup_and_install_file "tmux/tmux.conf" "$HOME/.tmux.conf"
[ ! -d ~/.tmux/plugins/tpm ] && \
	git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
echo "please rum tmux and press 'prefix + I' to install all plugins!"
