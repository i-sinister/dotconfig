let s:save_cpo = &cpo
set cpo&vim

" shamelessly stealing from vim-qf
setlocal nowrap
setlocal norelativenumber
setlocal number
set nobuflisted

if exists("b:undo_ftplugin")
    let b:undo_ftplugin .= "| setl wrap< rnu< nu< bl<"
else
    let b:undo_ftplugin = "setl wrap< rnu< nu< bl<"
endif

let &cpo = s:save_cpo
