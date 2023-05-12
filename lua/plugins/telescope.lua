return {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.1',
    dependencies = {
        { 'nvim-lua/plenary.nvim' },
        { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    },
    config = function()
        local telescope = require('telescope')
        telescope.setup({
            -- defaults = {
            --     mappings = {
            --       i = {
            --         ["<C-k>"] = actions.move_selection_previous, -- move to prev result
            --         ["<C-j>"] = actions.move_selection_next, -- move to next result
            --         ["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist, -- send selected to quickfixlist
            --       },
            --     },
            --   },
        })
        telescope.load_extension("fzf")
    end

}
