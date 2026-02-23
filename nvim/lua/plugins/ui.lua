return {
  {
    "rebelot/kanagawa.nvim",
    lazy = false,
    priority = 900,
  },
  {
    "EdenEast/nightfox.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      require("nightfox").setup({
        options = {
          transparent = false,
        },
      })
    end,
  },
  -- LazyVim自体の設定でカラースキームを指定
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "kanagawa",
    },
  },
}
