-- Automatically install packer
local install_path = vim.fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system({"git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim",
                                install_path})
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
    use("nvim-tree/nvim-web-devicons")
    use("nvim-tree/nvim-tree.lua")

    -- Sessions
    use("Shatur/neovim-session-manager")

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
    use({
      "akinsho/bufferline.nvim",
      tag = "v3.*",
      requires = "nvim-tree/nvim-web-devicons"
    })
    use({
      "nvim-lualine/lualine.nvim",
      requires = {
        "nvim-tree/nvim-web-devicons",
        opt = true
      }
    })

    -- Multiple cursors
    use("mg979/vim-visual-multi")

    -- Keymapping helper
    use("folke/which-key.nvim")

    -- Treesitter
    use({
      "nvim-treesitter/nvim-treesitter",
      run = ":TSUpdate"
    })
    use("nvim-treesitter/nvim-treesitter-context")

    -- Find stuff
    use({
      "nvim-telescope/telescope-fzf-native.nvim",
      run = "make"
    })
    use({"nvim-telescope/telescope-ui-select.nvim"})
    use({
      "nvim-telescope/telescope.nvim",
      branch = "0.1.x",
      requires = {{'nvim-lua/plenary.nvim'}}
    })
    use({
      "folke/trouble.nvim",
      requires = "nvim-tree/nvim-web-devicons"
    })
    use("RRethy/vim-illuminate")

    -- Get help
    use("github/copilot.vim")

    -- Better interface
    use("folke/zen-mode.nvim")

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
        return require("packer.util").float({
          border = "single"
        })
      end
    }
  }
})
