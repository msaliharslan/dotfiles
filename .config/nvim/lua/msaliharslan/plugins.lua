local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

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
    
    -- LSP
    use({
      "VonHeikemen/lsp-zero.nvim",
      branch = "v1.x",
      requires = {
        -- LSP Support
        {"neovim/nvim-lspconfig"},             -- Required
        {"williamboman/mason.nvim"},           -- Optional
        {"williamboman/mason-lspconfig.nvim"}, -- Optional

        -- Autocompletion
        {"hrsh7th/nvim-cmp"},         -- Required
        {"hrsh7th/cmp-nvim-lsp"},     -- Required
        {"hrsh7th/cmp-buffer"},       -- Optional
        {"hrsh7th/cmp-path"},         -- Optional
        {"saadparwaiz1/cmp_luasnip"}, -- Optional
        {"hrsh7th/cmp-nvim-lua"},     -- Optional

        -- Snippets
        {"L3MON4D3/LuaSnip"},             -- Required
        {"rafamadriz/friendly-snippets"}, -- Optional
      }
    })
    use("lukas-reineke/lsp-format.nvim")

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

