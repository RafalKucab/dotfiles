set nocompatible

""" Plugins
" download plugin manager: curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
" install plugins :PlugInstall
call plug#begin()

" automatically saves changes to disk without having to use
Plug '907th/vim-auto-save'

" file finder
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" file system explorer
Plug 'preservim/nerdtree'

" themes
 Plug 'gmoe/vim-espresso'
 Plug 'joshdick/onedark.vim'
 Plug 'doums/darcula'
 Plug 'tomasiser/vim-code-dark'

call plug#end()


""" Appearance
colorscheme onedark  " set theme

set t_Co=256
if exists('+termguicolors')
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif

" set a line cursor within insert mode and a block cursor everywhere else
let &t_SI = "\e[6 q"
let &t_EI = "\e[2 q"

set termguicolors
syntax on                 " turn on syntax highlighting
set number                " show line numbers
set relativenumber        " set relative line numbers
set showmode              " show whether it is in command or insert mode
set showcmd               " show command at the bottom
set encoding=utf-8        " support UTF-8 encoding
set laststatus=1          " always show status line
set splitright            " open new split panes to right
set splitbelow            " ... or bottom
set cursorline            " highlight cursor line
set ruler                 " show ruler on the bottom
set cmdheight=2           " more space for displaying messages


""" Indentation
filetype indent on        " enables indentation rule checking based on file type
set autoindent            " make indentation after pressing Enter key
set tabstop=2             " number of spaces after pressing Tab key
set shiftwidth=2          " number of spaces after pressing >> / << / ==
set expandtab             " turns Tab into spaces
set smartindent           " use smart indentation


""" Editing
set nobackup              " delete backup if exists
set nowritebackup         " don't create backup files
set noswapfile            " don't create swap files
set autoread              " turn on open file monitoring, prompt for reload when external changes happened
set showmatch             " show matching brackets
set wrap!                 " no text wrap
set incsearch             " highlights result while searching
set hlsearch              " highlights all search results
set linespace=5           " space between lines
set showmatch             " show matching brackets
set guifont=JetBrains\ Mono:h12         "set font


""" Behavior
set updatetime=1000                    " decrease update time to trigger plugin
set ignorecase                         " case-insensitive search
set undofile                           " turn on undo after save
set undodir=$HOME/.vim/undo
autocmd BufWritePre * %s/\s\+$//e      " remove trailing whitespaces on save
let g:auto_save=0                      " disable(0)/enable(1) AutoSave on Vim startup


""" Others
set belloff=all                        " turn off bell


""" Key mapping
let mapleader = ' '

nnoremap <C-P> :GFiles<CR>
nnoremap <leader>e :Buffers<CR>
nnoremap <leader>nt :NERDTree<CR>

nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

nnoremap <Space><Space>x <cmd>source %<CR>

