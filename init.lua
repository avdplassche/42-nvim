--[[ broller config :) ]] --

-- Set a few settings. Necessary before lazy is run.
require "vim_settings"

-- Install package manager
--    https://github.com/folke/lazy.nvim
--    `:help lazy.nvim.txt` for more info
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system {
      'git',
      'clone',
      '--filter=blob:none',
      'https://github.com/folke/lazy.nvim.git',
      '--branch=stable', -- latest stable release
      lazypath,
  }
end
vim.opt.rtp:prepend(lazypath)

-- Validate that lazy is available.
if not pcall(require, "lazy") then
  -- stylua: ignore
  vim.api.nvim_echo({ { ("Unable to load lazy from: %s\n"):format(lazypath), "ErrorMsg" }, { "Press any key to exit...", "MoreMsg" } }, true, {})
  vim.fn.getchar()
  vim.cmd.quit()
end

-- Load Lazy and make sure every plugin is installed.
require "lazy_load"

-- Load Telescope Settings.
require "config.telescope"

-- Load Treesitter Settings.
require "config.treesitter"

-- Load LSP Settings.
require "config.lsp"

-- Load Autocompletion Settings.
require "config.cmp"

-- Load File Tree Settings.
require "config.nvimtree"

-- Set theme.
--vim.cmd.colorscheme 'astrotheme'
vim.cmd.colorscheme 'onedark'
vim.notify = require("notify")
-- Launch! :)