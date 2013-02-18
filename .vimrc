set nocompatible

set mouse=a

set winminheight=0
set winminwidth=0

set laststatus=2

set completeopt=menu

set expandtab
set autoindent
set smartindent
set backspace=indent,eol,start
syntax on

" overlength
highlight OverLength ctermbg=darkgray ctermfg=white guibg=darkgray guifg=white
set wrap
set linebreak
set cmdheight=1

set number
set foldmethod=syntax " indent
set list
set listchars=tab:»-,trail:-
set guifont=Courier\ New\ 10
set background=dark
colorscheme evening  "desert

set showcmd
"set statusline=%«%f%h%m%r%=format=%{&fileformat}\ file=%{&fileencoding}\ enc=%{&encoding}\ %b\ 0x%B\ %l,%c%V\ %P

set hlsearch
set incsearch
"set nowrapscan
set ignorecase
set cursorcolumn

set nobackup
set noswapfile

set fileencodings=utf-8,cp1251,koi8-r,cp866
set encoding=utf-8
set visualbell
set filetype=on
set fileformat=unix
filetype plugin on

if &filetype == '.rb'
    set tabstop=2
    set shiftwidth=2
else
    set tabstop=4
    set shiftwidth=4
endif

" lighting for action-script as for java-script
if &filetype == 'atlas'
    setlocal filetype=javascript
endif

" Reading others file format
au BufReadPost *.pdf silent %!pdftotext -nopgbrk "%" - |fmt -csw78
au BufReadPost *.doc silent %!antiword "%"
au BufReadPost *.odt silent %!odt2txt "%"

:setlocal spell spelllang=en
"""""""""""""""""""""""""""""""""
" Global Varibles
"""""""""""""""""""""""""""""""""
set tags+=tags,TAGS,./**/tags,./**/TAGS,D:\editors\Vim\ctags

"""""""""""""""""""""""""""""""""
" Ruby abbrivation
"""""""""""""""""""""""""""""""""
inoreab «%= «%=«Space»«Space»-%»«Esc»3hi
inoreab «% «%«Space»-%»«Esc»3hi

" get tag definition list
"nnoremap <C-Space> <Esc>:execute<Space>:stselect!<Space>.expand('«cword»')<CR>
map <S-Space> [I:let nr = input("Which one: ")<Bar>exe "normal " . nr ."[\t"<CR>
" toggle nert-tree-window
nnoremap <C-F11> <Esc>:NERDTreeToggle<CR>
" regenerate tag list
nnoremap <C-F12> <Esc>:!ctags<Space>-R<Space>.<CR>
