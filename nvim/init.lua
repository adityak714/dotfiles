-- Downloading lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- Add plugins here
local plugins = {
	{
		"folke/tokyonight.nvim",
		lazy = false,
		priority = 1000,
		opts = {},
	},
	{
		'preservim/nerdtree'
	},
	{
		'zyedidia/vim-snake'
	},
	{
    		'goolord/alpha-nvim',
    		config = function ()
        		require'alpha'.setup(require'alpha.themes.dashboard'.config)
    		end
	},
	{
    		'nvim-telescope/telescope.nvim', tag = '0.1.6',
	        -- or                       , branch = '0.1.x',
      		dependencies = { 'nvim-lua/plenary.nvim' },
		defaults = {
		  file_ignore_patterns = { "^.local/", "^.cache/" } 
		},
		pickers = {
    		  find_files = {
      		     hidden = true
    		  }
  		}
	},
	{
		'edluffy/hologram.nvim'
	}
}

-- Add options here
local opts = {}

-- Load lazy.nvim
require("lazy").setup(plugins, opts)

require('hologram').setup{
    auto_display = true -- WIP automatic markdown image display, may be prone to breaking
}

local actions = require("telescope.actions")

vim.cmd.colorscheme "tokyonight-night"

-- Set highlight on search
vim.o.hlsearch = false

-- Make line numbers default
vim.wo.number = true

-- Enable mouse mode
vim.o.mouse = 'a'

-- Enable break indent
vim.o.breakindent = true

-- Save undo history
vim.o.undofile = true

-- Case insensitive searching UNLESS /C or capital in search
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.relativenumber = true

-- Decrease update time
vim.o.updatetime = 250
vim.wo.signcolumn = 'yes'

vim.keymap.set('i', 'fj', '<Esc>', {noremap = true})
vim.keymap.set('n', ".", ":", {noremap = true})
vim.keymap.set('n', 'fj', '<Esc>', {noremap = true})
vim.keymap.set('v', 'fj', '<Esc>', {noremap = true})

-- vim.keymap.set('c', '<cmd>:Ex<cr>', '<cmd>:ex<cr>', {noremap = true})
vim.cmd.cnoreabbrev'ex NERDTree'

vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

local builtin = require("telescope.builtin")
-- vim.keymap.set('n', 'ff', "<cmd>lua require'telescope.builtin'.find_files({ find_command = {'--hidden'}})<cr>", {noremap=true})

require('telescope').setup{
    defaults = {
        mappings = {
            i = {
                ["fj"] = actions.close,
            },
        },
    },
}

vim.keymap.set('n', 'ff', "<cmd>:Telescope find_files hidden=true<cr>", { noremap=true })
