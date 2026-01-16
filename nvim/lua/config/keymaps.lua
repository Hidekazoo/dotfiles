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
