local ok, nvim_tree = pcall(require, "nvim-tree")
if not ok then
  return
end

local view = nvim_tree.view

local config = {
  view = {
    hide_root_folder = true,
    mappings = {
      custom_only = false,
      list = {
        { key = "l", action = "edit"},
        { key = "h", action = "close_node" },
        { key = "H", action = "collapse_all" },
      }
    },
  },
  renderer = {
    highlight_git = true,
    full_name = true,
    highlight_opened_files = "all",
    indent_markers = {
      enable = true,
    },
    special_files = { "Cargo.toml", "Makefile", "README.md", "readme.md", "LICENSE" },
  },
  filters = {
    dotfiles = false,
    custom = {"**/.git"},
  },
}

nvim_tree.setup(config)
