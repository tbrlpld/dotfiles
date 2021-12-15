" Plugins (install with vim-plug: https://github.com/junegunn/vim-plug)
call plug#begin('~/.vim/plugged')
Plug 'editorconfig/editorconfig-vim'
Plug 'mattn/emmet-vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'preservim/nerdtree'
Plug 'ervandew/supertab'
Plug 'tpope/vim-commentary'
" Language support
Plug 'othree/html5.vim'
Plug 'vim-python/python-syntax'
Plug 'pangloss/vim-javascript'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'blueyed/vim-diminactive'
call plug#end()

let g:python3_host_prog = '~/.pyenv/versions/py3nvim/bin/python'
let g:python_highlight_all = 1
" Set default supertab completion to be context aware.
" This tries the omni completionm but also falls back to local keyword
" completion.
let g:SuperTabDefaultCompletionType = 'context'

set number
set ic
set expandtab
set tabstop=4
set shiftwidth=4
set fixendofline
set nowrap
set listchars=eol:¬,tab:>·,trail:~,extends:…,precedes:…,space:⋅
set nolist
set foldmethod=indent
set foldlevel=2
set nofoldenable  " ensure file is not folded when opening
set clipboard=unnamed  " yank and paste will use system clipboard
set cursorline

" Colors
syntax on
hi Include ctermfg=1 cterm=bold
hi pythonFunctionCall ctermfg=11
hi Identifier ctermfg=12
" Darken active line and inactive windows.
hi CursorLine ctermbg=16 cterm=none
hi ColorColumn ctermbg=16

" Trim trailin whitespace
function TrimWhiteSpace()
  %s/\s*$//
  ''
endfunction

autocmd FileWritePre * call TrimWhiteSpace()
autocmd FileAppendPre * call TrimWhiteSpace()
autocmd FilterWritePre * call TrimWhiteSpace()
autocmd BufWritePre * call TrimWhiteSpace()
au BufRead,BufNewFile *.html set filetype=htmldjango

" Omni complete: http://blog.fluther.com/django-vim/
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType htmldjango set omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python set omnifunc=pythoncomplete#Complete
