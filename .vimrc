"python.jediEnabled": false
"vim qol"
set number relativenumber
set nu rnu
set shiftwidth=2
set autoindent
set smartindent
let mapleader = ","
set clipboard = "clipboard-unnamed"

"tex qol"
"
let g:livepreview_previewer = 'zathura' 
let g:tex_flavor = 'latex'

"Plugin control"
call plug#begin()

Plug 'ervandew/supertab' 
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'KabbAmine/vCoolor.vim'
Plug 'calviken/vim-gdscript3'
Plug 'lilydjwg/colorizer'
Plug 'kien/ctrlp.vim'
Plug 'SirVer/ultisnips'
Plug 'lervag/vimtex'
Plug 'xuhdev/vim-latex-live-preview', { 'for': 'tex' }
Plug 'jacoborus/tender.vim'
Plug 'dylanaraps/wal.vim'
Plug 'preservim/nerdtree'
Plug 'ThePrimeagen/vim-be-good', {'do': './install.sh'}

call plug#end()

"Mappings"

nnoremap <leader>q :q!<CR> 
nnoremap <leader>s :w<CR> 
nnoremap <leader>w :wq<CR> 
nnoremap ! :!
nnoremap <leader>Z :set nospell<CR>
nnoremap <leader>z :set spelllang=es<CR> :set spell<CR>
nnoremap <leader>r :s/<c-r><c-w>//g<left><left>
nnoremap <leader>R :%s/<c-r><c-w>//g<left><left>
nnoremap <leader>zz z=1<CR><CR>]s
nnoremap <leader>h <c-w>h
nnoremap <leader>l <c-w>l
nnoremap <leader>j <c-w>j
nnoremap <leader>k <c-w>k
nnoremap <leader>a gT
nnoremap <leader>d gt
nnoremap <S-r> :source ~/.vimrc<CR>
nnoremap <C-p> :CtrlP<CR>
nnoremap <S-c> :VCoolor<CR>
nnoremap <leader>t :NERDTreeToggle<CR>


nnoremap <F2> :wa<CR>

"toggle background opacity
let opacity = "false"
nnoremap º :let opacity = ToggleBackgroundOpacity(opacity)<CR>

let g:SuperTabDefaultCompletionType = "<c-n>"

".cpp specific mappings"
autocmd FileType cpp nnoremap <leader>b :!g++ *.cpp*<CR> :!./a.out<CR>
".tex specific mapping"
autocmd FileType tex inoremap { {}<left>
"--Color--"
"colorscheme tender
colorscheme wal

"current line"
let g:SuperTabContextDefaultCompletionType = "<c-p>"
"statusline"
function ToggleBackgroundOpacity(opacity)
  if (a:opacity == "true")
    hi Normal ctermbg=black guibg=black
    hi NonText ctermbg=black guibg=black
    hi! StatusLine ctermbg=DarkBlue ctermfg=Black
    hi! StatusLineNC cterm=bold ctermbg=DarkRed ctermfg=white
    return "false"
  else
    hi Normal ctermbg=NONE guibg=NONE
    hi NonText ctermbg=NONE guibg=NONE
    hi StatusLine ctermbg=NONE cterm=NONE ctermfg=gray
    hi StatusLineNC ctermbg=NONE cterm=NONE ctermfg=gray
    return "true"
  endif
endfunction

function! ClipboardYank()
  call system('xclip -i -selection clipboard', @@)
endfunction
function! ClipboardPaste()
  let @@ = system('xclip -o -selection clipboard')
endfunction

vnoremap <leader>y y:call ClipboardYank()<cr>
nnoremap <leader>p :call ClipboardPaste()<cr>p
hi StatusLineNC ctermbg=NONE cterm=NONE ctermfg=gray
hi StatusLine ctermbg=NONE cterm=NONE ctermfg=gray
