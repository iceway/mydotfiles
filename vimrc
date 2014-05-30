" VIM setting (for terminal)
" Iceway Zhang
" vim:set shiftwidth=4 tabstop=4 softtabstop=4 expandtab: "

""" ### VIM featrues settings {{{
set nocompatible        " be improved

set ruler
set number
"set relativenumber
set hlsearch
set incsearch
set cursorline
"set nowrap
"set list
set scrolloff=3
set showmode
set showcmd
set nobackup
set textwidth=0
set history=500

"set shiftwidth=4
"set tabstop=4
"set expandtab
"set smarttab

set backspace=indent,eol,start
set pastetoggle=<F3>
"set encoding=utf-8
set viminfo='100,f1,<500

filetype plugin indent on

if &t_Co > 2
    syntax on
    set t_Co=256
endif
"set laststatus=2
"set statusline=%2*Filename\:\ %t%*%1*%m%*%2*%r%h%w\ %=[FORMAT=%{&ff}]\ [TYPE=%Y]\ [ASCII=\%b]\ [HEX=\%02.2B]\ [POS=%l,%v][%p%%]\ [LINES=%L]\ %*
"hi User1 term=inverse,bold cterm=inverse,bold ctermfg=red
"hi User2 term=inverse,bold cterm=inverse,bold ctermfg=green
"set background=dark
"set colorscheme=desert256

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
" ### }}}

""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""

""" ### Vundle setting {{{
filetype off

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
        "let g:solarized_termcolors=256
        colorscheme solarized
        "call togglebg#map("<F5>")
    " }}}
    " coding
    "Bundle 'a.vim'
    "Bundle 'c.vim'
    Bundle 'taglist.vim'
    " ::: taglist {{{
        map <F2> :silent! Tlist<CR>
        let Tlist_Ctags_Cmd='ctags'
        let Tlist_Exit_OnlyWindow=1
    " }}}
    "Bundle 'Valloric/YouCompleteMe'
    "Bundle 'Valloric/ListToggle'
    Bundle 'scrooloose/syntastic'
    " ::: synstastic {{{
        let g:syntastic_check_on_open=0
        let g:syntastic_check_on_wq=1
        let g:syntastic_auto_loc_list=1
    " }}}
    Bundle 'plasticboy/vim-markdown'
    " ::: vim-markdown {{{
        let g:vim_markdown_folding_disabled=1
    " }}}
    " Others
    Bundle 'EasyMotion'
    Bundle 'bling/vim-airline'
    " ::: vim-airline {{{
        set noshowmode
        set laststatus=2
        let g:airline_theme='powerlineish'
        let g:airline_powerline_fonts=1
        let g:airline_detect_whitespace = 1
        let g:airline#extensions#hunks#non_zero_only = 1
    " }}}
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
" }}}

" install Bundles automatically
if iCanHazVundle == 0
    echo "Installing Bundles, please ignore key map error messages"
    echo ""
    :BundleInstall
endif
filetype plugin indent on
" ### }}}
