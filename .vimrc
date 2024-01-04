" Install Plug
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif
" Plugins (install with vim-plug: https://github.com/junegunn/vim-plug)
call plug#begin('~/.vim/plugged')
Plug 'editorconfig/editorconfig-vim'
Plug 'mattn/emmet-vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'preservim/nerdtree'
" Plug 'ervandew/supertab'
" Plug 'sirver/UltiSnips'
Plug 'tpope/vim-commentary'
Plug 'blueyed/vim-diminactive'
Plug 'michaeljsmith/vim-indent-object'
Plug 'tpope/vim-repeat'
Plug 'honza/vim-snippets'
Plug 'tpope/vim-surround'
Plug 'chaoren/vim-wordmotion'
" Language support
Plug 'othree/html5.vim'
Plug 'alvan/vim-closetag'
Plug 'tweekmonster/django-plus.vim'
Plug 'vim-python/python-syntax'
Plug 'pangloss/vim-javascript'
Plug 'maxmellon/vim-jsx-pretty'
call plug#end()

set nocompatible " from garybernhardt
set autoindent
set autoread
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set backspace=indent,eol,start
set cursorline
set clipboard=unnamed  " yank and paste will use system clipboard
set cmdheight=1
set complete=.,b,u,]  " pull from keywords in the current file, other buffers (closed or still open), and from the current tags file.
set completeopt=menu,preview
set diffopt=vertical
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set expandtab
set fixendofline
set foldmethod=indent
set incsearch
set ignorecase smartcase
set hidden
set hlsearch
set laststatus=2
set nobackup
set nojoinspaces " Insert only one space when joining lines that contain sentence-terminating punctuation like `.`.
set nofoldenable  " Ensure file is not folded when opening
set nowritebackup
set noswapfile " Never found any use for a swapfile but am bugged by them daily.
set nolist
set nowrap
set number
set relativenumber
set signcolumn=no
set scrolloff=3
set shiftwidth=4
set showcmd
set showtabline=2
set softtabstop=4
set statusline=%<%f\ (%{&ft})\ %-4(%m%)%=%-19(%3l,%02c%03V%)
set switchbuf=usetab
set tabstop=4
set wildmenu " make tab completion for files/buffers act like bash
set wildmode=longest,list:longest  " make tab completion similar to zsh

" Colors
colorscheme default
syntax on

" FZF preview window above file names for see more of the paths
let g:fzf_preview_window = ['up:60%', 'ctrl-/']
" python
let g:python_highlight_all = 1
let g:python3_host_prog = '~/.pyenv/versions/nvim/bin/python'

" FUNCTIONS
" Trim trailin whitespace
function TrimWhiteSpace()
  %s/\s*$//
  ''
endfunction

function! RenameFile()
    let old_name = expand('%')
    let new_name = input('New file name: ', expand('%'), 'file')
    if new_name != '' && new_name != old_name
        exec ':saveas ' . new_name
        exec ':silent !rm ' . old_name
        redraw!
    endif
endfunction

" AUTO COMMANDS
autocmd FileWritePre * call TrimWhiteSpace()
autocmd FileAppendPre * call TrimWhiteSpace()
autocmd FilterWritePre * call TrimWhiteSpace()
autocmd BufWritePre * call TrimWhiteSpace()

autocmd BufRead,BufNewFile *.html set filetype=htmldjango
autocmd BufRead,BufNewFile *.css set filetype=css

autocmd FileType python set colorcolumn=88

" KEY MAPS
map <leader>n :call RenameFile()<cr>
map <leader>t :NERDTreeFind % <cr>
