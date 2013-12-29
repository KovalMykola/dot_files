set nocompatible                    " disable vi compatibility.

filetype off                        " required by Vundle
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
" My bundles here:
Bundle 'gmarik/vundle'
Bundle 'scrooloose/nerdtree'
Bundle 'kien/ctrlp.vim'

" snipMate sub-plugins
Bundle 'MarcWeber/vim-addon-mw-utils'
Bundle 'tomtom/tlib_vim'
Bundle 'garbas/vim-snipmate'

Bundle 'PA_ruby_ri'
Bundle 'Yggdroot/indentLine'
Bundle 'vim-scripts/ZoomWin'
Bundle 'rking/ag.vim'


filetype plugin indent on
filetype indent on
filetype on
syntax on

" Misc
set history=500                     " Number of things to remember in history.
set number
set backspace=indent,eol,start

" Match and search
set hlsearch                        " highlight search
set ignorecase                      " Do case in sensitive matching with
set smartcase                       " be sensitive when there's a capital letter
set incsearch

" Tabs
set tabstop=2                       " Set the default tabstop
set softtabstop=2
set shiftwidth=2                    " Set the default shift width for indents
set expandtab                       " Make tabs into spaces (set by tabstop)
set smarttab                        " Smarter tab levels
set autoindent
set smartindent                     " ???

" Line wraping
set wrap
set linebreak

" Folding
set foldenable                      " Turn on folding
set foldmethod=syntax

" Window
set mouse=a
set winminheight=1
set winminwidth=1
set laststatus=2
set cmdheight=1
set showcmd
set statusline=%f%h%m%r%=format=%{&fileformat}\ file=%{&fileencoding}\ enc=%{&encoding}\ %b\ 0x%B\ %l,%c%V\ %P
highlight OverLength ctermbg=darkgray ctermfg=white guibg=darkgray guifg=white
set list
set listchars=tab:»-,trail:-
set guifont=Courier\ New\ 10
set background=dark
colorscheme evening
set cursorcolumn

" Backups
set nobackup
set noswapfile

" Omni
set completeopt=menu

" Encoding/formats
set fileencodings=utf-8,cp1251,koi8-r,cp866
set encoding=utf-8
set visualbell
set fileformat=unix

:setlocal spell spelllang=en

" Auto commands
autocmd BufRead,BufNewFile {Gemfile,Rakefile,Capfile,*.rake,config.ru}     set ft=ruby
autocmd BufReadPost *.pdf silent %!pdftotext -nopgbrk "%" - |fmt -csw78
autocmd BufReadPost *.doc silent %!antiword "%"
autocmd BufReadPost *.odt silent %!odt2txt "%"
autocmd FileWritePre,FileAppendPre,FilterWritePre,BufWritePre * %s/\s\+$//e

" Ctags
set tags+=tags,TAGS,./**/tags,./**/TAGS

" Maps
" run selected ruby script
"vnoremap <C-F5> Y<Esc>:!ruby<Space>-e<Space>@0<CR>
" jump to under cursor tag
map ,f [I:let nr = input("Which one: ")<Bar>exe "normal " . nr ."[\t"<CR>
" ctag: regenerate tag list
nnoremap <C-F12> <Esc>:!ctags<Space>-R<Space>.<CR>
" toggle nert-tree-left-side window
nnoremap <C-F11> <Esc>:NERDTreeToggle<CR>



" CtrlP plugin
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn)$',
  \ 'file': '\v\.(exe|so|dll|zip|rar|swp)$'
  \ }
