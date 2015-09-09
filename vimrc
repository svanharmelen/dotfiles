"   1. Place file in home directory as .vimrc
"   2. Install the accompanying powerline patched font to use as non-ASCII font
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
Plugin 'bling/vim-airline'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'fatih/vim-go'
Plugin 'garyburd/go-explorer'
Plugin 'majutsushi/tagbar'
Plugin 'raimondi/delimitmate'
Plugin 'rking/ag.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/syntastic'
Plugin 'sirver/ultisnips'
Plugin 'svanharmelen/molokai'
Plugin 'tomtom/tcomment_vim'
Plugin 'tpope/vim-dispatch'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-repeat'
Plugin 'xolox/vim-session'
Plugin 'xolox/vim-misc'
Plugin 'valloric/youcompleteme'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" General setting
set autoread                         " Reload files that have been modified
set backspace=indent,eol,start       " Makes backspace not behave all retarded-like
set clipboard+=unnamed               " Copy selected text to the system clipboard
set colorcolumn=100                  " Highlight 100 character limits
set conceallevel=2                   " Concealed text is completely hidden
set concealcursor=niv                " Conceal in normal, insert and visual modes
set encoding=utf-8                   " Set default encoding to UTF8"
set hidden                           " Allow buffers to be backgrounded without being saved
set laststatus=2                     " Always show the status bar
set list                             " Show invisible characters
set listchars=tab:▸\ ,eol:¬          " Set the characters for the invisibles
set noshowmode                       " We show the current mode with airline
set number                           " Show the absolute line number the cursor is on
set relativenumber                   " Show relative line numbers
set scrolloff=999                    " Keep the cursor centered
set sessionoptions-=buffers          " Do not save hidden and unloaded buffers
set sessionoptions-=options          " Don't persist options as it can corrupt sessions
set splitbelow                       " Splits show up below by default
set splitright                       " Splits go to the right by default

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
set synmaxcol=300
set re=1
set statusline=%<%f\ %h%m%r%{fugitive#statusline()}%=%-14.(%l,%c%V%)\ %P
syntax sync minlines=256

" Tab settings
set expandtab     " Expand tabs to the proper type and size
set tabstop=2     " Tabs width in spaces
set softtabstop=2 " Soft tab width in spaces
set shiftwidth=2  " Amount of spaces when shifting

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

" ----------------------------------------- "
" Plugin configs                            "
" ----------------------------------------- "

" ==================== CtrlP ====================
let g:ctrlp_cmd = 'CtrlPMRU'
let g:ctrlp_match_func  = {'match' : 'matcher#cmatch'}
"  let g:ctrlp_match_func = {'match': 'cpsm#CtrlPMatch'}
" let g:ctrlp_user_command = 'ag %s -l --nocolor --hidden -g ""'
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_max_height = 10		" maxiumum height of match window
let g:ctrlp_switch_buffer = 'et'	" jump to a file if it's open already
let g:ctrlp_mruf_max=450 		" number of recently opened files
let g:ctrlp_max_files=0  		" do not limit the number of searchable files
let g:ctrlp_use_caching = 1
let g:ctrlp_clear_cache_on_exit = 0
let g:ctrlp_cache_dir = $HOME.'/.cache/ctrlp'

let g:ctrlp_buftag_types = {
      \ 'go'     	   : '--language-force=go --golang-types=ftv',
      \ 'coffee'     : '--language-force=coffee --coffee-types=cmfvf',
      \ 'markdown'   : '--language-force=markdown --markdown-types=hik',
      \ 'objc'       : '--language-force=objc --objc-types=mpci',
      \ 'rc'         : '--language-force=rust --rust-types=fTm'
      \ }

func! MyCtrlPTag()
  let g:ctrlp_prompt_mappings = {
        \ 'AcceptSelection("e")': ['<cr>', '<2-LeftMouse>'],
        \ 'AcceptSelection("t")': ['<c-t>'],
        \ }
  CtrlPBufTag
endfunc
command! MyCtrlPTag call MyCtrlPTag()

nmap <C-f> :CtrlPCurWD<cr>
imap <C-f> <esc>:CtrlPCurWD<cr>

nmap <C-b> :CtrlPBuffer<cr>
imap <C-b> <esc>:CtrlPBuffer<cr>

" ==================== delimitmate ====================
let g:delimitMate_expand_cr = 1		
let g:delimitMate_expand_space = 1		
let g:delimitMate_smart_quotes = 1		
let g:delimitMate_expand_inside_quotes = 0		
let g:delimitMate_smart_matchpairs = '^\%(\w\|\$\)'		

imap <expr> <CR> pumvisible() ? "\<c-y>" : "<Plug>delimitMateCR"

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
let g:syntastic_go_golint_quiet_messages = { "regex": 'exported.*should have comment' }

" ====================== ultisnips =====================
function! g:UltiSnips_Complete()
  call UltiSnips#ExpandSnippet()
  if g:ulti_expand_res == 0
    if pumvisible()
      return "\<C-n>"
    else
      call UltiSnips#JumpForwards()
      if g:ulti_jump_forwards_res == 0
        return "\<TAB>"
      endif
    endif
  endif
  return ""
endfunction

function! g:UltiSnips_Reverse()
  call UltiSnips#JumpBackwards()
  if g:ulti_jump_backwards_res == 0
    return "\<C-P>"
  endif

  return ""
endfunction


if !exists("g:UltiSnipsJumpForwardTrigger")
  let g:UltiSnipsJumpForwardTrigger = "<tab>"
endif

if !exists("g:UltiSnipsJumpBackwardTrigger")
  let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
endif

au InsertEnter * exec "inoremap <silent> " . g:UltiSnipsExpandTrigger . " <C-R>=g:UltiSnips_Complete()<cr>"
au InsertEnter * exec "inoremap <silent> " . g:UltiSnipsJumpBackwardTrigger . " <C-R>=g:UltiSnips_Reverse()<cr>"

" ===================== vim-airline ====================
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

" ===================== vim-session ====================
let g:session_directory = '~/.vim/sessions'
let g:session_autoload = 'yes'
let g:session_autosave = 'yes'
let g:session_default_to_last = 1
let g:session_lock_enabled = 0
nmap so :OpenSession
nmap ss :SaveSession
nmap sd :DeleteSession<CR>
nmap sc :CloseSession<CR>

" ==================== youcompleteme ===================
let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_min_num_of_chars_for_completion = 1

" ----------------------------------------- "
" Some helpful functions                    "
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
