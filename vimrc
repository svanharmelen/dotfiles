"Installation Installation Instructions
"   1. Place file in home directory as .vimrc
"   2. Install the accompanying powerline patched font to use as non-ASCII font
"   3. Run the following command in terminal
"      mkdir .vim .vim/bundle .vim/backup .vim/swap .vim/cache .vim/undo; git clone https://github.com/vundlevim/vundle.vim.git .vim/bundle/vundle.vim
"   4. Launch Vim and Run
"      :BundleInstall
"   5. Restart Vim

set nocompatible
filetype off

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'vundlevim/vundle.vim'

" add plugins
Plugin 'airblade/vim-gitgutter'
Plugin 'benmills/vimux'
Plugin 'benmills/vimux-golang'
Plugin 'bling/vim-airline'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'fatih/vim-go'
Plugin 'garyburd/go-explorer'
Plugin 'scrooloose/nerdcommenter'
Plugin 'jiangmiao/auto-pairs'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/syntastic'
Plugin 'svanharmelen/molokai'
Plugin 'tpope/vim-fugitive'
Plugin 'valloric/youcompleteme'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" General setting
set autoread                   " Reload files that have been modified
set backspace=indent,eol,start " Makes backspace not behave all retarded-like
set colorcolumn=80,100         " Highlight 80 and 100 character limits
set encoding=utf-8             " Set default encoding to UTF8"
set hidden                     " Allow buffers to be backgrounded without being saved
set laststatus=2               " Always show the status bar
set list                       " Show invisible characters
set listchars=tab:▸\ ,eol:¬    " Set the characters for the invisibles
set noshowmode                 " We show the current mode with airline
set number                     " Show the absolute line number the cursor is on
set relativenumber             " Show relative line numbers
set ruler                      " Show the line number and column in the status bar
set scrolloff=999              " Keep the cursor centered in the screen
set showmatch                  " Highlight matching braces
set matchtime=0.2              " Set the matchtime to 0.2 second
set splitbelow                 " Splits show up below by default
set splitright                 " Splits go to the right by default
set t_Co=256                   " Use 256 colors
set updatetime=1000            " Update every 1000ms

"http://stackoverflow.com/questions/20186975/vim-mac-how-to-copy-to-clipboard-without-pbcopy
set clipboard^=unnamed
set clipboard^=unnamedplus

" Backup settings
set backupdir=~/.vim/backup
set undodir=~/.vim/undo
set backup
set noswapfile
set undofile
set writebackup

" Search settings
set hlsearch   " Highlight results
set ignorecase " Ignore casing of searches
set incsearch  " Start showing results as you type
set smartcase  " Be smart about case sensitivity when searching

" Tab settings
set expandtab     " Expand tabs to the proper type and size
set tabstop=2     " Tabs width in spaces
set softtabstop=2 " Soft tab width in spaces
set shiftwidth=2  " Amount of spaces when shifting

" Tab completion settings
set wildmode=longest:list                        " Wildcard matches the longest and shows a list
set wildignore+=.git,.hg,.svn                    " Ignore version control repos
set wildignore+=*.o,*.obj,*.exe,*.dll,*.manifest " Ignore compiled object files"
set wildignore+=go/pkg                           " Ignore Go static files
set wildignore+=go/bin                           " Ignore Go bin files

" Configure the look and feel
syntax on
let g:molokai_original = 1
colorscheme molokai

" Tweak Airline related settings
let g:airline_powerline_fonts = 1
let g:airline_theme = 'murmur'

" Tweak Auto Close
let g:AutoPairsShortcutFastWrap = '<C-e>'

" Tweak Git related settings
let g:gitgutter_sign_column_always = 1

" Tweak Go related settings
let g:go_fmt_command = "goimports"
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
let g:go_play_open_browser = 0

" Tweak Neocomplete settings
let g:neocomplete#enable_at_startup = 1
setlocal omnifunc=gocode#Complete

" Tweak Syntastic related settings
let g:syntastic_error_symbol='✗'
let g:syntastic_warning_symbol='⚠'

" Set custom key bindings
let mapleader=","
nmap <leader>h :noh<CR>
nmap <leader>n :NERDTreeToggle<CR>
nmap <leader>wh :wincmd h<CR>
nmap <leader>wj :wincmd j<CR>
nmap <leader>wk :wincmd k<CR>
nmap <leader>wl :wincmd l<CR>
nmap <leader>ws :wincmd s<CR>
nmap <leader>wv :wincmd v<CR>

