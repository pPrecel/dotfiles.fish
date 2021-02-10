" ==============================
" Load plugins
" ==============================
call plug#begin('~/.vim/plugged')

Plug 'airblade/vim-gitgutter'
Plug 'itchyny/lightline.vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'dag/vim-fish'

call plug#end()
" ==============================

" Enable mouse in vim
set mouse=a
set ttymouse=sgr

" Show status bar
set laststatus=2

set number relativenumber

set updatetime=500

set balloondelay=250

autocmd! BufEnter,BufNewFile *.go syntax on
autocmd! BufLeave *.go syntax off

set autoindent
set smartindent
filetype indent on

set backspace=2

if has("patch-8.1.1904")
  set completeopt+=popup
    set completepopup=align:menu,border:off,highlight:Pmenu
    endif