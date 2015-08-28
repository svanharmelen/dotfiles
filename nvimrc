"Installation Installation Instructions
"   1. Place file in home directory as .vimrc
"   2. Install the accompanying powerline patched font to use as non-ASCII font
"   3. Run the following command in terminal
"      mkdir .nvim .nvim/bundle .nvim/backup .nvim/cache .nvim/undo; git clone https://github.com/vundlevim/vundle.vim.git .nvim/bundle/vundle.vim
"   4. Launch NeoVim and Run
"      :BundleInstall
"   5. Restart NeoVim

filetype off

" Set the runtime path to include Vundle and initialize
set rtp+=~/.nvim/bundle/vundle.vim
call vundle#begin('~/.nvim/bundle')

" Let Vundle manage Vundle, required
Plugin 'vundlevim/vundle.vim'

" Add custom plugins
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
Plugin 'shougo/deoplete.nvim'
Plugin 'svanharmelen/molokai'
Plugin 'tpope/vim-fugitive'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" General setting
set autoread                   " Reload files that have been modified
set backspace=indent,eol,start " Makes backspace not behave all retarded-like
set clipboard+=unnamed         " Copy selected text to the system clipboard"
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
set matchtime=2                " Set the matchtime to 0.2 second
set splitbelow                 " Splits show up below by default
set splitright                 " Splits go to the right by default
set updatetime=1000            " Update every 1000ms

" Backup settings
set backupdir=~/.nvim/backup
set undodir=~/.nvim/undo
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

" Airline settings
let g:airline_powerline_fonts = 1
let g:airline_theme = 'murmur'

" Auto Close
let g:AutoPairsShortcutFastWrap = '<C-e>'

" Deoplete settings
let g:deoplete#enable_at_startup = 1
let g:deoplete#enable_ignore_case = 1
let g:deoplete#enable_smart_case = 1
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <CR>    pumvisible() ? "\<C-y>" : "\<CR>"
inoremap <expr> <Esc>   pumvisible() ? g:deoplete#mappings#cancel_popup() : "\<Esc>"

" Git settings
let g:gitgutter_sign_column_always = 1

" Go settings
let g:go_fmt_command = 'goimports'
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
let g:go_play_open_browser = 0

" NeoVim setting
let $NVIM_TUI_ENABLE_CURSOR_SHAPE=1

" Syntastic settings
let g:syntastic_error_symbol='✗'
let g:syntastic_warning_symbol='⚠'
let g:syntastic_style_error_symbol='✗'
let g:syntastic_style_warning_symbol='⚠'
let g:syntastic_aggregate_errors = 1
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_stl_format = '[%W{Warn: %fw #%w}%B{, }%E{Err: %fe #%e}]'
let g:syntastic_go_checkers = ['golint', 'govet']

" Set custom key bindings
let mapleader=';'
tnoremap <Esc> <C-\><C-n><CR>      " Make --terminal-- mode escape using <Esc>
nmap <leader>n :NERDTreeToggle<CR> " Toggle NERDTree
nmap wh :wincmd h<CR>              " Switch to left window
nmap wj :wincmd j<CR>              " Switch to bottom window
nmap wk :wincmd k<CR>              " Switch to upper window
nmap wl :wincmd l<CR>              " Switch to left window
nmap wq :wincmd q<CR>              " Close current window

