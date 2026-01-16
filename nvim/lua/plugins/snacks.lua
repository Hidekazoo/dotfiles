return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
  ---@type snacks.Config
  opts = {
    indent = { enabled = true },
    input = { enabled = true },
    picker = { enabled = true },
    terminal = { enabled = true }
  },
  keys = {
	  { "<C-/>", function() Snacks.terminal() end, desc = "Toggle Terminal", mode = { "n", "t" } },
	  { "<leader>sf", function() Snacks.picker.files() end, desc = "Search Files" },
	  { "<leader>sg", function() Snacks.picker.grep() end, desc = "Search Grep" }
  }
}
