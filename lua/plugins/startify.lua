return {
    "mhinz/vim-startify",
    event ={"VeryLazy"},
    config = function()
        vim.keymap.set('n', "<leader>y", ":Startify<cr>")
    end
}
