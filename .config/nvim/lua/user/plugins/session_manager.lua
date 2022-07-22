local ok, session_manager = pcall(require, "session_manager")
if not ok then
  return
end

session_manager.setup({})

