return {
    "nvim-lualine/lualine.nvim",
    dependencies = "nvim-tree/nvim-web-devicons",
    event = "VeryLazy",
    keys = {
        { "<A-1>", "<cmd>LualineBuffersJump! 1<cr>" },
        { "<A-2>", "<cmd>LualineBuffersJump! 2<cr>" },
        { "<A-3>", "<cmd>LualineBuffersJump! 3<cr>" },
        { "<A-4>", "<cmd>LualineBuffersJump! 4<cr>" },
        { "<A-5>", "<cmd>LualineBuffersJump! 5<cr>" },
        { "<A-6>", "<cmd>LualineBuffersJump! 6<cr>" },
        { "<A-7>", "<cmd>LualineBuffersJump! 7<cr>" },
        { "<A-8>", "<cmd>LualineBuffersJump! 8<cr>" },
        { "<A-9>", "<cmd>LualineBuffersJump! 9<cr>" },
        { "<A-$>", "<cmd>LualineBuffersJump! $<cr>" },
    },
    config = function()
        -- local custom_gruvbox = require 'lualine.themes.gruvbox'
        -- Change the background of lualine_c section for normal mode
        -- custom_gruvbox.normal.c.bg = '#112233'
        -- custom_gruvbox.normal.a.bg = '#000000'
        require("lualine").setup({
            -- options = {
            --     theme = custom_gruvbox,
            --     section_separators = { left = "", right = "" },
            --     component_separators = { left = "", right = "" },
            -- },
            sections = {
                lualine_a = { "mode" },
                lualine_b = { "branch", "diff", {
                    'diagnostics',

                    -- Table of diagnostic sources, available sources are:
                    --   'nvim_lsp', 'nvim_diagnostic', 'nvim_workspace_diagnostic', 'coc', 'ale', 'vim_lsp'.
                    -- or a function that returns a table as such:
                    --   { error=error_cnt, warn=warn_cnt, info=info_cnt, hint=hint_cnt }
                    sources = { 'nvim_diagnostic', 'nvim_lsp' },

                    -- Displays diagnostics for the defined severity types
                    sections = { 'error', 'warn', 'info', 'hint' },

                    diagnostics_color = {
                        -- Same values as the general color option can be used here.
                        error = 'DiagnosticError', -- Changes diagnostics' error color.
                        warn  = 'DiagnosticWarn', -- Changes diagnostics' warn color.
                        info  = 'DiagnosticInfo', -- Changes diagnostics' info color.
                        hint  = 'DiagnosticHint', -- Changes diagnostics' hint color.
                    },
                    symbols = { error = '😅', warn = 'W', info = 'I', hint = 'H' },
                    colored = true, -- Displays diagnostics status in color if set to true.
                    update_in_insert = false, -- Update diagnostics in insert mode.
                    always_visible = false, -- Show diagnostics even if there are none.
                } },
            },
            -- inactive_sections = {
            --     lualine_a = {},
            --     lualine_b = {},
            --     lualine_c = { "filename" },
            --     lualine_x = {},
            --     lualine_y = {},
            --     lualine_z = {},
            -- },
            -- tabline = {
            --     lualine_a = {},
            --     lualine_b = {},
            --     lualine_c = { { "buffers", mode = 2, max_length = vim.o.columns * 9 / 10 } },
            --     lualine_x = { "tabs" },
            --     lualine_y = {},
            --     lualine_z = {},
            -- },
            -- extensions = {
            --     "aerial",
            --     "fugitive",
            --     "fzf",
            --     "man",
            --     "neo-tree",
            --     "nvim-dap-ui",
            --     "quickfix",
            --     "toggleterm",
            -- },
        })
    end,
}
