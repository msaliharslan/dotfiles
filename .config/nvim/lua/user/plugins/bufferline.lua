local ok, bufferline = pcall(require, "bufferline")
if not ok then
  return
end

bufferline.setup({
  options = {
    diagnostics = "nvim_lsp",
    offsets = {{filetype = "NvimTree", text = "File Explorer", text_align = "left"}},
    coloricons = true,
    always_show_bufferline = true,
  },
})

