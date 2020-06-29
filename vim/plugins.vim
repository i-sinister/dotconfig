" vim: se ff=unix
" color schemes {{{
Plug 'sjl/badwolf'
Plug 'altercation/vim-colors-solarized'
Plug 'nightsense/wonka'
Plug 'vim-scripts/tomatosoup.vim'
Plug 'wmvanvliet/vim-blackboard'
Plug 'benburrill/potato-colors'
Plug 'KKPMW/distilled-vim'
Plug 'Addisonbean/Vim-Xcode-Theme'
Plug 'morhetz/gruvbox'
" }}}
" 'ag' searching integration
Plug 'rking/ag.vim'
" fuzzy file open
" fzf is installed and managed externally
Plug 'junegunn/fzf', { 'dir': '~/bin/fzf' }
Plug 'junegunn/fzf.vim'
" register popup
Plug 'junegunn/vim-peekaboo'
" file drawer
Plug 'scrooloose/nerdtree'
" status line {{{
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
" }}}
Plug 'mhinz/vim-startify'
" auto chdir to the projects root
Plug 'airblade/vim-rooter'
" source control {{{
Plug 'ludovicchabant/vim-lawrencium'
Plug 'tpope/vim-fugitive'
Plug 'sodapopcan/vim-twiggy'
Plug 'junegunn/gv.vim'
Plug 'airblade/vim-gitgutter'
" }}}
"async external commands with output in vim
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-obsession'
" fast movement
Plug 'easymotion/vim-easymotion'
" syntax checking on save
Plug 'scrooloose/syntastic'
" popup completion menu
Plug 'Shougo/neocomplete.vim'
" sql formatter
Plug 'vim-scripts/SQLUtilities'
Plug 'vim-scripts/Align'
Plug 'tpope/vim-unimpaired'
" text editing {{{
" commenting
Plug 'scrooloose/nerdcommenter'
" automatic closing of quotes, parenthesis, brackets, etc.
Plug 'Raimondi/delimitMate'
" plugin for visually displaying indent levels
Plug 'nathanaelkane/vim-indent-guides'
" end certain structures automatically, e.g. begin/end etc.
Plug 'tpope/vim-endwise'
" quotes/tag/brackets handling
Plug 'tpope/vim-surround'
" text object based on indent level (ai, ii)
Plug 'austintaylor/vim-indentobject'
" indentation autodetection
Plug 'tpope/vim-sleuth'
" advanced repeat command
Plug 'tpope/vim-repeat'
" wiki formatting
Plug 'vimwiki/vimwiki'
" code snippets
Plug 'Shougo/neosnippet.vim'
Plug 'Shougo/neosnippet-snippets'
" editor config
Plug 'editorconfig/editorconfig-vim'
Plug 'majutsushi/tagbar'
" }}}
" json {{{
Plug 'tpope/vim-jdaddy'
" }}}
" html {{{
" hi-speed html coding
Plug 'mattn/emmet-vim'
" }}}
" javascript {{{
" improved Javascript indentation and syntax support in Vim
Plug 'pangloss/vim-javascript', {'for': 'javascript'}
" syntax highlight
Plug 'jelera/vim-javascript-syntax', {'for': 'javascript'}
" Syntax for JavaScript libraries, including Angular
Plug 'othree/javascript-libraries-syntax.vim', {'for': 'javascript'}
" javascript autocompletion
Plug 'ternjs/tern_for_vim', {'for': 'javascript', 'do': 'npm install'}
" es6 snippets; needs snippet engine
Plug 'isRuslan/vim-es6', {'for': 'javascript'}
" }}}
" css {{{
Plug 'JulesWang/css.vim'
Plug 'genoma/vim-less'
"}}}
" c-sharp {{{
Plug 'OmniSharp/omnisharp-vim'
" }}}
" python {{{
Plug 'davidhalter/jedi-vim'
" }}}
" rust {{{
Plug 'rust-lang/rust.vim'
Plug 'racer-rust/vim-racer'
" }}}
" avro {{{
Plug 'gurpreetatwal/vim-avro'
" }}}
" misc {{{
Plug 'i-sinister/vim-todo'
" }}}
Plug 'ryanoasis/vim-devicons'
Plug 'DanilaMihailov/vim-tips-wiki'
Plug 'bfrg/vim-jqplay'
Plug 'bfrg/vim-jq'
" vim:foldmethod=marker:foldlevel=0
