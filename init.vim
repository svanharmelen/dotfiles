"   1. Place file in home directory as ~/.config/nvim/init.vim
"   2. Install the accompanying powerline patched font (or create your own)
"   3. Run the following command in terminal
"      mkdir ~/.config/nvim ~/.config/nvim/bundle ~/.config/nvim/backup ~/.config/nvim/cache ~/.config/nvim/undo; git clone https://github.com/vundlevim/vundle.vim.git ~/.config/nvim/bundle/vundle.vim
"   4. Launch nvim and Run
"      :PluginInstall
"   5. Restart nvim

" Set custom key bindings
let mapleader = ' '
let g:mapleader = ' '

" So... Let's try this out :)
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>

filetype off                  " required

" Set the runtime path to include Vundle and initialize
set rtp+=~/.config/nvim/bundle/vundle.vim
call vundle#begin('~/.config/nvim/bundle')

" Let Vundle manage Vundle, required
Plugin 'vundlevim/vundle.vim'

" Add custom plugins
Plugin 'airblade/vim-gitgutter'
Plugin 'airblade/vim-rooter'
Plugin 'bling/vim-airline'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'edkolev/tmuxline.vim'
Plugin 'elzr/vim-json'
Plugin 'fatih/vim-go'
Plugin 'kchmck/vim-coffee-script' 
Plugin 'majutsushi/tagbar'
Plugin 'nvie/vim-flake8'
Plugin 'qpkorr/vim-bufkill'
Plugin 'raimondi/delimitmate'
Plugin 'rking/ag.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'shougo/deoplete.nvim'
Plugin 'svanharmelen/molokai'
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-surround'
Plugin 'wesq3/vim-windowswap'
Plugin 'xolox/vim-session'
Plugin 'xolox/vim-misc'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" General setting
set clipboard^=unnamed               " Copy selected text to the system clipboard
set clipboard^=unnamedplus           " Copy selected text to the system clipboard
set cmdheight=1                      " Force the command height to 1
set colorcolumn=100                  " Highlight 100 character limits
set completeopt-=preview             " Do not show completion options in the preview window"
set hidden                           " Allow buffers to be backgrounded without being saved
set list                             " Show invisible characters
set listchars=tab:▸\ ,eol:¬          " Set the characters for the invisibles
set noshowmode                       " We show the current mode with airline
set number                           " Show the absolute line number the cursor is on
set relativenumber                   " Show relative line numbers
set scrolloff=999                    " Keep the cursor centered
set sessionoptions-=help             " Do not save help windows
set splitbelow                       " Splits show up below by default
set splitright                       " Splits go to the right by default

" Backup settings
set backupdir=~/.config/nvim/backup
set backup
set noswapfile
set undofile
set undodir=~/.config/nvim/undo
set writebackup

" Open help vertically
command! -nargs=* -complete=help Help vertical belowright help <args>
autocmd FileType help wincmd L

" Search settings
set ignorecase " Ignore casing of searches
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

" Change the cursor shape on insert mode
let $NVIM_TUI_ENABLE_CURSOR_SHAPE = 1

" Configure the look and feel
syntax on
let g:molokai_original = 1
colorscheme molokai

" ----------------------------------------- "
" Plugin configs                            "
" ----------------------------------------- "

" ==================== CtrlP ====================
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_max_height = 10		" maxiumum height of match window
let g:ctrlp_switch_buffer = 'et'	" jump to a file if it's open already
let g:ctrlp_mruf_max=450 		" number of recently opened files
let g:ctrlp_max_files=0  		" do not limit the number of searchable files
let g:ctrlp_use_caching = 1
let g:ctrlp_clear_cache_on_exit = 0
let g:ctrlp_cache_dir = '~/.config/nvim/ctrlp'
let g:ctrlp_buftag_types = {'go' : '--language-force=go --golang-types=ftv'}

" ==================== delimitmate ====================
let g:delimitMate_expand_cr = 1
let g:delimitMate_expand_space = 1
let g:delimitMate_smart_quotes = 1
let g:delimitMate_expand_inside_quotes = 0
let g:delimitMate_smart_matchpairs = '^\%(\w\|\$\)'
imap <expr><CR> pumvisible() ? "\<C-y>" : "\<Plug>delimitMateCR"

" ====================== deoplete ======================
let g:deoplete#enable_at_startup = 1
imap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
imap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<S-TAB>"

" ====================== nerdtree ======================
nmap <leader>n :NERDTreeToggle<CR>

" ===================== vim-airline ====================
let g:airline_powerline_fonts = 1
let g:airline_theme = 'murmur'
function! AirlineInit()
  let g:airline_section_z = '%{go#jobcontrol#Statusline()}'.g:airline_section_z
  let g:airline_section_y = airline#section#create(['ffenc', ' %{strftime("%H:%M")}'])
endfunction
autocmd VimEnter * call AirlineInit() 

" ================== vim-coffee-script =================
au BufRead,BufNewFile *.cson set ft=coffee

" ==================== vim-gitgutter ===================
let g:gitgutter_sign_column_always = 1

" ======================= vim-go =======================
let g:go_auto_type_info = 1
let g:go_fmt_command = "goimports"
let g:go_highlight_space_tab_error = 0
let g:go_highlight_array_whitespace_error = 0
let g:go_highlight_trailing_whitespace_error = 0
let g:go_highlight_functions = 1
let g:go_highlight_extra_types = 0
let g:go_highlight_methods = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
let g:go_metalinter_autosave = 1
let g:go_metalinter_autosave_enabled = ['vet', 'golint', 'gotype']
let g:go_metalinter_enabled = [
      \ 'gotype', 'varcheck', 'structcheck', 'aligncheck', 
      \ 'errcheck', 'deadcode', 'ineffassign'
      \ ]
au FileType go nmap <leader>r  <Plug>(go-run)
au FileType go nmap <leader>b  <Plug>(go-build)
au FileType go nmap <leader>i  <Plug>(go-install)
au FileType go nmap <leader>t  <Plug>(go-test)
au FileType go nmap <leader>c  <Plug>(go-coverage)
au FileType go nmap <leader>l  :GoMetaLinter<CR>
au FileType go nmap <leader>d  <Plug>(go-def)
au FileType go nmap <leader>ds <Plug>(go-def-split)
au FileType go nmap <leader>dv <Plug>(go-def-vertical)
au FileType go nmap <leader>gd <Plug>(go-doc)
au FileType go nmap <leader>gv <Plug>(go-doc-vertical)
au FileType go nmap <leader>gi <Plug>(go-implements)
au FileType go nmap <leader>gr <Plug>(go-rename)
au FileType go nmap <leader>im :GoImports<CR>

" ====================== vim-json ======================
let g:vim_json_syntax_conceal = 0
" Prettify JSON, install: brew install yajl
command! JSONFormat %!json_reformat

" ===================== vim-rooter =====================
let g:rooter_silent_chdir = 1
let g:rooter_use_lcd = 1

" ===================== vim-session ====================
let g:session_directory = '~/.config/nvim/sessions'
let g:session_autoload = 'no'
let g:session_autosave = 'yes'
let g:session_lock_enabled = 0
nmap so :OpenSession
nmap ss :SaveSession
nmap sc :CloseSession<CR>
nmap sd :DeleteSession<CR>

" ----------------------------------------- "
" Some helpful functions and key bindings   "
" ----------------------------------------- "

" ============== always put quickfix on bottom ===========
autocmd FileType qf wincmd J

" ================== auto resize windows =================
au VimResized * :wincmd =

" =================== fix generic typos ==================
command WQA wq
command WQa wq
command Wqa wq
command QA qa
command Qa qa
command WQ wq
command Wq wq
command Q q
command W w

" ================ locationlist shortcuts ================
function! <SID>LocationPrevious()
  try
    lprev
  catch /^Vim\%((\a\+)\)\=:E553/
    llast
  endtry
endfunction

function! <SID>LocationNext()
  try
    lnext
  catch /^Vim\%((\a\+)\)\=:E553/
    lfirst
  endtry
endfunction

nnoremap <silent> <Plug>LocationPrevious :<C-u>exe 'call <SID>LocationPrevious()'<CR>
nnoremap <silent> <Plug>LocationNext     :<C-u>exe 'call <SID>LocationNext()'<CR>
map <silent> <C-n> <Plug>LocationPrevious
map <silent> <C-m> <Plug>LocationNext
nnoremap <leader>a :lclose<CR>

" ======================= terminal =======================
let g:terminal_scrollback_buffer_size = 100000
autocmd WinEnter term://* startinsert
tnoremap <Esc> <C-\><C-n>
nmap ts :new<CR><ESC>:term<CR>
nmap tv :vnew<CR><ESC>:term<CR>

" ================== trailing whitespace =================
function! <SID>StripTrailingWhitespaces()
    let _s=@/
    let l = line(".")
    let c = col(".")
    %s/\s\+$//e
    let @/=_s
    call cursor(l, c)
endfunction
autocmd BufWritePre *.py :call <SID>StripTrailingWhitespaces()

" ==================== window switching ==================
tnoremap <C-h> <C-\><C-n><C-w>h
tnoremap <C-j> <C-\><C-n><C-w>j
tnoremap <C-k> <C-\><C-n><C-w>k
tnoremap <C-l> <C-\><C-n><C-w>l

" =============== window switching by number =============
let i = 1
while i <= 9
    execute 'nnoremap <leader>' . i . ' :' . i . 'wincmd w<CR>'
    let i = i + 1
endwhile
function! WindowNumber()
    let str=tabpagewinnr(tabpagenr())
    return str
endfunction
set statusline=win:%{WindowNumber()}
