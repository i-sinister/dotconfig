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
" CtrlP {{{
nnoremap <Leader>o :CtrlP<CR>
nnoremap <Leader>ob :CtrlPBuffer<CR>
nnoremap <Leader>om :CtrlPMRU<CR>
let g:ctrlp_map = '<Leader>o'
" Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
" ag is fast enough that CtrlP doesn't need to cache
let g:ctrlp_use_caching = 0
" display mru files in working directory only
let g:ctrlp_mruf_relative = 1
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/](\.(git|hg|svn))|(packages)$',
  \ 'file': '\v\.(exe|so|dll)$',
  \ }
" }}}
" Ag {{{
" highlight results
let g:ag_highlight=1
nnoremap <C-f> :Ag!<Space>
nnoremap <C-s> :AgFile!<Space>
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
let g:syntastic_auto_jump=1
let g:syntastic_stl_format = '[%E{Err: %fe #%e}%B{, }%W{Warn: %fw #%w}]'

let g:syntastic_html_checkers=['jslint']
let g:syntastic_mode_map = { 'mode': 'active',
	\ 'active_filetypes': ['html', 'js', 'less'] }
" }}}
" javascript-libraries {{{
let g:used_javascript_libs = 'angularjs,angularui,angularuirouter,jquery'
" }}}
" tern_for_vim {{{
let g:tern_map_keys = 1
let g:tern_show_argument_hints = 'on_move'
let g:tern_show_signature_in_pum = 1
" }}}
" vim-less {{{
autocmd BufNewFile,BufRead *.less set filetype=less
autocmd FileType less set omnifunc=csscomplete#CompleteCSS
" }}}
" neocomplete {{{
let g:neocomplete#enable_at_startup = 1
" }}}
" jedi-vim {{{
let python_highlight_builtins=1
let python_highlight_all=1
let g:jedi#auto_initialization = 0
let g:jedi#auto_vim_configuration = 0
let g:jedi#popup_select_first = 0
let g:jedi#show_call_signatures = "1"
let g:jedi#goto_command = ""
let g:jedi#goto_assignments_command = ""
let g:jedi#goto_definitions_command = ""
let g:jedi#documentation_command = ""
let g:jedi#usages_command = ""
let g:jedi#completions_command = "<C-Space>"
let g:jedi#rename_command = ""
" }}}
" vim:foldmethod=marker:foldlevel=0
