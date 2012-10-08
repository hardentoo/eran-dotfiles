set nocompatible " Use vim settings, rather than Vi settings
set encoding=utf-8 " set utd-8 as the internal vim encoding
autocmd! bufwritepost .vimrc source % " reload .vimrc if it changes
call pathogen#infect()

filetype off
filetype plugin on
filetype indent on

" Use unix as the standard file type
set fileformats=unix,dos

syntax on

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

" CTRL+T/CTRL+W to open/close new tabs
map <C-T> :tabnew<cr>
map <C-W> :tabclose<cr>

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

" Pasting blockwise and linewise selections is not possible in Insert and
" Visual mode without the +virtualedit feature.  They are pasted as if they
" were characterwise instead.
" Uses the paste.vim autoload script.
exe 'inoremap <script> <C-V>' paste#paste_cmd['i']
exe 'vnoremap <script> <C-V>' paste#paste_cmd['v']
imap <S-Insert>       <C-V>
vmap <S-Insert>       <C-V>

" Use CTRL-Q to do what CTRL-V used to do
noremap <C-Q>     <C-V>

" make yank copy to the global system clipboard
set clipboard=unnamed

" Improving code completion
set completeopt=longest,menuone

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

" Quicksave command
noremap <C-s> :update<CR>
vnoremap <C-s> <C-C>:update<CR>
inoremap <C-s> <C-O>:update<CR>


" Quick quit command
noremap <Leader>e :quit<CR>


" Bind nohl
noremap <C-n> :nohl<CR>
vnoremap <C-n> :nohl<CR>
inoremap <C-n> :nohl<CR>


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

" Map <Space> to / (search) and Ctrl-<Space> to ? (backwards search)
map <space> /
map <c-space> ?

" Disable highlight when <leader><cr> is pressed
map <silent> <leader><cr> :noh<cr>

set nowrap " don't automatically wrap on load
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
map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-l> <c-w>l
map <c-h> <c-w>h

map <Leader>n <esc>:tabprevious<CR>
map <Leader>m <esc>:tabnext<CR>
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
map <Leader>w :%s/\s\+$//

" Color scheme
" =============
set t_Co=256
color wombat256mod

set colorcolumn=80
highlight ColorColumn ctermbg=233

" NERDTree Plugin
" ===============
map <leader>nn :NERDTreeToggle<cr>
map <leader>nf :NERDTreeFind<cr>
