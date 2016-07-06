set nocompatible              " be iMproved
" Vundle
filetype off                  " required!
set rtp+=~/.vim/bundle/Vundle.vim/
call vundle#begin()
Plugin 'gmarik/vundle'
Plugin 'groenewege/vim-less'
Plugin 'bling/vim-airline'
Plugin 'tomasr/molokai'
Plugin 'Shougo/unite.vim'
Plugin 'Shougo/neomru.vim'
Plugin 'Shougo/vimproc.vim'
Plugin 'elzr/vim-json'
Plugin 'octol/vim-cpp-enhanced-highlight'
call vundle#end()
filetype plugin indent on     " required!
" Keymap
set keymap=russian-jcukenwin
set iminsert=0
set imsearch=-1
" Appearance
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
" ctrl+s as save
inoremap <C-s> <Esc>:w<CR>
nnoremap <C-s> :w<CR>
" windows
nnoremap <C-h> <C-w><Left>
nnoremap <C-j> <C-w><Down>
nnoremap <C-k> <C-w><Up>
nnoremap <C-l> <C-w><Right>
" remove current buffer without closing window
nnoremap <C-c> :bp\|bd #<CR>
" buffers
nnoremap <Space>h :bprevious<CR>
nnoremap <Space>j :bprevious<CR>
nnoremap <Space>l :bnext<CR>
nnoremap <Space>k :bnext<CR>
" Backspace fix
set backspace=indent,eol,start
" quotes shortcuts
nnoremap "" Bi"<Esc>Ea"<Esc>
nnoremap '' Bi'<Esc>Ea'<Esc>
nnoremap d" T"dt"
nnoremap d' T'dt'
nnoremap y" T"yt"
nnoremap y' T'yt'
" parenthesis shortcuts
nnoremap d( T(dt)
nnoremap d) T(dt)
nnoremap y( T(yt)
nnoremap y) T(yt)
" newline without insert mode
nnoremap <S-Enter> O<Esc>j
nnoremap <CR> a<CR><Esc>k$
" folding
set foldmethod=manual
set foldlevelstart=1
let xml_syntax_folding=1
" Build
nnoremap \b :!make<CR>
" Run
nnoremap \r :!make run<CR>
" Debug
nnoremap \d :!make debug<CR>
" Unite
nnoremap <leader>t :Unite -start-insert file_rec/async<CR>
nnoremap <leader>f :Unite file<CR>
nnoremap <leader>r :Unite file_mru<CR>
" Airline
let g:airline#extensions#tabline#enabled = 1 " Enable the list of buffers
let g:airline#extensions#tabline#fnamemod = ':t' " Show just the filename
let g:airline_detect_modified = 0
let g:airline_left_sep = '▶'
let g:airline_right_sep = '◀'
set laststatus=3

" Functions
fu! IsCurrentBufferEmpty()
    return line2byte(line("$") + 1) <= 2
endfu

fu! CppModule(name)
    let headerName = a:name . ".h"
    execute 'tabedit ' . headerName
    if IsCurrentBufferEmpty()        
        let guardName = a:name . "_h"
        call append(0, "#ifndef GUARD_" . guardName)
        call append(1, "#define GUARD_" . guardName)
        call append(3, "#endif")
    endif
    execute 'vsplit ' . a:name . ".cpp"
    if IsCurrentBufferEmpty()
        call append(0, "#include \"" . headerName . "\"")
    endif
endfu

fu! ModuleComplete(A, L, P)
    return system("ls *.h | cut -d. -f1")
endfu

com! -complete=custom,ModuleComplete -nargs=1 Cppm :call CppModule(<f-args>)

fu! CppMake()
    if IsCurrentBufferEmpty()        
        call append(0, "CXXFLAGS=-std=c++11 -Wall -g")
        call append(2, "default: main")
        call append(3, "")
        call append(4, "run: main exec clean")
        call append(5, "")
        call append(6, "exec:")
        call append(7, "\t ./main < input.txt")
        call append(8, "")
        call append(9, "debug:")
        call append(10, "\t gdb ./main")
        call append(11, "")
        call append(12, "clean:")
        call append(13, "\t rm -f main")
    endif
endfu

com! CppMake :call CppMake()
