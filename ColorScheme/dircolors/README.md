# dircolors

Linux命令行下ls命令显示不同文件类型的色彩配置。

> 获取自[dircolors-solarized](https://github.com/seebi/dircolors-solarized)，256dark方案。

## 安装

直接拷贝到HOME目录下，命令为`.dir_colors`。

```bash
cp ColorScheme/dircolors/solarized.dir_colors ~/.dir_colors
```

## 配置

在shell的默认配置文件（~/.bashrc或者~/.zshrc）中加入下面的命令生效:

```bash
[ -f ~/.dir_colors ] && eval `dircolors ~/.dir_colors`
```
