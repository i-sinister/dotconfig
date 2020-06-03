" 'listchars' are highlighted with 'NonText' and 'SpecialKey' highlight groups;
" with solarized 'SpecialKey' has brighter background which is extremly annoying;
" autocmd is necessary because solarized listens to BackgtounChange events and
" currect colorscheme
"augroup SpecialKeyBgReset
	"autocmd!
	"autocmd ColorScheme * :highlight SpecialKey ctermbg=NONE guibg=NONE
"augroup END

" colorscheme installed as a plugin so it was to be
" enabled after plugins are loaded
colorscheme gruvbox
