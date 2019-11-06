"##########
" Borrowed a lot from https://github.com/eevee/rc/blob/master/.vimrc
" (almost all the whitespace)
"

"# whitespace
set autoindent				" keep indentation
set tabstop=4				" tabs are four wide
set shiftwidth=4			" shift is four wide
source ~/.vim/better-whitespace.vim

"## rustfmt forces spaces (so does yaml)
" [sw]         one tab = N spaces (auto)
" [sts]        one tab = N spaces (key)
" [expandtab ] never use hard tabs
" [shiftround] only indent to multiples of shiftwidth
" [smarttab]   Do the right thing when shiftwidth/softtabstop diverge
autocmd FileType rust setlocal sw=4 sts=4 expandtab shiftround smarttab
autocmd FileType yaml setlocal sw=2 sts=2 expandtab shiftround smarttab
autocmd FileType gitcommit let &colorcolumn="50,72"
autocmd FileType markdown set spell spelllang=en_us
autocmd FileType markdown EnableWhitespace
autocmd FileType markdown highlight ExtraWhitespace ctermbg=240

set fileformats=unix,dos	" unix linebraks in new files

"# wrapping
"## Color 80 and everything past 100: https://vi.stackexchange.com/a/375
let &colorcolumn="80,".join(range(100,999),",")
set linebreak				" linebrak on 'bondaries'
"set textwidth=80			" wrap after 80col

"# user interface
syntax on					" syntax highlighy
set t_Co=256				" force 256colors
colorscheme tokyo-metro		" set colorscheme
set laststatus=2			" always show status bar
set number					" line numbers
set ruler					" show cursor pos always
set cursorline				" highlight current line

"# shorcuts
map <C-w> :w<cr>
imap <C-w> <C-o><C-w>

"## Tabs
map <C-x> :tabp<cr>
imap <C-x> <C-o><C-x>
map <C-c> :tabe<Space>
imap <C-c> <C-o><C-c>
map <C-v> :tabn<cr>
imap <C-v> <C-o><C-v>

"## Save as root: https://stackoverflow.com/a/7078429
cmap w!! w !sudo tee > /dev/null %
cmap x!! x !sudo tee > /dev/null %

"## rustfmt shortcut
cmap rfmt %! rustfmt

"# Autobracket
"inoremap { {}<Esc>i

