return {
	{
		"mason-org/mason.nvim",
		opts = {},
	},
	{
		"mason-org/mason-lspconfig.nvim",
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = {
					"angularls",
					"ts_ls",
					"html",
					"cssls",
					"jsonls",
					"gopls",
				},
        handlers = {
          function(server_name)
            require("lspconfig")[server_name].setup({})
          end,
          rust_analyzer = function() end,
          -- angularls専用の設定を追加
          angularls = function()
            require("lspconfig").angularls.setup({
              on_new_config = function(new_config,
                new_root_dir)
                local project_ts = new_root_dir ..
                "/node_modules/typescript/lib"
                local project_angularls = new_root_dir ..
                "/node_modules/@angular/language-service"

                if vim.fn.isdirectory(project_ts) == 1 and
                  vim.fn.isdirectory(project_angularls) == 1 then
                  new_config.cmd = {
                    "ngserver",
                    "--stdio",
                    "--tsProbeLocations", project_ts,
                    "--ngProbeLocations",
                    project_angularls,
                  }
                end
              end,
            })
          end,
        },
			})
		end,
		dependencies = {
			"mason-org/mason.nvim",
			"neovim/nvim-lspconfig",
		},
	},
	{
		"neovim/nvim-lspconfig",
		dependencies = { "mason-org/mason.nvim", "mason-org/mason-lspconfig.nvim" },
		config = function()
			vim.api.nvim_create_autocmd("LspAttach", {
				callback = function(event)
					local opts = { buffer = event.buf }
					vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
					vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
					vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
					vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
					vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
				end,
			})
		end,
    opts = {
      servers = {
        angularls = {},
        elixirls = {
      keys = {
        {
          "<leader>cp",
          function()
            local params = vim.lsp.util.make_position_params()
            LazyVim.lsp.execute({
              command = "manipulatePipes:serverid",
              arguments = { "toPipe", params.textDocument.uri, params.position.line, params.position.character },
            })
          end,
          desc = "To Pipe",
        },
        {
          "<leader>cP",
          function()
            local params = vim.lsp.util.make_position_params()
            LazyVim.lsp.execute({
              command = "manipulatePipes:serverid",
              arguments = { "fromPipe", params.textDocument.uri, params.position.line, params.position.character },
            })
          end,
          desc = "From Pipe",
        },
      },
    },
      },
      setup = {
        angularls = function()
          Snacks.util.lsp.on({ name = "angularls" }, function(_, client)
            --HACK: disable angular renaming capability due to duplicate rename popping up
            client.server_capabilities.renameProvider = false
          end)
        end,
      },
    },
	},
}
