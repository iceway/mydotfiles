# Linux下常用dotfiles记录

保存Linux下常用软件的dotfiles，如bash，vim，git，tmux，zsh等工具的配置文件。

## 自动安装

git克隆本仓库，然后进入仓库工作数目录下，执行以下命令:

```bash
./install.sh
```

> 自动安装只是将这里的配置文件复制到软件的默认配置问家所在路径，对如vim和tmux，由于配置中用到了插件管理器，安装完成请参见下文的用法介绍，手动安装插件管理器并安装所需插件。

## 用法介绍

### tmux.conf

该文件是tmux的配置文件，可通过下面命令手动安装（注意备份之前的配置文件）：

```bash
cp tmux.conf ~/.tmux.conf
```

> 该配置文件在tmux 2.0版本上测试过，如果是其他版本使用，可能出现参数不能正常识别，具体请参见所用tmux版本的手册。

本配置文件使用[tmux-plugins/tpm](https://github.com/tmux-plugins/tpm)作为插件管理器，手动执行以下命令安装tpm，然后开启tmux后按下<kbd>Ctrl-b</kbd>（tmux命令前缀）和<kbd>I</kbd>（大写I，表示Install），自动安装其他所需的tmux插件。

```bash
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
```

### vimrc

vim的配置文件，通过下面的命令手动安装使用：

```bash
cp vimrc ~/.vimrc
```

> 该配置文件在vim 7.4版本上测试过，某些用到的插件在7.4以下版本上可能无法正常使用。

本配置文件使用[VundleVim/Vundle.vim](https://github.com/VundleVim/Vundle.vim)作为插件管理器，手动执行以下命令安装vundle，完成后启动vim，在普通模式下执行命令`:BundleInstall`，自动安装配置中用到的其他插件。

```bash
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/vundle
```

### gitconfig

git工具的配置文件，通过下面的命令手动安装使用：

```bash
cp gitconfig ~/.gitconfig
```

> 本配置文件没有指定username和email，安装后要手动编辑`~/.gitconfig`文件填入正确的uername和email。


## 参考

[1] [http://dotshare.it/](http://dotshare.it/)
