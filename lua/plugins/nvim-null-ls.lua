return {
  "jose-elias-alvarez/null-ls.nvim",
  dependencies = "nvim-lua/plenary.nvim",
  event = {"VeryLazy"},
  config = function()
    local null_ls = require("null-ls")
    local formatting = null_ls.builtins.formatting   -- to setup formatters
    local diagnostics = null_ls.builtins.diagnostics -- to setup linters
    -- to setup format on save
    local augroup = "LspFormatting"
    null_ls.setup({
      sources = {
        formatting.prettier.with({
          condition = function(utils)
            return utils.root_has_file(".prettierrc.js") -- change file extension if you use something else
          end,
        }),
      },
      on_attach = function(current_client, bufnr)
        if current_client.supports_method("textDocument/formatting") then
          vim.api.nvim_exec("augroup " .. augroup .. "\nautocmd!\nautocmd BufWritePre <buffer> lua vim.lsp.buf.format(nil, 1000)\naugroup END", false)
        end
      end
    })
  end,
}
