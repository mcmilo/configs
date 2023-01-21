""""""""""""""""""""""
" => Keys mapping
""""""""""""""""""""""
let mapleader = "\<Space>"
inoremap jk <Esc>
nnoremap <Leader>f :NERDTreeToggle<Enter>
nnoremap <silent> <Leader>F :NERDTreeFind<CR>
nmap <F3> :set paste<CR>:r !pbpaste<CR>:set nopaste<CR>
imap <F3> <Esc>:set paste<CR>:r !pbpaste<CR>:set nopaste<CR>
nmap <F2> :.w !pbcopy<CR><CR>
vmap <F2> :w !pbcopy<CR><CR>

" Split window
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
nnoremap <silent> vv <C-w>v

" Vimux
nmap <Leader>vp :VimuxPromptCommand<CR>
nmap <Leader>vl :VimuxRunLastCommand<CR>
nmap <Leader>vi :VimuxInspectRunner<CR>
nmap <leader>vz :VimuxZoomRunner<CR>

" Vimux Jest test
nmap <Leader>tb :RunJestOnBuffer<CR>
nmap <Leader>ta :RunJest<CR>
nmap <Leader>tl :RunJestFocused<CR>
