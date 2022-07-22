local ok, lspconfig = pcall(require, "lspconfig")
if not ok then
	return
end

require("user.lsp.diagnostic")

lspconfig.cssls.setup({})
lspconfig.eslint.setup({})
lspconfig.jsonls.setup({})
lspconfig.pyright.setup({})
lspconfig.volar.setup({})
lspconfig.dockerls.setup({})
lspconfig.rust_analyzer.setup({})
lspconfig.stylelint_lsp.setup({})
lspconfig.sumneko_lua.setup({})
lspconfig.tsserver.setup({})
