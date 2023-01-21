
" Specify a directory for plugins
call plug#begin('~/.vim/plugged')

Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'ryanoasis/vim-devicons'
Plug 'airblade/vim-gitgutter'
Plug 'ctrlpvim/ctrlp.vim' " fuzzy find files
Plug 'scrooloose/nerdcommenter'
"Plug 'prettier/vim-prettier', { 'do': 'yarn install' }
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

Plug 'preservim/vimux'
Plug 'christoomey/vim-tmux-navigator'

Plug 'tpope/vim-fugitive' "Git

" Themes
Plug 'morhetz/gruvbox' "Intellij Colorscheme
Plug 'doums/darcula' " Reproduction of JetBrains Darcula theme
Plug 'EdenEast/nightfox.nvim' " A highly customizable theme

" Status bar
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes' " Collection of airline themes

Plug 'sheerun/vim-polyglot' "Better syntax highlight
Plug 'Glench/Vim-Jinja2-Syntax' "Jinja2 syntax highlight
"Plug 'HerringtonDarkholme/yats.vim' " TS Syntax

Plug 'tpope/vim-surround' " Surrounding in pairs
Plug 'tpope/vim-unimpaired' " Complementary pairs of mappings
Plug 'tpope/vim-repeat' " Allows for using the . command after a plugin map
Plug 'alvan/vim-closetag' " Autoclose html/xml tags

Plug 'mattn/emmet-vim' " Emmet-like expanding abbreviation

Plug 'yggdroot/indentLine' " for displaying thin vertical lines at each indentation level
Plug 'editorconfig/editorconfig-vim'

Plug 'tyewang/vimux-jest-test'

" Initialize plugin system
call plug#end()
