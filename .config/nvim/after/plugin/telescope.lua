local ok, telescope = pcall(require, "telescope")
if not ok then
  return
end

telescope.load_extension("fzf")
telescope.load_extension("ui-select")
