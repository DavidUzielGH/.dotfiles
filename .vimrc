
"vim qol"

set number relativenumber
set nu rnu
set shiftwidth=2
set autoindent
set smartindent
let mapleader = ","

"tex qol"
let g:livepreview_previewer = 'zathura' 
let g:tex_flavor = 'latex'

"Plugin control"
call plug#begin()

Plug 'KabbAmine/vCoolor.vim'
Plug 'calviken/vim-gdscript3'
Plug 'lilydjwg/colorizer'
Plug 'kien/ctrlp.vim'
Plug 'flrnd/plastic.vim'
Plug 'SirVer/ultisnips'
Plug 'lervag/vimtex'
Plug 'xuhdev/vim-latex-live-preview', { 'for': 'tex' }

call plug#end()


"Mappings"

nnoremap <leader>q :q!<CR> 
nnoremap <leader>s :w<CR> 
nnoremap <leader>w :wq<CR> 
noremap <leader>y "+y
noremap <leader>Y "*y
noremap <leader>p "*p
noremap <leader>P "*P
nnoremap <leader>z :set nospell<CR>
nnoremap <leader>z ToggleSpellCheck()
nnoremap <S-r> :source ~/.vimrc<CR>
nnoremap <C-p> :CtrlP<CR>
nnoremap <S-c> :VCoolor<CR>
inoremap <F2> <Esc> 	

nnoremap <F2> :wa<CR>

".tex specific mapping"
autocmd FileType tex inoremap { {}<left>
"--Color--"
colorscheme plastic

"current line"
hi CursorLine term=bold cterm=bold ctermbg=DarkGray ctermfg=White

"statusline"
hi StatusLine ctermbg=Cyan ctermfg=White

"Omnicompletion"
filetype plugin on
set omnifunc=syntaxcomplete#Complete

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" MULTIPURPOSE TAB KEY
" Indent if we're at the beginning of a line. Else, do completion.
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! InsertTabWrapper()
    let col = col('.') - 1
    if !col || getline('.')[col - 1] !~ '\k'
        return "\<tab>"
    else
        return "\<c-p>"
    endif
endfunction
inoremap <expr> <tab> InsertTabWrapper()
inoremap <s-tab> <c-n>

function! ToggleSpellCheck()
  if &spell 
    setlocal spell spelllang=es
  else
    setlocal nospell
  endif
endfunction
