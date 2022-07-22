local ok, configs = pcall(require, "nvim-treesitter.configs")
if not ok then
	return
end

configs.setup({
	ensure_installed = "all",
  auto_install = true,
	ignore_install = { "" },
	highlight = {
		enable = true,       -- false will disable the whole extension
		disable = { "" },    -- languages to be disabled
    additional_vim_regex_highlighting = false,
	},
	autopairs = {
		enable = true,
	},
	indent = { enable = true, disable = {  }, }
})

