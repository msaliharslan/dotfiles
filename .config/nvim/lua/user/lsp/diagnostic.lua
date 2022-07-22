local signs = {
	Error = " ",
	Warn = " ",
	Hint = " ",
	Info = " ",
}

for type, icon in pairs(signs) do
	local hl = "DiagnosticSign" .. type
	vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

local opts = {
	virtual_text = false,
	update_in_insert = true,
	severity_sort = true,
}

vim.diagnostic.config(opts)
