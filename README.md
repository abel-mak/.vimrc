# .vimrc
```
set ru<br>
call plug#begin('~/.vim/plugged')<br>
set colorcolumn=80<br>
sy on<br>
hi StatusLine ctermbg=Black ctermfg=Red<br>
set nocompatible<br>
" Initialisation de pathogen<br>
call pathogen#infect()<br>
call pathogen#helptags()<br>
filetype plugin indent on<br>
runtime! config/**/*.vim<br>
"++++this is for vim color<br>
"colorscheme xcodedark<br>
"colorscheme molokai<br>
colorscheme badwolf<br>
highlight Normal ctermbg=234<br>
"---<br>
hi Search ctermbg=Yellow ctermfg=Black<br>
nnoremap <C-j> <C-u><br>
nnoremap <C-k> <C-d><br>
Plug 'vim-scripts/OmniCppComplete'<br>
Plug 'dense-analysis/ale'<br>
Plug 'honza/vim-snippets'<br>
call plug#end()<br>
set number<br>
" ------auto fix ale<br>
let g:ale_fixers      = {<br>
    \ 'yaml': ['prettier'],<br>
    \}<br>
let g:ale_fix_on_save = 1<br>
" -------<br>
hi Comment ctermfg=Brown<br>
" set omnifunc=... for auto-complete<br>
"-----<br>
"set library for clang_complete<br>
let g:clang_library_path='/Library/Developer/CommandLineTools/usr/lib/libclang.dylib'<br>
set completeopt-=preview<br>
"shortcut for vim snippet<br>
let g:UltiSnipsExpandTrigger="<c-a>"<br>
"-------<br>
map te :tabedit<br>
map g5 gT<br>
```
