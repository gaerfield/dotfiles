" Plugins -> has to be on top
set nocompatible              " be iMproved, required
filetype off                  " required

" set important paths
set undodir=$XDG_CACHE_HOME/nvim/undo
set directory=$XDG_CACHE_HOME/nvim/swap
set backupdir=$XDG_CACHE_HOME/nvim/backup
set viewdir=$XDG_CACHE_HOME/nvim/view

call plug#begin()

" vim-sensible
Plug 'tpope/vim-sensible'
" lean Statusbar
Plug 'vim-airline/vim-airline'
" Airline Themes
Plug 'vim-airline/vim-airline-themes'
" Fuzzy finder
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
" NERDTree filebrowser
Plug 'preservim/nerdtree'
" git
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
" quoting 
Plug 'tpope/vim-surround'
" colorscheme: nord
Plug 'arcticicestudio/nord-vim'

call plug#end()            " required
filetype plugin indent on    " required

" Airline Settings
" Tabbar (top of vim) is enabled
let g:airline#extensions#tabline#enabled = 1
" Use Powerline Fonts (better looking)
let g:airline_powerline_fonts = 1

""""""""""""""""""""
""" Own settings """
""""""""""""""""""""

"" General
" Other
set wildmenu                    " Opens a menue when there is more than one file/command/...
set wildmode=list:longest,full  " Shows all possible files/commands/... in a list
set t_Co=256                    " Colors to 256, for TODO
silent! colorscheme nord        " 'silent' to not fail before install
set clipboard=unnamedplus       " Nutze den STRG+C/STRG+V - copy-paste-buffer

" Display
set laststatus=2     " Always show status line
set title            " Always show title of document
set number           " Show line numbers
set relativenumber   " Show relative line numbers -> must have set number
set colorcolumn=81   " Shows a colored vertical line at position 81
"set linebreak        " Break lines at word (requires Wrap lines)
set showbreak=+++    " Wrap-broken line prefix
"set textwidth=100    " Line wrap (number of cols)
set showmatch        " Highlight matching brace
set errorbells       " Beep or flash screen on errors
set visualbell       " Use visual bell (no beeping)
"set nowrap          " TODO vergleiche mit textwrap
set list             " Replace characters with others TODO really?
set listchars=tab:>- " Show tabs as >-
"set listchars=tab:▸\ ,eol:¬",space:␣ " fancier than the option above, could be too much for the eye
syntax on            " Show syntax
set cursorline       " Highlights current cursor line

" Find and Replace
set hlsearch                    " Highlight all search results
set smartcase                   " Enable smart-case search
set ignorecase                  " Always case-insensitive
set incsearch                   " Searches for strings incrementally
set wildignorecase              " case insensitive searching -> TAB completion
"set fileignorecase             " case insensitive file searching -> even without TAB completion
set inccommand=split

" Indentation
set autoindent      " Auto-indent new lines
set expandtab       " Use spaces instead of tabs
set shiftwidth=2    " Number of auto-indent spaces
set smartindent     " Enable smart-indent
set smarttab        " Enable smart-tabs
set softtabstop=2   " Number of spaces per Tab

"" Advanced
" Window
set confirm         " Prompt confirmation dialogs -> saving before exit
set ruler           " Show row and column ruler information
set showtabline=2   " Show tab bar

" Files and Paths
set autochdir                   " Change working directory to open buffer
set path+=**                    " Find recursive files
set backup                      " Activate Backup of old files

" Miscellaneous
set undolevels=1000 " Number of undo levels
set backspace=indent,eol,start  " Backspace behaviour
set whichwrap+=<,>,h,l

" fzf-config
" preview '(highlight -O ansi -l {} 2> /dev/null || cat {}
command! -bang -nargs=? -complete=dir Files
    \ call fzf#vim#files(<q-args>, {'options': ['--layout=reverse', '--info=inline', '--preview', 'highlight -O ansi -l {} 2> /dev/null || cat {}']}, <bang>0)

" Own keybindings
"""""""""""""""""
" use jj to escape Insert Mode
" let mapleader = ','
" Edit vim-config
" nnoremap <leader>ev :tabedit $XDG_CONFIG_HOME/nvim/init.vim<cr>

" Plugin keybindings
""""""""""""""""""""
map <F5> :NERDTreeToggle<CR>
map <F2> :Files<CR>

" Own Scripts
"""""""""""""
" XML formatieren mit gg=G
" au FileType xml setlocal equalprg=xmllint\ --format\ --recover\ -\ 2>/dev/null
"""""""""""""
" nutzt die Dunkle Variante des Themes
" command Dark execute ":set background=dark"
command Editvimc execute ":tabedit $XDG_CONFIG_HOME/nvim/init.vim"
command Sovimc execute ":so $XDG_CONFIG_HOME/nvim/init.vim"
command Editzsh execute ":tabedit $XDG_CONFIG_HOME/zsh/.zshrc"
" Function to source only if file exists {
function! SourceIfExists(file)
  if filereadable(expand(a:file))
    exe 'source' a:file
  endif
endfunction
" }
call SourceIfExists("$XDG_CONFIG_HOME/nvim/init-local.vim")
