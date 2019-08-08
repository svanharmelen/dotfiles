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
Plug 'google/vim-searchindex'
Plug 'fatih/vim-go', {'frozen': 1}
Plug 'junegunn/fzf.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'qpkorr/vim-bufkill'
Plug 'raimondi/delimitmate'
Plug 'scrooloose/nerdtree'
Plug 'svanharmelen/molokai'
Plug 'svanharmelen/vim-session'
Plug 'svanharmelen/vim-tmux-navigator'
Plug 'takac/vim-hardtime'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tweekmonster/fzf-filemru'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'xolox/vim-misc'
Plug 'xuyuanp/nerdtree-git-plugin'

" Syntax related plugins
Plug 'elzr/vim-json', {'for': 'json'}
Plug 'ekalinin/Dockerfile.vim', {'for': 'Dockerfile'}
Plug 'hashivim/vim-terraform'
Plug 'leafgarland/typescript-vim'
Plug 'othree/html5.vim'
Plug 'pangloss/vim-javascript'
Plug 'plasticboy/vim-markdown'
Plug 'rust-lang/rust.vim'
Plug 'tmux-plugins/vim-tmux', {'for': 'tmux'}
Plug 'tpope/vim-rails'
Plug 'vim-ruby/vim-ruby'

call plug#end()

" Set custom key bindings
let mapleader = ' '
let g:mapleader = ' '

" General settings
set autoread                         " Automatically reload files when changed outside vim
set breakat=,)                       " Break lines at specific characters only
set clipboard^=unnamed               " Copy selected text to the system clipboard
set cmdheight=1                      " Force the command height to 1
set colorcolumn=100                  " Highlight 100 character limits
set completeopt-=preview             " Do not show completion options in the preview window
set diffopt+=vertical                " Make diffs split vertically
set hidden                           " Allow buffers to be backgrounded without being saved
set inccommand=nosplit               " Live update (preview) substitutions
set linebreak                        " Break lines at `breakat` characters only
set list                             " Show invisible characters
set listchars=tab:┊\                 " Set the characters for the invisibles
set noshowmode                       " We show the current mode with airline
set number                           " Show the absolute line number the cursor is on
set mouse-=a                         " Disable mouse clicks to go to a position
set relativenumber                   " Show relative line numbers
set runtimepath+=/usr/local/opt/fzf  " Add the fzf binary to the runtime path
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
set wildignore+=*.jpg,*.bmp,*.gif,*.png,*.jpeg   " binary images
set wildignore+=*.o,*.obj,*.exe,*.dll,*.manifest " compiled object files
set wildignore+=*.spl                            " compiled spelling word lists
set wildignore+=*.sw?                            " Vim swap files
set wildignore+=*.DS_Store                       " OSX bullshit
set wildignore+=*.luac                           " Lua byte code
set wildignore+=go/pkg                           " Go static files
set wildignore+=go/bin                           " Go bin files
set wildignore+=go/bin-vagrant                   " Go bin-vagrant files
set wildignore+=*.pyc                            " Python byte code
set wildignore+=*.orig                           " Merge resolution files

" Configure the look and feel
let g:molokai_original = 1
colorscheme molokai

" Config Python used by Neovim
let g:loaded_python_provider = 1
let g:python3_host_prog = '/usr/local/bin/python3'

" Config Ruby used by Neovim
let g:loaded_ruby_provider = 1

" Config Node used by Neovim
let g:loaded_node_provider = 1

" ----------------------------------------- "
" Plugin configs                            "
" ----------------------------------------- "

" ====================== coc.nvim ======================
" Settings
let g:coc_global_extensions = [
  \ 'coc-json',
  \ 'coc-snippets',
  \ 'coc-tslint-plugin',
  \ 'coc-tsserver'
  \]
let g:coc_selectmode_mapping = 0
hi CocErrorSign   ctermfg=15 ctermbg=236
hi CocHintSign    ctermfg=15 ctermbg=236
hi CocInfoSign    ctermfg=15 ctermbg=236
hi CocWarningSign ctermfg=15 ctermbg=236
hi default link CocHintFloat Pmenu
hi default link CocInfoFloat Pmenu
hi default link CocErrorFloat Pmenu
hi default link CocWarningFloat Pmenu
" Bindings
nmap <silent> <leader>df <Plug>(coc-definition)
nmap <silent> <leader>dc <Plug>(coc-declaration)
nmap <silent> <leader>im <Plug>(coc-implementation)
nmap <silent> <leader>td <Plug>(coc-type-definition)
nmap <silent> <leader>rf <Plug>(coc-references)
nmap <silent> <leader>rn <Plug>(coc-rename)

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:CocExpand()
  if pumvisible()
    if coc#expandableOrJumpable()
      return "\<Plug>(coc-snippets-expand-jump)"
    else
      return "\<C-y>"
    endif
  else
    return "\<Plug>delimitMateCR"
  endif
endfunction
imap <expr><CR> <SID>CocExpand()

function! s:CocJump()
  if pumvisible()
    return "\<C-n>"
  elseif coc#jumpable()
    return coc#rpc#request('snippetNext', [])
  else
    return "\<TAB>"
  endif
endfunction
imap <expr><TAB> <SID>CocJump()
smap <expr><TAB> <SID>CocJump()

function! s:CocJumpBack()
  if pumvisible()
    return "\<C-p>"
  elseif coc#jumpable()
    return coc#rpc#request('snippetPrev', [])
  else
    return "\<S-TAB>"
  endif
endfunction
imap <expr><S-TAB> <SID>CocJumpBack()
smap <expr><S-TAB> <SID>CocJumpBack()

" ===================== delimitmate ====================
let g:delimitMate_balance_matchpairs = 1
let g:delimitMate_expand_cr = 1
let g:delimitMate_expand_space = 1
let g:delimitMate_expand_inside_quotes = 0
let g:delimitMate_insert_eol_marker = 0

" ====================== fugitive ======================
nnoremap <leader>fb :Gblame<CR>
nnoremap <leader>fo :Gbrowse<CR>
nnoremap <leader>fu :Gbrowse!<CR>
nnoremap <leader>fd :Gdiff<CR>
nnoremap <leader>fl :Glog! -- %<CR>
if &diff
  nnoremap <silent> db :diffget BASE<Bar>diffupdate<CR>
  nnoremap <silent> dl :diffget LOCAL<Bar>diffupdate<CR>
  nnoremap <silent> dr :diffget REMOTE<Bar>diffupdate<CR>
  nnoremap <silent> dg :diffget<Bar>diffupdate<CR>
  nnoremap <silent> dr :diffput<Bar>diffupdate<CR>
endif

" ======================== fzf =========================
let g:fzf_action = {
  \ 'ctrl-s': 'split',
  \ 'ctrl-v': 'vsplit'
  \ }
let g:fzf_layout = { 'down': '~30%' }
let $FZF_DEFAULT_COMMAND='ag --hidden --ignore=.git -g ""'
let $FZF_DEFAULT_OPTS='-e --bind ctrl-a:select-all'

command! -bang -nargs=* Ag
  \ call fzf#vim#ag(<q-args>, '--color-match="1;31"',
  \ fzf#vim#with_preview('right:50%:hidden', '?'), <bang>0)

nnoremap <silent><C-P> :FilesMru<CR>
nnoremap <leader>ff :Ag<Space>

" ====================== nerdtree ======================
let g:NERDTreeAutoDeleteBuffer = 1
let g:NERDTreeBookmarksFile = $HOME . '/.config/nvim/NERDTreeBookmarks'
let g:NERDTreeChDirMode = 2
let g:NERDTreeShowLineNumbers = 1
function! s:ShowFilename()
  redraw | echohl Debug |
    \ echom index(['" Press ? for help', '', '.. (up a dir)'], getline('.')) < 0 ?
    \ 'NERDTree: ' . matchstr(getline('.'), '[0-9A-Za-z_/].*') : '' | echohl None
endfunction
autocmd CursorMoved NERD_tree* :call <SID>ShowFilename()
nnoremap <leader>n :NERDTreeToggle<CR>

" ================ nerdtree-git-plugin =================
let g:NERDTreeIndicatorMapCustom = {
  \ 'Modified'  : '~',
  \ 'Staged'    : '+',
  \ 'Untracked' : '≠',
  \ 'Renamed'   : '→',
  \ 'Unmerged'  : '=',
  \ 'Deleted'   : '×',
  \ 'Dirty'     : '~',
  \ 'Clean'     : '√',
  \ 'Unknown'   : '?'
  \ }
hi def link NERDTreeOpenable Title
hi def link NERDTreeClosable Title

" ====================== rust.vim ======================
" Settings
let g:rustfmt_autosave = 1
let g:rustfmt_fail_silently = 1
let g:rust_clip_command = 'pbcopy'
" Bindings
autocmd FileType rust nmap <silent> <leader>t  :RustTest<CR>
autocmd FileType rust nmap <silent> <leader>tf :RustTest!<CR>

" ===================== vim-airline ====================
let g:airline_focuslost_inactive=1
let g:airline_powerline_fonts = 1
let g:airline_theme = 'murmur'
let g:airline#extensions#coc#enabled = 1
let g:airline#extensions#whitespace#enabled = 0
let g:airline#extensions#default#layout = [
  \ [ 'a', 'b', 'c' ],
  \ [ 'x', 'y', 'z', 'error', 'warning' ]
  \ ]

" =================== vim-gitgutter ====================
let g:gitgutter_max_signs = 1000
hi GitGutterAdd    ctermfg=2 ctermbg=236
hi GitGutterChange ctermfg=3 ctermbg=236
hi GitGutterDelete ctermfg=1 ctermbg=236

" ====================== vim-go ========================
" Settings
let g:go_decls_mode = 'fzf'
let g:go_def_mapping_enabled = 0
let g:go_doc_keywordprg_enabled = 0
let g:go_fmt_command = 'goimports'
let g:go_fmt_fail_silently = 1
let g:go_code_completion_enabled = 0
let g:go_list_type = 'quickfix'
let g:go_highlight_build_constraints = 1
let g:go_highlight_generate_tags = 1
let g:go_highlight_functions = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_operators = 1
let g:go_statusline_duration = 10000
" Bindings
autocmd FileType go nmap <leader>b  <Plug>(go-build)
autocmd FileType go nmap <leader>t  <Plug>(go-test)
autocmd FileType go nmap <leader>tc <Plug>(go-test-compile)
autocmd FileType go nmap <leader>tf <Plug>(go-test-func)
autocmd FileType go nmap <Leader>c  <Plug>(go-coverage-toggle)
autocmd FileType go nmap <leader>ga :GoAlternate!<CR>
autocmd FileType go nmap <leader>gg <Plug>(go-generate)
autocmd FileType go nmap <C-g> :GoDecls<CR>
autocmd FileType go imap <C-g> <ESC>:GoDecls<CR>
autocmd FileType go nmap © :GoDeclsDir<CR>
autocmd FileType go imap © <ESC>:GoDeclsDir<CR>
autocmd FileType go nmap <leader>fs :GoFillStruct<CR>
" autocmd BufWritePre *.go :call CocAction('runCommand', 'editor.action.organizeImport')

" ==================== vim-hardtime ====================
let g:hardtime_allow_different_key = 1
let g:hardtime_default_on = 1
let g:hardtime_ignore_buffer_patterns = [ "NERD.*" ]
let g:hardtime_ignore_quickfix = 1
let g:hardtime_maxcount = 3
let g:hardtime_showmsg = 1

" ===================== vim-json =======================
let g:vim_json_syntax_conceal = 0
" Prettify JSON, install: brew install yajl
command! JSONFormat %!json_reformat
command! JSONMinimize %!json_reformat -m

" ==================== vim-markdown ====================
let g:vim_markdown_conceal = 0
let g:vim_markdown_conceal_code_blocks = 0
let g:vim_markdown_folding_disabled = 1

" ==================== vim-rooter ======================
let g:rooter_change_directory_for_non_project_files = 'current'
let g:rooter_silent_chdir = 1
let g:rooter_use_lcd = 1

" ==================== vim-session =====================
let g:session_directory = '~/.config/nvim/sessions'
let g:session_autoload = 'no'
let g:session_autosave = 'yes'
let g:session_lock_enabled = 0
nnoremap so :OpenSession
nnoremap ss :SaveSession
nnoremap sc :CloseSession<CR>

" =================== vim-surround =====================
let g:surround_no_insert_mappings = 1

" =================== vim-terraform ====================
let g:terraform_fmt_on_save = 1

" ----------------------------------------- "
" Some helpful functions and key bindings   "
" ----------------------------------------- "

" ================= auto reload buffers ================
autocmd FocusGained,BufEnter,CursorHold * :checktime

" ================= auto resize windows ================
autocmd VimResized * :wincmd =

nnoremap <leader>w :w<CR>
nnoremap <leader>q :q<CR>

" =============== find next merge conflict =============
function! s:NextMergeConflict(reverse)
  if !search('^\(@@ .* @@\|[<=>|]\{7}[<=>|]\@!\)', a:reverse ? 'bW' : 'W')
    echo 'No merge conflicts found.'
  endif
endfunction
nmap <silent> ]n :call <SID>NextMergeConflict(0)<CR>
nmap <silent> [n :call <SID>NextMergeConflict(1)<CR>

" ================== fix generic typos =================
command! -bang WQA wqa<bang>
command! -bang WQa wqa<bang>
command! -bang Wqa wqa<bang>
command! -bang QA qa<bang>
command! -bang Qa qa<bang>
command! -bang WQ wq<bang>
command! -bang Wq wq<bang>
command! -bang Q q<bang>
command! -bang W w<bang>

" ============== overwrite read only files =============
cnoremap w!! execute 'silent! write !sudo tee % >/dev/null' <Bar> edit!

" ============== paste over selected test ==============
xnoremap p "_dP

" ================= quickfix settings ==================
autocmd FileType qf wincmd J

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
  call CocActionAsync('diagnosticPrevious')
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
  call CocActionAsync('diagnosticNext')
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
  let s:return_to_window = winnr()
  let buflist = s:GetBufferList()
  for bufnum in map(filter(split(buflist, '\n'), 'v:val =~ "'.a:bufname.'"'), 'str2nr(matchstr(v:val, "\\d\\+"))')
    if bufwinnr(bufnum) != -1
      exec a:pfx.'close'
      if s:return_to_window <= winnr('$')
        exec s:return_to_window . 'wincmd w'
      endif
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
  exec a:pfx.'open ' . s:Height(height)
  if s:return_to_window <= winnr('$')
    exec s:return_to_window . 'wincmd w'
  endif
endfunction

nnoremap <silent> <C-n> :call <SID>LocationPrevious()<CR>
nnoremap <silent> <C-m> :call <SID>LocationNext()<CR>
nnoremap <silent> <leader>a :call <SID>LocationToggle('Quickfix List', 'c')<CR>
nnoremap <silent> <leader>l :call <SID>LocationToggle('Location List', 'l')<CR>

" ================ remove search highlight =============
nnoremap <silent> <leader><space> :nohlsearch<Bar>pclose!<CR>

" ================= trailing whitespace ================
function! s:StripTrailingWhitespaces()
  if &ft =~ 'go'
    return
  endif
  let _s=@/
  let l = line('.')
  let c = col('.')
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
vnoremap <C-h> <ESC><C-w>h
vnoremap <C-j> <ESC><C-w>j
vnoremap <C-k> <ESC><C-w>k
vnoremap <C-l> <ESC><C-w>l

" ================ toggle spell checking ===============
nmap <silent> <leader>s :set spell!<CR>

" ============== window switching by number ============
let i = 1
while i <= 9
  execute 'nnoremap <leader>' . i . ' :' . i . 'wincmd w<CR>'
  let i = i + 1
endwhile
