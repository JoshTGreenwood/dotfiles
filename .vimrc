set nocompatible

" PLUGINS
"--------------------------------------------------------------------------------
call plug#begin('~/.vim/plugged')
" Misc
  Plug 'christoomey/vim-tmux-navigator' " treat vim and tmux splits the same
  Plug 'dracula/vim' " colorscheme
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

let g:rainbow_active = 1
xnoremap ga <Plug>(EasyAlign)
"--------------------------------------------------------------------------------

syntax on

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

" split with vv and ss
" noremap vv <C-w>v
" noremap ss <C-w>s

" other
set nowrap
set number
set list
let mapleader = "\<space>"
inoremap <c-l> <space>=><space>

" color
color dracula
set bg=dark

" exit insert mode with jj
inoremap jk <Esc>


" close quickfix window
noremap <leader>c :ccl<cr>

" swapfiles
set swapfile
set dir=/tmp

" autojump to last edit position when opening a file
" taken from :help last-position-jump
:au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif

" Vim Test + Dispatch
"--------------------------------------------------------------------------------
let test#strategy = "dispatch"
let g:test#preserve_screen = 1
nnoremap <silent> <leader>tt :TestNearest<CR>
nnoremap <silent> <leader>tf :TestFile<CR>
nnoremap <silent> <leader>ts :TestSuite<CR>
nnoremap <silent> <leader>tl :TestLast<CR>
nnoremap <silent> <leader>tg :TestVisit<CR>
nnoremap <silent> <leader>m :Dispatch<CR>
"--------------------------------------------------------------------------------

" fzf
set rtp+=~/.fzf
nnoremap <leader>f :Files<CR>
nnoremap <leader>h :History<CR>
nnoremap <leader>d :Tags<CR>
nnoremap <leader>s :Ag<CR>
let $FZF_DEFAULT_COMMAND = 'ag -l --hidden -g ""'
" defaultCommand = `find . -path '*/\.*' -prune -o -type f -print -o -type l -print 2> /dev/null | sed s/^..//`

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

" neomake
"--------------------------------------------------------------------------------
" let g:neomake_open_list = 2
" autocmd! BufWritePost,BufEnter * Neomake
"--------------------------------------------------------------------------------
"

" elm
au FileType elm nnoremap <leader>m <Plug>(elm-make)
au FileType elm nnoremap <leader>e <Plug>(elm-error-detail)
au FileType elm nnoremap <leader>d <Plug>(elm-show-docs)
let g:elm_make_output_file = "index.html"

" toggles the quickfix window, comes from Plug '907th/vim-qfix'
nnoremap <leader>q :QFix<CR>

iabbrev pryy require 'pry'; binding.pry

vnoremap ' <esc>`<i'<esc>`>a'<esc>
noremap H ^
noremap L $

"open help in vertical split
augroup helpfiles
  autocmd!
  autocmd FileType help wincmd L
augroup END

"joshua.t.greenwood@gmail.com"
onoremap in@ :<c-u>execute "normal!  /[a-zA-Z.]\\+@[a-zA-Z]\\+.com\r:nohl\rgn"<cr>

:set statusline=%f         " Path to the file
:set statusline+=%m         " Path to the file
:set statusline+=%=        " Switch to the right side
:set statusline+=%l        " Current line
:set statusline+=/         " Separator
:set statusline+=%L        " Total lines

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

" set statusline=%t[%{strlen(&fenc)?&fenc:'none'},%{&ff}]%h%m%r%y%=%c,%l/%L\ %P
