set nocompatible              " be iMproved
filetype off                  " required!

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'gmarik/vundle'
Bundle 'hdima/python-syntax.git'
Bundle 'groenewege/vim-less'

filetype plugin indent on     " required!

syntax enable
colorscheme zellner 
set number

let python_highlight_all = 1

" indentation all
set smartindent
set tabstop=4
set shiftwidth=4
set expandtab

" file types 
" make
autocmd FileType make setlocal noexpandtab

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

" trailing semicolons
nnoremap ;; $a;<Esc>
inoremap ;; <Esc>$a;<Esc>

" space selection
nnoremap <space> /{<CR>Nv%

" ctrl+s as save
inoremap <C-s> <Esc>:w<CR>
nnoremap <C-s> :w<CR>

" Backspace fix
set backspace=2
