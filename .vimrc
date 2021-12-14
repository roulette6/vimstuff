set nocompatible              " Latest vim settings, not vi


"------ source Vundle (plugin manager) ---"
so ~/.vim/plugins.vim

syntax enable

set backspace=indent,eol,start
let mapleader=','           " Default is \
set number                  " Line numbers
set linespace=15		    " Macvim-specific


"------ visuals ------"
colorscheme atom-dark-256
set t_CO=256                " Use 256 colors
set guifont=Fira_Code:h15   " Macvim-specific
hi LineNr ctermbg=bg guibg=bg
set cursorline
set noshowmode              " hide INSERT b/c airline shows this

set guioptions-=l           " Get rid of scrollbars
set guioptions-=L
set guioptions-=r
set guioptions-=R
set guioptions-=e           " Disable GUI tabs

set tabstop=4
set expandtab
set softtabstop=4
set shiftwidth=4
set fillchars=""            " Remove split chars

"------ search ------"
set hlsearch
set incsearch


"------ split mgmt ------"
set splitbelow              " new split under current
set splitright              " new split to right of current
nmap <C-J> <C-W><C-J>       " ?
nmap <C-K> <C-W><C-K>       " ?
nmap <C-H> <C-W><C-H>       " Left
nmap <C-L> <C-W><C-L>       " Right


"------ mappings ------"
" Make it easy to edit .vimrc
nmap <Leader>ev :tabedit $MYVIMRC<cr>
nmap <Leader><space> :nohlsearch<cr>


"------ Plugins ------"
" CtrlP
let g:ctrlp_custom_ignore = {
    \   'dir' : '\.git$\|build$\|bower_components\|node_modules\|dist\|target' ,
    \ 	'file' : '\v\.(exe|dll|lib)$'
    \ }
nmap <c-R> :CtrlPBufTag<cr>

" NERDTREE
let NERDTreeHijackNetrw = 0

nmap <Leader>1 :NERDTreeToggle<CR>

" vim-airline
let g:airline_powerline_fonts = 1
let g:airline_theme='cool'
"eliminate delay changing from INSERT to NORMAL mode
if ! has('gui_running')
  set ttimeoutlen=10
  augroup FastEscape
    autocmd!
    au InsertEnter * set timeoutlen=0
    au InsertLeave * set timeoutlen=1000
  augroup END
endif

"------ auto-commands ------"
" Automatically source .vimrc on save
augroup autosourcing
    autocmd!
    autocmd BufWritePost .vimrc source %
augroup END

