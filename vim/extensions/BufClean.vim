" DoBufferClean
nnoremap dbc :BufClean<CR>
command! -nargs=* BufClean call CleanupHiddenBuffers()
function! CleanupHiddenBuffers()
  let visible = {}
  for t in range(1, tabpagenr('$'))
    for b in tabpagebuflist(t)
      let visible[b] = 1
    endfor
  endfor
  " close any buffer that are loaded and not visible
  let l:closed_count = 0
  for b in range(1, bufnr('$'))
    if bufloaded(b) && !has_key(visible, b)
      let l:closed_count += 1
      exe 'bw ' . b
    endif
  endfor
  echon "Deleted " . l:closed_count . " buffers"
endfun
