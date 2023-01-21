""""""""""""""""""
" => UI Config
""""""""""""""""""

syntax on " Colors
" colorscheme darcula
" colorscheme gruvbox
colorscheme nightfox

set number relativenumber " Always show line numbers in relative mode

" Toogle relative line numbers
:augroup numbertoggle
:  autocmd!
:  autocmd BufEnter,FocusGained,InsertLeave * set number relativenumber
:  autocmd BufLeave,FocusLost,InsertEnter   * set number norelativenumber
:augroup END

" Syntax highlight for Nunjucks files
augroup nunjucks_ft
  au!
  autocmd BufNewFile,BufRead *.njk set syntax=jinja2
augroup END

""""""""""""""""""""
" => Spaces & Tabs
""""""""""""""""""""
set tabstop=2
set softtabstop=2
set expandtab
set shiftwidth=2 
set smarttab
set ai "Auto indent
set si "Smart indent

""""""""""""""""""""
" => Searching
""""""""""""""""""""

" Search files recursevely
set path+=**

" Files and folder to ignore
set wildignore+=**/node_modules/**,**/bower_components/**,**/build/**,**/dist/**,**/docs/**,*.jpg,*.png,*.gif,*.mp4,*.webm

" Ignore case when searching
set ignorecase

" When searching try to be smart about cases 
set smartcase

" Makes search act like search in modern browsers
set incsearch


set hlsearch " Highlight search results

set so=7 " Set 7 lines to the cursor - when moving vertically using j/k
set showcmd " Show information about the current command
set cursorline " Highlight cursor line
set ruler "Always show current position
set wildmenu " Turn on the Wild menu
set showmatch " Show matching brackets when text indicator is over them

set splitright
set splitbelow
set colorcolumn=100
set textwidth=100 "set tw=100
highlight OverLength ctermbg=red ctermfg=white guibg=#592929
match OverLength /\%101v.\+/
