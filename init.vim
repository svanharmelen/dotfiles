"   1. Install the accompanying powerline patched font (or create your own)
"   2. Run the following commands in terminal:
"      mkdir -p ~/.config/nvim/backup ~/.config/nvim/cache ~/.config/nvim/undo
"      curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
"   3. Link this file in your nvim config directory as ~/.config/nvim/init.vim
"   4. Launch nvim and Run:
"      :PlugInstall
"   5. Restart nvim

call plug#begin('~/.config/nvim/plugged')

" Add plugins
Plug 'airblade/vim-gitgutter'
Plug 'airblade/vim-rooter'
Plug 'christoomey/vim-tmux-navigator'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'edkolev/tmuxline.vim'
Plug 'google/vim-searchindex'
Plug 'fatih/vim-go'
Plug 'mileszs/ack.vim'
Plug 'nvie/vim-flake8'
Plug 'qpkorr/vim-bufkill'
Plug 'raimondi/delimitmate'
Plug 'romainl/vim-qf'
Plug 'scrooloose/nerdtree'
Plug 'shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'shougo/neosnippet'
Plug 'shougo/vimproc.vim', { 'do': 'make' }
Plug 'svanharmelen/molokai'
Plug 'takac/vim-hardtime'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'w0rp/ale'
Plug 'xolox/vim-session'
Plug 'xolox/vim-misc'
Plug 'xuyuanp/nerdtree-git-plugin'
Plug 'zchee/deoplete-go', { 'do': 'make' }

" Syntax related plugins
Plug 'elzr/vim-json', {'for' : 'json'}
Plug 'ekalinin/Dockerfile.vim', {'for' : 'Dockerfile'}
Plug 'hashivim/vim-hashicorp-tools'
Plug 'othree/html5.vim'
Plug 'pangloss/vim-javascript'
Plug 'jvirtanen/vim-octave'
Plug 'kchmck/vim-coffee-script'
Plug 'tmux-plugins/vim-tmux', {'for': 'tmux'}
Plug 'vim-ruby/vim-ruby'

call plug#end()

" Set custom key bindings
let mapleader = ' '
let g:mapleader = ' '

" General setting
set breakat=,)                       " Break lines at specific characters only
set clipboard^=unnamed               " Copy selected text to the system clipboard
set clipboard^=unnamedplus           " Copy selected text to the system clipboard
set cmdheight=1                      " Force the command height to 1
set colorcolumn=100                  " Highlight 100 character limits
set completeopt-=preview             " Do not show completion options in the preview window
set diffopt+=vertical                " Make diffs split vertically
set hidden                           " Allow buffers to be backgrounded without being saved
set inccommand=nosplit               " Live update (preview) substitutions
set linebreak                        " Break lines at `breakat` characters only
set list                             " Show invisible characters
set listchars=tab:▸\ ,eol:¬          " Set the characters for the invisibles
set noshowmode                       " We show the current mode with airline
set number                           " Show the absolute line number the cursor is on
set mouse-=a                         " Disable mouse clicks to go to a position
set relativenumber                   " Show relative line numbers
set scrolloff=999                    " Keep the cursor centered
set sessionoptions-=help             " Do not save help windows
set sessionoptions-=buffers          " Do not save hidden and uploaded buffers
set shortmess+=c                     " Silent short messages from deoplete.nvim
set showbreak=>>>                    " Show clearly were linebreaks are applied
set spelllang=en_us                  " Set default spell check language to English US
set splitbelow                       " Splits show up below by default
set splitright                       " Splits go to the right by default
set updatetime=500                   " Let plugins show effects after 500ms

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

" Configure the look and feel
let g:molokai_original = 1
colorscheme molokai

" ----------------------------------------- "
" Plugin configs                            "
" ----------------------------------------- "

" ======================== ale ========================
let g:ale_go_gometalinter_options = '
  \ --aggregate
  \ --fast
  \ --sort=line
  \ --vendor
  \ --vendored-linters
  \ --disable=gas
  \ --disable=goconst
  \ --disable=gocyclo
  \ '
let g:ale_linters = {'go': ['gometalinter'], 'javascript': ['eslint'], 'python': ['flake8']}
let g:ale_set_quickfix = 1
let g:ale_set_signs = 1
let g:ale_sign_column_always = 1
let g:ale_sign_error = '✗'
let g:ale_sign_warning = '⚠'
let g:ale_statusline_format = ['✗ %d', '⚠ %d', '✓ OK']
let g:ale_warn_about_trailing_whitespace = 0

" ====================== ack.vim ======================
let g:ackprg = 'pt --nogroup --ignore=vendor --smart-case -e'
let g:ackhighlight = 1
nnoremap <leader>ff :Ack!<Space>

" ======================= CtrlP =======================
let g:ctrlp_cmd = 'CtrlPMRU'
let g:ctrlp_cache_dir = '~/.config/nvim/ctrlp'
let g:ctrlp_clear_cache_on_exit = 0
let g:ctrlp_max_files = 0         " do not limit the number of searchable files
let g:ctrlp_max_height = 10       " maxiumum height of match window
let g:ctrlp_mruf_max = 500        " number of recently opened files
let g:ctrlp_mruf_relative = 1     " show only MRU files in the working directory
let g:ctrlp_switch_buffer = 0     " always open file in the current buffer
let g:ctrlp_use_caching = 1
let g:ctrlp_working_path_mode = 'ra'

" ===================== delimitmate ====================
let g:delimitMate_expand_cr = 1
let g:delimitMate_expand_space = 1
let g:delimitMate_expand_inside_quotes = 0
let g:delimitMate_smart_quotes = 1
let g:delimitMate_smart_matchpairs = '^\%(\w\|\$\)'
" imap <expr><CR> pumvisible() ? "\<C-y>" : "\<Plug>delimitMateCR"

" ====================== deoplete ======================
let g:deoplete#enable_at_startup = 1
let g:deoplete#ignore_sources = {}
let g:deoplete#ignore_sources._ = ['member', 'tag']
let g:deoplete#max_list = 30
let g:deoplete#sources#go#align_class = 1
let g:deoplete#sources#go#sort_class = ['package', 'func', 'var', 'type', 'const']
call deoplete#custom#set('_', 'converters', ['converter_remove_overlap'])
call deoplete#custom#set('go,neosnippet', 'disabled_syntaxes', ['Comment', 'String'])
" imap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
imap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<S-TAB>"

" ====================== fugitive ======================
nnoremap <leader>fb :Gblame<CR>
nnoremap <leader>fd :Gdiff<CR>
nnoremap <leader>fc :Gcommit -am
nnoremap <leader>fl :Glog<CR>
nnoremap <leader>fp :Gpush<CR>

" ===================== neosnippet =====================
let g:neosnippet#enable_completed_snippet = 1
let g:neosnippet#disable_runtime_snippets = {'_' : 1}
function! s:neosnippet_expand()
  if pumvisible()
    if neosnippet#expandable()
      return "\<Plug>(neosnippet_expand)"
    elseif neosnippet#jumpable()
      return "\<Plug>(neosnippet_jump)"
    else
      return deoplete#close_popup()
    endif
  else
    return "\<Plug>delimitMateCR"
  endif
endfunction
imap <expr><CR> <SID>neosnippet_expand()

function! s:neosnippet_jump()
  if pumvisible()
    return "\<C-n>"
  elseif neosnippet#jumpable()
    return "\<Plug>(neosnippet_jump)"
  else
    return "\<TAB>"
  endif
endfunction
imap <expr><TAB> <SID>neosnippet_jump()
smap <expr><TAB> <SID>neosnippet_jump()

" ====================== nerdtree ======================
let g:NERDTreeAutoDeleteBuffer = 1
let g:NERDTreeBookmarksFile = $HOME . '/.config/nvim/NERDTreeBookmarks'
let g:NERDTreeChDirMode = 2
let g:NERDTreeShowLineNumbers = 1
function! s:nerdtree()
  redraw | echohl Debug |
    \ echom index(["\" Press ? for help", "", ".. (up a dir)"], getline(".")) < 0 ?
    \ "NERDTree: " . matchstr(getline("."), "[0-9A-Za-z_/].*") : "" | echohl None
endfunction
autocmd CursorMoved NERD_tree* call <SID>nerdtree()
nnoremap <leader>n :NERDTreeToggle<CR>

" ================ nerdtree-git-plugin =================
let g:NERDTreeIndicatorMapCustom = {
      \ "Modified"  : "~",
      \ "Staged"    : "+",
      \ "Untracked" : "≠",
      \ "Renamed"   : "→",
      \ "Unmerged"  : "=",
      \ "Deleted"   : "×",
      \ "Dirty"     : "~",
      \ "Clean"     : "√",
      \ "Unknown"   : "?"
      \ }
hi def link NERDTreeOpenable Title
hi def link NERDTreeClosable Title

" ===================== vim-airline ====================
let g:airline_powerline_fonts = 1
let g:airline_theme = 'murmur'
let g:airline#extensions#whitespace#enabled = 0
let g:airline#extensions#default#layout = [
      \ [ 'a', 'b', 'c' ],
      \ [ 'x', 'y', 'z', 'error', 'warning' ]
      \ ]
call airline#parts#define_raw('go', '%#goStatuslineColor#%{go#statusline#Show()}%')
call airline#parts#define_condition('go', '&filetype=="go"')
let g:airline_section_x = airline#section#create(['go'])
function! AirlineInit()
  let g:airline_section_y = airline#section#create(['ffenc', ' %{strftime("%H:%M")}'])
endfunction
autocmd VimEnter * call AirlineInit()

" ================== vim-coffee-script =================
autocmd BufRead,BufNewFile *.cson set ft=coffee

" ==================== vim-gitgutter ===================
let g:gitgutter_max_signs = 10000
let g:gitgutter_sign_column_always = 1

" ======================= vim-go =======================
" Settings
let g:go_auto_type_info = 1
let g:go_def_mapping_enabled = 0
let g:go_fmt_command = "goimports"
let g:go_list_type = "quickfix"
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
let g:go_snippet_engine = "neosnippet"
let g:go_statusline_duration = 10000
let g:go_metalinter_enabled = [
      \ 'deadcode', 'errcheck', 'gas', 'goconst', 'golint', 'gosimple',
      \ 'gotype', 'ineffassign', 'interfacer', 'staticcheck', 'structcheck',
      \ 'unconvert', 'varcheck', 'vet', 'vetshadow',
      \ ]
" Bindings
autocmd FileType go nmap <leader>b  <Plug>(go-build)
autocmd FileType go nmap <leader>i  <Plug>(go-install)
autocmd FileType go nmap <leader>t  <Plug>(go-test)
autocmd FileType go nmap <leader>tc :w<CR><Plug>(go-test-compile)
autocmd FileType go nmap <leader>tf <Plug>(go-test-func)
autocmd FileType go nmap <leader>c  :GoCoverageToggle<CR>
autocmd FileType go nmap <leader>l  <Plug>(go-metalinter)
autocmd FileType go nmap <leader>d  <Plug>(go-def)
autocmd FileType go nmap <leader>ga :GoAlternate!<CR>
autocmd FileType go nmap <leader>gd <Plug>(go-doc)
autocmd FileType go nmap <leader>gg <Plug>(go-generate)
autocmd FileType go nmap <leader>gi <Plug>(go-implements)
autocmd FileType go nmap <leader>gr <Plug>(go-rename)
autocmd FileType go nmap <leader>r  <Plug>(go-referrers)
autocmd FileType go nmap <leader>gm :GoMetaLinter<CR>
autocmd FileType go nmap <leader>gs :GoSameIdsAutoToggle<CR>
autocmd FileType go nmap <C-g> :GoDecls<CR>
autocmd FileType go imap <C-g> <ESC>:GoDecls<CR>
autocmd FileType go nmap © :GoDeclsDir<CR>
autocmd FileType go imap © <ESC>:GoDeclsDir<CR>

" ==================== vim-hardtime ====================
let g:hardtime_allow_different_key = 1
let g:hardtime_default_on = 1
let g:hardtime_ignore_buffer_patterns = [ "NERD.*" ]
let g:hardtime_ignore_quickfix = 1
let g:hardtime_maxcount = 3
let g:hardtime_showmsg = 1

" ====================== vim-json ======================
let g:vim_json_syntax_conceal = 0
" Prettify JSON, install: brew install yajl
command! JSONFormat %!json_reformat
command! JSONMinimize %!json_reformat -m

" ===================== vim-octave =====================
autocmd BufRead,BufNewFile *.m,*.oct set filetype=octave

" ===================== vim-rooter =====================
let g:rooter_change_directory_for_non_project_files = 'current'
let g:rooter_silent_chdir = 1
let g:rooter_use_lcd = 1

" ===================== vim-session ====================
let g:session_directory = '~/.config/nvim/sessions'
let g:session_autoload = 'no'
let g:session_autosave = 'yes'
let g:session_lock_enabled = 0
nnoremap so :OpenSession
nnoremap ss :SaveSession
nnoremap sc :CloseSession<CR>

" ====================== vim-qf ========================
let g:qf_mapping_ack_style = 1
let g:qf_auto_open_quickfix = 0
let g:qf_auto_open_loclist = 0
nmap <C-n> <Plug>(qf_qf_previous)
nmap <C-m> <Plug>(qf_qf_next)
nmap <leader>a <Plug>(qf_qf_toggle)

" ===================== vim-surround ===================
let g:surround_no_insert_mappings = 1

" ----------------------------------------- "
" Some helpful functions and key bindings   "
" ----------------------------------------- "

" ================= auto resize windows ================
autocmd VimResized * :wincmd =

" =============== fast saving and closing ==============
nnoremap <leader>w :w<CR>
nnoremap <leader>q :q<CR>

" ================== fix generic typos =================
command! -bang WQA wq<bang>
command! -bang WQa wq<bang>
command! -bang Wqa wq<bang>
command! -bang QA qa<bang>
command! -bang Qa qa<bang>
command! -bang WQ wq<bang>
command! -bang Wq wq<bang>
command! -bang Q q<bang>
command! -bang W w<bang>

" ========== make pasting work more naturally ==========
xnoremap p "_d"0P

" ================= move visual lines ==================
" nnoremap j gj
" nnoremap k gk
" vnoremap j gj
" vnoremap k gk

" ================ toggle spell checking ===============
nmap <silent> <leader>s :set spell!<CR>

" ================ remove search highlight =============
nnoremap <leader><space> :nohlsearch<CR>

" ====================== terminal ======================
let g:terminal_scrollback_buffer_size = 100000
autocmd BufWinEnter,WinEnter term://* startinsert
tnoremap <ESC> <C-\><C-n>
noremap <C-f>s :new<CR><ESC>:term<CR>
noremap <C-f>v :bo vnew<CR><ESC>:term<CR>
tnoremap <C-f>s <c-\><C-n>:new<CR><ESC>:term<CR>
tnoremap <C-f>v <c-\><C-n>:vnew<CR><ESC>:term<CR>

" ================= trailing whitespace ================
function! s:StripTrailingWhitespaces()
  if &ft =~ 'go'
    return
  endif
  let _s=@/
  let l = line(".")
  let c = col(".")
  %s/\s\+$//e
  let @/=_s
  call cursor(l, c)
endfunction
autocmd BufWritePre * :call <SID>StripTrailingWhitespaces()

" =============== write and close buffer ===============
" make a function that detects if were in a terminal of not
cnoreabbrev x update<bar>BD

" ================== window switching ==================
inoremap <C-h> <ESC><C-w>h
inoremap <C-j> <ESC><C-w>j
inoremap <C-k> <ESC><C-w>k
inoremap <C-l> <ESC><C-w>l
tnoremap <C-h> <C-\><C-n><C-w>h
tnoremap <C-j> <C-\><C-n><C-w>j
tnoremap <C-k> <C-\><C-n><C-w>k
tnoremap <C-l> <C-\><C-n><C-w>l
vnoremap <C-h> <ESC><C-w>h
vnoremap <C-j> <ESC><C-w>j
vnoremap <C-k> <ESC><C-w>k
vnoremap <C-l> <ESC><C-w>l

" ============== window switching by number ============
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
