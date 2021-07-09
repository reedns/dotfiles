execute pathogen#infect()

" Basic settings
set nocompatible
filetype plugin indent on
syntax enable
set encoding=utf-8
set showcmd
syntax on
set relativenumber
set number
set ruler
set laststatus=2
set background=dark
colorscheme gruvbox
set hidden
:au FocusLost * :wa             " auto save when focus is lost
:au FocusLost * silent! wa      " ignore errors when above command is triggerd for unsaved buffer
set updatetime=250              " set default update time to 250ms
set autoindent
set wildmenu
set history=1000
set visualbell
set autoread

runtime macros/matchit.vim
packadd! matchit

" Whitespace settings
set nowrap
set tabstop=2
set shiftwidth=2
set expandtab
set backspace=indent,eol,start
autocmd BufWritePre * :%s/\s\+$//e      " trim trailing whitspace on save
set scrolloff=2

" Search settings
set hlsearch                    " highlight matches
set incsearch                   " incremental searching
set ignorecase                  " searches are case insensitive...
set smartcase                   " ... unless they contain at least one capital letter

" Key mappings
:inoremap jk <Esc>
:vnoremap jk <Esc>
map <C-c> y:e ~/clipsongzboard<CR>P:w !pbcopy<CR><CR>:bdelete!<CR>
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l
let mapleader = "\<Space>"
nnoremap <silent> <Leader>/ :nohlsearch<CR>
map Y y$
nmap 0 ^

"Leader Mappings"
nnoremap <leader>p :set paste<CR>"+p:set nopaste<CR>
vnoremap <leader>p <Esc>:set paste<CR>gv"+p:set nopaste<CR>
nmap <leader>vr :sp $MYVIMRC<cr>
nmap <leader>so :source $MYVIMRC<cr>
nnoremap <leader>b :CtrlPBuffer<CR>       ''

"NERD-tree"
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
map <C-t> :NERDTreeToggle<CR>
map <leader>nf :NERDTreeFind<CR>
let g:ctrlp_dont_split = 'nerdtree'

" Auto-reload vimrc
augroup reload_vimrc " {
    autocmd!
    autocmd BufWritePost $MYVIMRC source $MYVIMRC
augroup END " }

"Indent-guides"
let g:indent_guides_guide_size=0

"Automatically rebalance windows on vim resize"
autocmd VimResized * :wincmd =

"Zoom a vim pane, <C-w>= to re-balance"
nnoremap <leader>- :wincmd -<cr>:wincmd \|<cr>
nnoremap <leader>= :wincmd =<cr>

" Disable tmux navigator when zooming the Vim pane
let g:tmux_navigator_disable_when_zoomed = 1

" Make CtrlP faster with Silver Searcher and Git
if executable('ag')
  set grepprg=ag\ --nogroup\ --nocolor

  let g:ctrlp_user_command = 'ag %s -i --nocolor --nogroup --ignore ''.git'' --ignore ''.DS_Store'' --ignore ''node_modules'' --hidden -g ""'
endif

" Set no file limit
let g:ctrlp_max_files = 0

" Set delay to prevent extra searches
let g:ctrlp_lazy_update = 350

" bind K to grep word under cursor
nnoremap K :grep! "\b<C-R><C-W>\b"<CR>:cw<CR>

" Use py-matcher for CtrlP matching
let g:ctrlp_match_func = { 'match': 'pymatcher#PyMatch' }

" Minitest syntax completion
set completefunc=syntaxcomplete#Complete

" Vim-Airline-Theme
let g:airline_theme='gruvbox'

" Vim-inky syntax
let g:inky_template_language = 'haml'

" Send more characters for redraws
set ttyfast

" Enable autoclosing HTML tags in jsx and tsx files
let g:closetag_filenames = '*.html,*.jsx,*.tsx'
let g:closetag_regions =  {
\ 'typescript.tsx': 'jsxRegion,tsxRegion',
\ 'javascript.jsx': 'jsxRegion',
\ }

" Run the current file with rspec
map <Leader>rb :call VimuxRunCommand("clear; bundle exec rspec " . bufname("%"))<CR>
" Run command without sending a return
map <Leader>rq :call VimuxRunCommand("clear; bundle exec rspec " . bufname("%"), 0)<CR>
" Prompt for a command to run
map <Leader>vp :VimuxPromptCommand<CR>
" Run last command executed by VimuxRunCommand
map <Leader>vl :VimuxRunLastCommand<CR>
" Inspect runner pane
map <Leader>vi :VimuxInspectRunner<CR>

" Tab completion
" will insert tab at beginning of line,
" will use completion if not at beginning
set wildmode=list:longest,list:full
function! InsertTabWrapper()
    let col = col('.') - 1
    if !col || getline('.')[col - 1] !~ '\k'
        return "\<Tab>"
    else
        return "\<C-p>"
    endif
endfunction
inoremap <Tab> <C-r>=InsertTabWrapper()<CR>
inoremap <S-Tab> <C-n>

" Set the filetype based on the file's extension
au BufRead,BufNewFile *.html.inky-haml setfiletype haml

" NERDCommenter
let g:NERDSpaceDelims = 1
let g:NERDTrimTrailingWhitespace = 1

" Use TabNine for autocomplete
set rtp+=~/.vim/bundle/tabnine-vim
