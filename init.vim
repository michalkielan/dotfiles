""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""" Settings
set clipboard=unnamed
set mouse=a
set shiftwidth=2
set softtabstop=2
set expandtab
set shiftwidth=2
set tabstop=2
set number
set autoread
set ignorecase
set smartcase
set incsearch
set tags=tags
syntax on
hi PreProc ctermfg=Yellow
hi LineNr ctermfg=darkgrey
hi Comment ctermfg=darkgrey
hi Pmenu ctermbg=gray guibg=gray

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""" Plugins
call plug#begin()
Plug '/usr/local/opt/fzf'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'junegunn/fzf.vim'
Plug 'ludovicchabant/vim-lawrencium'
Plug 'mhinz/vim-signify'
Plug 'morhetz/gruvbox'
Plug 'preservim/nerdcommenter'
Plug 'rhysd/vim-clang-format'
Plug 'sheerun/vim-polyglot'
Plug 'tpope/vim-fugitive'
Plug 'vim-scripts/TagHighlight'
Plug 'vim-scripts/bandit'
call plug#end()

let g:python_highlight_all = 1
set updatetime=100
filetype plugin on

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""" fbsource only
source /Users/kielanm/vim_fbsource/fzf-biggrep.vim
source /Users/kielanm/vim_fbsource/fbsource.vim
source /Users/kielanm/vim_fbsource/mercenary.vim
source /Users/kielanm/vim_fbsource/mercurial.vim


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""" Ag grep
"command! -bang -nargs=* Ag
  "\ call fzf#vim#grep(
  "\ 'ag --column --line-number --no-heading --ignore-case --no-break --color '.shellescape(<q-args>), 0,
  "\ <bang>0 ? fzf#vim#with_preview('up:60%')
  "\ : fzf#vim#with_preview('up:55%:hidden', '?'),
  "\ <bang>0)


"noremap ga :Ag <C-r><C-w><CR>
"nmap <leader>ag :Ag<space>


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""" fzf config
nmap <leader>f :FZF<CR>

function! s:build_quickfix_list(lines)
  call setqflist(map(copy(a:lines), '{ "filename": v:val }'))
  copen
  cc
endfunction

let g:fzf_action = {
  \ 'ctrl-q': function('s:build_quickfix_list'),
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit' }


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""" Switch between tabs
nmap <leader>1 1gt
nmap <leader>2 2gt
nmap <leader>3 3gt
nmap <leader>4 4gt
nmap <leader>5 5gt
nmap <leader>6 6gt
nmap <leader>7 7gt
nmap <leader>8 8gt
nmap <leader>9 9gt


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""" Theme
let g:gruvbox_contrast_dark='hard'
let g:airline_theme='hybrid'
colorscheme gruvbox
colo gruvbox
hi Normal guibg=#ffffff guifg=#000000 ctermbg=black


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""" Custom functions
fun! RemoveTrailingWhiteSpaces()
  let l:save = winsaveview()
  %s/\s\+$//e
  call winrestview(l:save)
endfun

command! RemoveTrailingWhiteSpaces call RemoveTrailingWhiteSpaces()
command! WriteSudo w !sudo tee > /dev/null %
command! MakeTags !ctags -R
