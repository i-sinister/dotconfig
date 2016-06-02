" hdevtools
au FileType haskell nnoremap <buffer> <F1> :HdevtoolsType<CR>
au FileType haskell nnoremap <buffer> <silent> <F2> :HdevtoolsClear<CR>
au FileType haskell nnoremap <buffer> <silent> <F3> :HdevtoolsInfo<CR>
" ghc-mod
map <silent> tu :call GHC_BrowseAll()<CR> " Reload
map <silent> tw :call GHC_ShowType(1)<CR> " Type Lookup
autocmd BufEnter *.hs set formatprg=pointfree
