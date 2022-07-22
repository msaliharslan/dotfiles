local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
	PACKER_BOOTSTRAP =
		fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
	vim.cmd([[packadd packer.nvim]])
end

-- Automatically compile when updated
vim.cmd([[
augroup packer_user_config
autocmd!
autocmd BufWritePost */user/plugins/plugins.lua source <afile> | PackerSync
augroup end
]])

-- Use a protected call so we don't error out on first use
local ok, packer = pcall(require, "packer")
if not ok then
	return
end

return packer.startup({
	function()
		-- Packer can manage itself
		use("wbthomason/packer.nvim")

		-- common dependencies for other plugins
		use("nvim-lua/popup.nvim")
		use("nvim-lua/plenary.nvim")

		-- Indentation lines
		use("lukas-reineke/indent-blankline.nvim")

		-- Pair up paranthesis
		use("windwp/nvim-autopairs")

		-- File Tree
		use("kyazdani42/nvim-web-devicons")
		use("kyazdani42/nvim-tree.lua")

		-- Sessions
		use("Shatur/neovim-session-manager")

		-- Find stuff
		use("nvim-telescope/telescope.nvim")
		use("nvim-telescope/telescope-media-files.nvim")
		use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make" })
		use({ "folke/trouble.nvim", requires = "kyazdani42/nvim-web-devicons" })
		use("RRethy/vim-illuminate")

		-- Completion
		use("hrsh7th/nvim-cmp")
		use("hrsh7th/cmp-buffer")
		use("hrsh7th/cmp-path")
		use("hrsh7th/cmp-cmdline")
		use("saadparwaiz1/cmp_luasnip")
		use("hrsh7th/cmp-nvim-lsp")
		use("hrsh7th/cmp-nvim-lsp-signature-help")
		use("hrsh7th/cmp-nvim-lua")
		use("hrsh7th/cmp-nvim-lsp-document-symbol")

		-- Snippets
		use("L3MON4D3/LuaSnip")
		use("rafamadriz/friendly-snippets")

		-- Treesitter
		use({ "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" })

		-- LSP
		use("neovim/nvim-lspconfig")
		use("williamboman/nvim-lsp-installer")
		use("jose-elias-alvarez/null-ls.nvim")

		-- Undotree
		use("mbbill/undotree")

		-- Comments
		use("numToStr/Comment.nvim")

		-- Git
		use("lewis6991/gitsigns.nvim")

		-- Theme
		use("gruvbox-community/gruvbox")
		use("lunarvim/colorschemes")
		use("lunarvim/darkplus.nvim")
		use("tomasiser/vim-code-dark")

		-- Buffer & status line
		use({ "akinsho/bufferline.nvim", tag = "v2.*", requires = "kyazdani42/nvim-web-devicons" })
		use({ "nvim-lualine/lualine.nvim", requires = { "kyazdani42/nvim-web-devicons", opt = true } })

		-- Multiple cursors
		use("mg979/vim-visual-multi")

		-- Keymapping helper
		use("folke/which-key.nvim")

		-- Automatically set up your configuration after cloning packer.nvim
		-- Put this at the end after all plugins
		if packer_bootstrap then
			require("packer").sync()
		end
	end,
	-- Have packer use a popup window
	config = {
		display = {
			open_fn = function()
				return require("packer.util").float({ border = "single" })
			end,
		},
	},
})
