vim.keymap.set("n", "<leader>w", "<cmd>w<cr>", { desc = "Save File" })
vim.keymap.set('n', '<leader>sw', function()
  -- 現在のテーマが nightfox なら dayfox に、それ以外なら nightfox に変更
  if vim.g.colors_name == "nightfox" then
    vim.cmd("colorscheme dayfox")
    print("Switched to dayfox")
  else
    vim.cmd("colorscheme nightfox")
    print("Switched to nightfox")
  end
end, { desc = "Toggle nightfox/dayfox" })
vim.keymap.set("n", "gl", function()
  vim.diagnostic.open_float()
end, { desc = "Show line diagnostics" })
vim.keymap.set({ "n", "v" }, "<D-.>", vim.lsp.buf.code_action, { desc = "Code Action" })
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")
vim.keymap.set("t", "<Esc>", "<C-\\><C-n>", { silent = true })
vim.keymap.set("t", "<C-w>", [[<C-\><C-n><C-w>]], { silent = true })
