set clipboard+=unnamedplus " Use system clipboard

" fix indention
set shiftwidth=2
set tabstop=2
set autoindent
set smartindent
set expandtab

set number

" fix searching
set ignorecase
set smartcase
set incsearch

let g:mapleader = " " " Set leader to spacebar

" plugins
call plug#begin(stdpath('data') . '/plugged')
  Plug 'nvim-lua/plenary.nvim'
  Plug 'nvim-telescope/telescope.nvim'
  Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }
  Plug 'nvim-tree/nvim-web-devicons'
  Plug 'BurntSushi/ripgrep'
  Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
  Plug 'ahmedkhalf/project.nvim'
  Plug 'tpope/vim-surround'
  Plug 'mrjones2014/legendary.nvim'
  Plug 'echasnovski/mini.nvim'
  Plug 'folke/which-key.nvim'
  Plug 'stevearc/dressing.nvim'
  Plug 'ellisonleao/gruvbox.nvim'
  Plug 'ruifm/gitlinker.nvim'
	Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install' }
	Plug 'numToStr/Comment.nvim'
	Plug 'tpope/vim-rails'
call plug#end()

lua << EOF
require('telescope').load_extension('projects')
require("project_nvim").setup { }
require"gitlinker".setup()
require('Comment').setup()

require('which-key').add({
  { "<leader>f", group = "file" },
  { "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Find File" },
  { "<leader>fr", "<cmd>Telescope oldfiles<cr>", desc = "Open Recent File" },
  { "<leader>fp", "<cmd>Telescope projects<cr>", desc = "Open Project" },
  { "<leader>fg", "<cmd>Telescope live_grep<cr>", desc = "Grep" },
  { "<leader>fs", "<cmd>Telescope grep_string<cr>", desc = "Grep string" },

  { "<leader>v", group = "vim" },
  { "<leader>vr", "<cmd>so ~/.config/nvim/init.vim<cr>", desc = 'Reload init.vim'},
  { "<leader>ve", "<cmd>e ~/.config/nvim/init.vim<cr>", desc = 'Open init.vim'},
})

vim.api.nvim_create_autocmd({ "BufWritePre" }, {
  pattern = { "*" },
  command = [[%s/\s\+$//e]],
})

EOF

set background=dark
colorscheme gruvbox
