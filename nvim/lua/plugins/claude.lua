return {
  "coder/claudecode.nvim",
  dependencies = { "folke/snacks.nvim" },
  opts = {
    terminal = {
      provider = "snacks",
      split_side = "right",
      split_width_percentage = 0.20,
    },
    diff_opts = {
      open_in_new_tab = true,
    },
  },
  keys = {},
}
