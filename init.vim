"   1. Install the accompanying powerline patched font (or create your own)
"   2. Run the following commands in terminal:
"      mkdir -p ~/.config/nvim/after/plugin ~/.config/nvim/backup ~/.config/nvim/cache ~/.config/nvim/undo
"      curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
"   3. Link this file in your nvim config directory as ~/.config/nvim/init.vim
"   4. Link disable_mappings.vim to ~/.config/nvim/after/plugin/disable_mappings.vim
"   5. Launch nvim and Run:
"      :PlugInstall
"   6. Restart nvim

call plug#begin('~/.config/nvim/plugged')

" Add plugins
Plug 'airblade/vim-gitgutter'
Plug 'airblade/vim-rooter'
Plug 'christoomey/vim-tmux-navigator'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'edkolev/tmuxline.vim'
Plug 'elzr/vim-json'
Plug 'fatih/vim-go'
Plug 'hashivim/vim-terraform'
Plug 'jvirtanen/vim-octave'
Plug 'kchmck/vim-coffee-script'
Plug 'majutsushi/tagbar'
Plug 'nvie/vim-flake8'
Plug 'qpkorr/vim-bufkill'
Plug 'raimondi/delimitmate'
Plug 'rking/ag.vim'
Plug 'scrooloose/nerdtree'
Plug 'shougo/deoplete.nvim'
Plug 'shougo/vimproc.vim', { 'do': 'make' }
Plug 'svanharmelen/molokai'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'wesq3/vim-windowswap'
Plug 'xolox/vim-session'
Plug 'xolox/vim-misc'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'xuyuanp/nerdtree-git-plugin'
Plug 'zchee/deoplete-go', { 'do': 'make' }

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
set linebreak                        " Break lines at `breakat` characters only
set list                             " Show invisible characters
set listchars=tab:▸\ ,eol:¬          " Set the characters for the invisibles
set noshowmode                       " We show the current mode with airline
set number                           " Show the absolute line number the cursor is on
set relativenumber                   " Show relative line numbers
set scrolloff=999                    " Keep the cursor centered
set sessionoptions-=help             " Do not save help windows
set sessionoptions-=buffers          " Do not save hidden and uploaded buffers
set shortmess+=c                     " Silent short messages from deoplete.nvim
set showbreak=>>>                    " Show clearly were linebreaks are applied
set spelllang=en_us                  " Set default spell check language to English US
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
let g:molokai_original = 1
colorscheme molokai

" ----------------------------------------- "
" Plugin configs                            "
" ----------------------------------------- "

" ======================= CtrlP =======================
let g:ctrlp_cmd = 'CtrlPMRU'
let g:ctrlp_cache_dir = '~/.config/nvim/ctrlp'
let g:ctrlp_clear_cache_on_exit = 0
let g:ctrlp_max_files = 0         " do not limit the number of searchable files
let g:ctrlp_max_height = 10       " maxiumum height of match window
let g:ctrlp_mruf_max = 500        " number of recently opened files
let g:ctrlp_mruf_relative = 1     " show only MRU files in the working directory
let g:ctrlp_switch_buffer = 0     " open file in the current buffer
let g:ctrlp_use_caching = 1
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_buftag_types = {'go' : '--language-force=go --golang-types=ftv'}

" ===================== delimitmate ====================
let g:delimitMate_expand_cr = 1
let g:delimitMate_expand_space = 1
let g:delimitMate_smart_quotes = 1
let g:delimitMate_expand_inside_quotes = 0
let g:delimitMate_smart_matchpairs = '^\%(\w\|\$\)'
imap <expr><CR> pumvisible() ? "\<C-y>" : "\<Plug>delimitMateCR"

" ====================== deoplete ======================
let g:deoplete#enable_at_startup = 1
let g:deoplete#ignore_sources = {}
let g:deoplete#ignore_sources._ = ['member', 'tag']
let g:deoplete#max_list = 30
let g:deoplete#sources#go#align_class = 1
let g:deoplete#sources#go#sort_class = ['package', 'func', 'var', 'type', 'const']
call deoplete#custom#set('_', 'converters', ['converter_remove_overlap'])
imap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
imap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<S-TAB>"

" ====================== fugitive ======================
nnoremap <leader>fb :Gblame<CR>
nnoremap <leader>fd :Gdiff<CR>

" ====================== nerdtree ======================
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

" ===================== vim-airline ====================
let g:airline_powerline_fonts = 1
let g:airline_theme = 'murmur'
let g:airline#extensions#whitespace#enabled = 0
let g:airline#extensions#default#layout = [
      \ [ 'a', 'b', 'c' ],
      \ [ 'y', 'z', 'error', 'warning' ]
      \ ]
function! AirlineInit()
  let g:airline_section_y = airline#section#create(['ffenc', ' %{strftime("%H:%M")}'])
  let g:airline_section_z = '%{go#jobcontrol#Statusline()}'.g:airline_section_z
endfunction
autocmd VimEnter * call AirlineInit()

" ================== vim-coffee-script =================
au BufRead,BufNewFile *.cson set ft=coffee

" ==================== vim-gitgutter ===================
let g:gitgutter_sign_column_always = 1

" ======================= vim-go =======================
" Settings
let g:go_auto_type_info = 1
let g:go_def_mapping_enabled = 0
let g:go_fmt_command = "goimports"
let g:go_list_type = "quickfix"
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
let g:go_metalinter_deadline = "10s"
let g:go_metalinter_enabled = [
      \ 'vet', 'golint', 'gotype', 'goconst', 'varcheck', 'structcheck',
      \ 'errcheck', 'deadcode', 'ineffassign', 'unconvert', 'interfacer'
      \ ]
" Bindings
au FileType go nmap <leader>r  <Plug>(go-run)
au FileType go nmap <leader>b  <Plug>(go-build)
au FileType go nmap <leader>i  <Plug>(go-install)
au FileType go nmap <leader>t  <Plug>(go-test)
au FileType go nmap <leader>tf <Plug>(go-test-func)
au FileType go nmap <leader>c  <Plug>(go-coverage)
au FileType go nmap <leader>l  <Plug>(go-metalinter)
au FileType go nmap <leader>d  <Plug>(go-def)
au FileType go nmap <leader>ds <Plug>(go-def-split)
au FileType go nmap <leader>dv <Plug>(go-def-vertical)
au FileType go nmap <leader>ga <Plug>(go-alternate-edit)
au FileType go nmap <leader>gd <Plug>(go-doc)
au FileType go nmap <leader>gg <Plug>(go-generate)
au FileType go nmap <leader>gi <Plug>(go-implements)
au FileType go nmap <leader>gr <Plug>(go-rename)
au FileType go nmap <leader>gm :GoMetalinterAutoSaveToggle<CR>
au FileType go nmap <leader>gs :GoSameIdsAutoToggle<CR>
au FileType go nmap <C-g> :GoDecls<CR>
au FileType go imap <C-g> <ESC>:GoDecls<CR>
au FileType go nmap © :GoDeclsDir<CR>
au FileType go imap © <ESC>:GoDeclsDir<CR>

" ====================== vim-json ======================
let g:vim_json_syntax_conceal = 0
" Prettify JSON, install: brew install yajl
command! JSONFormat %!json_reformat
command! JSONMinimize %!json_reformat -m

" ===================== vim-octave =====================
augroup filetypedetect 
  au! BufRead,BufNewFile *.m,*.oct set filetype=octave 
augroup END

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

" ==================== vim-terraform ===================
let g:terraform_fmt_on_save = 1

" ----------------------------------------- "
" Some helpful functions and key bindings   "
" ----------------------------------------- "

" ============= always put quickfix on bottom ==========
autocmd FileType qf wincmd J

" ================= auto resize windows ================
au VimResized * :wincmd =

" ================= disable cursor keys ================
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>

" ================== fix generic typos =================
command WQA wq
command WQa wq
command Wqa wq
command QA qa
command Qa qa
command WQ wq
command Wq wq
command Q q
command W w

" ================= move visual lines ==================
nnoremap j gj
nnoremap k gk
vnoremap j gj
vnoremap k gk

" ================ toggle spell checking ===============
nmap <silent> <leader>s :set spell!<CR>

" ================= quickfix shortcuts =================
function! <SID>LocationPrevious()
  try
    cprev
  catch /^Vim\%((\a\+)\)\=:E553/
    clast
  endtry
endfunction

function! <SID>LocationNext()
  try
    cnext
  catch /^Vim\%((\a\+)\)\=:E553/
    cfirst
  endtry
endfunction

nnoremap <silent> <Plug>LocationPrevious :<C-u>exe 'call <SID>LocationPrevious()'<CR>
nnoremap <silent> <Plug>LocationNext     :<C-u>exe 'call <SID>LocationNext()'<CR>
map <silent> <C-n> <Plug>LocationPrevious
map <silent> <C-m> <Plug>LocationNext
nnoremap <leader>a :cclose<CR>

" ====================== terminal ======================
let g:terminal_scrollback_buffer_size = 100000
autocmd BufWinEnter,WinEnter term://* startinsert
tnoremap <ESC> <C-\><C-n>
noremap <C-f>s :new<CR><ESC>:term<CR>
noremap <C-f>v :bo vnew<CR><ESC>:term<CR>
tnoremap <C-f>s <c-\><C-n>:new<CR><ESC>:term<CR>
tnoremap <C-f>v <c-\><C-n>:vnew<CR><ESC>:term<CR>

" ================= trailing whitespace ================
function! <SID>StripTrailingWhitespaces()
    let _s=@/
    let l = line(".")
    let c = col(".")
    %s/\s\+$//e
    let @/=_s
    call cursor(l, c)
endfunction
autocmd BufWritePre *.py :call <SID>StripTrailingWhitespaces()

" =============== write and close buffer ===============
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
