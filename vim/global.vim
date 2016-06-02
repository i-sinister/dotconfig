" vim: se ff=unix
" Color scheme {{{
set t_Co=256
set background=dark
" }}}
" General {{{
set nocompatible
set ttyfast
set noeol
set noshellslash
set encoding=utf-8
" disable empty new line at the end of text files
set fileformats+=dos
set visualbell
" always keep x rows above/below cursor
set scrolloff=3
" enable backspace to erase newlines, previously entered characters
set backspace=indent,eol,start
" ui elements
set number
set relativenumber
set showcmd
set showmode
set cursorline
set ruler
" always display status line
set laststatus=2
set list
" requires Lucida Console font
set listchars=tab:→\ ,space:·,trail:°,extends:…,precedes:…,eol:¬
" }}}
" Layout {{{
set wildmenu
set wildmode=longest:full
set wildchar=<Tab>
set wildcharm=<C-Z>
" don't autoselect first item in omnicomplete, show if only
" one item (for preview); remove preview if you don't want
" to see any documentation whatsoever.
set completeopt=longest,menuone,preview
" Move the preview window (code documentation) to the bottom of the
" screen, so it doesn't move the code!
set splitbelow
" Remove 'Press Enter to continue' message when type information is longer than one line.
set cmdheight=2
" }}}
" filetype {{{
filetype indent on
filetype plugin on
syntax enable
" }}}
" Spaces & Tabs {{{
set tabstop=4
set softtabstop=4
set shiftwidth=4
set smarttab
set autoindent
" }}}
" Longlines handing {{{
set wrap
set textwidth=79
set formatoptions=qrn1
set colorcolumn=85
" }}}
" ModeLine {{{
set modeline
set modelines=1
" }}}
" Mouse {{{
set mouse=a
" }}}
" Backup {{{
set backup
" backup directory
if !isdirectory(expand($VIM_VAR.'/backup'))
  call mkdir(expand($VIM_VAR.'/backup'), "p")
endif
set backupdir=$VIM_VAR/backup//
" Double slash does not actually work for backupdir, here's a fix
"au BufWritePre * let &backupext='@'.substitute(substitute(substitute(expand('%:p:h'), '/', '%', 'g'), '\', '%', 'g'), ':', '', 'g')
" swap directory
if !isdirectory(expand($VIM_VAR.'/swap'))
  call mkdir(expand($VIM_VAR.'/swap'), "p")
endif
set directory=$VIM_VAR/swap//
" undo directory
" see :help persistent-undo
if !isdirectory(expand($VIM_VAR.'/undo'))
  call mkdir(expand($VIM_VAR.'/undo'), "p")
endif
set undodir=$VIM_VAR/undo//
set undofile
" }}}
" Folding {{{
set foldmethod=indent
set foldnestmax=10
set foldenable
set foldlevelstart=10
" }}}
" command mode {{{
" enter command mode without pressing shift
nnoremap ; :
" }}}
" Search {{{
" use ag for grepping
set grepprg=ag\ --nogroup\ --nocolor
set ignorecase
" highligh matching brackets
set showmatch
set smartcase
set incsearch
set hlsearch
" use common regex syntax for search, not vims one
nnoremap / /\v
vnoremap / /\v
" use <tab> to match brackets 
nnoremap <tab> %
vnoremap <tab> %
" semicolon is mapped to enter command mode
nnoremap : ;
" }}}
" Move shortcuts {{{
" quick exit insert mode
inoremap jj <Esc>
" disable arrows
nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>
" in insert mode arrows are used to select item from completeion list
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>
" move up/down by screen lines
nnoremap j gj
nnoremap k gk
" }}}
" Leader {{{
let mapleader = "\<Space>"
" leader mapping during initialization;
set timeoutlen=500
" }}}
" vimrc {{{
" edit vimrc
nmap <Leader>ev ;e $MYVIMRC<CR>
" reload vimrc
nmap <Leader>sv ;so $MYVIMRC<CR>
" }}}
" Editing shortcuts {{{
" break line at cursor
nnoremap K i<CR><Esc>
" insert empty line after current line
nnoremap <A-o> o<Esc>
" Y yank everything from the cursor to the end of the line.
" This makes Y act more like C or D because by default
noremap Y y$
" select test just pasted
nnoremap gV `[v`]
" Stay in visual mode when indenting
vnoremap < <gv
vnoremap > >gv
" Copy & paste to system clipboard
vmap <Leader>y "+y
vmap <Leader>d "+d
nmap <Leader>p "+p
nmap <Leader>P "+P
" }}}
" Buffer handling {{{
"Don't ask to save when changing buffers (i.e. when jumping to a type definition)
set hidden
set switchbuf=usetab
nnoremap b<CR> :b <C-Z>
nnoremap bs :buffers<CR>:buffer<Space>
nnoremap ]b :bnext<CR>
nnoremap [b :bprevious<CR>
"}}}
" splits {{{
set splitbelow
set splitright
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
" }}}
" Tabs {{{
nnoremap [t :tabprevious<CR>
nnoremap ]t :tabnext<CR>
nnoremap <silent> <A-Left> :execute 'silent! tabmove ' . (tabpagenr()-2)<CR>
nnoremap <silent> <A-Right> :execute 'silent! tabmove ' . tabpagenr()<CR>
" }}}
" QuickFix list {{{
nnoremap <C-c><C-n> :cnext<CR>
nnoremap <C-c><C-p> :cprevious<CR>
nnoremap <C-c>o :cope!<CR>
nnoremap <C-c>O :cope
nnoremap <C-c>c :ccl<CR>
" }}}
" Location list {{{
nnoremap <C-l><C-n> :lnext<CR>
nnoremap <C-l><C-p> :lprev<CR>
nnoremap <C-l>o :lop!<CR>
nnoremap <C-l>O :lop
nnoremap <C-l>c :lcl<CR>
" }}}
" File handling {{{
" use current edited files directory in command line
cabbr <expr> %% expand('%:p:h')
" fast save
nnoremap <Leader>w :w<CR>
" edit file in the current directory
nnoremap <Leader>e :e <C-R>=expand('%:p:h') . '/'<CR>
" put current file path to the current buffer
nnoremap <Leader>pp :put =expand('%:p')<CR>
" yank file path
nnoremap <Leader>yp :let @"=expand("%:p")<CR>
" yank directory path
nnoremap <Leader>yh :let @"=expand("%:p:h")<CR>
" yank file Name
nnoremap <Leader>yf :let @"=expand("%")<CR>
" cd to the currenty edited file
nnoremap <Leader>cd :cd %:p:h<CR>
" }}}
" vim:foldmethod=marker:foldlevel=0
