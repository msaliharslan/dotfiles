local ok, autopairs = pcall(require, "nvim-autopairs")
if not ok then
  return
end

autopairs.setup()

local autopairs_cmp = require "nvim-autopairs.completion.cmp"
local ok, cmp = pcall(require, 'cmp')
if not ok then
  return
end

cmp.event:on(
  'confirm_done',
  autopairs_cmp.on_confirm_done()
)
