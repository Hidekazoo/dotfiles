return {
  'nvim-treesitter/nvim-treesitter',
  lazy = false,
  build = ':TSUpdate',
  config = function()
    require('nvim-treesitter').setup({
      ensure_installed = { 'rust', 'lua', 'vim', 'vimdoc', 'toml' },
      auto_install = true,
    })
    -- Enable treesitter highlighting for all supported filetypes
    vim.api.nvim_create_autocmd('FileType', {
      callback = function()
        pcall(vim.treesitter.start)
      end,
    })
  end,
  opts = function(_, opts)
    if type(opts.ensure_installed) == "table" then
      vim.list_extend(opts.ensure_installed, { "angular", "scss", "elixir", "heex", "eex" })
      vim.treesitter.language.register("markdown", "livebook")
    end
    vim.api.nvim_create_autocmd({ "BufReadPost", "BufNewFile" }, {
      pattern = { "*.component.html", "*.container.html" },
      callback = function()
        vim.treesitter.start(nil, "angular")
      end,
    })
  end,
}
