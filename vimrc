" Forget being compatible with good ol' vi
set nocompatible

" use pathogen to easily modify the runtie path to include all
" plugins under the ~/.vim/bundle directory
" call pathogen#helptags()
" call pathogen#incubate()

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let vundle manage vundle
" required
Bundle 'gmarik/vundle'

" Set the Leader Key Mapping
" \ is the leader character
let mapleader = ","


" Get that filetype stuff happening
filetype on
filetype plugin on
filetype indent on

syntax on                       " Turn on that syntax highlighting
set hidden                      " Why is this not a default
set lazyredraw                  " Don't update the display while executing macros
set showmode                    " At least let yourself know what mode you're in
set wildmenu                    " Enable enhanced command-line completion. Presumes you have compiled with +wildmenu.  See :help 'wildmenu'
set nowrap											" don't wrap lines
set tabstop=2										" # of spaces for a tab
																" set backspace=indent,eol, start	
set softtabstop=2								" two spaces
																" allow backspacing over everything in insert mode
set autoindent									" always set autoindenting on
set copyindent									" copy the previous indention on autoindenting
set number											" always show line numbers
set shiftwidth=2								" number of spaces to use for autoindenting
set shiftround									" use multiple of shiftwidth when indenting with '<' and '>'
set showmatch										" set show matching parenthesis
set ignorecase									" ignore case when searching
set smartcase										" ignore case if search pattern is all lowercase, case sensitive otherwise
set smarttab										" insert tabls on the start of the a line according to shiftwidth not tabstop
set hlsearch										" highlight search terms
set incsearch										" show search matches as you type

set history=1000								" history setting
set undolevels=1000							" undo buffer
set title												" change the terminals title
set visualbell									" don't beep
set noerrorbells								" don't beep
set nobackup										" no backup files
set noswapfile									" not needed

set wildignore=*.swp,*.bak,*.pyc,*.class

colors mustang


" Let's make it easy to edit this file (mnemonic for the key sequence is 'e'dit 'v'imrc)
nmap <silent> ,ev :e $MYVIMRC<cr>  

" And to source this file as well (mnemonic for the key sequence is 's'ource 'v'imrc)
nmap <silent> ,sv :so $MYVIMRC<cr>




" ------------------------------- Mappings
:imap jj <Esc>







" ------------------------------- Bundles

"Bundle "tpope/vim-rails.git"
"Bundle "MarcWeber/vim-addon-mw-utils"
"Bundle "tomtom/tlib_vim"
"Bundle "garbas/vim-snipmate"

"Bundle "honza/vim-snippets"

Bundle 'tpope/vim-sensible'
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-rails'
Bundle 'tpope/vim-rake'
Bundle 'nanotech/jellybeans.vim'
Bundle 'Lokaltog/vim-powerline'
Bundle 'scrooloose/syntastic'
Bundle 'scrooloose/nerdtree'
Bundle 'kien/ctrlp.vim'
Bundle 'rking/ag.vim'
Bundle 'kana/vim-textobj-user'
Bundle 'nelstrom/vim-textobj-rubyblock'
Bundle 'slim-template/vim-slim'
Bundle 'wincent/Command-T'


" ------------------------------- Functions

" ---------------------------------------------------------------------------
"  Strip all trailing whitespace in file
"
"  ---------------------------------------------------------------------------

function! StripWhitespace ()
	exec ':%s/ \+$//gc'
endfunction
map <leader>s :call StripWhitespace ()<CR>

" ---------------------------------------------------------------------------
" Remap the tab key to do autocompletion or indentation depending on the
" context
" ---------------------------------------------------------------------------
function! InsertTabWrapper()
	let col = col('.') - 1
	if !col || getline('.')[col - 1] !~ '\k'
		return "\<tab>"
	else
		return "\<c-p>"
	endif
endfunction
inoremap <tab> <c-r>=InsertTabWrapper()<cr>
inoremap <s-tab> <c-n>



