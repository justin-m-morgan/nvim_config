return {
  "elixir-tools/elixir-tools.nvim",
  version = "*",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    local elixir = require("elixir")
    local elixirls = require("elixir.elixirls")

    elixir.setup {
      nextls = {
        enable = true,
        init_options = {
          mix_env = "dev",
          experimental = {
            completions = {
              enable = false -- control if completions are enabled. defaults to false
            }
          },
        },
        credo = { enable = true },
        elixirls = {
          enable = true,
          settings = elixirls.settings {
            dialyzerEnabled = true,
            enableTestLenses = true,
          },
          on_attach = function(_, _)
            vim.keymap.set("n", "<space>fp", ":ElixirFromPipe<cr>", { buffer = true, noremap = true })
            vim.keymap.set("n", "<space>tp", ":ElixirToPipe<cr>", { buffer = true, noremap = true })
            vim.keymap.set("v", "<space>em", ":ElixirExpandMacro<cr>", { buffer = true, noremap = true })
          end,
        }
      },
    }
  end,
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
}
