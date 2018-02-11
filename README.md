# 我的Linux常用工具配置

保存Linux下常用软件的dotfiles，如bash，vim，git，tmux，zsh等工具的配置文件。

## 安装

git克隆本仓库，然后进入仓库工作数目录下，执行以下命令:

```bash
./install.sh
```

自动安装只是将配置文件复制到相关软件的默认配置文件所在路径，同时备份原始配置文件。

对vim和tmux，由于配置文件中用到了插件管理器，安装完成请参见下文的用法介绍，手动安装所需插件。

## 用法介绍

### tmux.conf

> 该配置文件在tmux 2.0版本上测试过，如果是其他版本使用，可能出现参数不能正常识别，具体请参见所用tmux版本的手册。

本配置文件使用[tmux-plugins/tpm](https://github.com/tmux-plugins/tpm)作为插件管理器。

开启tmux后按下`Ctrl-b`（tmux命令前缀）和`I`（大写I，表示Install），自动安装所需的tmux插件。按下`Ctrl-b`（tmux命令前缀）和`U`（大写U，表示Upgrade）可以自动跟新所需插件。


### vimrc

> 该配置文件在vim 7.4版本上测试过，某些用到的插件在7.4以下版本上可能无法正常使用。

本配置文件使用[VundleVim/Vundle.vim](https://github.com/VundleVim/Vundle.vim)作为插件管理器。

运行vim，会自动检测Vundle.vim是否已安装，如果没有则安装插件管理器，然后安装所有指定的插件。如果已经安装过Vundle.vim，运行vim后，执行命令`:PluginInstall`安装所有插件，`:PluginUpdate`更新所有插件。


### gitconfig

本配置文件没有指定username和email，安装后要手动编辑`~/.gitconfig`文件填入正确的uername和email。


## 参考

[1] [http://dotshare.it/](http://dotshare.it/)
