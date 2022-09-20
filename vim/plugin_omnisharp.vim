let g:OmniSharp_selector_ui = 'fzf'
let g:OmniSharp_selector_findusages = ''
let g:OmniSharp_server_stdio = 1
let g:OmniSharp_highlight_types = 2
let g:OmniSharp_highlighting = 2
let g:OmniSharp_lookup_metadata = 1
let g:OmniSharp_typeLookupInPreview = 1
let g:OmniSharp_want_snippet = 0
let g:omnicomplete_fetch_full_documentation = 1
let g:OmniSharp_diagnostic_showid = 1
let g:OmniSharp_diagnostic_exclude_paths = [
  \ '/tmp/',
  \ '.nuget/packages/',
  \ '/obj/Debug/',
  \ '\<AssemblyInfo\.cs\>'
  \]


augroup omnisharp_commands
  autocmd!
  "Set autocomplete function to OmniSharp (if not using YouCompleteMe completion plugin)
  if exists('OmniSharp*')
    autocmd FileType cs setlocal omnifunc=OmniSharp#Complete
    autocmd FileType cs nnoremap <buffer> <C-r><C-s> :wa!<CR>:OmniSharpRestartServer<CR>
    autocmd FileType cs nnoremap <buffer> <C-r><C-b> :wa!<CR>:OmniSharpBuildAsync<CR>
    autocmd FileType cs nnoremap <buffer> <C-r><C-t> :wa!<CR>:OmniSharpRunTest<CR>
    autocmd FileType cs nnoremap <buffer> <C-r><C-f> :wa!<CR>:OmniSharpRunTestsInFile<CR>
    autocmd FileType cs nnoremap <buffer> <C-r><C-a> :wa!<CR>:OmniSharpRunTests<CR>
    " Find all code errors/warnings for the current solution and populate the quickfix window
    autocmd FileType cs nnoremap <buffer> <C-r><C-c> :OmniSharpGlobalCodeCheck<CR>
    " cursor can be anywhere on the line containing an issue
    autocmd FileType cs nnoremap <buffer> <C-r><C-u> :OmniSharpFixUsings<CR>
    " Rename with dialog
    autocmd FileType cs nnoremap <buffer> <C-r><C-r> :OmniSharpRename<CR>
    "The following commands are contextual, based on the current cursor position.
    autocmd FileType cs nnoremap <buffer> <C-g><C-d> :OmniSharpGotoDefinition<CR>
    autocmd FileType cs nnoremap <buffer> <C-f><C-i> :OmniSharpFindImplementations<CR>
    autocmd FileType cs nnoremap <buffer> <C-f><C-s> :OmniSharpFindSymbol<CR>
    autocmd FileType cs nnoremap <buffer> <C-f><C-u> :OmniSharpFindUsages<CR>
    autocmd FileType cs nnoremap <buffer> <C-f><C-m> :OmniSharpFindMembers<CR>
    autocmd FileType cs nnoremap <buffer> <C-p><C-d> :OmniSharpPreviewDefinition<CR>
    autocmd FileType cs nnoremap <buffer> <C-p><C-i> :OmniSharpPreviewImplementation<CR>
    autocmd FileType cs nnoremap <buffer> <C-h><C-h> :OmniSharpSignatureHelp<CR>
    autocmd FileType cs nnoremap <buffer> <C-h><C-t> :OmniSharpTypeLookup<CR>
    autocmd FileType cs nnoremap <buffer> <C-h><C-d> :OmniSharpDocumentation<CR>
    " Add syntax highlighting for types and interfaces
    autocmd FileType cs nnoremap <buffer> <C-s><C-h> :OmniSharpHighlightTypes<CR>
    " Contextual code actions (requires CtrlP or unite.vim)
    autocmd FileType cs nnoremap <buffer> <Leader>. :OmniSharpGetCodeActions<CR>
    " Run code actions with text selected in visual mode to extract method
    autocmd FileType cs vnoremap <buffer> <Leader>. :call OmniSharp#GetCodeActions('visual')<CR>
    "navigate up by method/property/field
    autocmd FileType cs nnoremap <buffer> <C-k> :OmniSharpNavigateUp<CR>
    "navigate down by method/property/field
    autocmd FileType cs nnoremap <buffer> <C-j> :OmniSharpNavigateDown<CR>
    
    autocmd FileType cs inoremap <buffer> <C-h><C-h> <C-O>:OmniSharpSignatureHelp<CR>
    autocmd FileType cs inoremap <buffer> <C-h><C-t> <C-O>:OmniSharpTypeLookup<CR>
  endif
augroup END

" Rename without dialog - with cursor on the symbol to rename: `:Rename newname`
command! -nargs=1 Rename :call OmniSharp#RenameTo("<args>")
