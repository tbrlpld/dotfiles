" Install Plug
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif
" Plugins (install with vim-plug: https://github.com/junegunn/vim-plug)
call plug#begin('~/.vim/plugged')
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'editorconfig/editorconfig-vim'
Plug 'mattn/emmet-vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'preservim/nerdtree'
Plug 'arcticicestudio/nord-vim'
" Plug 'ervandew/supertab'
Plug 'sirver/UltiSnips'
Plug 'tpope/vim-commentary'
Plug 'blueyed/vim-diminactive'
Plug 'michaeljsmith/vim-indent-object'
Plug 'tpope/vim-repeat'
Plug 'honza/vim-snippets'
Plug 'tpope/vim-surround'
Plug 'chaoren/vim-wordmotion'
" Language support
Plug 'othree/html5.vim'
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
set listchars=eol:¬,tab:>·,trail:~,extends:…,precedes:…,space:⋅
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
syntax on
colorscheme default
function ConfigureForNordTerminalColor()
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
function ConfigureForAyuLightTerminalColor()
    colorscheme nord
    hi pythonFunctionCall ctermfg=3
    hi Identifier ctermfg=9
    hi Statement ctermfg=1
    hi Conditional cterm=bold
    hi Exception cterm=bold
    hi Function ctermfg=3
    hi Operator ctermfg=13
    hi Delimiter ctermfg=13
    hi Comment ctermfg=6
    hi CursorLine ctermbg=255 cterm=none
    hi ColorColumn ctermbg=255
    hi Visual ctermbg=254
    hi PreProc ctermfg=none
    hi TabLineSel ctermbg=none ctermfg=none cterm=bold
    hi TabLine ctermbg=254 ctermfg=none
    hi TabLineFill ctermbg=254
    hi StatusLine ctermbg=254 ctermfg=none cterm=bold
    hi StatusLineNC ctermbg=254 ctermfg=none cterm=none
    hi LineNr ctermfg=248
    hi ErrorMsg ctermfg=15
    hi htmlArg ctermfg=6
    hi djangoArgument ctermfg=4
    hi djangoStatement ctermfg=2
    hi markdownCode ctermfg=3
    hi markdownCodeBlock ctermfg=3
    hi markdownCodeDelimiter ctermfg=4
    hi NERDTreeExecFile ctermfg=3
endfunction
function ConfigureForDefaultTerminalColor()
    colorscheme default
    hi CursorLine cterm=none ctermbg=7
    hi CursorLineNr cterm=none ctermbg=7
endfunction
call ConfigureForDefaultTerminalColor()

" FZF preview window above file names for see more of the paths
let g:fzf_preview_window = ['up:60%', 'ctrl-/']
let g:python_highlight_all = 1

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

" Omni complete: http://blog.fluther.com/django-vim/
" autocmd FileType css set omnifunc=csscomplete#CompleteCSS
" autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
" autocmd FileType htmldjango set omnifunc=htmlcomplete#CompleteTags
" autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS

" KEY MAPS
map <leader>n :call RenameFile()<cr>
map <leader>t :NERDTreeFind % <cr>

" COC
" Set internal encoding of vim, not needed on neovim, since coc.nvim using some
" unicode characters in the file autoload/float.vim
set encoding=utf-8

" TextEdit might fail if hidden is not set.
set hidden

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Give more space for displaying messages.
" set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("nvim-0.5.0") || has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ CheckBackspace() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call ShowDocumentation()<CR>

function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Run the Code Lens action on the current line.
nmap <leader>cl  <Plug>(coc-codelens-action)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Remap <C-f> and <C-b> for scroll float windows/popups.
if has('nvim-0.4.0') || has('patch-8.2.0750')
  nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
  inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
  vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif

" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of language server.
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocActionAsync('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocActionAsync('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings for CoCList
" Show all diagnostics.
nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>
