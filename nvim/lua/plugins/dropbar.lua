return {
  'Bekaboo/dropbar.nvim',
  event = { "BufReadPost", "BufNewFile" },
  dependencies = {
    'nvim-telescope/telescope-fzf-native.nvim',
    build = 'make'
  },

  opts = {
    general = {
      enable = function(buf, win)
        local ft = vim.bo[buf].filetype
        local buftype = vim.bo[buf].buftype
        local name = vim.api.nvim_buf_get_name(buf)

        if ft == 'oil' then
          return true
        end

        return not vim.api.nvim_win_get_config(win).zindex
        and buftype == ""
        and name ~= ""
        and ft ~= "snacks_dashboard" 
      end,
    }
  },

  keys = {
    { "<Leader>;", function() require("dropbar.api").pick() end, desc = "Pick symbols" },
    { "[;", function() require("dropbar.api").goto_context_start() end, desc = "Go to start" },
    { "];", function() require("dropbar.api").select_next_context() end, desc = "Select next" },
  },
}
