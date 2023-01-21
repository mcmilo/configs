""""""""""""""""""""""
" => NERDTree Config
""""""""""""""""""""""
let g:NERDTreeGitStatusWithFlags = 1
let NERDTreeAutoDeleteBuffer = 1
let NERDTreeQuitOnOpen=1

" sync open file with NERDTree
" " Check if NERDTree is open or active
function! IsNERDTreeOpen()        
  return exists("t:NERDTreeBufName") && (bufwinnr(t:NERDTreeBufName) != -1)
endfunction

" Call NERDTreeFind iff NERDTree is active, current window contains a modifiable
" file, and we're not in vimdiff
"function! SyncTree()
  "if &modifiable && IsNERDTreeOpen() && strlen(expand('%')) > 0 && !&diff
    "NERDTreeFind
    "wincmd p
  "endif
"endfunction

" Highlight currently open buffer in NERDTree
"autocmd BufEnter * call SyncTree()

""""""""""""""""""""""
" => COC Config
""""""""""""""""""""""
let g:coc_global_extensions = [
  \ 'coc-snippets',
  \ 'coc-pairs',
  \ 'coc-tsserver',
  \ 'coc-eslint', 
  \ 'coc-prettier', 
  \ 'coc-json', 
  \ ]
" from readme
" if hidden is not set, TextEdit might fail.
set hidden " Some servers have issues with backup files, see #649 set nobackup set nowritebackup " Better display for messages set cmdheight=2 " You will have bad experience for diagnostic messages when it's default 4000.
set updatetime=300

""""""""""""""""""""""
" => Airline Config
""""""""""""""""""""""
let g:airline_theme = 'deus'
let g:airline#extensions#tabline#enabled = 1
set laststatus=2
let g:airline_powerline_fonts = 1

""""""""""""""""""""""
" => Closetags
""""""""""""""""""""""
let g:closetag_filenames = '*.html,*.xhtml,*.phtml'
let g:closetag_xhtml_filenames = '*.xhtml,*.jsx,*.js'
let g:closetag_filetypes = 'html,xhtml,phtml'
let g:closetag_xhtml_filetypes = 'xhtml,jsx,js'
let g:closetag_emptyTags_caseSensitive = 1
let g:closetag_regions = {
    \ 'typescript.tsx': 'jsxRegion,tsxRegion',
    \ 'javascript.jsx': 'jsxRegion',
    \ 'typescriptreact': 'jsxRegion,tsxRegion',
    \ 'javascriptreact': 'jsxRegion',
    \ }
let g:closetag_shortcut = '>'
let g:closetag_close_shortcut = '<leader>>'
