set ru
set colorcolumn=80
sy on
hi StatusLine ctermbg=Black ctermfg=Red
set nocompatible
colorscheme badwolf
set number
hi Comment ctermfg=Brown
call plug#begin('~/.vim/plugged')
" Initialisation de pathogen
call pathogen#infect()
call pathogen#helptags()
filetype plugin indent on
runtime! config/**/*.vim
"++++this is for vim color
"colorscheme xcodedark
"colorscheme molokai
highlight Normal ctermbg=234
"---
hi Search ctermbg=Yellow ctermfg=Black
nnoremap <C-j> <C-u>
nnoremap <C-k> <C-d>
Plug 'vim-scripts/OmniCppComplete'
Plug 'dense-analysis/ale'
Plug 'honza/vim-snippets'
Plug 'pangloss/vim-javascript'
Plug 'bfrg/vim-cpp-modern'
call plug#end()
let g:ale_fix_on_save = 1
" -------
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
"------
if isdirectory('/Library/Developer/CommandLineTools/usr/include/c++/v1/')
	set path+=/Library/Developer/CommandLineTools/usr/include/c++/v1/
endif
"----
"ale sign colors
"let g:ale_sign_column_always = 0
"let g:ale_sign_error = '✗'
"let g:ale_sign_info = '⚡'
"let g:ale_sign_offset = 1000000
"let g:ale_sign_style_error = '✗'
"let g:ale_sign_style_warning = '⚡'
"let g:ale_sign_warning = '⚡'
"let g:ale_statusline_format = ['✗ %d', '⚡ %d', '✔ OK']
highlight ALEErrorSign ctermfg=0 ctermbg=0
let g:ale_sign_error = '❌'
let g:ale_sign_warning = '⚠️'
"---
"BS_Allman (in configuration: Allman) Always break before braces.
"AlignConsecutiveAssignments align variable or macro assignments in columns?
"SortIncludes
let g:clang_format#style_options = {
            \ "UseTab" : "ForIndentation",
            \ "IndentWidth": 4,
			\ "TabWidth": 4,
			\ "BreakBeforeBraces": "Allman",
			\ "AccessModifierOffset": -4,
			\ "NamespaceIndentation" : "All",
			\ "AlignConsecutiveMacros": "true",
			\ "IndentPPDirectives": "AfterHash",
			\ "ColumnLimit": 80,
			\ "AlignConsecutiveAssignments": "true",
			\ "AllowShortIfStatementsOnASingleLine" : "Never",
			\ "PointerAlignment": "Right",
			\ "DerivePointerAlignment": "false",
			\ "Standard": "C++03",
			\ "AllowShortFunctionsOnASingleLine" : "None"}

autocmd BufWritePost *.cpp,*.c,*.js,*.h,*.hpp :ClangFormat
"autocmd BufWritePost *.ejs :ALEFix tidy
"autocmd InsertLeave *.cpp,*.c,*.js,*.h,*.hpp :ClangFormat
"autocmd FileType c,cpp,js,hpp,h  InsertLeave * :ClangFormat
" ------auto fix ale
let g:ale_fixers = {
			\ 'yaml': ['prettier'],
			\ 'typescipt': [],
			\ 'ruby': ['ruby']
			\}

let g:ale_linters = {
\   'typescript': [],
\	'ruby':['ruby']
\}

let g:ale_completion_enabled = 1

"persistent undo
let vimDir = '$HOME/goinfre'
if has('persistent_undo')
    let myUndoDir = expand(vimDir . '/undodir')
    " Create dirs
    call system('mkdir ' . myUndoDir)
    let &undodir = myUndoDir
    set undofile
endif
