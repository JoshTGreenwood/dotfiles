set nocompatible
syntax on

" plugins
call plug#begin('~/.vim/plugged')
" Misc
  Plug 'christoomey/vim-tmux-navigator' " treat vim and tmux splits the same
  " Plug 'dracula/vim' " colorscheme
  Plug 'altercation/vim-colors-solarized'
  Plug 'janko-m/vim-test' | Plug 'tpope/vim-dispatch' " for running
  Plug 'junegunn/fzf.vim' | Plug 'junegunn/fzf' " fuzzy finder
  Plug 'tpope/vim-commentary' " comment stuff out with gcc
  Plug 'tpope/vim-endwise' " automatically add 'end' when appropriate
  Plug 'tpope/vim-fugitive' " git porcelein
  " Plug 'airblade/vim-gitgutter' " show git + and - in stat column
  Plug 'tpope/vim-sensible' " seems like a good thing to have
  Plug 'tpope/vim-surround' " adds motions for surrounding quotes brackets etc
  Plug 'tpope/vim-repeat' " makes . do repeat more things (like surround)
  Plug 'wincent/terminus' " makes vim behave better in terminal
  Plug 'junegunn/vim-easy-align' " align stuff
  Plug '907th/vim-qfix'
" language specific
  Plug 'pangloss/vim-javascript', { 'for': 'javascript' }
  Plug 'kchmck/vim-coffee-script', { 'for': 'coffeescript' }
  Plug 'vim-ruby/vim-ruby', { 'for': 'ruby' }
  Plug 'tpope/vim-rails', { 'for': 'ruby' }
  Plug 'tpope/vim-bundler', { 'for': 'ruby' }
  Plug 'ElmCast/elm-vim'
  Plug 'digitaltoad/vim-pug'
call plug#end()

xnoremap ga <Plug>(EasyAlign)
" 

set clipboard=unnamed "use mac clipboard

" search
set hlsearch
set ignorecase
set magic

" indention and tabs
set softtabstop=0
set shiftwidth=2
set tabstop=2
set expandtab

" other
set nowrap
set number
set list
let mapleader = "\<space>"
inoremap <c-l> <space>=><space>

" color
set background=dark
colorscheme solarized

" exit insert mode with jk
inoremap jk <Esc>

" swapfiles
set swapfile
set dir=/tmp

" autojump to last edit position when opening a file
" taken from :help last-position-jump
:au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif

" Vim Test + Dispatch {{{
let test#strategy = "dispatch"
let g:test#preserve_screen = 1
nnoremap <silent> <leader>tt :TestNearest<CR>
nnoremap <silent> <leader>tf :TestFile<CR>
nnoremap <silent> <leader>ts :TestSuite<CR>
nnoremap <silent> <leader>tl :TestLast<CR>
nnoremap <silent> <leader>tg :TestVisit<CR>
nnoremap <silent> <leader>m :Dispatch<CR>
" }}}

" fzf {{{
set rtp+=~/.fzf
nnoremap <leader>f :Files<CR>
nnoremap <leader>h :History<CR>
nnoremap <leader>d :Tags<CR>
nnoremap <leader>s :Ag<CR>
" }}}

" toggles the quickfix window, comes from Plug '907th/vim-qfix'
nnoremap <leader>q :QFix<CR>

" filetype specific {{{
augroup elm
  autocmd!
  autocmd FileType elm nnoremap <leader>m <Plug>(elm-make)
  autocmd FileType elm nnoremap <leader>e <Plug>(elm-error-detail)
  autocmd FileType elm nnoremap <leader>d <Plug>(elm-show-docs)
  autocmd FileType elm g:elm_make_output_file = "index.html"
augroup END

augroup helpfiles
  autocmd!
  autocmd FileType help wincmd L
augroup END

augroup ruby
  autocmd!
  autocmd FileType ruby iabbrev pryy require 'pry'; binding.pry
  " RSpec promote to let
  "--------------------------------------------------------------------------------
  function! PromoteToLet()
    ":normal! dd
    " :exec '?^\s*it\>'
    ":normal! P
    :.s/\(\w\+\) = \(.*\)$/let(:\1) { \2 }/
    :normal ==
  endfunction
  :command! PromoteToLet :call PromoteToLet()
  :noremap <leader>p :PromoteToLet<cr>
  "--------------------------------------------------------------------------------
augroup END
" }}}

" statusline {{{
:set statusline=%f         " Path to the file
:set statusline+=%m        " modified flag
:set statusline+=%=        " Switch to the right side
:set statusline+=%l        " Current line
:set statusline+=/         " Separator
:set statusline+=%L        " Total lines
" }}}

" vimrc stuff {{{
noremap <leader>v :vsplit $MYVIMRC<cr>
augroup vimrc
  autocmd!
  autocmd BufWritePost $MYVIMRC source %
augroup END
noremap <leader>V :source $MYVIMRC<cr>
augroup filetype_vim
    autocmd!
    autocmd FileType vim setlocal foldmethod=marker
augroup END
" }}}
