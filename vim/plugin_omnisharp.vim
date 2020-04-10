" Use ctrlp.vim
let g:OmniSharp_selector_ui = 'fzf'
let g:OmniSharp_server_stdio = 1
let g:OmniSharp_highlight_types = 3
let g:OmniSharp_loopup_metadata = 1
let g:OmniSharp_typeLookupInPreview = 1
let g:omnicomplete_fetch_full_documentation = 1



augroup omnisharp_commands
	autocmd!
	"Set autocomplete function to OmniSharp (if not using YouCompleteMe completion plugin)
	autocmd FileType cs setlocal omnifunc=OmniSharp#Complete
	autocmd FileType cs nnoremap <C-b> :wa!<cr>:OmniSharpBuildAsync<cr>
	"show type information automatically when the cursor stops moving
	autocmd CursorHold *.cs call OmniSharp#TypeLookupWithDocumentation()
	"The following commands are contextual, based on the current cursor position.
	autocmd FileType cs nnoremap gd :OmniSharpGotoDefinition<cr>
	autocmd FileType cs nnoremap <C-g><C-i> :OmniSharpFindImplementations<cr>
	autocmd FileType cs nnoremap <C-g><C-t> :OmniSharpFindType<cr>
	autocmd FileType cs nnoremap <C-g><C-s> :OmniSharpFindSymbol<cr>
	autocmd FileType cs nnoremap <C-g><C-u> :OmniSharpFindUsages<cr>
	" finds members in the current buffer
	autocmd FileType cs nnoremap <leader>fm :OmniSharpFindMembers<cr>
	" cursor can be anywhere on the line containing an issue
	autocmd FileType cs nnoremap <buffer> <Leader>fx :OmniSharpFixUsings<CR>
	autocmd FileType cs nnoremap <buffer> <Leader>tt :OmniSharpTypeLookup<CR>
	autocmd FileType cs nnoremap <buffer> <Leader>dc :OmniSharpDocumentation<CR>
	autocmd FileType cs nnoremap <buffer> <C-\> :OmniSharpSignatureHelp<CR>
	autocmd FileType cs inoremap <buffer> <C-\> <C-o>:OmniSharpSignatureHelp<CR>
	"navigate up by method/property/field
	autocmd FileType cs nnoremap <C-K> :OmniSharpNavigateUp<cr>
	"navigate down by method/property/field
	autocmd FileType cs nnoremap <C-J> :OmniSharpNavigateDown<cr>
	" Find all code errors/warnings for the current solution and populate the quickfix window
	autocmd FileType cs nnoremap <buffer> <Leader>cc :OmniSharpGlobalCodeCheck<CR>
augroup END
" Contextual code actions (requires CtrlP or unite.vim)
nnoremap <C-.> :OmniSharpGetCodeActions<cr>
" Run code actions with text selected in visual mode to extract method
vnoremap <C-.>ca :call OmniSharp#GetCodeActions('visual')<cr>
" Rename with dialog
nnoremap <C-r><C-r> :OmniSharpRename<CR>
" Rename without dialog - with cursor on the symbol to rename: `:Rename newname`
command! -nargs=1 Rename :call OmniSharp#RenameTo("<args>")
" Add syntax highlighting for types and interfaces
nnoremap <leader>th :OmniSharpHighlightTypes<cr>
