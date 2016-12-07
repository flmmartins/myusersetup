" ================== VUNDLE =========================

set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim' "Vundle
Plugin 'altercation/vim-colors-solarized' "Don't forget to change color to 256 in iTerm
Plugin 'scrooloose/nerdtree' "NERDTree navigator
Plugin 'airblade/vim-gitgutter' "show lines added and remove from files for git
Plugin 'sjl/gundo.vim' "show saved local history from files
Plugin 'Raimondi/delimitMate' "Close bracers automaticaly
Plugin 'L9'
Plugin 'ack.vim'              " :Ack search for teams in files
Plugin 'kien/ctrlp.vim'       "Ctrlp finds a file and open it
Plugin 'bling/vim-airline'    "Show vim modes in footer
Plugin 'bling/vim-bufferline' "Show vim buffers in footer. Needs airline.
Plugin 'scrooloose/syntastic' "Show sintax error in vim window
Plugin 'editorconfig/editorconfig-vim' "Alows the creation of a file that std vim in a team
Plugin 'nvie/vim-flake8' "Python sintax checker
Plugin 'jelera/vim-javascript-syntax' "Improved JS sintax
Plugin 'pangloss/vim-javascript'      "Walk together with vim-ident-guides
Plugin 'nathanaelkane/vim-indent-guides'  "Better indentation for JS
Plugin 'mustache/vim-mustache-handlebars' "Handlebar visual plugin
Plugin 'hashivim/vim-vagrant' "Vagrant sintax
Plugin 'rodjek/vim-puppet' "Puppet sintax
Plugin 'godlygeek/tabular' " Puppet tabular
Plugin 'elzr/vim-json'      "JSON plugin
Plugin 'tfnico/vim-gradlex' "Recognize gradle as groovy
Plugin 'vim-scripts/groovy' "Groovy plugin
Plugin 'thoughtbot/vim-rspec' "Rspec Plugin
Plugin 'sukima/xmledit' "Xml plugin
Plugin 'klen/python-mode'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

" ======================================================

" TODO: this may not be in the correct place. It is intended to allow overriding <Leader>.
" source ~/.vimrc.before if it exists.
if filereadable(expand("~/.vimrc.before"))
  source ~/.vimrc.before
endif
" ================ Bufferline =======================
let g:airline#extensions#bufferline#overwrite_variables = 0
let g:airline_left_sep = ''
let g:airline_right_sep = ''

" ================= Mappings =========================

nmap <F1> <nop>
map <F1> <Esc>
imap <F1> <Esc>
map <F2> :NERDTree<CR>


" ================= Fuzzy Finder =====================

nmap ,f :FufFileWithCurrentBufferDir<CR>
nmap ,b :FufBuffer<CR>
nmap ,t :FufTaggedFile<CR>

" ================ General Config ====================
set encoding=utf-8
set clipboard=unnamed           " Enable copy to clibboard
set number                      "Line numbers are good
set backspace=indent,eol,start  "Allow backspace in insert mode
set history=1000                "Store lots of :cmdline history
set showcmd                     "Show incomplete cmds down the bottom
set showmode                    "Show current mode down the bottom
set gcr=a:blinkon0              "Disable cursor blink
set visualbell                  "No sounds
set autoread                    "Reload files changed outside vim
set mouse=a                     "Add mouse to nerdtree"
set hlsearch                    "Highlight current word being searched"

" Cursor line hightlight
highlight CursorLine cterm=NONE ctermbg=NONE ctermfg=NONE guibg=NONE guifg=NONE
set cursorline

" ================ Solarized ========================
syntax enable
set background=dark
let g:solarized_visibility = "high"
let g:solarized_contrast = "high"
let g:solarized_termcolors=256
colorscheme solarized

" This makes vim act like all other editors, buffers can
" exist in the background without being in a window.
" http://items.sjbach.com/319/configuring-vim-right
set hidden

" Change leader to a comma because the backslash is too far away
" That means all \x commands turn into ,x
" The mapleader has to be set before vundle starts loading all 
" the plugins.
let mapleader=","

" =============== CtrlP  ==================

set wildignore+=*.swp,*.pyc,*.class,.venv,node_modules
let g:ctrlp_show_hidden = 1

" =============== NerdTree  ==================

let NERDTreeShowHidden=1
let NERDTreeIgnore=['\.swp$', '\.pyc$', '\.class$']

" =============== Javascript tweaks ==================

" " YCM gives you popups and splits by default that some people might not
" like, so these should tidy it up a bit for you.
let g:ycm_add_preview_to_completeopt=0
let g:ycm_confirm_extra_conf=0
set completeopt-=preview

" =============== Vundle Initialization ===============
" This loads all the plugins specified in ~/.vim/vundle.vim
" Use Vundle plugin to manage all other plugins
if filereadable(expand("~/.vim/vundles.vim"))
  source ~/.vim/vundles.vim
endif

" ================ Turn Off Swap Files ==============

set noswapfile
set nobackup
set nowb

" ================ Persistent Undo ==================
" Keep undo history across sessions, by storing in file.
" Only works all the time.

silent !mkdir ~/.vim/backups > /dev/null 2>&1
set undodir=~/.vim/backups
set undofile

" ================ Indentation ======================

set autoindent
set smartindent
set smarttab
set expandtab
set shiftwidth=2
set softtabstop=2
set tabstop=2

filetype plugin on
filetype indent on

" Display tabs and trailing spaces visually
set list listchars=tab:\ \ ,trail:·

set nowrap       "Don't wrap lines
set linebreak    "Wrap lines at convenient points

" ================ Folds ============================

set foldmethod=indent   "fold based on indent
set foldnestmax=3       "deepest fold is 3 levels
set nofoldenable        "dont fold by default

" ================ Completion =======================

set wildmode=list:longest
set wildmenu                "enable ctrl-n and ctrl-p to scroll thru matches
set wildignore=*.o,*.obj,*~ "stuff to ignore when tab completing
set wildignore+=*vim/backups*
set wildignore+=*sass-cache*
set wildignore+=*DS_Store*
set wildignore+=vendor/rails/**
set wildignore+=vendor/cache/**
set wildignore+=*.gem
set wildignore+=log/**
set wildignore+=tmp/**
set wildignore+=*.png,*.jpg,*.gif

"

" ================ Scrolling ========================

set scrolloff=8         "Start scrolling when we're 8 lines away from margins
set sidescrolloff=15
set sidescroll=1
