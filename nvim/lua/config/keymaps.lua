-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

vim.keymap.set({ "n", "t" }, "gx", function()
  local line = vim.api.nvim_get_current_line()
  local url = line:match("https?://[%w%p]+")
  if url then
    -- 末尾の句読点を落とす
    url = url:gsub("[%.,%)%];:]+$", "")
    vim.ui.open(url)
  else
    vim.notify("No URL on this line", vim.log.levels.WARN)
  end
end, { desc = "Open URL on current line" })
