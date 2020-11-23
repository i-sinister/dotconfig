" Vim compiler file
" Compiler:	dotnet
" Maintainer:	Aleksandr Nekrasov
" Last Change:	2020 Apr 14

if exists("current_compiler")
  finish
endif
let current_compiler = "dotnet"
let s:keepcpo= &cpo
set cpo&vim

if exists(":CompilerSet") != 2
  " older Vim always used :setlocal
  command -nargs=* CompilerSet setlocal <args>
endif

" pipes are doing following:
" - dotnet build prints messages twice, so "sort -u" removes duplicates
CompilerSet makeprg=dotnet\ build\ --nologo\ --verbosity\ quiet\ -p:GenerateFullPaths=true\ \\\|&\ sort\ -u
CompilerSet errorformat=%f(%l\\\,%c):\ %t%.%#\ CS%n:\ %m
CompilerSet errorformat+=%f(%l\\\,%c):\ %t%.%#\ SA%n:\ %m
CompilerSet errorformat+=%f(%l\\\,%c):\ %t%.%#\ IDE%n:\ %m
CompilerSet errorformat+=%f(%l\\\,%c):\ %t%.%#\ CA%n:\ %m
CompilerSet errorformat+=%-G\\s%#,%-G%.%#


let &cpo = s:keepcpo
unlet s:keepcpo
