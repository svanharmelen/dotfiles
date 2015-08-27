"Installation Installation Instructions
"   1. Place file in home directory as .vimrc
"   2. Run the following command in terminal
"      mkdir .vim .vim/bundle .vim/backup .vim/swap .vim/cache .vim/undo; git clone https://github.com/vundlevim/vundle.vim.git .vim/bundle/vundle.vim
"   3. Launch Vim and Run
"      :BundleInstall
"   4. Restart Vim
"   5. Download powerline patched fonts to use as non-ASCII fonts
"      https://gist.githubusercontent.com/kevinis/c788f85a654b2d7581d8/raw/5be6ef0e44a3427fdb8343b4dacc29716449c59e/Monaco%2520for%2520Powerline.ttf

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
Plugin 'raimondi/delimitmate'
Plugin 'scrooloose/nerdcommenter'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/syntastic'
Plugin 'shougo/neocomplete.vim'
Plugin 'shougo/neosnippet.vim'
Plugin 'svanharmelen/molokai'
Plugin 'tpope/vim-fugitive'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" General setting
set autoread                   " Reload files that have been modified
set backspace=indent,eol,start " Makes backspace not behave all retarded-like
set colorcolumn=80,100         " Highlight 80 and 100 character limits
set cursorline                 " Highlight the line the cursor is on
set encoding=utf-8             " Set default encoding to UTF8"
set hidden                     " Allow buffers to be backgrounded without being saved
set laststatus=2               " Always show the status bar
set list                       " Show invisible characters
set listchars=tab:»\ ,eol:¬    " Set the characters for the invisibles
set noshowmode                 " We show the current mode with airline
set number                     " Show the absolute line number the cursor is on
set relativenumber             " Show relative line numbers
set ruler                      " Show the line number and column in the status bar
set scrolloff=999              " Keep the cursor centered in the screen
set showmatch                  " Highlight matching braces
set splitbelow                 " Splits show up below by default
set splitright                 " Splits go to the right by default
set t_Co=256                   " Use 256 colors
set updatetime=1000            " Update every 1000ms

"http://stackoverflow.com/questions/20186975/vim-mac-how-to-copy-to-clipboard-without-pbcopy
set clipboard^=unnamed
set clipboard^=unnamedplus

" Backup settings
set directory=~/.vim/swap
set backupdir=~/.vim/backup
set undodir=~/.vim/undo
set backup
set undofile
set writebackup
set noswapfile

" Search settings
set hlsearch   " Highlight results
set ignorecase " Ignore casing of searches
set incsearch  " Start showing results as you type
set smartcase  " Be smart about case sensitivity when searching

" Tab settings
set expandtab     " Expand tabs to the proper type and size
set tabstop=3     " Tabs width in spaces
set softtabstop=3 " Soft tab width in spaces
set shiftwidth=3  " Amount of spaces when shifting

" Tab completion settings
set wildmode=longest:list                        " Wildcard matches the longest and shows a list
set wildignore+=.git,.hg,.svn                    " Ignore version control repos
set wildignore+=*.o,*.obj,*.exe,*.dll,*.manifest " Ignore compiled object files"
set wildignore+=go/pkg                           " Ignore Go static files
set wildignore+=go/bin                           " Ignore Go bin files

" Configure the look and feel
syntax on
colorscheme molokai

" Tweak airline related settings
let g:airline_powerline_fonts = 1
let g:airline_theme = 'murmur'

" Tweak Git related settings
let g:gitgutter_sign_column_always = 1

" Tweak Go related settings
let g:go_fmt_command = "goimports"
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
let g:go_play_open_browser = 0

" Tweak Syntastic related settings
let g:syntastic_error_symbol='✗'
let g:syntastic_warning_symbol='⚠'

" Set custom key bindings
let mapleader=","
map <leader>n :NERDTreeToggle<CR>
map <leader>wh :wincmd h<CR>
map <leader>wj :wincmd j<CR>
map <leader>wk :wincmd k<CR>
map <leader>wl :wincmd l<CR>
map <leader>ws :wincmd s<CR>
map <leader>wv :wincmd v<CR>

" ==================== UltiSnips ====================

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

