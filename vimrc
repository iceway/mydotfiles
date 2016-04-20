" VIM 配置（终端环境）
" Iceway Zhang
" {vim:set shiftwidth=4 tabstop=4 softtabstop=4 expandtab:} "

""" ### VIM 特性配置 {{{
set nocompatible			" 不使用vi兼容模式

set ruler				" 显示状态栏光标标尺
set cursorline				" 突出显示当前行
set number				" 显示行号
"set relativenumber			" 显示相对（当前光标所在行）行号而不是绝对行号
set hlsearch				" 高亮搜索结果
set incsearch				" 输入搜索内容时就同步显示搜索结果
"set nowrap				" 长度超过窗口宽度不要换行显示
"set list				" 让VIM显示空格、tab、换行等不可见字符
"set listchars=nbsp:¬,trail:·,tab:»	" 设置VIM把空格、换行、tab显示为什么字符
set scrolloff=3				" 光标移动到顶部和底部时自动保持3行距离
"set showmatch				" 显示自动匹配到的对应括号
set showmode				" 让VIM在窗口最低下显示当前模式，如--INSERT--等
set showcmd				" 在命令模式下输入命令时，同步显示已经键入的命令内容
set nobackup				" 保存文件时，不要创建备份文件
set textwidth=0				" 一行内输入字符达到多少时自动换行，0表示不限制
set history=500				" 记录的历史命令个数

"set shiftwidth=4			" 设定VIM的自动缩进，以及>和<命令时移动的空白长度
"set softtabstop=4			" 按下tab时，插入的是空格和tab制表符的混合，具体方式参见:help softtabstop
"set tabstop=4				" 设定tab长度为4字节
"set expandtab				" 键入tab时，自动用空格替换tab，空格长度等于tabstop的设置

set backspace=indent,eol,start		" 退格键（backspace）默认工作vi模式下。该设置可以让退格键工作在大家熟悉的方式下。
					" indent: 如果设置了:set indent等自动缩进，按退格键会删掉这个缩进。
					" eol: 如果插入模式下在行开头，设置了eol后按下退格键会合并到上一行。
					" start: 若不设置为start，则在回退时，只能回退删除自己新添加的字符，原来已经存在的字符无法回退删除。
set pastetoggle=<F3>			" 按下F3键可以切换粘贴插入模式[Insert (paste)]和普通插入模式。
set viminfo='100,f1,<500

filetype plugin indent on		" 启用indent（自动对齐）插件

if &t_Co > 2
    syntax on				" 开启语法高亮
    set t_Co=256			" 终端支持256色
endif

"set laststatus=2
"set statusline=%2*Filename\:\ %t%*%1*%m%*%2*%r%h%w\ %=[FORMAT=%{&ff}]\ [TYPE=%Y]\ [ASCII=\%b]\ [HEX=\%02.2B]\ [POS=%l,%v][%p%%]\ [LINES=%L]\ %*
"hi User1 term=inverse,bold cterm=inverse,bold ctermfg=red
"hi User2 term=inverse,bold cterm=inverse,bold ctermfg=green

"set background=dark			" 设置VIM背景色是深色方案，对应的可以赋值light设置为浅色方案
"set colorscheme=desert256		" 设置默认的配色方案

"map <C-H> <C-W>h
"map <C-J> <C-W>j
"map <C-K> <C-W>k
"map <C-L> <C-W>l
cmap w!! w !sudo tee >/dev/null %

autocmd! BufWritePost ~/.vimrc so ~/.vimrc
autocmd BufReadPost *
    \ if line("`\"") > 1 && line("`\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif
runtime! ftplugin/man.vim
" ### }}} VIM 特性配置结束

""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""

""" ### Vundle setting {{{
filetype off				" 关闭自动检测文件类型

" refer to http://www.erikzaadi.com/2012/03/19/auto-installing-vundle-from-your-vimrc/
let iCanHazVundle=1
let vundle_readme=expand('~/.vim/bundle/vundle/README.md')
if !filereadable(vundle_readme)
    echo "Installing Vundle..."
    echo ""
    silent !mkdir -p ~/.vim/bundle/
    silent !git clone https://github.com/gmarik/vundle ~/.vim/bundle/vundle
    let iCanHazVundle=0
endif

" apend vundle path to runtimepath
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" Bundles {{{
    Bundle 'gmarik/vundle'
    " color scheme
    Bundle 'altercation/vim-colors-solarized'
    " ::: vim-colors-solarized {{{
        set background=dark
        let g:solarized_termcolors=256
        colorscheme solarized
        "call togglebg#map("<F5>")
    " }}}
    Bundle 'chriskempson/vim-tomorrow-theme'
    " ::: vim-tomorrow-theme {{{
        " set background=dark
        " colorscheme 'Tomorrow-Night-Eighties'
    " }}}
    Bundle 'taglist.vim'
    " ::: taglist {{{
        map <F2> :silent! Tlist<CR>
        let Tlist_Ctags_Cmd='ctags'
        let Tlist_Exit_OnlyWindow=1
    " }}}
"    Bundle 'Valloric/YouCompleteMe'
"    " ::: YouCompleteMe {{{
"        let g:ycm_register_as_syntastic_checker = 1 "default 1
"        let g:Show_diagnostics_ui = 1 "default 1
"        let g:ycm_enable_diagnostic_signs = 1
"        let g:ycm_enable_diagnostic_highlighting = 0
"        let g:ycm_always_populate_location_list = 1 "default 0
"        let g:ycm_open_loclist_on_ycm_diags = 1 "default 1
"        let g:ycm_complete_in_strings = 1 "default 1
"        let g:ycm_collect_identifiers_from_tags_files = 0 "default 0
"        let g:ycm_path_to_python_interpreter = '' "default ''
"        let g:ycm_server_use_vim_stdout = 0 "default 0 (logging to console)
"        let g:ycm_server_log_level = 'info' "default info
"        let g:ycm_global_ycm_extra_conf = '~/.ycm_extra_conf.py'  "where to search for .ycm_extra_conf.py if not found
"        let g:ycm_confirm_extra_conf = 1
"        let g:ycm_goto_buffer_command = 'same-buffer' "[ 'same-buffer', 'horizontal-split', 'vertical-split', 'new-tab' ]
"        let g:ycm_filetype_whitelist = { '*': 1 }
"        let g:ycm_key_invoke_completion = '<C-Space>'
"        nnoremap <F11> :YcmForceCompileAndDiagnostics <CR>
    " }}}
    "Bundle 'Valloric/ListToggle'
    Bundle 'scrooloose/syntastic'
    " ::: synstastic {{{
       let g:syntastic_check_on_open=0
       let g:syntastic_check_on_wq=1
       let g:syntastic_auto_loc_list=1
    " }}}
    Bundle 'EasyMotion'
    Bundle 'vim-airline/vim-airline'
    " ::: vim-airline {{{
         set noshowmode
	 set laststatus=2
	 let g:airline_theme='powerlineish'
	 let g:airline_powerline_fonts = 1
	 let g:airline_detect_whitespace = 1
	 let g:airline#extensions#tabline#enabled = 1
	 let g:airline#extensions#hunks#non_zero_only = 1
    " }}}
    Bundle 'vim-airline/vim-airline-themes'
    "Bundle 'vimtips.zip'
    Bundle 'ctrlp.vim'
    " ::: ctrlp {{{
        let g:ctrlp_follow_symlinks=1
        let g:ctrlp_custom_ignore = '\.git$\|\.hg$\|\.svn$\|.rvm$'
    " }}}
    "Bundle 'The-NERD-tree'
    "Bundle 'The-NERD-Commenter'
    Bundle 'terryma/vim-multiple-cursors'
    Bundle 'tpope/vim-fugitive'
    Bundle 'lilydjwg/colorizer'
    Bundle 'sheerun/vim-polyglot'
    "Bundle 'SirVer/ultisnips'
    "Bundle 'honza/vim-snippets'
    "Bundle 'scrooloose/nerdtree'
    "Bundle 'tpope/vim-eunuch'
" }}}

" install Bundles automatically
if iCanHazVundle == 0
    echo "Installing Bundles, please ignore key map error messages"
    echo ""
    :BundleInstall
endif
filetype plugin indent on
" ### }}}
