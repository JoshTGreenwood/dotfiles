-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

vim.opt.clipboard = 'unnamedplus'

-- fix indention
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.expandtab = true
vim.opt.number = true

-- fix searching
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.incsearch = true

vim.opt.background = 'dark'

require("lazy").setup({
  spec = {
    'nvim-lua/plenary.nvim',
    'nvim-telescope/telescope.nvim',
    { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
    'nvim-tree/nvim-web-devicons',
    'BurntSushi/ripgrep',
    { 'nvim-treesitter/nvim-treesitter', build = ':TSUpdate' },
    'ahmedkhalf/project.nvim',
    'tpope/vim-surround',
    'mrjones2014/legendary.nvim',
    'echasnovski/mini.nvim',
    'folke/which-key.nvim',
    'stevearc/dressing.nvim',
    'ellisonleao/gruvbox.nvim',
    'ruifm/gitlinker.nvim',
    { 'iamcco/markdown-preview.nvim', build = 'cd app && yarn install' },
    'numToStr/Comment.nvim',
    'tpope/vim-rails',
    'github/copilot.vim',
    { "CopilotC-Nvim/CopilotChat.nvim", build = "make tiktoken" },
  },
  install = { colorscheme = { "gruvbox" } },
  checker = { enabled = true },
})

vim.cmd('colorscheme gruvbox')

require('telescope').load_extension('projects')
require('project_nvim').setup { }
require'gitlinker'.setup()
require('Comment').setup()
require('CopilotChat').setup()

require('which-key').add({
  { "<leader>f", group = "file" },
  { "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Find File" },
  { "<leader>fr", "<cmd>Telescope oldfiles<cr>", desc = "Open Recent File" },
  { "<leader>fp", "<cmd>Telescope projects<cr>", desc = "Open Project" },
  { "<leader>fg", "<cmd>Telescope live_grep<cr>", desc = "Grep" },
  { "<leader>fs", "<cmd>Telescope grep_string<cr>", desc = "Grep string" },

  { "<leader>v", group = "vim" },
  { "<leader>vr", "<cmd>so ~/.config/nvim/init.lua<cr>", desc = 'Reload init.lua'},
  { "<leader>ve", "<cmd>e ~/.config/nvim/init.lua<cr>", desc = 'Open init.lua'},

  { "<leader>c", group = "copilot" },
  { "<leader>ct", "<cmd>CopilotChatToggle<cr>", desc = "toggle" },
})

-- Remove trailing whitespace on save
vim.api.nvim_create_autocmd({ "BufWritePre" }, {
  pattern = { "*" },
  command = [[%s/\s\+$//e]],
})
