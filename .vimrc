let mapleader = "/"
set updatetime=250
set rtp+=/usr/local/lib/python2.7/dist-packages/powerline/bindings/vim/

" Always show statusline
set laststatus=2

" Set working directory to current file's directory
autocmd BufEnter * lcd %:p:h
" autoresize splits
autocmd VimResized * wincmd =

call plug#begin('~/.vim/plugged')
Plug 'Valloric/YouCompleteMe'
Plug 'tmhedberg/SimpylFold'
Plug 'airblade/vim-gitgutter'
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/syntastic'
Plug 'ervandew/supertab'
Plug 'scrooloose/nerdcommenter'
Plug 'kien/rainbow_parentheses.vim'
Plug 'https://github.com/tpope/vim-fugitive.git'
Plug 'altercation/vim-colors-solarized'
Plug 'jnurmine/Zenburn'
Plug 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}
Plug 'flazz/vim-colorschemes'
call plug#end()
 
" Plug 'tpope/vim-surround/'
" Plug 'nvie/vim-flake8'
" Plug 'vim-scripts/indentpython.vim'
" Plug 'vim-airline/vim-airline'
" Plug 'vim-airline/vim-airline-themes'
" let python_highlight_all=1
syntax on
" filetype plugin on
filetype plugin indent on
" set background=dark
" access your system clipboard
set clipboard=unnamedplus

" show line number
set number

" Use 256 colours (Use this setting only if your terminal supports 256 colours)
set t_Co=256

" Split Layouts
set splitbelow
set splitright

" split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Syntastic Settings
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_python_checkers = ['pylint']

" The Silver Searcher
if executable('ag')
  " Use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor
  " let g:ackprg = 'ag --vimgrep'
  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
endif

" bind K to grep word under cursor
nnoremap K :grep! "\b<C-R><C-W>\b"<CR>:cw<CR>

" bind \ (backward slash) to grep shortcut
" command -nargs=+ -complete=file -bar Ag silent! grep! <args>|cwindow|redraw!

" Enable folding
set foldmethod=indent
set foldlevel=99

" Enable folding with the spacebar
nnoremap <space> za

" Show docstrings for folded code
let g:SimpylFold_docstring_preview=1

" Python specific settings.
au BufNewFile,BufRead *.py,*.cpp,*.h,*.c
    \ set tabstop=4 |
    \ set softtabstop=4 |
    \ set shiftwidth=4 |
    \ set textwidth=100 |
    \ set smarttab |
    \ set expandtab |
    \ set fileformat=unix

" \ set autoindent |
" Flag unnecessary whitespaces"
highlight BadWhitespace guibg=red ctermbg=darkred
au BufRead,BufNewFile *.py,*.pyw,*.c,*.h,*.cpp match BadWhitespace /\s\+$/

" autocmd BufWritePost *.py call Flake8()

set encoding=utf-8

"autocomplete window goes away when you’re done with it, and the latter defines a shortcut for goto definition
let g:ycm_autoclose_preview_window_after_completion=1
map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>

"python with virtualenv support
py << EOF
import os
import sys
if 'VIRTUAL_ENV' in os.environ:
  project_base_dir = os.environ['VIRTUAL_ENV']
  activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
  execfile(activate_this, dict(__file__=activate_this))
EOF

" to define which scheme to use based upon the VIM mode
" if has('gui_running')
"   set background=dark
"   colorscheme solarized
"  else
"   colorscheme zenburn
" endif

" Airline theme
" let g:airline_theme = 'luna'

" Powerline fonts
" let g:airline_powerline_fonts = 1

" Vim colorscheme
" colorscheme xcode-default 
" colorscheme Tomorrow-Night 
" set background=dark
" colorscheme Chasing_Logic
colorscheme onedark
" colorscheme ecostation
" colorscheme flattown
" colorscheme mirodark 
" colorscheme feral 
" colorscheme herald
" colorscheme PaperColor 
" colorscheme jellybeans
" Solarized also ships with a dark and light theme. To make switching between them very easy (by pressing F5)
call togglebg#map("<F5>")

" ignore files in NERDTree
let NERDTreeIgnore=['\.pyc$', '\~$'] 

" Store the bookmarks file
let NERDTreeBookmarksFile=expand("$HOME/.vim-NERDTreeBookmarks")
" " " Show the bookmarks table on startup
let NERDTreeShowBookmarks=1
" Map NerdTree
nmap <leader>\ :NERDTreeToggle<cr>
" Map NerdTre - Bookmark
nmap <leader>b :Bookmark<cr>

" rainbow-para options
let g:rbpt_colorpairs = [
    \ ['brown',       'RoyalBlue3'],
    \ ['Darkblue',    'SeaGreen3'],
    \ ['darkgray',    'DarkOrchid3'],
    \ ['darkgreen',   'firebrick3'],
    \ ['darkcyan',    'RoyalBlue3'],
    \ ['darkred',     'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['brown',       'firebrick3'],
    \ ['gray',        'RoyalBlue3'],
    \ ['black',       'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['Darkblue',    'firebrick3'],
    \ ['darkgreen',   'RoyalBlue3'],
    \ ['darkcyan',    'SeaGreen3'],
    \ ['darkred',     'DarkOrchid3'],
    \ ['red',         'firebrick3'],
    \ ]

" rainbow-para
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces
au Syntax * RainbowParenthesesLoadChevrons


" tags file
" This will check the current folder for tags file and keep going one directory
" up all the way to the root folder. SO you can be in any sub-folder in your
" project and it'll be able to find the tags files.
set tags=tags;/

"Open multiple tag matches in new tab
nnoremap <F6> :tab tselect <C-r><C-w><CR>
" map <A-]> :vsp <CR>:exec("tag ".expand("<cword>"))<CR>
" nnoremap <F6> :vsp select <CR>exec("tag ".expand("<cword>"))<CR>
" map <F6> :vsp <CR>exec("tag ".expand("<cword>"))<CR>
" nnoremap <g]> :vs <CR>:exec("tag ".expand("<cword>"))<CR>
" map <F2> :tab split <CR>:exec("tag ".expand("<cword>"))<CR>


