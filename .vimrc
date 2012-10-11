set nocompatible " Use vim settings, rather than Vi settings
set encoding=utf-8 " set utd-8 as the internal vim encoding
autocmd! bufwritepost .vimrc source % " reload .vimrc if it changes
filetype off

" Pathogen load
call pathogen#infect()
call pathogen#helptags()

filetype plugin on
filetype indent on

" enable omni-complete
autocmd FileType python set omnifunc=pythoncomplete#Complete
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags
autocmd FileType c set omnifunc=ccomplete#Complete
autocmd FileType cpp set omnifunc=omni#cpp#complete#Main
"in case there is a problem with cpp, replace with:
"au BufNewFile,BufRead,BufEnter *.cpp,*.hpp set omnifunc=omni#cpp#complete#Main


" enable syntax-based OmniComplete (on filetypes that do not
" already have omni complete registered functions)
autocmd Filetype *
            \   if &omnifunc == "" |
            \       setlocal omnifunc=syntaxcomplete#Complete |
            \   endif

syntax on

" Use unix as the standard file type
set fileformats=unix,dos

" General option
" ===============
let mapleader = "," " rebind <Leader> key
set wildmode=list:longest " make TAB behave like in a shell
set autoread " reload file when changes happen in other editors
set tags=./tags

set mouse=a
set bs=indent,eol,start " make backspace behave like normal again

set wildignore+=*.pyc
set wildignore+=*_build/*
set wildignore+=*/coverage/*


" Disable stupid backup and swap files - they trigger too many events
" for file system watchers
set nobackup
set nowritebackup
set noswapfile

" CTRL+T to open new tabs
map <C-T> :tabnew<cr>

" CTRL-Up/Down to move to the next/previous tab
nnoremap <C-Up> :tabprevious<CR>
inoremap <C-Up> <Esc>:tabprevious<CR>i
nnoremap <C-Down> :tabnext<CR>
inoremap <C-Down> <Esc>:tabnext<CR>i


" CTRL+X/C/V to cut/copy/paste (also shift-del, ctrl-insert, shift-insert)
vnoremap <C-X> "+x
vnoremap <S-Del> "+x
vnoremap <C-C> "+y
vnoremap <C-Insert> "+y
map <C-V> "+gP
map <S-Insert> "+gP
cmap <C-V> <C-R>+
cmap <S-Insert> <C-R>+
noremap <C-Q> <C-V> " Use CTRL-Q to do what CTRL-V used to do

" Pasting blockwise and linewise selections is not possible in Insert and
" Visual mode without the +virtualedit feature.  They are pasted as if they
" were characterwise instead.
" Uses the paste.vim autoload script.
exe 'inoremap <script> <C-V>' paste#paste_cmd['i']
exe 'vnoremap <script> <C-V>' paste#paste_cmd['v']
imap <S-Insert>       <C-V>
vmap <S-Insert>       <C-V>


" make yank copy to the global system clipboard
set clipboard=unnamed

" Improving code completion
set completeopt=longest,menuone,preview

" autocomplete parenthesis
inoremap {<CR> {<CR>}<Esc>O
inoremap (<CR> (<CR>)<Esc>O
inoremap [<CR> [<CR>]<Esc>O

" found here: http://stackoverflow.com/a/2170800/70778
function! OmniPopup(action)
    if pumvisible()
        if a:action == 'j'
            return "\<C-N>"
        elseif a:action == 'k'
            return "\<C-P>"
        endif
    endif
    return a:action
endfunction
inoremap <silent><C-j> <C-R>=OmniPopup('j')<CR>
inoremap <silent><C-k> <C-R>=OmniPopup('k')<CR>

" Quick save command
noremap <silent><leader>s :update<CR>
vnoremap <silent><leader>s <C>:update<CR>
inoremap <silent><leader>s <C-O>:update<CR>

" Quick quit command
noremap <leader>q :quit<CR>
vnoremap <silent><leader>q <C>:quit<CR>
inoremap <silent><leader>q <C-O>:quit<CR>

set history=700
set undolevels=700


set tabstop=4
set softtabstop=4
set shiftwidth=4
set shiftround
set expandtab " Use spaces instead of tabs
set smarttab " smarter tabs
" disable formatting when pasting large chunks of code
set pastetoggle=<F2>

set hlsearch " highlight search results
set incsearch " search as you type
set ignorecase " Ignore case when searching
set smartcase " Ignore ignorecase if the search contains uppercase characters

" spell-checking toggle with <leader>ss
map <leader>ss :setlocal spell!<cr>

" Disable highlight when <leader><cr> is pressed
map <silent> <leader><cr> :noh<cr>

set tw=79  " width of document (used by gd)
set fo-=t  " don't automatically wrap text when typing
set number " show line numbers
set so=4   " always show 4 lines at the edge when moving the cursor
set wildmenu " turn on wild menu

" center the cursor vertically
:nnoremap <Leader>zz :let &scrolloff=999-&scrolloff<CR>

" Switch CWD to the directory of the open buffer
map <leader>cd :cd %:p:h<cr>:pwd<cr>

" easier formatting of paragraphs
vmap Q gq
nmap Q gqap

set lazyredraw
set magic " for regular expressions
set showmatch " briefly jump to a matching bracket
set matchtime=2
" set foldcolumn=1

" No annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500

" Settings for python-mode
" =========================
map <Leader>g :call RopeGotoDefinition()<CR>
let ropevim_enable_shortcuts = 1
let g:pymode_rope_goto_def_newwin = "vnew"
let g:pymode_rope_extended_complete = 1
let g:pymode_breakpoint = 0
let g:pymode_syntax = 1
let g:pymode_syntax_builtin_objs = 0
let g:pymode_syntax_builtin_funcs = 0
map <Leader>b Oimport ipdb; ipdb.set_trace() # BREAKPOINT<C-c>


" Settings for vim-powerline
" ===========================
set laststatus=2
" let g:Powerline_symbols = 'fancy'
" Format the status line
"set statusline=\ %F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ Line:\ %l

" Settings for vim-markdown
" ==========================
set nofoldenable

" Settings for ctrlp
" ===================
let g:ctrlp_max_height = 30

" Movement
" =========
" bind Ctrl+<movement> keys to move around the windows, instead of using Ctrl+w + <movement>
noremap <silent> <c-j> <c-w>j
noremap <silent> <c-k> <c-w>k
noremap <silent> <c-l> <c-w>l
noremap <silent> <c-h> <c-w>h

" bind Ctrl+<right> / c+<left> for moving next and previous windows respectively
noremap <silent> <c-right> <c-w><c-w>
noremap <silent> <c-left> <c-w><s-w>

" bind Shift+special keys to resize windows
noremap <silent> + <c-w>+
noremap <silent> _ <c-w>-
noremap <silent> < <c-w><
noremap <silent> > <c-w>>

" shortcuts to move between tabs
map <Leader>n <esc>:tabprevious<CR>
map <Leader>m <esc>:tabnext<CR>

" shortcut to sort selected text
vnoremap <Leader>s :sort<CR>

" Custom mappings
" ================
vnoremap < <gv  " better indentation
vnoremap > >gv  " better indentation
map <Leader>a ggVG  " select all

" Fixing the copy & paste madness
" ================================
vmap <C-y> y:call system("xclip -i -selection clipboard", getreg("\""))<CR>:call system("xclip -i", getreg("\""))<CR>
nmap <C-v> :call setreg("\"",system("xclip -o -selection clipboard"))<CR>p
imap <C-v> <Esc><C-v>a

" Show trailing whitespace
" =========================
autocmd ColorScheme * highlight ExtraWhitespace ctermbg=red guibg=red
au InsertLeave * match ExtraWhitespace /\s\+$/

" remove all end-of-line whitespaces
map <Leader>w :%s/\s\+$//<cr>

" replace all tabs with spaced
map <leader><tab> :retab<cr>


" Color scheme
" =============
set t_Co=256
color wombat256mod

set colorcolumn=101
highlight ColorColumn ctermbg=235

" NERDTree Plugin
" ===============
let NERDTreeShowHidden=1
map <leader>nn :NERDTreeToggle<cr>
map <leader>nf :NERDTreeFind<cr>
map <silent> <F12> :NERDTreeToggle<cr>
map <silent> <S-F12> :NERDTreeFind<cr>
" starts nerdtree if no files specified when vim opened (disabled)
"autocmd vimenter * if !argc() | NERDTree | endif
" closes vim if the only buffer left is nerdtree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

" Git shortcuts
" =============
map <leader>gb :Git branch -v -a --color<cr>
map <leader>gf :Git fetch --all<cr>
map <leader>gs :Git status<cr>
map <leader>gl :Git log --graph --decorate --color --oneline --abbrev-commit --date-order<cr>
map <leader>gla :Git log --graph --decorate --color --oneline --abbrev-commit --date-order --all<cr>

