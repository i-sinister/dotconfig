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
let g:fzf_command_prefix = 'Fzf'
nnoremap <Leader>o :FzfFiles<CR>
nnoremap <Leader>od :FzfFiles getcwd()<CR>
nnoremap <Leader>ob :FzfBuffers<CR>
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
nnoremap <C-f> :Ag!<Space>
nnoremap <C-f>w :Ag!<Space><cword><CR>
nnoremap <C-s> :AgFile!<Space>
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
let g:syntastic_cs_checkers = ['syntax', 'semantic', 'issues']
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
" Set minimum syntax keyword length.
let g:neocomplete#sources#syntax#min_keyword_length = 3
let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'
" Define keyword.
if !exists('g:neocomplete#keyword_patterns')
    let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns['default'] = '\h\w*'
" Plugin key-mappings.
inoremap <expr><C-g>     neocomplete#undo_completion()
inoremap <expr><C-l>     neocomplete#complete_common_string()
" accept suggestion
inoremap <expr><C-y>  neocomplete#close_popup()
" reject suggestion
inoremap <expr><C-e>  neocomplete#cancel_popup()
" <TAB>: completion.
inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
" AutoComplPop like behavior.
"let g:neocomplete#enable_auto_select = 1
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
" vim:foldmethod=marker:foldlevel=0
