" Use vim settings, rather than Vi settings
set nocompatible

" set utd-8 as the internal vim encoding
set encoding=utf-8

" Use unix as the standard file type
set fileformats=unix,dos

" Disable stupid backup and swap files - they trigger too many events
" for file system watchers
set nobackup
set nowritebackup
set noswapfile

" use indentation from the previous line
set autoindent

" configure tab handling (spaces instead of tabs, etc.)
set tabstop=4
set softtabstop=4
set shiftwidth=4
set shiftround
set expandtab " Use spaces instead of tabs
set smarttab " smarter tabs

" maximum width of inserted text
" set textwidth = 120 " 80 is too small for modern displays

" highlight group for wrong whitespace, must appear before the colorscheme
autocmd ColorScheme * highlight BadWhitespace ctermbg=red guibg=red

" color scheme
set t_Co=256
color wombat256mod
syntax on

" color column margin
set colorcolumn=101
highlight ColorColumn ctermbg=235

" show line numbers
set number

" intelligent c-style comments
set comments=sl:/*,mb:\ *,elx:\ */

" pathogen load
call pathogen#infect()
call pathogen#helptags()

" enable filetype detection features
filetype plugin indent on

" No annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500

" history/undo settings
set history=1000
set undolevels=1000

" general settings
let mapleader="," " set <leader> to ,
set wildmenu " turn on wild menu
set wildmode=longest:full " TAB acts nicely (auto-complete and show the wildmenu)
set autoread " reload file when changes happen in other editors
set mouse=a " enable mouse support
set bs=indent,eol,start " make backspace behave like normal again
set lazyredraw " do not refresh screen while executing macros
set scrolloff=4 " always show 4 lines at the edge when moving the cursor
set magic " for regular expressions
set clipboard=unnamed " make yank copy to the global system clipboard (works?)
set completeopt=longest,menuone,preview " Improving code completion
set splitbelow " split windows at the bottom (e.g, help and omnicomplete preview windows)

" tags
set tags+=./tags
set tags+=$HOME/.vim/tags/**
set tags+=$HOME/.vim/tags/python27.ctags

" search settings
set hlsearch " highlight search results
set incsearch " search as you type
set ignorecase " ignore case when searching
set smartcase " ignore ignorecase if the search contains uppercase characters

" auto-format settings
set formatoptions-=t " don't automatically wrap text when typing
set formatoptions+=j " when joining lines, smartly join their comments leader

" highlight bad whitespace matching rules (when leaving insert mode)
autocmd InsertLeave * match BadWhitespace /\t\|\s\+$/

" enable omni-complete
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags
" enable omni-complete on filetypes without omni complete registered functions
autocmd Filetype *
            \   if &omnifunc == "" |
            \       setlocal omnifunc=syntaxcomplete#Complete |
            \   endif
" c/cpp/python will be handled by better complete functions
"autocmd FileType python set omnifunc=pythoncomplete#Complete
"autocmd FileType c set omnifunc=ccomplete#Complete
"autocmd FileType cpp set omnifunc=omni#cpp#complete#Main
"in case there is a problem with cpp, replace with:
"au BufNewFile,BufRead,BufEnter *.cpp,*.hpp set omnifunc=omni#cpp#complete#Main

" Mappings - tabs/windows handling
" ================================
" CTRL+T to open new tabs
noremap <C-T> :tabnew<cr>
" Move between tabs
noremap <silent> <Leader>n <Esc>:tabprevious<CR>
noremap <silent> <Leader>m <Esc>:tabnext<CR>
noremap <silent> <C-Up> <Esc>:tabprevious<CR>
noremap <silent> <C-Down> <Esc>:tabnext<CR>
" Move between windows
noremap <silent> <c-j> <c-w>j
noremap <silent> <c-k> <c-w>k
noremap <silent> <c-l> <c-w>l
noremap <silent> <c-h> <c-w>h
noremap <silent> <c-right> <c-w><c-w>
noremap <silent> <c-left> <c-w><s-w>
" Resize windows
noremap <silent> + <c-w>+
noremap <silent> _ <c-w>-
noremap <silent> < <c-w><
noremap <silent> > <c-w>>

" Mappings - various shortcuts
" ============================
" Quick save
noremap <silent> <leader>s <Esc>:update<CR>
" Quick quit
noremap <silent> <leader>q <Esc>:quit<CR>
" Spell-checking toggle
map <leader>ss :setlocal spell!<cr>
" Disable highlight with <leader><cr>
map <silent> <leader><cr> :noh<cr>
" CWD to the directory of the open buffer
map <leader>cd :cd %:p:h<cr>:pwd<cr>
" Indentation of selected text
vnoremap < <gv
vnoremap > >gv
" Select all
map <leader>a ggVG
" remove all end-of-line whitespaces
map <leader>w :%s/\s\+$//<cr>
" replace all tabs with spaces
map <leader><tab> :retab<cr>
" Git shortcuts (assuming available git aliases)
map <leader>gf :Git fetch --all<cr>
map <leader>gb :Git b<cr>
map <leader>gs :Git s<cr>
map <leader>gl :Git l<cr>
map <leader>gla :Git la<cr>
map <leader>gd :Gdiff<cr>


" Extra Features
" ==============

" Autocomplete parenthesis
inoremap {<CR> {<CR>}<Esc>O
inoremap (<CR> (<CR>)<Esc>O
inoremap [<CR> [<CR>]<Esc>O


" Workarounds
" ===========

" Can also use CTRL+j/k to move inside omnicomplete
function! OmniPopup(action)
    if pumvisible()
        if a:action == 'j'
            return "\<C-N>"
        elseif a:action == 'k'
            return "\<C-P>"
        endif
    endi    f
    return a:action
endfunction
inoremap <silent><C-j> <C-R>=OmniPopup('j')<CR>
inoremap <silent><C-k> <C-R>=OmniPopup('k')<CR>

" Automatically close the preview window of omnicomplete
autocmd CursorMovedI * if pumvisible() == 0|pclose|endif
autocmd InsertLeave * if pumvisible() == 0|pclose|endif


" Plugins Settings
" ================

" python-mode
" ===========
let g:pymode_rope = 1 " enable rope
let g:pymode_folding = 1 " automatic folding
let g:pymode_syntax_all = 1 " highlight all
let g:pymode_lint_onfly = 1 " on-the-fly code checking
map <Leader>g :call RopeGotoDefinition()<CR>
" Replace pdb with ipdb (i.e, for IPython)
"let g:pymode_breakpoint = 0
"map <Leader>b Oimport ipdb; ipdb.set_trace() # BREAKPOINT<C-c>

" vim-powerline
" =============
set laststatus=2 " always show the statusline

" ctrlp
" =====
let g:ctrlp_max_height = 30
let g:ctrlp_show_hidden = 1 " also look for hidden files

" NERDTree
" ========
let NERDTreeShowHidden=1 " show hidden files by default
map <leader>nn :NERDTreeToggle<cr>
map <leader>nf :NERDTreeFind<cr>
map <silent> <F12> :NERDTreeToggle<cr>
map <silent> <S-F12> :NERDTreeFind<cr>
" closes vim if the only buffer left is nerdtree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
" starts nerdtree if no files specified when vim opened (disabled)
"autocmd vimenter * if !argc() | NERDTree | endif








" ======================================================================
" below: stuff that need to be arranged/checked

" Windows like copy/paste shortcuts (CTRL+X/C/V, etc.) - disabled
"vnoremap <C-X> "+x
"vnoremap <S-Del> "+x
"vnoremap <C-C> "+y
"vnoremap <C-Insert> "+y
"map <C-V> "+gP
"map <S-Insert> "+gP
"cmap <C-V> <C-R>+
"cmap <S-Insert> <C-R>+
"noremap <C-Q> <C-V> " Use CTRL-Q to do what CTRL-V used to do

" wildignore these:
set wildignore+=*.pyc
set wildignore+=*_build/*
set wildignore+=*/coverage/*

" disable formatting when pasting large chunks of code
set pastetoggle=<F2>

" easier formatting of paragraphs
vmap Q gq
nmap Q gqap




" Fixing the copy & paste madness
" ================================
vmap <C-y> y:call system("xclip -i -selection clipboard", getreg("\""))<CR>:call system("xclip -i", getreg("\""))<CR>
nmap <C-v> :call setreg("\"",system("xclip -o -selection clipboard"))<CR>p
imap <C-v> <Esc><C-v>a




" reload .vimrc when it changed
" because the settings are not reset, I prefer to disable it until I find a better approach
"autocmd! bufwritepost .vimrc source %
