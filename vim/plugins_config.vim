" vim: se ff=unix
" vim-easymotion {{{
" Disable default mappings
let g:EasyMotion_do_mapping = 0
" Turn on case insensitive feature
let g:EasyMotion_smartcase = 1
nmap <Leader>wo <Plug>(easymotion-w)
nmap <Leader>s <Plug>(easymotion-s2)
" JK motions: Line motions
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)
map <Leader>h <Plug>(easymotion-linebackward)
map <Leader>l <Plug>(easymotion-lineforward)
" }}}
" fzf.vim {{{
" fzf provides Ag command 
function! s:build_quickfix_list(lines)
  call setqflist(map(copy(a:lines), '{ "filename": v:val }'))
  copen
  cc
endfunction

let g:fzf_action = {
  \ 'ctrl-q': function('s:build_quickfix_list'),
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit' }
" match colors with colorscheme
let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }

let g:fzf_command_prefix = 'F'
let $FZF_DEFAULT_OPTS = '--bind ctrl-a:select-all'

nnoremap <Leader>fw :FAg <C-R><C-W><CR>
nnoremap <Leader>f :FAg<CR>
nnoremap <Leader>of :FFiles<CR>
nnoremap <Leader>od :execute 'FFiles '.expand('%:p:h')<CR>
nnoremap <Leader>ob :FBuffers<CR>
nnoremap <Leader>ow :FWindows<CR>
nnoremap <Leader>oma :FMarks<CR>
nnoremap <Leader>ot :FTags<CR>
nnoremap <Leader>fl :FBLines<CR>
nnoremap <Leader>fal :FLines<CR>
nnoremap <Leader>fm :FMaps<CR>
nnoremap <Leader>fh :FHistory<CR>
" }}}
" NERDTree {{{
nnoremap <Leader>n :NERDTreeToggle<CR>
nnoremap <Leader>l :NERDTreeFind<CR>
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'
let g:NERDTreeWinPos = 'right'
let NERDTreeMinimalUI = 1
" }}}
" Ag {{{
" highlight results
let g:ag_highlight=1
let g:ag_working_path_mode="r"
nnoremap <Leader>faf :Ag!<Space>
nnoremap <Leader>fa :Ag!<Space><cword><CR>
" }}}
" rooter {{{
" for files that are not under the project change directory to files directory
" like similar to autochdir
let g:rooter_change_directory_for_non_project_files = 'current'
" change directory for current window only
let g:rooter_use_lcd = 1
" }}}
" airline {{{
set laststatus=2
" }}}
" Syntastic {{{
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_enable_signs=1
let g:syntastic_aggregate_errors = 1
" conflicts with autocomplete window when OmniSharp is used
" let g:syntastic_auto_jump=1
let g:syntastic_stl_format = '[%E{Err: %fe #%e}%B{, }%W{Warn: %fw #%w}]'
let g:syntastic_html_checkers=['jslint']
let g:syntastic_less_lessc_args = '--npm-import="prefix=~"'
" requires omnisharp
let g:syntastic_cs_checkers = ['code_checker']
let g:syntastic_javascript_checkers = ['eslint', 'jshint']
let g:syntastic_mode_map = { 'mode': 'active',
	\ 'active_filetypes': ['html', 'js', 'less'] }
" use eslintrc if corresponding file is found
autocmd FileType javascript let b:syntastic_checkers = findfile('.eslintrc', '.;') != '' ? ['eslint'] : ['jshint']
" }}}
" vim-javascript {{{
let g:javascript_plugin_jsdoc = 1
" }}}
" javascript-libraries-syntax {{{
let g:used_javascript_libs = 'angularjs,angularui,angularuirouter,jquery'
" }}}
" tern_for_vim {{{
let g:tern_map_keys = 1
let g:tern_request_timeout = 10
let g:tern_show_argument_hints = 'no'
let g:tern_show_signature_in_pum = 0
" }}}
" vim-less {{{
autocmd BufNewFile,BufRead *.less set filetype=less
autocmd FileType less set omnifunc=csscomplete#CompleteCSS
" }}}
" neocomplete {{{
let g:neocomplete#enable_at_startup = 1
" Use smartcase.
let g:neocomplete#enable_smart_case = 1
let g:neocomplete#enable_fuzzy_completion = 1
let g:neocomplete#enable_auto_select = 0
" Set minimum syntax keyword length.
let g:neocomplete#sources#syntax#min_keyword_length = 3
let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'
" Define keyword.
if !exists('g:neocomplete#keyword_patterns')
    let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns['default'] = '\h\w*'
" Plugin key-mappings.
inoremap <expr><C-g> neocomplete#undo_completion()
inoremap <expr><C-l> neocomplete#complete_common_string()
" accept suggestion
inoremap <expr><C-y> neocomplete#close_popup()
" reject suggestion
inoremap <expr><C-e> neocomplete#cancel_popup()
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
" Enable heavy omni completion.
if !exists('g:neocomplete#sources#omni#input_patterns')
  let g:neocomplete#sources#omni#input_patterns = {}
endif
let g:neocomplete#sources#omni#input_patterns.cs = '.*[^=\);]'
" }}}
" neosnippet {{{
let g:neosnippet#enable_snipmate_compatibility=1
let g:neosnippet#snippets_directory='~/.config/vim/snippets/'
" Plugin key-mappings.
" Note: It must be "imap" and "smap".  It uses <Plug> mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)
imap <C-k><C-k> NeoSnippetClearMarkers

" SuperTab like snippets' behavior.
" Note: It must be "imap" and "smap".  It uses <Plug> mappings.
imap <expr><TAB>
\ pumvisible() ? "\<C-n>" :
\ neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
smap <expr><TAB>
\ neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

" For conceal markers.
if has('conceal')
  set conceallevel=2 concealcursor=niv
endif
" }}}
" csharp {{{
source $VIM_CFG/plugin_omnisharp.vim
" }}}
" jedi-vim {{{
let python_highlight_builtins=1
let python_highlight_all=1
let g:jedi#auto_initialization = 1
let g:jedi#auto_vim_configuration = 0
let g:jedi#popup_on_dot = 1
let g:jedi#popup_select_first = 0
let g:jedi#show_call_signatures = "1"
let g:jedi#goto_command = "<LocalLeader>jg"
let g:jedi#goto_assignments_command = "<LocalLeader>ja"
let g:jedi#goto_definitions_command = "<LocalLeader>jd"
let g:jedi#documentation_command = "<LocalLeader>jh"
let g:jedi#usages_command = "<LocalLeader>ju"
let g:jedi#completions_command = "<C-Space>"
let g:jedi#rename_command = "<LocalLeader>jr"
" }}}
" vim-racer {{{
" au FileType rust nmap gd <Plug>(rust-def)
" au FileType rust nmap gs <Plug>(rust-def-split)
" au FileType rust nmap gx <Plug>(rust-def-vertical)
" au FileType rust nmap <leader>gd <Plug>(rust-doc)
" }}}
" fugitive {{{
autocmd BufReadPost fugitive://* set bufhidden=delete
" not really related bu fugitive, but git: start git view
nnoremap <Leader>gvk :silent! !git view&<CR>
" }}}
" tagbar {{{
let g:tagbar_ctags_bin = '/usr/bin/ctags-universal'
let g:tagbar_type_yaml = {
    \ 'ctagstype' : 'openapi',
    \ 'kinds'     : [
        \ 'o:operations:0:0',
        \ 's:schemas:0:0',
        \ 'r:responses:0:0',
        \ 'p:parameters:0:0',
        \ 'b:request bodies:0:0',
        \ 'h:headers:0:0',
        \ 'l:links:0:0',
        \ 'e:examples:0:0',
        \ 'c:callback:s:0:0',
        \ 'y:sschemas:0:0'
    \ ],
    \ 'sro'        : '>',
    \ 'kind2scope' : { },
    \ 'scope2kind' : { }
\ }
" }}}



























" vim:foldmethod=marker:foldlevel=0
