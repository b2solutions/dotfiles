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



" ------------------------------- Unite Settings 
 let g:unite_source_history_yank_enable = 1
 "call unite#filters#matcher_default#use(['matcher_fuzzy'])
 nnoremap <leader>t :<C-u>Unite -no-split -buffer-name=files   -start-insert file_rec/async:!<cr>
 nnoremap <leader>f :<C-u>Unite -no-split -buffer-name=files   -start-insert file_rec<cr>
 nnoremap <leader>r :<C-u>Unite -no-split -buffer-name=mru     file_mru<cr>   
 "-start-insert file_mru<cr>
 nnoremap <leader>o :<C-u>Unite -no-split -buffer-name=outline -start-insert outline<cr>
 nnoremap <leader>y :<C-u>Unite -no-split -buffer-name=yank     history/yank<cr>
 nnoremap <leader>e :<C-u>Unite -no-split -buffer-name=buffer   buffer<cr>

" Custom mappings for the unite buffer
autocmd FileType unite call s:unite_settings()
function! s:unite_settings()
	" Play nice with supertab
	let b:SuperTabDisabled=1
	" Enable navigation with control-j and control-k in insert mode
	imap <buffer> <C-j>   <Plug>(unite_select_next_line)
	imap <buffer> <C-k>   <Plug>(unite_select_previous_line)
endfunction



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


" ---------------------------------------------------------------------------
" NeoComplete Settings
" ---------------------------------------------------------------------------

"Note: This option must set it in .vimrc(_vimrc).  NOT IN .gvimrc(_gvimrc)!
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplete.
let g:neocomplete#enable_at_startup = 1
" Use smartcase.
let g:neocomplete#enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplete#sources#syntax#min_keyword_length = 3
let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'

" Define dictionary.
let g:neocomplete#sources#dictionary#dictionaries = {
    \ 'default' : '',
    \ 'vimshell' : $HOME.'/.vimshell_hist',
    \ 'scheme' : $HOME.'/.gosh_completions'
        \ }

" Define keyword.
if !exists('g:neocomplete#keyword_patterns')
    let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns['default'] = '\h\w*'

" Plugin key-mappings.
inoremap <expr><C-g>     neocomplete#undo_completion()
inoremap <expr><C-l>     neocomplete#complete_common_string()

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  return neocomplete#close_popup() . "\<CR>"
  " For no inserting <CR> key.
  "return pumvisible() ? neocomplete#close_popup() : "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplete#close_popup()
inoremap <expr><C-e>  neocomplete#cancel_popup()
" Close popup by <Space>.
"inoremap <expr><Space> pumvisible() ? neocomplete#close_popup() : "\<Space>"

" For cursor moving in insert mode(Not recommended)
"inoremap <expr><Left>  neocomplete#close_popup() . "\<Left>"
"inoremap <expr><Right> neocomplete#close_popup() . "\<Right>"
"inoremap <expr><Up>    neocomplete#close_popup() . "\<Up>"
"inoremap <expr><Down>  neocomplete#close_popup() . "\<Down>"
" Or set this.
"let g:neocomplete#enable_cursor_hold_i = 1
" Or set this.
"let g:neocomplete#enable_insert_char_pre = 1

" AutoComplPop like behavior.
"let g:neocomplete#enable_auto_select = 1

" Shell like behavior(not recommended).
"set completeopt+=longest
"let g:neocomplete#enable_auto_select = 1
"let g:neocomplete#disable_auto_complete = 1
"inoremap <expr><TAB>  pumvisible() ? "\<Down>" : "\<C-x>\<C-u>"

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" Enable heavy omni completion.
if !exists('g:neocomplete#sources#omni#input_patterns')
  let g:neocomplete#sources#omni#input_patterns = {}
endif
"let g:neocomplete#sources#omni#input_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
"let g:neocomplete#sources#omni#input_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
"let g:neocomplete#sources#omni#input_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'

" For perlomni.vim setting.
" https://github.com/c9s/perlomni.vim
let g:neocomplete#sources#omni#input_patterns.perl = '\h\w*->\h\w*\|\h\w*::'


" ------------------------------- Bundles

Bundle 'arcWeber/vim-addon-mw-utils'
Bundle 'tpope/vim-sensible'
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-rails'
Bundle 'tpope/vim-rake'
Bundle 'tpope/vim-endwise'
Bundle 'nanotech/jellybeans.vim'
Bundle 'Lokaltog/vim-powerline'
Bundle 'scrooloose/syntastic'
Bundle 'rking/ag.vim'
Bundle 'kana/vim-textobj-user'
Bundle 'nelstrom/vim-textobj-rubyblock'
Bundle 'slim-template/vim-slim'
Bundle 'vim-ruby/vim-ruby'
Bundle 'Shougo/unite.vim'
Bundle 'Shougo/vimproc.vim'
Bundle 'Shougo/neocomplete.vim'
Bundle 'Shougo/neosnippet.vim'
Bundle 'Shougo/neosnippet-snippets'
Bundle 'ervandew/supertab'

"Bundle 'begin{tomtom/tlib_vim'
"Bundle 'garbas/vim-snipmate'
"Bundle 'MarcWeber/ultisnips'
"Bundle 'honza/vim-snippets'
"Bundle 'kien/ctrlp.vim'
"Bundle 'wincent/Command-T'
"Bundle 'scrooloose/nerdtree'
"Bundle 'Valloric/YouCompleteMe'
"
