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
Plug 'fatih/vim-go', {'tag': '*'}
Plug 'mileszs/ack.vim'
Plug 'plytophogy/vim-virtualenv'
Plug 'qpkorr/vim-bufkill'
Plug 'raimondi/delimitmate'
Plug 'scrooloose/nerdtree'
Plug 'shougo/deoplete.nvim', {'do': ':UpdateRemotePlugins'}
Plug 'shougo/neosnippet'
Plug 'shougo/vimproc.vim', {'do': 'make'}
Plug 'svanharmelen/molokai'
Plug 'svanharmelen/vim-session'
Plug 'takac/vim-hardtime'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'w0rp/ale'
Plug 'xolox/vim-misc'
Plug 'xuyuanp/nerdtree-git-plugin'
Plug 'zchee/deoplete-go', {'do': 'make'}
Plug 'zchee/deoplete-jedi'

" Syntax related plugins
Plug 'elzr/vim-json', {'for': 'json'}
Plug 'ekalinin/Dockerfile.vim', {'for': 'Dockerfile'}
Plug 'hashivim/vim-hashicorp-tools'
Plug 'othree/html5.vim'
Plug 'pangloss/vim-javascript'
Plug 'plasticboy/vim-markdown'
Plug 'jvirtanen/vim-octave'
Plug 'kchmck/vim-coffee-script'
Plug 'tmux-plugins/vim-tmux', {'for': 'tmux'}
Plug 'vim-ruby/vim-ruby'

call plug#end()

" Set custom key bindings
let mapleader = ' '
let g:mapleader = ' '

" General setting
set autoread                         " Automatically reload files when changed outside vim
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
set signcolumn=yes                   " Always show the sign column
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

" Config python used by Neovim
let g:loaded_python_provider = 1
let g:python3_host_prog = '/usr/local/bin/python3'

" ----------------------------------------- "
" Plugin configs                            "
" ----------------------------------------- "

" ======================== ale ========================
let g:ale_linters = {
  \ 'go': ['gometalinter'],
  \ 'html': [],
  \ 'javascript': ['eslint'],
  \ 'python': ['flake8']
  \ }
let g:ale_go_gometalinter_options = '
  \ --aggregate
  \ --disable=gas
  \ --disable=goconst
  \ --disable=gocyclo
  \ --fast
  \ --sort=line
  \ --tests
  \ --vendor
  \ '
let g:ale_python_flake8_options = '
  \ --ignore=E226,E501
  \ '
let g:ale_set_highlights = 0
let g:ale_set_signs = 1
let g:ale_sign_column_always = 1
let g:ale_sign_error = '✖'
let g:ale_sign_warning = '⚠'
let g:ale_warn_about_trailing_whitespace = 0
hi ALEErrorSign   ctermfg=15 ctermbg=236
hi ALEInfoSign    ctermfg=15 ctermbg=236
hi ALEWarningSign ctermfg=15 ctermbg=236

" ====================== ack.vim ======================
let g:ackprg = 'pt --nogroup --ignore=vendor --smart-case -e'
let g:ackhighlight = 1
cnoreabbrev Ack Ack!
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
let g:delimitMate_balance_matchpairs = 1
let g:delimitMate_expand_cr = 1
let g:delimitMate_expand_space = 1
let g:delimitMate_expand_inside_quotes = 0
let g:delimitMate_insert_eol_marker = 0

" ====================== deoplete ======================
let g:deoplete#enable_at_startup = 1
let g:deoplete#ignore_sources = {}
let g:deoplete#ignore_sources._ = ['member', 'tag']
let g:deoplete#max_list = 30
let g:deoplete#sources#go#align_class = 1
let g:deoplete#sources#go#sort_class = ['package', 'func', 'var', 'type', 'const']
call deoplete#custom#source('_', 'converters', ['converter_remove_overlap'])
call deoplete#custom#source('_', 'matchers', ['matcher_fuzzy', 'matcher_length'])
" call deoplete#custom#source('go,neosnippet', 'disabled_syntaxes', ['Comment', 'String'])
imap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<S-TAB>"

" ====================== fugitive ======================
nnoremap <leader>fb :Gblame<CR>
nnoremap <leader>fs :Gbrowse<CR>
nnoremap <leader>fc :Gcommit -am
nnoremap <leader>fd :Gdiff<CR>
nnoremap <leader>fl :Glog<CR>
nnoremap <leader>fp :Gpush<CR>

" ===================== neosnippet =====================
let g:neosnippet#enable_completed_snippet = 1
let g:neosnippet#disable_runtime_snippets = {'_' : 1}
function! s:NeosnippetExpand()
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
imap <expr><CR> <SID>NeosnippetExpand()

function! s:NeosnippetJump()
  if pumvisible()
    return "\<C-n>"
  elseif neosnippet#jumpable()
    return "\<Plug>(neosnippet_jump)"
  else
    return "\<TAB>"
  endif
endfunction
imap <expr><TAB> <SID>NeosnippetJump()
smap <expr><TAB> <SID>NeosnippetJump()

" ====================== nerdtree ======================
let g:NERDTreeAutoDeleteBuffer = 1
let g:NERDTreeBookmarksFile = $HOME . '/.config/nvim/NERDTreeBookmarks'
let g:NERDTreeChDirMode = 2
let g:NERDTreeShowLineNumbers = 1
function! s:ShowFilename()
  redraw | echohl Debug |
    \ echom index(["\" Press ? for help", "", ".. (up a dir)"], getline(".")) < 0 ?
    \ "NERDTree: " . matchstr(getline("."), "[0-9A-Za-z_/].*") : "" | echohl None
endfunction
autocmd CursorMoved NERD_tree* :call <SID>ShowFilename()
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
function! s:AirlineInit()
  let g:airline_section_y = airline#section#create(['ffenc', ' %{strftime("%H:%M")}'])
endfunction
autocmd VimEnter * :call <SID>AirlineInit()

" ================== vim-coffee-script =================
autocmd BufRead,BufNewFile *.cson set ft=coffee

" ==================== vim-gitgutter ===================
let g:gitgutter_max_signs = 1000

" ======================= vim-go =======================
" Settings
let g:go_def_mapping_enabled = 0
let g:go_fmt_command = "goimports"
let g:go_fmt_fail_silently = 1
let g:go_list_type = "quickfix"
let g:go_highlight_build_constraints = 1
let g:go_highlight_generate_tags = 1
let g:go_highlight_functions = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_operators = 1
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
autocmd FileType go nmap <leader>tc <Plug>(go-test-compile)
autocmd FileType go nmap <leader>tf <Plug>(go-test-func)
autocmd FileType go nmap <Leader>c  <Plug>(go-coverage-toggle)
autocmd FileType go nmap <leader>gm <Plug>(go-metalinter)
autocmd FileType go nmap <leader>d  <Plug>(go-def)
autocmd FileType go nmap <leader>ga :GoAlternate!<CR>
autocmd FileType go nmap <leader>gd <Plug>(go-doc)
autocmd FileType go nmap <leader>gg <Plug>(go-generate)
autocmd FileType go nmap <leader>gi <Plug>(go-info)
autocmd FileType go nmap <leader>gr <Plug>(go-rename)
autocmd FileType go nmap <leader>r  <Plug>(go-referrers)
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

" ==================== vim-markdown ====================
let g:vim_markdown_folding_disabled = 1

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

" ===================== vim-surround ===================
let g:surround_no_insert_mappings = 1

" ==================== vim-virtualenv ==================
let g:virtualenv_directory = '~/Python'

" ----------------------------------------- "
" Some helpful functions and key bindings   "
" ----------------------------------------- "

" ================= auto reload buffers ================
autocmd FocusGained,BufEnter,CursorHold * :checktime

" ================= auto resize windows ================
autocmd VimResized * :wincmd =

" =============== fast saving and closing ==============
nnoremap <leader>w :w<CR>
nnoremap <leader>q :q<CR>

" =============== find next merge conflict =============
function! s:NextMergeConflict(reverse)
  call search('^\(@@ .* @@\|[<=>|]\{7}[<=>|]\@!\)', a:reverse ? 'bW' : 'W')
endfunction
nmap ]n :call <SID>NextMergeConflict(0)<CR>
nmap [n :call <SID>NextMergeConflict(1)<CR>

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

" ================ toggle spell checking ===============
nmap <silent> <leader>s :set spell!<CR>

" ================= quickfix settings ==================
autocmd FileType qf wincmd J
let s:return_to_window = winnr()

function! s:GetBufferList()
  redir =>buflist
  silent! ls!
  redir END
  return buflist
endfunction

function! s:LocationPrevious()
  let buflist = s:GetBufferList()
  for bufnum in map(filter(split(buflist, '\n'), 'v:val =~ "Quickfix List"'), 'str2nr(matchstr(v:val, "\\d\\+"))')
    if bufwinnr(bufnum) != -1
      try
        cprev
      catch /^Vim\%((\a\+)\)\=:E553/
        clast
      catch /^Vim\%((\a\+)\)\=:E\%(776\|42\):/
      endtry
      return
    endif
  endfor
  try
    lprev
  catch /^Vim\%((\a\+)\)\=:E553/
    llast
  catch /^Vim\%((\a\+)\)\=:E\%(776\|42\):/
  endtry
endfunction

function! s:LocationNext()
  let buflist = s:GetBufferList()
  for bufnum in map(filter(split(buflist, '\n'), 'v:val =~ "Quickfix List"'), 'str2nr(matchstr(v:val, "\\d\\+"))')
    if bufwinnr(bufnum) != -1
      try
        cnext
      catch /^Vim\%((\a\+)\)\=:E553/
        cfirst
      catch /^Vim\%((\a\+)\)\=:E\%(776\|42\):/
      endtry
      return
    endif
  endfor
  try
    lnext
  catch /^Vim\%((\a\+)\)\=:E553/
    lfirst
  catch /^Vim\%((\a\+)\)\=:E\%(776\|42\):/
  endtry
endfunction

function! s:Height(height)
  if a:height == 1
    return 2
  elseif a:height > 10
    return 10
  else
    return a:height
  endif
endfunction

function! s:LocationToggle(bufname, pfx)
  let buflist = s:GetBufferList()
  for bufnum in map(filter(split(buflist, '\n'), 'v:val =~ "'.a:bufname.'"'), 'str2nr(matchstr(v:val, "\\d\\+"))')
    if bufwinnr(bufnum) != -1
      exec a:pfx.'close'
      exec s:return_to_window . 'wincmd w'
      return
    endif
  endfor
  if a:pfx == 'c'
    let height = len(getqflist())
    if height == 0
      echo 'Quickfix List is Empty.'
      return
    endif
  endif
  if a:pfx == 'l'
    let height = len(getloclist(0))
    if height == 0
      echo 'Location List is Empty.'
      return
    endif
  endif
  let s:return_to_window = winnr()
  exec a:pfx.'open ' . s:Height(height)
  exec s:return_to_window . 'wincmd w'
endfunction

nnoremap <silent> <C-n> :call <SID>LocationPrevious()<CR>
nnoremap <silent> <C-m> :call <SID>LocationNext()<CR>
nnoremap <silent> <leader>a :call <SID>LocationToggle("Quickfix List", 'c')<CR>
nnoremap <silent> <leader>l :call <SID>LocationToggle("Location List", 'l')<CR>

" ================ remove search highlight =============
nnoremap <leader><space> :nohlsearch<CR>

" ====================== terminal ======================
let $EDITOR = 'nvr --remote-wait'
let $VISUAL = 'nvr --remote-wait'
let $FZF_DEFAULT_OPTS .= ' --no-height'
let g:terminal_scrollback_buffer_size = 100000
function! TweakTerminal()
  setlocal norelativenumber
  setlocal nonumber
  setlocal scrollback=100000
  startinsert
endfunc
autocmd TermOpen * :call TweakTerminal()
autocmd BufEnter * if &buftype == 'terminal' | startinsert | endif
autocmd TermClose * bd!
tnoremap <ESC> <C-\><C-n>
noremap <C-f>s :new +term<CR>
noremap <C-f>v :bo vnew +term<CR>
tnoremap <C-f>s <c-\><C-n>:new +term<CR>
tnoremap <C-f>v <c-\><C-n>:vnew +term<CR>

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
