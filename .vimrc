set nocompatible                    " disable vi compatibility.

filetype off                        " required by Vundle
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" My bundles here:
Bundle 'gmarik/vundle'
Bundle 'scrooloose/nerdtree'
Bundle 'Xuyuanp/nerdtree-git-plugin'
Bundle 'majutsushi/tagbar'
Bundle 'kien/ctrlp.vim'

" snipMate sub-plugins
Bundle 'MarcWeber/vim-addon-mw-utils'
Bundle 'tomtom/tlib_vim'
Bundle 'honza/vim-snippets'
Bundle 'garbas/vim-snipmate'

Bundle 'PA_ruby_ri'
Bundle 'vim-scripts/ZoomWin'
Bundle 'rking/ag.vim'
Bundle 'sjl/gundo.vim'
Bundle 'jlanzarotta/bufexplorer'
Bundle 'ap/vim-css-color'
Bundle '1995eaton/vim-better-css-completion'
Bundle 'vim-gitgutter'
Bundle 'godlygeek/tabular'
Bundle 'yaymukund/vim-rabl'
Bundle 'mustache/vim-mustache-handlebars'
call vundle#end()

filetype plugin on
filetype plugin indent on
filetype indent on
filetype on
syntax on

" Misc
set history=1000                    " Number of things to remember in history.
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
set foldlevel=1
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
set guifont=DejaVu\ Sans\ Mono\ 13
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
vnoremap <C-F5> Y<Esc>:!ruby<Space>-e<Space>@0<CR>
" ctag: regenerate tag list
nmap <C-F12> <Esc>:!ctags<Space>-R<Space>.<CR>
" toggle nert-tree-left-side window
nmap <C-F11> <Esc>:NERDTreeToggle<CR>
" toggle tagbar-right-side window
nmap <S-F11> <Esc>:TagbarToggle<CR>
" start Ag!
nmap <C-F7> <Esc>:Ag!
" toggle gundo-left-side window
nnoremap <C-F6> :GundoToggle<CR>
" GitGutter
nmap ,gg <Esc>:GitGutterToggle<CR>
nmap ,gG <Esc>:GitGutterLineHighlightsToggle<CR>



" CtrlP plugin
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn)$',
  \ 'file': '\v\.(exe|so|dll|zip|rar|swp)$'
  \ }

" Ag plugin
let g:agprg="ag --column --smart-case"
let g:aghighlight=1

" GitGutter plugin
let g:gitgutter_realtime = 0
let g:gitgutter_eager = 0
