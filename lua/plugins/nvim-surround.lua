return {
    "kylechui/nvim-surround",
    event = "VeryLazy",
    dependencies = "tpope/vim-repeat",
    keys = { "cs", "ds", "ys", "Y"},
    config = function()
        require("nvim-surround").setup({})
    end
}
