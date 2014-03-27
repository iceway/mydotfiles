" Configuration file for vim

" Normally we use vim-extensions. If you want true vi-compatibility
" remove change the following statements
set nocompatible	" Use Vim defaults instead of 100% vi compatibility
set backspace=indent,eol,start	" more powerful backspacing

set textwidth=0		" Don't wrap words by default
set nobackup		" Don't keep a backup file
set viminfo='20,\"500	" read/write a .viminfo file, don't store more than
			" 500 lines of registers
set history=50		" keep 50 lines of command line history
"set ruler		" show the cursor position all the time
"set number		" show line number
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set autoindent          " automatic indent
"set cindent            " automatic indent while edit c program file
"set nocindent          " not auto indet while copy
"set paste              " when paste shomthing in, don't indent
set pastetoggle=<F3>    " shortcut key for paste

"set expandtab           " replace tab to space
"set tabstop=4          " set one tab display by 4 spaces
"set softtabstop=4       " set 4 spaces replace one tab
"set shiftwidth=4        " set 4 spaces while indent
set bg=dark             " highlight display
"set cursorline         " highlight the line that cursor in

"***** set status bar of vim
"set statusline=%F%1*%m%*%r%h%w\ %=\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [ASCII=\%2*%03.3b%*]\ [HEX=\%2*%02.2B%*]\ [POS=%1*%l,%v%*][%p%%]\ [LINES\ COUNT=%L]
set statusline=%2*Filename\:\ %t%*%1*%m%*%2*%r%h%w\ %=[FORMAT=%{&ff}]\ [TYPE=%Y]\ [ASCII=\%b]\ [HEX=\%02.2B]\ [POS=%l,%v][%p%%]\ [LINES=%L]\ %*
"set statusline=%F%m%r%h%w\ %=[FORMAT=%{&ff}]\ [TYPE=%Y]\ [ASCII=\%b]\ [HEX=\%02.2B]\ [POS=%l,%v][%p%%]\ [LEN=%L]\ 
hi User1 term=inverse,bold cterm=inverse,bold ctermfg=red
hi User2 term=inverse,bold cterm=inverse,bold ctermfg=green
set laststatus=2        " set the status line position, at the penultimate of vim window

"***** set color of status line, but it seems not take any effect
if version >= 700
function! InsertStatuslineColor(mode)
  if a:mode == 'i'
    hi statusline guibg=magenta
  elseif a:mode == 'r'
    hi statusline guibg=blue
  else
    hi statusline guibg=red
  endif
endfunction
au InsertEnter * call InsertStatuslineColor(v:insertmode)
au InsertLeave * hi statusline guibg=green
" default the statusline to green when entering Vim
hi statusline guibg=green
endif

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Suffixes that get lower priority when doing tab completion for filenames.
" These are files we are not likely to want to edit or read.
set suffixes=.bak,~,.swp,.o,.info,.aux,.log,.dvi,.bbl,.blg,.brf,.cb,.ind,.idx,.ilg,.inx,.out,.toc

" We know xterm-debian is a color terminal
if &term =~ "xterm-debian" || &term =~ "xterm-xfree86"
  set t_Co=16
  set t_Sf=[3%dm
  set t_Sb=[4%dm
endif

" Make p in Visual mode replace the selected text with the "" register.
vnoremap p <Esc>:let current_reg = @"<CR>gvdi<C-R>=current_reg<CR><Esc>

" Vim5 and later versions support syntax highlighting. Uncommenting the next
" line enables syntax highlighting by default.
 syntax on

" Debian uses compressed helpfiles. We must inform vim that the main
" helpfiles is compressed. Other helpfiles are stated in the tags-file.
"set helpfile=$VIMRUNTIME/doc/help.txt.gz

if has("autocmd")
 " Enabled file type detection
 " Use the default filetype settings. If you also want to load indent files
 " to automatically do language-dependent indenting add 'indent' as well.
 filetype plugin on
 " when we copy multi-line code , we should execute "filetype plugin on", and reopen file to copy
endif " has ("autocmd")

" Some Debian-specific things
augroup filetype
  au BufRead reportbug.*		set ft=mail
  au BufRead reportbug-*		set ft=mail
augroup END

" The following are commented out as they cause vim to behave a lot
" different from regular vi. They are highly recommended though.
set showcmd		" Show (partial) command in status line.
"set showmatch		" Show matching brackets.
"set ignorecase		" Do case insensitive matching
"set incsearch		" Incremental search
"set autowrite		" Automatically save before commands like :next and :make
set dictionary=.c-c++-keywords.list
set ls=2
set hls

let g:DoxygenToolkit_briefTag_pre="@Synopsis  "
let g:DoxygenToolkit_paramTag_pre="@Param "
let g:DoxygenToolkit_returnTag="@Returns   "
let g:DoxygenToolkit_blockHeader="--------------------------------------------------------------------------"
let g:DoxygenToolkit_blockFooter="----------------------------------------------------------------------------"
let g:DoxygenToolkit_authorName="agui.zhang"
let g:DoxygenToolkit_licenseTag="My own license\<enter>"

"start configure for bufferlist.vim
map <silent> <F3> :call BufferList()<CR>
let g:BufferListWidth = 25
"end of configure for bufferlist.vim


"start configure for PreviewTag.vim
command! -nargs=? -complete=tag_listfiles       PreviewTag call PreviewTag(<f-args>)
map <F12> :PreviewTag<CR>
"end of configure for PreviewTag.vim

" Only do this part when compiled with support for autocommands
if has("autocmd")
  " In text files, always limit the width of text to 78 characters
    "autocmd BufRead *.txt set tw=78
      " When editing a file, always jump to the last cursor position
        autocmd BufReadPost *
          \ if line("'\"") > 0 && line ("'\"") <= line("$") |
  \   exe "normal! g'\"" |
  \ endif
endif

" Taglist configuration
let Tlist_Exit_OnlyWindow = 1	" exit vim if taglist is the only window
map <F2> <Esc>:TlistToggle<CR>
" let Tlist_Auto_Open=1

" Configure for ctags
set tags=tags;
set autochdir

set textwidth=0		" Don't wrap words by default


" Color
colorscheme desert
set t_Co=256

set statusline=%2*Filename\:\ %t%*%1*%m%*%2*%r%h%w\ %=[FORMAT=%{&ff}]\ [TYPE=%Y]\ [ASCII=\%b]\ [HEX=\%02.2B]\ [POS=%l,%v][%p%%]\ [LINES=%L]\ %*
hi User1 term=inverse,bold cterm=inverse,bold ctermfg=red
hi User2 term=inverse,bold cterm=inverse,bold ctermfg=green
set laststatus=2        " set the status line position, at the penultimate of vim window
