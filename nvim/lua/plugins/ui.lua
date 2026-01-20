return {
  -- {
  --   "folke/tokyonight.nvim",
  --   lazy = false,
  --   opts = {
  --   },
  --   config = function(_, opts)
  --     require("tokyonight").setup(opts)
  --   end,
  -- },
  { "EdenEast/nightfox.nvim" ,
  lazy = false,
  priority = 1000,
  opts = {
    options = {
      transparent = true,
    }
  },
  config = function()
    vim.cmd.colorscheme("nightfox")
  end,
  },
}
