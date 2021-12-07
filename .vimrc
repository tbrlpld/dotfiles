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


" Colors
syntax on
hi Include ctermfg=1 cterm=bold
hi pythonFunctionCall ctermfg=11
hi Identifier ctermfg=12

" Trim trailin whitespace
function TrimWhiteSpace()
  %s/\s*$//
  ''
endfunction
autocmd FileWritePre * call TrimWhiteSpace()
autocmd FileAppendPre * call TrimWhiteSpace()
autocmd FilterWritePre * call TrimWhiteSpace()
autocmd BufWritePre * call TrimWhiteSpace()

" Plugins (install with vim-plug: https://github.com/junegunn/vim-plug)
call plug#begin('~/.vim/plugged')
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'editorconfig/editorconfig-vim'
Plug 'ervandew/supertab'
Plug 'tpope/vim-commentary'
Plug 'vim-python/python-syntax'
call plug#end()

let g:python_highlight_all = 1
" Set default supertab completion to be context aware.
" This tries the omni completionm but also falls back to local keyword
" completion.
let g:SuperTabDefaultCompletionType = 'context'
