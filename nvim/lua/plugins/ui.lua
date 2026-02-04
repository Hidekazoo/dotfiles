return {
  -- Nightfox本体の追加
  {
    "EdenEast/nightfox.nvim",
    lazy = false, -- 起動時に読み込む必要があるため
    priority = 1000, -- 他のプラグインより先に読み込む
    config = function()
      -- 必要ならここにNightfox独自のオプションを書けます
      -- 例: 背景を透明にするなど
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
      colorscheme = "nightfox",
    },
  },
}
