return {
    "morhetz/gruvbox",
    config = function()
        vim.o.background = "dark" --you can use dark or light mode.
        -- vim.cmd([[colorscheme gruvbox]])
        vim.cmd.colorscheme("gruvbox")
    end
}
