"##########
" Borrowed a lot from https://github.com/eevee/rc/blob/master/.vimrc
" (almost all the whitespace)
"

"# whitespace
set autoindent				" keep indentation
set tabstop=4				" tabs are four wide
"## rustfmt forces spaces
" one tab = 4 spaces (auto)
" one tab = 4 spaces (key)
" never use hard tabs (;-;)
" only indent to multiples of shiftwidth
" DTRT when shiftwidth/softtabstop diverge
autocmd FileType rust setlocal sw=4 sts=4 expandtab shiftround smarttab

set fileformats=unix,dos	" unix linebraks in new files

"# wrapping
"## Color 80 and everything past 100: https://vi.stackexchange.com/a/375
let &colorcolumn="80,".join(range(100,999),",")
set linebreak				" linebrak on 'bondaries'
"//set textwidth=80			" wrap after 80col

"# user interface
syntax on					" syntax highlighy
set t_Co=256				" force 256colors
colorscheme tokyo-metro		" set colorscheme
set laststatus=2			" always show status bar
set number					" line numbers
set ruler					" show cursor pos always
set cursorline				" highlight current line

"# shorcuts
inoremap <F1> <C-o>:w<cr>
inoremap <C-w> <C-o>:w<cr>
"## Save as root: https://stackoverflow.com/a/7078429
cmap w!! w !sudo tee > /dev/null %
cmap rfmt %! rustfmt

"# Autobracket
inoremap { {}<Esc>i

