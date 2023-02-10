-- search
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.hlsearch = false
vim.opt.incsearch = true

-- higlight line
vim.opt.cursorline = true
vim.opt.cursorlineopt = "screenline"

-- indentation
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.smartindent = true

-- line numbers
vim.opt.number = true
vim.opt.relativenumber = true

-- splits
vim.opt.splitbelow = true
vim.opt.splitright = true

-- files
vim.opt.backup = false
vim.opt.swapfile = false
vim.opt.undofile = true

-- Time
vim.opt.timeoutlen = 500

-- miscalleneous
vim.opt.fileencoding = "utf-8"
vim.opt.scrolloff = 12
vim.opt.sidescrolloff = 12
vim.opt.signcolumn = 'yes:2'
vim.opt.showtabline = 2
vim.opt.mouse = 'a'
vim.opt.termguicolors = true
vim.opt.clipboard = "unnamedplus"
vim.opt.wrap = false
vim.opt.colorcolumn = "80"
vim.opt.cmdheight = 0

-- Restore cursor position
vim.api.nvim_create_autocmd('BufReadPost', {
  pattern = '*',
  callback = function()
    vim.fn.setpos(".", vim.fn.getpos("'\""))
  end
})
