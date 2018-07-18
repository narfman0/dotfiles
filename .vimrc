set nocompatible              " be iMproved, required
filetype off                  " required

" we need to silently run python3 to shut up warnings :|
if has('python3')
    silent! python3 1
endif

let iCanHazVundle=1
let vundle_readme=expand('~/.vim/bundle/vundle.vim/README.md')
if !filereadable(vundle_readme)
    echo "Installing Vundle.."
    echo ""
    silent !mkdir -p ~/.vim/bundle
    silent !git clone https://github.com/gmarik/vundle ~/.vim/bundle/vundle.vim
    let iCanHazVundle=0
endif
set rtp+=~/.vim/bundle/vundle.vim
call vundle#begin()
Bundle 'gmarik/vundle'
Bundle 'scrooloose/syntastic'
Bundle 'scrooloose/nerdtree'
Bundle 'Valloric/YouCompleteMe'
Bundle 'ctrlpvim/ctrlp.vim'
Plugin 'tmux-plugins/vim-tmux'
"Plugin 'joonty/vdebug'
Plugin 'jnurmine/Zenburn'
Plugin 'narfman0/cscope_maps'
Plugin 'tpope/vim-fugitive'
Plugin 'hashivim/vim-terraform'
Plugin 'fatih/vim-go'
Plugin 'ambv/black'
Plugin 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}
if iCanHazVundle == 0
    echo "Installing Bundles..."
    :BundleInstall
    echo "Finished installing bundles"
endif
call vundle#end()            " required

filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
filetype plugin on

syntax on

set hidden
" Better command-line completion
set wildmenu
" Show partial commands in the last line of the screen
set showcmd
" Highlight searches (use <C-L> to temporarily turn off highlighting; see the
" mapping of <C-L> below)
set hlsearch

" Use case insensitive search, except when using capital letters
set ignorecase
set smartcase

" Allow backspacing over autoindent, line breaks and start of insert action
set backspace=indent,eol,start

" When opening a new line and no filetype-specific indenting is enabled, keep
" the same indent as the line you're currently on. Useful for READMEs, etc.
set autoindent

" Stop certain movements from always going to the first character of a line.
" While this behaviour deviates from that of Vi, it does what most users
" coming from other editors would expect.
set nostartofline

" Display the cursor position on the last line of the screen or in the status
" line of a window
set ruler

" Always display the status line, even if only one window is displayed
set laststatus=2

" Instead of failing a command because of unsaved changes, instead raise a
" dialogue asking if you wish to save changed files.
set confirm

" Use visual bell instead of beeping when doing something wrong
set visualbell

" And reset the terminal code for the visual bell. If visualbell is set, and
" this line is also included, vim will neither flash nor beep. If visualbell
" is unset, this does nothing.
set t_vb=

" Enable use of the mouse for all modes
set mouse=a

" Set the command window height to 2 lines, to avoid many cases of having to
" "press <Enter> to continue"
set cmdheight=2

" Display line numbers on the left
set number

" Quickly time out on keycodes, but never time out on mappings
set notimeout ttimeout ttimeoutlen=200

" Use <F11> to toggle between 'paste' and 'nopaste'
set pastetoggle=<F11>

" make sure we are utf8 happy
set encoding=utf-8

"------------------------------------------------------------
" Indentation options {{{1
"
" Indentation settings according to personal preference.
set tabstop=4
set shiftwidth=4
set softtabstop=4
set shiftround
set expandtab

au BufNewFile,BufRead *.py
    \ set tabstop=4 |
    \ set softtabstop=4 |
    \ set shiftwidth=4 |
    \ set textwidth=79 |
    \ set expandtab |
    \ set autoindent |
    \ set fileformat=unix

" Autorun black for python files on save
autocmd BufWritePre *.py execute ':Black'

au BufNewFile,BufRead *.js,*.html,*.css
    \ set tabstop=2 |
    \ set softtabstop=2 |
    \ set shiftwidth=2

" Map Y to act like D and C, i.e. to yank until EOL, rather than act as yy,
" which is the default
map Y y$

" Map <C-L> (redraw screen) to also turn off search highlighting until the
" next search
nnoremap <C-L> :nohl<CR><C-L>

" no backup/swp files
set autoread
set nobackup
set nowb
set noswapfile

" Enable folding
set foldmethod=indent
set foldlevel=99
" Enable folding with spacebar
nnoremap <space> za

" Auto write changes and source vimrc immediately
autocmd! bufwritepost .vimrc source %

" set ctags paths
set tags=./tags,tags
set nocscopeverbose
map <F5> :!pycscope -R<CR>
  \:cs add cscope.out<CR>
  \:cs reset<CR>

set ttymouse=xterm2

" Make clipboard copy verbatim instead of commenting forever if it hits one
set clipboard=unnamed

" Make obvious bar at column 110 to avoid overly long lines
set colorcolumn=110
highlight UnwanttedTab ctermbg=red guibg=darkred
highlight TrailSpace guibg=red ctermbg=darkred
match UnwanttedTab /\t/
match TrailSpace / \+$/
colorscheme zenburn

" visual mode system clipboard copy
vnoremap <C-c> "+y
" insert mode system clipboard paste
inoremap <C-v> <ESC>"+pa

" enable/disable absolute line numbering vs relative
nnoremap <C-n> :set relativenumber!<cr>
set relativenumber

" enable/disable syntastic linting
map <C-u> :SyntasticToggleMode<cr>

set list
" backup chars to play with: → ·
set listchars=tab:>\ ,trail:·,nbsp:·

" django templates syntax highlighting
syn region  djangotagmarkers start="{{" end="}}"
syn region  djangovariablemarkers start="{%" end="%}"
command! -nargs=+ HiLink hi def link <args>
HiLink djangotagmarkers PreProc
HiLink djangovariablemarkers PreProc
delcommand HiLink

" syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0

let g:syntastic_python_checkers = ['pylint', 'flake8']
let g:syntastic_python_pylint_args = "--load-plugins pylint_django --max-line-length=110 --disable=F0401"
let g:syntastic_python_flake8_args="--max-line-length=110"
let g:syntastic_javascript_checkers = ['jshint']

let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux
set wildignore+=*\\tmp\\*,*.swp,*.zip,*.exe  " Windows
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'

" nerdtree
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
let NERDTreeIgnore=['\.pyc$', '\~$'] "ignore files in NERDTree
map <C-t> :NERDTreeToggle<CR>

" ycm youcompleteme
let g:ycm_autoclose_preview_window_after_completion=1
map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>
