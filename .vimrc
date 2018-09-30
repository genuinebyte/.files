"##########
" Borrowoed a lot from https://github.com/eevee/rc/blob/master/.vimrc
"

" whitespace
set autoindent				" keep indentation
set tabstop=4				" tabs are four wide
set fileformats=unix,dos	" unix linebraks in new files

" wrapping
set colorcolumn=+1			" Highlight 81st col
set linebreak				" linebrak on 'bondaries'
set textwidth=80			" wrap after 80col

" user interface
syntax on					" syntax highlighy
set t_Co=256				" force 256colors
colorscheme tokyo-metro		" set colorscheme
set laststatus=2			" always show status bar
set number					" line numbers
set ruler					" show cursor pos always
set cursorline				" highlight current line

" shorcuts
inoremap <F1> <C-o>:w<cr>

" Autobracket
inoremap { {}<Esc>i

" Save as root: https://stackoverflow.com/a/7078429
cmap w!! w !sudo tee > /dev/null %
