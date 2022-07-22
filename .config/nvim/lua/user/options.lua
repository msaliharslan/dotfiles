-- Options
local options = {
  -- search
  ignorecase = true,
  smartcase = true,
  hlsearch = false,

  -- higlight line
  cursorline = true,
  cursorlineopt = "screenline",

  -- indentation
  tabstop = 2,
  shiftwidth = 2,
  expandtab = true,
  smartindent = true,

  -- line numbers
  number = true,
  relativenumber = true,

  -- splits
  splitbelow = true,
  splitright = true,

  -- files
  backup = false,
  swapfile = false,
  undofile = true,

  -- Time
  timeoutlen = 500,

  -- miscalleneous
  fileencoding = "utf-8",
  scrolloff = 12,
  sidescrolloff = 12,
  signcolumn = 'yes:2',
  showtabline = 2,
  mouse = 'a',
  termguicolors = true,
  clipboard = "unnamedplus",
  --cmdheight = 0,
}


for key, val in pairs(options) do
  vim.opt[key] = val
end

-- Restore cursor position
vim.api.nvim_create_autocmd('BufReadPost', {
  pattern = '*',
  callback = function()
    vim.fn.setpos(".", vim.fn.getpos("'\""))
  end,
})
