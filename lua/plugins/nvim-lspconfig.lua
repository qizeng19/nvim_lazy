-- https://github.com/neovim/nvim-lspconfig
-- https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
-- https://github.com/folke/neodev.nvim

-- To instead override float border setting globally
local orig_util_open_floating_preview = vim.lsp.util.open_floating_preview
function vim.lsp.util.open_floating_preview(contents, syntax, opts, ...)
    local border = {
        { "┌", "FloatBorder" },
        { "─", "FloatBorder" },
        { "┐", "FloatBorder" },
        { "│", "FloatBorder" },
        { "┘", "FloatBorder" },
        { "─", "FloatBorder" },
        { "└", "FloatBorder" },
        { "│", "FloatBorder" },
    }
    opts = opts or {}
    opts.border = opts.border or border

    return orig_util_open_floating_preview(contents, syntax, opts, ...)
end

vim.diagnostic.config({
    virtual_text = { prefix = "", source = "always" }, -- prefix：'●', '▎', 'x'
    float = { source = "always" },
    signs = true,
    underline = true,
    update_in_insert = false,
    severity_sort = true,
})

local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
for type, icon in pairs(signs) do
    local hl = "DiagnosticSign" .. type
    vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "single" })
vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = "single" })

return {
    "neovim/nvim-lspconfig",
    dependencies = {
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
        "folke/neodev.nvim",
        "j-hui/fidget.nvim",
    },
    event = { "BufReadPre", "BufNewFile" },
    enabled = _G.IsNotLargeFile(),
    config = function()
        local lsp_signature = require("lsp_signature")
        local capabilities = vim.lsp.protocol.make_client_capabilities()

        capabilities.textDocument.completion.completionItem.snippetSupport = true
        capabilities.textDocument.completion.completionItem.documentationFormat = { "markdown", "plaintext" }
        capabilities.textDocument.completion.completionItem.preselectSupport = true
        capabilities.textDocument.completion.completionItem.insertReplaceSupport = true
        capabilities.textDocument.completion.completionItem.labelDetailsSupport = true
        capabilities.textDocument.completion.completionItem.deprecatedSupport = true
        capabilities.textDocument.completion.completionItem.commitCharactersSupport = true
        capabilities.textDocument.completion.completionItem.tagSupport = { valueSet = { 1 } }
        capabilities.textDocument.completion.completionItem.resolveSupport = {
            properties = {
                "documentation",
                "detail",
                "additionalTextEdits",
            },
        }

        local on_attach = function(client, bufnr)
            vim.api.nvim_exec_autocmds("User", { pattern = "LspAttached" })
            lsp_signature.on_attach(client, bufnr)
            -- Mappings.
            -- See `:help vim.lsp.*` for documentation on any of the below functions



            vim.keymap.set(
                "n",
                "<leader>f",
                "<cmd>lua vim.lsp.buf.format { async = true }<CR>",
                { noremap = true, silent = true, buffer = bufnr, desc = "format" }
            )

            vim.keymap.set(
                "n",
                "gr",
                "<cmd>lua vim.lsp.buf.rename() <CR>",
                { noremap = true, silent = true, buffer = bufnr, desc = "rename" }
            )
        end

        -- require("neodev").setup()




        -- https://clangd.llvm.org/features.html
        capabilities.offsetEncoding = { "utf-16" } -- https://github.com/neovim/neovim/pull/16694


        local servers = { 'pylsp', 'html', 'cssls', 'tsserver', 'tailwindcss' }
        for _, lsp in ipairs(servers) do
            require 'lspconfig'[lsp].setup {
                capabilities = capabilities,
                on_attach = on_attach,
            }
        end
    end,
}
