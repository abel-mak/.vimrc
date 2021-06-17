set ru
call plug#begin('~/.vim/plugged')
set colorcolumn=80
sy on
hi StatusLine ctermbg=Black ctermfg=Red
set nocompatible
" Initialisation de pathogen
call pathogen#infect()
call pathogen#helptags()
filetype plugin indent on
runtime! config/**/*.vim
"++++this is for vim color
"colorscheme xcodedark
"colorscheme molokai
colorscheme badwolf
highlight Normal ctermbg=234
"---
hi Search ctermbg=Yellow ctermfg=Black
nnoremap <C-j> <C-u>
nnoremap <C-k> <C-d>
Plug 'vim-scripts/OmniCppComplete'
Plug 'dense-analysis/ale'
Plug 'honza/vim-snippets'
call plug#end()
set number
" ------auto fix ale
let g:ale_fixers      = {
    \ 'yaml': ['prettier'],
    \}
let g:ale_fix_on_save = 1
" -------
hi Comment ctermfg=Brown
" set omnifunc=... for auto-complete
"-----
"set library for clang_complete
let g:clang_library_path='/Library/Developer/CommandLineTools/usr/lib/libclang.dylib'
set completeopt-=preview
"shortcut for vim snippet
let g:UltiSnipsExpandTrigger="<c-a>"
"-------
map te :tabedit
map g5 gT
