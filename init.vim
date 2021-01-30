" 1. Run the following commands in terminal:
"    mkdir -p ~/.config/nvim/backup ~/.config/nvim/cache ~/.config/nvim/undo
"    curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
" 2. Link all required files by running:
"     ln -s ~/dotfiles/init.vim ~/.config/nvim/init.vim
"     ln -s ~/dotfiles/coc-settings.json ~/.config/nvim/coc-settings.json
"     ln -s ~/dotfiles/NERDTreeBookmarks ~/.config/nvim/NERDTreeBookmarks
" 3. Launch nvim and Run:
"     :PlugInstall
" 4. Restart nvim

" Make sure nvim works properly when using fish
if &shell =~# 'fish$'
    set shell=sh
endif

call plug#begin('~/.config/nvim/plugged')

" Add plugins
Plug 'airblade/vim-gitgutter'
Plug 'airblade/vim-rooter'
Plug 'inkarkat/vim-replacewithregister'
Plug 'honza/vim-snippets'
Plug 'junegunn/fzf.vim'
Plug 'junegunn/vim-easy-align'
Plug 'justinmk/vim-sneak'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'preservim/nerdtree'
Plug 'qpkorr/vim-bufkill'
Plug 'raimondi/delimitmate'
Plug 'sheerun/vim-polyglot'
Plug 'svanharmelen/sonokai'
Plug 'svanharmelen/vim-session'
Plug 'svanharmelen/vim-tmux-navigator'
Plug 'takac/vim-hardtime'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-rhubarb'
Plug 'tpope/vim-surround'
Plug 'tweekmonster/fzf-filemru'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'xolox/vim-misc'
Plug 'xuyuanp/nerdtree-git-plugin'

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
set noshowmode                       " We show the current mode with airline
set number                           " Show the absolute line number the cursor is on
set mouse-=a                         " Disable mouse clicks to go to a position
set relativenumber                   " Show relative line numbers
set runtimepath+=/usr/local/opt/fzf  " Add the fzf binary to the runtime path
set scrolloff=999                    " Keep the cursor centered
set sessionoptions-=buffers          " Do not save hidden and uploaded buffers
set sessionoptions-=help             " Do not save help windows
set shortmess+=c                     " Silence completion messages
set shortmess-=S                     " Enable showing the search index
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
set tabstop=4     " Tabs width in spaces
set softtabstop=4 " Soft tab width in spaces
set shiftwidth=4  " Amount of spaces when shifting

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
set wildignore+=*.pyc                            " Python byte code
set wildignore+=*.orig                           " Merge resolution files

" Configure the look and feel
if has('termguicolors')
    set termguicolors
endif

function! s:sonokai_custom() abort
    let l:palette = sonokai#get_palette('default')
    call sonokai#highlight('CursorLine', l:palette.none, l:palette.bg2)
    call sonokai#highlight('CursorLineNr', l:palette.fg, l:palette.bg4)
    call sonokai#highlight('LineNr', l:palette.grey, l:palette.bg1)
    call sonokai#highlight('Search', l:palette.bg0, l:palette.yellow)
    call sonokai#highlight('IncSearch', l:palette.bg0, l:palette.bg_green)
    call sonokai#highlight('VertSplit', l:palette.grey, l:palette.none)

    call sonokai#highlight('CocRustTypeHint', l:palette.dark_grey, l:palette.none, 'italic')
    call sonokai#highlight('CocRustChainingHint', l:palette.dark_grey, l:palette.none, 'italic')
endfunction
augroup SonokaiCustom
    autocmd!
    autocmd ColorScheme sonokai call s:sonokai_custom()
augroup END

let g:sonokai_better_performance = 1
let g:sonokai_diagnostic_line_highlight = 1
let g:sonokai_disable_italic_comment = 1
let g:sonokai_enable_italic = 1
colorscheme sonokai

" Config Python used by Neovim
let g:loaded_python_provider = 0
let g:python3_host_prog = '/usr/local/bin/python3'

" Disable unused providers
let g:loaded_node_provider = 0
let g:loaded_perl_provider = 0
let g:loaded_ruby_provider = 0

" ----------------------------------------- "
" Plugin configs                            "
" ----------------------------------------- "

" ====================== coc.nvim ======================
" Settings
let g:coc_global_extensions = [
    \ 'coc-go',
    \ 'coc-json',
    \ 'coc-python',
    \ 'coc-rust-analyzer',
    \ 'coc-snippets',
    \ 'coc-tslint-plugin',
    \ 'coc-tsserver'
    \]
let g:coc_selectmode_mapping = 0
let g:coc_snippet_next = '<TAB>'
let g:coc_snippet_prev = '<S-TAB>'
" Generic Bindings
nmap <silent> <leader>df <Plug>(coc-definition)
nmap <silent> <leader>rf <Plug>(coc-references)
nmap <silent> <leader>rn <Plug>(coc-rename)
nnoremap <silent> q :CocAction quickfix<CR>
" Dialog Bindings
nnoremap <silent><nowait><expr> <leader>x coc#float#close_all()
nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<C-r>=coc#float#scroll(1)\<CR>" : "\<Right>"
inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<C-r>=coc#float#scroll(0)\<CR>" : "\<Left>"
vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
" Function objects
xmap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap if <Plug>(coc-funcobj-i)
omap af <Plug>(coc-funcobj-a)

function! s:ShowDocumentation()
    if (index(['vim','help'], &filetype) >= 0)
        execute 'h '.expand('<cword>')
    else
        call CocAction('doHover')
    endif
endfunction
nnoremap <silent> K :call <SID>ShowDocumentation()<CR>

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

" ===================== delimitmate ====================
let g:delimitMate_expand_cr = 1
let g:delimitMate_expand_space = 1
let g:delimitMate_insert_eol_marker = 0

" ====================== fugitive ======================
nnoremap <leader>gb :Gblame<CR>
nnoremap <leader>go :Gbrowse<CR>
nnoremap <leader>gl :Gbrowse!<CR>
nnoremap <leader>gd :Gdiff<CR>
if &diff
    nnoremap <silent> db :diffget BASE<Bar>diffupdate<CR>
    nnoremap <silent> dl :diffget LOCAL<Bar>diffupdate<CR>
    nnoremap <silent> dr :diffget REMOTE<Bar>diffupdate<CR>
    nnoremap <silent> dg :diffget<Bar>diffupdate<CR>
    nnoremap <silent> dp :diffput<Bar>diffupdate<CR>
endif

" ======================== fzf =========================
let g:fzf_action = {
    \ 'ctrl-s': 'split',
    \ 'ctrl-v': 'vsplit'
    \ }
let g:fzf_layout = { 'down': '~30%' }
let $FZF_DEFAULT_COMMAND='rg --files'
let $FZF_DEFAULT_OPTS='+x --bind ctrl-a:select-all'

command! -bang -nargs=* Rg
    \ call fzf#vim#grep(
    \   'rg --column --line-number --no-heading --color=always --colors="path:fg:155,204,112"
    \   --colors="line:fg:226,196,98" --colors="match:fg:247,91,122" --smart-case --sortr="path"
    \   -- '.(<q-args>), 1, fzf#vim#with_preview('right:50%:hidden', '?'), <bang>0)

nnoremap <silent><C-P> :FilesMru<CR>
nnoremap <leader>ff :Rg<Space>

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
autocmd SessionLoadPost * ++once NERDTreeFind | wincmd p
nnoremap <leader>n :NERDTreeToggle<CR>

" ================ nerdtree-git-plugin =================
let g:NERDTreeGitStatusIndicatorMapCustom = {
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

" ===================== vim-airline ====================
let g:airline_extensions = [
    \ 'branch',
    \ 'coc',
    \ 'fugitiveline',
    \ 'fzf',
    \ 'hunks',
    \ 'keymap',
    \ 'netrw',
    \ 'quickfix',
    \ 'term',
    \ 'wordcount'
    \ ]
let g:airline_focuslost_inactive = 1
let g:airline_highlighting_cache = 1
let g:airline_powerline_fonts = 1
let g:airline_theme = 'ouo'
let g:airline#extensions#default#layout = [
    \ [ 'a', 'b', 'c' ],
    \ [ 'x', 'y', 'z', 'error', 'warning' ]
    \ ]

" =================== vim-easyalign ====================
xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)

" =================== vim-gitgutter ====================
let g:gitgutter_max_signs = 1000

" ====================== vim-go ========================
" Settings
let g:go_highlight_build_constraints = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_functions = 1
let g:go_highlight_generate_tags = 1
let g:go_highlight_operators = 1
" Bindings
autocmd BufWritePre *.go :silent call CocAction('runCommand', 'editor.action.organizeImport')

" ==================== vim-hardtime ====================
let g:hardtime_allow_different_key = 1
let g:hardtime_default_on = 1
let g:hardtime_ignore_buffer_patterns = [ "[coc-explorer].*" ]
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

" ============== vim-replacewithregister ===============
xmap p <Plug>ReplaceWithRegisterVisual

" ==================== vim-rooter ======================
let g:rooter_cd_cmd = 'lcd'
let g:rooter_change_directory_for_non_project_files = 'current'
let g:rooter_silent_chdir = 1

" ==================== vim-session =====================
let g:session_directory = '~/.config/nvim/sessions'
let g:session_autoload = 'no'
let g:session_autosave = 'yes'
let g:session_lock_enabled = 0

" ==================== vim-sneak =======================
let g:sneak#label = 1

" =================== vim-surround =====================
let g:surround_no_insert_mappings = 1

" ----------------------------------------- "
" Some helpful functions and key bindings   "
" ----------------------------------------- "

" ================= auto reload buffers ================
autocmd FocusGained,BufEnter,CursorHold * checktime

" ================= auto resize windows ================
autocmd VimResized * wincmd =

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

" ================= quickfix settings ==================
autocmd FileType qf wincmd J

function! s:GetBufferList()
    redir =>buflist
    silent! ls!
    redir END
    return buflist
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

nnoremap <silent> <C-m> :call <SID>LocationNext()<CR>
nnoremap <silent> <C-n> :call <SID>LocationPrevious()<CR>
nnoremap <silent> <leader>a :call <SID>LocationToggle('Quickfix List', 'c')<CR>
nnoremap <silent> <leader>l :call <SID>LocationToggle('Location List', 'l')<CR>

" ================ remove search highlight =============
nnoremap <silent> <leader><space> :nohlsearch<Bar>pclose!<CR>

" ===================== termdebug ======================
packadd termdebug " Source the termdebug plugin
let g:termdebugger = 'rust-gdb'
let g:termdebug_wide = 1
noremap <silent> <leader>td :Termdebug<CR>

" =================== tab selection ====================
function! s:TabToSelectNext()
    if pumvisible()
        return "\<C-n>"
    else
        return "\<TAB>"
    endif
endfunction
imap <expr><TAB> <SID>TabToSelectNext()
smap <expr><TAB> <SID>TabToSelectNext()

function! s:ShiftTabToSelectPrevious()
    if pumvisible()
        return "\<C-p>"
    else
        return "\<S-TAB>"
    endif
endfunction
imap <expr><S-TAB> <SID>ShiftTabToSelectPrevious()
smap <expr><S-TAB> <SID>ShiftTabToSelectPrevious()

" ====================== terminal ======================
function! TweakTerminal()
    setlocal norelativenumber
    setlocal nonumber
    setlocal scrollback=100000
    startinsert
endfunc
autocmd TermOpen * call TweakTerminal()
autocmd BufEnter * if &buftype == 'terminal' | startinsert | endif
autocmd TermClose * bd!
function! NotFZF()
    return (&buftype == 'terminal') && (&filetype != 'fzf')
endfunction
augroup TerminalBindings
    autocmd BufEnter * if NotFZF() | tnoremap <buffer> <ESC> <C-\><C-n> | endif
    autocmd BufEnter * if NotFZF() | tnoremap <buffer> <C-h> <C-\><C-n><C-w>h | endif
    autocmd BufEnter * if NotFZF() | tnoremap <buffer> <C-j> <C-\><C-n><C-w>j | endif
    autocmd BufEnter * if NotFZF() | tnoremap <buffer> <C-k> <C-\><C-n><C-w>k | endif
    autocmd BufEnter * if NotFZF() | tnoremap <buffer> <C-l> <C-\><C-n><C-w>l | endif
augroup END

" ================ toggle spell checking ===============
nnoremap <silent> <leader>s :set spell!<CR>

" ================= trailing whitespace ================
function! s:TrimTrailingWhitespace()
    if &l:modifiable
        let s:view = winsaveview()
        try
            silent! keeppatterns %s/\s\+$//e
        finally
            call winrestview(s:view)
        endtry
    endif
endfunction
autocmd BufWritePre * call <SID>TrimTrailingWhitespace()

" ================== window switching ==================
inoremap <C-h> <ESC><C-w>h
inoremap <C-j> <ESC><C-w>j
inoremap <C-k> <ESC><C-w>k
inoremap <C-l> <ESC><C-w>l
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
