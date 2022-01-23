" Plugins (install with vim-plug: https://github.com/junegunn/vim-plug)
call plug#begin('~/.vim/plugged')
Plug 'editorconfig/editorconfig-vim'
Plug 'mattn/emmet-vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'preservim/nerdtree'
Plug 'arcticicestudio/nord-vim'
Plug 'ervandew/supertab'
Plug 'sirver/UltiSnips'
Plug 'honza/vim-snippets'
Plug 'tpope/vim-commentary'
" Language support
Plug 'othree/html5.vim'
Plug 'tweekmonster/django-plus.vim'
Plug 'vim-python/python-syntax'
Plug 'pangloss/vim-javascript'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'blueyed/vim-diminactive'
call plug#end()

set nocompatible " from garybernhardt
set autoindent
set autoread
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set backspace=indent,eol,start
set cursorline
set clipboard=unnamed  " yank and paste will use system clipboard
set cmdheight=1
set completeopt=menu,preview
set diffopt=vertical
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set expandtab
set fixendofline
set foldmethod=manual
set incsearch
set ignorecase smartcase
set hidden
set hlsearch
set laststatus=2
set listchars=eol:¬,tab:>·,trail:~,extends:…,precedes:…,space:⋅
set nobackup
set nojoinspaces " Insert only one space when joining lines that contain sentence-terminating punctuation like `.`.
set nofoldenable  " ensure file is not folded when opening
set nowritebackup
set nolist
set nowrap
set number
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

" Colors
syntax on
colorscheme default
function ActivateNordColor()
    colorscheme nord
    " hi Include ctermfg=1 cterm=bold
    hi pythonFunctionCall ctermfg=3
    hi Identifier ctermfg=9
    hi Statement ctermfg=1
    hi Conditional cterm=bold
    hi Exception cterm=bold
    hi Function ctermfg=5
    hi Operator ctermfg=13
    " " Darken active line and inactive windows.
    " hi CursorLine ctermbg=16 cterm=none
    " hi ColorColumn ctermbg=16
    hi TabLine ctermfg=16 ctermbg=8
    hi TabLineFill ctermbg=8
    hi TabLineSel ctermfg=6 ctermbg=none
endfunction
function ActivateAyuColor()
    colorscheme default
    hi CursorLine ctermbg=14 cterm=none
    hi Visual ctermbg=13
endfunction
call ActivateNordColor()

let g:python_highlight_all = 1
if has('nvim')
    let g:python3_host_prog = '~/.pyenv/versions/py3nvim/bin/python'
endif

" Set default supertab completion to be context aware.
" This tries the omni completionm but also falls back to local keyword
" completion.
let g:SuperTabDefaultCompletionType = 'context'
let g:UltiSnipsExpandTrigger="<tab>"

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

" Omni complete: http://blog.fluther.com/django-vim/
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
" autocmd FileType htmldjango set omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS

" KEY MAPS
map <leader>n :call RenameFile()<cr>
map <leader>t :NERDTreeFind % <cr>
