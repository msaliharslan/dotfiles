local ok, nvim_lsp_installer = pcall(require, "nvim-lsp-installer")
if not ok then
  return
end

nvim_lsp_installer.setup({
  automatic_installation = true -- automatically detect which servers to install (based on which servers are set up via lspconfig)
})
