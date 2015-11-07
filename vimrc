"   1. Place file in home directory as .vimrc
"   2. Install the accompanying powerline patched font (or create your own)
"   3. Run the following command in terminal
"      mkdir ~/.vim ~/.vim/bundle ~/.vim/backup ~/.vim/cache ~/.vim/undo; git clone https://github.com/vundlevim/vundle.vim.git ~/.vim/bundle/vundle.vim
"   4. Launch vim and Run
"      :PluginInstall
"   5. Restart vim

" Set custom key bindings
let mapleader = ' '

" So... Let's try this out :)
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>

set nocompatible              " be iMproved, required
filetype off                  " required

" Set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/vundle.vim
call vundle#begin('~/.vim/bundle')

" Let Vundle manage Vundle, required
Plugin 'vundlevim/vundle.vim'

" Add custom plugins
Plugin 'airblade/vim-gitgutter'
Plugin 'airblade/vim-rooter'
Plugin 'bling/vim-airline'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'fatih/vim-go'
Plugin 'garyburd/go-explorer'
Plugin 'majutsushi/tagbar'
Plugin 'qpkorr/vim-bufkill'
Plugin 'raimondi/delimitmate'
Plugin 'rking/ag.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/syntastic'
Plugin 'shougo/neocomplete.vim'
Plugin 'svanharmelen/molokai'
Plugin 'tomtom/tcomment_vim'
Plugin 'tpope/vim-dispatch'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-surround'
Plugin 'xolox/vim-session'
Plugin 'xolox/vim-misc'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" General setting
set autoread                         " Reload files that have been modified
set backspace=indent,eol,start       " Makes backspace not behave all retarded-like
set clipboard+=unnamed               " Copy selected text to the system clipboard
set colorcolumn=100                  " Highlight 100 character limits
set completeopt-=preview             " Do not show completion options in the preview window"
set conceallevel=2                   " Concealed text is completely hidden
set concealcursor=niv                " Conceal in normal, insert and visual modes
set encoding=utf-8                   " Set default encoding to UTF8"
set hidden                           " Allow buffers to be backgrounded without being saved
set laststatus=2                     " Always show the status bar
set list                             " Show invisible characters
set listchars=tab:▸\ ,eol:¬          " Set the characters for the invisibles
set noshowmode                       " We show the current mode with airline
set number                           " Show the absolute line number the cursor is on
set mouse=a                          " Enable passing mouse commands"
set relativenumber                   " Show relative line numbers
set scrolloff=999                    " Keep the cursor centered
set sessionoptions-=help             " Do not save help windows
set sessionoptions-=options          " Don't persist options as it can corrupt sessions
set splitbelow                       " Splits show up below by default
set splitright                       " Splits go to the right by default
set ttymouse=xterm2                  " Make mouse work in a terminal as well"

" Backup settings
set backupdir=~/.vim/backup
set backup
set noswapfile
set undofile
set undodir=~/.vim/undo
set writebackup

" Open help vertically
command! -nargs=* -complete=help Help vertical belowright help <args>
autocmd FileType help wincmd L

" Search settings
set hlsearch   " Highlight results
set ignorecase " Ignore casing of searches
set incsearch  " Start showing results as you type
set smartcase  " Be smart about case sensitivity when searching

" Speedup syntax highlighting
set nocursorcolumn
set nocursorline
set statusline=%<%f\ %h%m%r%{fugitive#statusline()}%=%-14.(%l,%c%V%)\ %P
syntax sync minlines=256

" Tab settings
set expandtab     " Expand tabs to the proper type and size
set tabstop=2     " Tabs width in spaces
set softtabstop=2 " Soft tab width in spaces
set shiftwidth=2  " Amount of spaces when shifting

" Time out on key codes but not mappings.
" Basically this makes terminal Vim work sanely.
set ttimeout
set ttimeoutlen=10

" Wildmenu completion settings
set wildmenu
set wildmode=list:full                           " Wildcard matches the longest and shows a list
set wildignore+=.hg,.git,.svn                    " Version control
set wildignore+=*.aux,*.out,*.toc                " LaTeX intermediate files
set wildignore+=*.jpg,*.bmp,*.gif,*.png,*.jpeg   " binary images
set wildignore+=*.o,*.obj,*.exe,*.dll,*.manifest " compiled object files
set wildignore+=*.spl                            " compiled spelling word lists
set wildignore+=*.sw?                            " Vim swap files
set wildignore+=*.DS_Store                       " OSX bullshit
set wildignore+=*.luac                           " Lua byte code
set wildignore+=migrations                       " Django migrations
set wildignore+=go/pkg                           " Go static files
set wildignore+=go/bin                           " Go bin files
set wildignore+=go/bin-vagrant                   " Go bin-vagrant files
set wildignore+=*.pyc                            " Python byte code
set wildignore+=*.orig                           " Merge resolution files

" Configure the look and feel
syntax on
let g:molokai_original = 1
colorscheme molokai

" Configure any GUI settings
set guifont=Monaco\ for\ Powerline:h11

" ----------------------------------------- "
" Plugin configs                            "
" ----------------------------------------- "

" ==================== CtrlP ====================
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_max_height = 25		" maxiumum height of match window
let g:ctrlp_switch_buffer = 'et'	" jump to a file if it's open already
let g:ctrlp_mruf_max=450 		" number of recently opened files
let g:ctrlp_max_files=0  		" do not limit the number of searchable files
let g:ctrlp_use_caching = 1
let g:ctrlp_clear_cache_on_exit = 0
let g:ctrlp_cache_dir = $HOME.'/.cache/ctrlp'
let g:ctrlp_buftag_types = {'go' : '--language-force=go --golang-types=ftv'}

" ==================== delimitmate ====================
let g:delimitMate_expand_cr = 1
let g:delimitMate_expand_space = 1
let g:delimitMate_smart_quotes = 1
let g:delimitMate_expand_inside_quotes = 0
let g:delimitMate_smart_matchpairs = '^\%(\w\|\$\)'
imap <expr><CR> pumvisible() ? "\<C-y>" : "\<Plug>delimitMateCR"

" ===================== neocomplete ====================
let g:neocomplete#enable_at_startup = 1
imap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
imap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<S-TAB>"

" ====================== nerdtree ======================
nmap <leader>n :NERDTreeToggle<CR>

" ====================== syntastic =====================
let g:syntastic_error_symbol = '✗'
let g:syntastic_warning_symbol = '⚠'
let g:syntastic_style_error_symbol = '✗'
let g:syntastic_style_warning_symbol = '⚠'
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_stl_format = '[%W{Warn: %fw #%w}%B{, }%E{Err: %fe #%e}]'
let g:syntastic_go_checkers = ['go', 'golint', 'govet']
"let g:syntastic_go_golint_quiet_messages = { "regex": 'exported.*should have comment' }

" ===================== vim-airline ====================
let g:airline_powerline_fonts = 1
let g:airline_theme = 'murmur'

" ==================== vim-gitgutter ===================
let g:gitgutter_sign_column_always = 1

" ======================= vim-go =======================
let g:go_autodetect_gopath = 1
let g:go_auto_type_info = 1
let g:go_fmt_fail_silently = 0
let g:go_fmt_command = "goimports"
let g:go_highlight_space_tab_error = 0
let g:go_highlight_array_whitespace_error = 0
let g:go_highlight_trailing_whitespace_error = 0
let g:go_highlight_functions = 1
let g:go_highlight_extra_types = 0
let g:go_highlight_methods = 1
let g:go_highlight_operators = 1
let g:go_snippet_engine = "neosnippet"
au FileType go nmap <leader>r  <Plug>(go-run)
au FileType go nmap <leader>b  <Plug>(go-build)
au FileType go nmap <leader>i  <Plug>(go-install)
au FileType go nmap <leader>t  <Plug>(go-test)
au FileType go nmap <leader>c  <Plug>(go-coverage)
au FileType go nmap <Leader>d  <Plug>(go-def)
au FileType go nmap <Leader>ds <Plug>(go-def-split)
au FileType go nmap <Leader>dv <Plug>(go-def-vertical)
au FileType go nmap <Leader>gd <Plug>(go-doc)
au FileType go nmap <Leader>gv <Plug>(go-doc-vertical)
au FileType go nmap <Leader>gi <Plug>(go-implements)
au FileType go nmap <Leader>gr <Plug>(go-rename)
au FileType go nmap <Leader>im :GoImports<CR>

" ===================== vim-rooter =====================
let g:rooter_silent_chdir = 1

" ===================== vim-session ====================
let g:session_directory = '~/.vim/sessions'
let g:session_autoload = 'no'
let g:session_autosave = 'yes'
let g:session_lock_enabled = 0
nmap so :OpenTabSession
nmap ss :SaveTabSession
nmap sc :CloseTabSession<CR>
nmap sd :DeleteSession<CR>

" ----------------------------------------- "
" Some helpful functions and key bindings   "
" ----------------------------------------- "

let i = 1
while i <= 9
    execute 'nnoremap <Leader>' . i . ' :' . i . 'wincmd w<CR>'
    let i = i + 1
endwhile
function! WindowNumber()
    let str=tabpagewinnr(tabpagenr())
    return str
endfunction
set statusline=win:%{WindowNumber()}

" Fix annoying typos when trying to write and/or quit
:command WQA wq
:command WQa wq
:command Wqa wq
:command QA qa
:command Qa qa
:command WQ wq
:command Wq wq
:command Q q
:command W w

nmap <D-A-Right> :tabnext<CR>     " Make tab switching consistent
nmap <D-A-Left> :tabprevious<CR>  " Make tab switching consistent
nmap <D-a> :%y+                   " Allow CTRL-a to select all text

