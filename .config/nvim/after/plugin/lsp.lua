-- Learn the keybindings, see :help lsp-zero-keybindings
-- Learn to configure LSP servers, see :help lsp-zero-api-showcase
local ok, lsp = pcall(require, "lsp-zero")
if not ok then
  print("LSP Zero is not installed, please install it with :PackerInstall lsp-zero")
  return
end

lsp.preset('recommended')

-- See :help lsp-zero-preferences
lsp.set_preferences({
    set_lsp_keymaps = true, -- set to false if you want to configure your own keybindings
    manage_nvim_cmp = true, -- set to false if you want to configure nvim-cmp on your own
})

-- (Optional) Configure lua language server for neovim
-- lsp.nvim_workspace()

local ok1, lsp_format = pcall(require, "lsp-format")
if not ok1 then
  print("LSP Format is not installed")
  return
end

lsp.on_attach(function(client, bufnr)
  lsp_format.on_attach(client)
end)

lsp.setup()
