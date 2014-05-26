let g:snips_author="Brian Blanton"
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsListSnippets="<c-tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"

source ~/dotfiles/bundles.vim
" scriptencoding utf-8
set background=dark
" colorscheme solarized
colors mustang
set t_Co=256





" Set the Leader Key Mapping
" \ is the leader character
let mapleader = ","

    
syntax on                       " Turn on that syntax highlighting
set hidden                      " Why is this not a default
set lazyredraw                  " Don't update the display while executing macros
set showmode                    " At least let yourself know what mode you're in
set wildmenu                    " Enable enhanced command-line completion. Presumes you have compiled with +wildmenu.  See :help 'wildmenu'
set nowrap                      " don't wrap lines
set tabstop=2                   " # of spaces for a tab
set softtabstop=2               " two spaces
set autoindent                  " always set autoindenting on
set copyindent                  " copy the previous indention on autoindenting
set number                      " always show line numbers
set shiftwidth=2                " number of spaces to use for autoindenting
set shiftround                  " use multiple of shiftwidth when indenting with '<' and '>'
set showmatch                   " set show matching parenthesis
set ignorecase                  " ignore case when searching
set smartcase                   " ignore case if search pattern is all lowercase, case sensitive otherwise
set smarttab                    " insert tabls on the start of the a line according to shiftwidth not tabstop
set hlsearch                    " highlight search terms
set incsearch                   " show search matches as you type

set history=1000                " history setting
set undolevels=1000             " undo buffer
set title                       " change the terminals title
set visualbell                  " don't beep
set noerrorbells                " don't beep
set nobackup                    " no backup files
set noswapfile                  " not needed

set wildignore=*.swp,*.bak,*.pyc,*.class


" ------------------------------- Mappings
:imap jj <Esc>
imap <C-c> <CR><Esc>



" ------------------------------- Functions

" ---------------------------------------------------------------------------
"  Strip all trailing whitespace in file
"
"  ---------------------------------------------------------------------------

function! StripWhitespace ()
    exec ':%s/ \+$//gc'
endfunction
map <leader>s :call StripWhitespace ()<CR>




