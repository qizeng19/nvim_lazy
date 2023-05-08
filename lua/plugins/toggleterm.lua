-- terminal模式 按 esc 和 jk
-- normall 模式按leader tt
return {
    lazy = false,
    'akinsho/toggleterm.nvim',
    config = function()
        require("toggleterm").setup({
            size = function(term)
                if term.direction == 'horizontal' then
                    return 15
                elseif term.direction == 'vertical' then
                    return vim.o.columns * 0.4
                end
            end,
            direction = 'float',
            close_on_exit = true, -- close the terminal window when the process exits
        })
        -- set keymaps to easily move between buffers and terminal
        function _G.set_terminal_keymaps()
            local opts = { buffer = 0 }
            vim.keymap.set('t', '<esc>', [[<C-\><C-n>]], opts)
            vim.keymap.set('t', 'jk', [[<C-\><C-n><Cmd>ToggleTerm<CR>]], opts)
        end

        vim.cmd('autocmd! TermOpen term://* lua set_terminal_keymaps()')
    -- Making the terminal to always open horizontally with this mapping.
        local cmd = '<CMD>execute v:count . "ToggleTerm direction=horizontal"<CR>'
        vim.keymap.set({ "n", "t" }, "<leader>tt", cmd, { silent = true, desc = "Toggle Terminal" })
    end
}
