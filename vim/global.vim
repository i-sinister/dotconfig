" vim: se ff=unix
" Color scheme {{{
set background=dark
" }}}
" General {{{
set nocompatible
set ttyfast
set noeol
set noshellslash
set encoding=UTF-8
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
set signcolumn=auto
set showcmd
set showmode
set cursorline
set ruler
" always display status line
set laststatus=2
set list
" requires Lucida Console font
set listchars=tab:→\ ,space:·,trail:°,extends:…,precedes:…,eol:¬
" update terminal title
autocmd BufEnter * let &titlestring = expand("%:t")
" restore original title
autocmd VimLeave * set notitle
" }}}
" Command mode {{{
" enter command mode without pressing shift
nnoremap ; :
" Remove 'Press Enter to continue' message when type information is longer than one line.
set cmdheight=2
" enable wildmenu
set wildmenu
set wildmode=list:longest,list:full
set wildchar=<C-X>
set wildcharm=<C-X>
" }}}
" Autocompletion {{{
set completeopt=menuone,preview,noinsert,noselect
set shortmess+=c
" <TAB>: completion.
inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<S-TAB>"
" }}}
" Filetype {{{
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
set colorcolumn=80
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
" Search {{{
" use ag for grepping
set grepprg=ag\ --nogroup\ --nocolor\ --path-to-ignore\ ~/.ignore
set ignorecase
" highligh matching brackets
set showmatch
set smartcase
set incsearch
set hlsearch
" use common regex syntax for search, not vims one
nnoremap / /\v
vnoremap / /\v
" }}}
" Movement {{{
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
let maplocalleader = "\<Space>"
" leader mapping during initialization;
set timeoutlen=500
" }}}
" Search commands {{{
" search word under cursor in the current buffer
nnoremap <Leader>fv :vimgrep /<C-r><C-w>/j<Space>%<CR>
" search word under cursor in
nnoremap <Leader>fvf :vimgrep /<C-r><C-w>/j
" search word under cursor in the current buffer using grep
nnoremap <Leader>fg :grep <C-r><C-w><Space>%<CR>
" search word under cursor in using grep
nnoremap <Leader>fgf :grep <C-r><C-w>
" replace word under cursor
noremap <Leader>r :%s/<C-r><C-w>//g<Left><Left>
" }}}
" vimrc {{{
" edit vimrc
nmap <Leader>ev ;e $MYVIMRC<CR>
" reload vimrc
nmap <Leader>sv ;so $MYVIMRC<CR>
" }}}
" Text editing {{{
" break line at cursor
nnoremap K i<CR><Esc>
" insert empty line after current line
nnoremap <A-o> o<Esc>
" Y yank everything from the cursor to the end of the line.
" This makes Y act more like C or D because by default
noremap Y y$
" select text just pasted
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
" Command mode mappings {{{
" start of line
cnoremap <C-A>  <Home>
" back one character
cnoremap <C-B>  <Left>
" delete character under cursor
cnoremap <C-D>  <Del>
" end of line
cnoremap <C-E>  <End>
" forward one character
cnoremap <C-F>  <Right>
" recall newer command-line
cnoremap <C-N>  <Down>
" recall previous (older) command-line
cnoremap <C-P>  <Up>
" back one word
cnoremap <Esc><C-B> <S-Left>
" forward one word
cnoremap <Esc><C-F> <S-Right>
" }}}
" Buffer handling {{{
"Don't ask to save when changing buffers (i.e. when jumping to a type definition)
set hidden
set switchbuf=usetab
"}}}
" Splits {{{
" Move the preview window (code documentation) to the bottom of the
" screen, so it doesn't move the code!
set splitbelow
set splitright
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
" }}}
" Tabs {{{
nnoremap <silent> <A-Left> :execute 'silent! tabmove ' . (tabpagenr()-2)<CR>
nnoremap <silent> <A-Right> :execute 'silent! tabmove ' . tabpagenr()<CR>
" }}}
" QuickFix list {{{
nnoremap <C-c>o :cope<CR>
nnoremap <C-c>c :ccl<CR>
nnoremap <C-c>f :QFilterFiles 
nnoremap <C-c>e :QFilterErrors<CR>
nnoremap <C-c>w :QFilterWarnings<CR>
function! s:QuickfixListFilterFiles(bang, pattern)
  let cmp = a:bang ? '!~' : '=~'
  call setqflist(filter(getqflist(), "bufname(v:val['bufnr']) " . cmp . " a:pattern"))
endfunction
command! -bang -nargs=1 -complete=file QFilterFiles call s:QuickfixListFilterFiles(<bang>0, <q-args>)
command! QFilterErrors call setqflist(filter(getqflist(), "v:val['type'] =~ 'e'"))
command! QFilterWarnings call setqflist(filter(getqflist(), "v:val['type'] =~ 'w'"))
" open quickfix/locations after *grep commands
augroup auto_quickfix_location_open
    autocmd!
    autocmd QuickFixCmdPost [^l]* cwindow
    autocmd QuickFixCmdPost l*    lwindow
augroup END
" }}}
" Location list {{{
nnoremap <C-l>o :lop<CR>
nnoremap <C-l>c :lcl<CR>
nnoremap <C-l>f :LocationFilterFiles 
nnoremap <C-l>e :LocationFilterErrors<CR>
nnoremap <C-l>w :LocationFilterErrors<CR>
function! s:LocationFilterFiles(bang, pattern)
  let cmp = a:bang ? '!~' : '=~'
  call setloclist(0, filter(getloclist(0), "bufname(v:val['bufnr']) " . cmp . " a:pattern"))
endfunction
command! -bang -nargs=1 -complete=file LFilter call s:LocationFilterFiles(<bang>0, <q-args>)
command! LocationFilterErrors call setloclist(0, filter(getloclist(0), "v:val['type'] == 'E'"))
command! LocationFilterWarnings call setloclist(0, filter(getloclist(0), "v:val['type'] == 'W'"))
" }}}
" Preview window {{{
nnoremap <C-p>c :pclose<CR>
" }}}
" File handling {{{
" use current edited files directory in command line
cabbr <expr> %% expand('%:p:h')
" fast save
nnoremap <Leader>w :w<CR>
" put current file path to the current buffer
nnoremap <Leader>pp a<C-R>=expand('%:p')<CR><Esc>
nnoremap <Leader>pd a<C-R>=expand('%:p:h')<CR><Esc>
nnoremap <Leader>pr a<C-R>=expand('%')<CR><Esc>
nnoremap <Leader>pn a<C-R>=expand('%:t:r')<CR><Esc>
nnoremap <Leader>pf a<C-R>=expand('%:t')<CR><Esc>
" paste in insert mode
inoremap <C-P><C-P> <C-R>=expand('%:p')<CR>
inoremap <C-P><C-D> <C-R>=expand('%:h')<CR>
inoremap <C-P><C-R> <C-R>=expand('%')<CR><Esc>
inoremap <C-P><C-N> <C-R>=expand('%:t:r')<CR>
inoremap <C-P><C-F> <C-R>=expand('%:r')<CR>
" yank file path
nnoremap <Leader>yp :let @+=expand("%:p")<CR>
nnoremap <Leader>yd :let @+=expand("%:p:h")<CR>
nnoremap <Leader>yr :let @+=expand("%")<CR>
nnoremap <Leader>yn :let @+=expand('%:t:r')<CR>
nnoremap <Leader>yf :let @+=expand('%:t')<CR>
" cd to the currenty edited file
nnoremap <Leader>cd :cd %:p:h<CR>
" }}}
" vim:foldmethod=marker:foldlevel=0
