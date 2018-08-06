""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Basic config
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set background=dark

syntax on
hi PreProc ctermfg=Yellow
hi LineNr ctermfg=darkgrey
hi Comment ctermfg=darkgrey
hi Pmenu ctermbg=gray guibg=gray

set tabstop=2 softtabstop=0 expandtab shiftwidth=2 smarttab
set hls
set nocompatible
filetype off

" number on
autocmd BufRead,BufNewFile *.cpp set number
autocmd BufRead,BufNewFile *.cc set number
autocmd BufRead,BufNewFile *.hpp set number
autocmd BufRead,BufNewFile *.c set number
autocmd BufRead,BufNewFile *.h set number
autocmd BufRead,BufNewFile *.cxx set number
autocmd BufRead,BufNewFile *.hxx set number
autocmd BufRead,BufNewFile *.sh set number
autocmd BufRead,BufNewFile *.yml set number
autocmd BufRead,BufNewFile *.json set number
autocmd BufRead,BufNewFile *.py set number
autocmd BufRead,BufNewFile CMakeLists.txt set number
autocmd BufRead,BufNewFile *.cmake set number
autocmd BufRead,BufNewFile .vimrc set number
autocmd BufRead,BufNewFile .zshrc set number

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugins config
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'mileszs/ack.vim'
Plugin 'https://github.com/ctrlpvim/ctrlp.vim'
Plugin 'airblade/vim-gitgutter'

call vundle#end()
filetype plugin indent on

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Airline config
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set laststatus=2

let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1

if !exists('g:airline_symbols')
      let g:airline_symbols = {}
    endif

" unicode symbols
let g:airline_left_sep = '»'
let g:airline_left_sep = '▶'
let g:airline_right_sep = '«'
let g:airline_right_sep = '◀'
" airline symbols
let g:airline_symbols.linenr = '␊'
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.whitespace = 'Ξ'

let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Git
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set updatetime=100

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Custom commands
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
fun! RemoveTrailingWhiteSpaces()
  let l:save = winsaveview()
  %s/\s\+$//e
  call winrestview(l:save)
endfun

command! RemoveTrailingWhiteSpaces call RemoveTrailingWhiteSpaces()
command! WriteSudo w !sudo tee > /dev/null %
command! MakeTags !ctags -R .
