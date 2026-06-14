return {
  {
    "rebelot/kanagawa.nvim",
    lazy = false,
    priority = 900,
    opts = {
      transparent = true,
      overrides = function(colors)
        local theme = colors.theme
        return {
          -- フロート/サイドバー系の背景を透過
          NormalFloat = { bg = "none" },
          FloatBorder = { bg = "none" },
          FloatTitle = { bg = "none" },
          -- snacks explorer / picker パネル
          SnacksPicker = { bg = "none" },
          SnacksPickerList = { bg = "none" },
          SnacksPickerListBorder = { bg = "none" },
          SnacksPickerPreview = { bg = "none" },
          SnacksPickerInput = { bg = "none" },
          SnacksPickerBox = { bg = "none" },
          SnacksPickerTitle = { bg = "none" },
          SnacksPickerBorder = { bg = "none" },
          SnacksDashboardNormal = { bg = "none" },
          -- which-key 等のポップアップで角が暗くなるのを防ぐ
          NormalDark = { fg = theme.ui.fg_dim, bg = "none" },
          -- neo-tree を使う場合
          NeoTreeNormal = { bg = "none" },
          NeoTreeNormalNC = { bg = "none" },
        }
      end,
    },
  },
  -- {
  --   "EdenEast/nightfox.nvim",
  --   lazy = false,
  --   priority = 1000,
  --   config = function()
  --     require("nightfox").setup({
  --       options = {
  --         transparent = false,
  --       },
  --     })
  --   end,
  -- },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "kanagawa",
    },
  },
}
