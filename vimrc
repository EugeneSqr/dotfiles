set nocompatible              " be iMproved
filetype off                  " required!

set rtp+=~/.vim/bundle/vundle/
call vundle#begin()
Plugin 'gmarik/vundle'
Plugin 'groenewege/vim-less'
Plugin 'bling/vim-airline'
Plugin 'tomasr/molokai'
call vundle#end()
filetype plugin indent on     " required!

syntax enable

set t_Co=256
colorscheme molokai

set number

" indentation all
set smartindent
set tabstop=4
set shiftwidth=4
set expandtab

" file types 
autocmd FileType make setlocal noexpandtab "make

" search
set incsearch

" multifile search
nnoremap <F7> :grep <C-R><C-W> *<CR><CR>
nnoremap <F3> :cnext <CR>

" quotes shortcuts
nnoremap "" Bi"<Esc>Ea"<Esc>
nnoremap '' Bi'<Esc>Ea'<Esc>
nnoremap d" T"vt"d
nnoremap d' T'vt'd
nnoremap d( T(vt)d
nnoremap d) T(vt)d

" ctrl+s as save
inoremap <C-s> <Esc>:w<CR>
nnoremap <C-s> :w<CR>

"managing windows
nnoremap <C-h> <C-w><Left>
nnoremap <C-j> <C-w><Down>
nnoremap <C-k> <C-w><Up>
nnoremap <C-l> <C-w><Right>

" Backspace fix
set backspace=indent,eol,start

" Airline
let g:airline#extensions#tabline#enabled = 1 " Enable the list of buffers
let g:airline#extensions#tabline#fnamemod = ':t' " Show just the filename
let g:airline_detect_modified = 0
let g:airline_left_sep = '▶'
let g:airline_right_sep = '◀'
set laststatus=2
