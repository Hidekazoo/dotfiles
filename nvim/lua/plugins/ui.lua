return {
  {
    "folke/tokyonight.nvim",
    lazy = false,
    opts = {},
    config = function(_, opts)
      require("tokyonight").setup(opts)
    end,
  },
  { "EdenEast/nightfox.nvim" ,
  lazy = false,
  priority = 1000,
  config = function()
    vim.cmd.colorscheme("nightfox")
  end,
  },
}
