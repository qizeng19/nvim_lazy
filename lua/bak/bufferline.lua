vim.opt.termguicolors = true
return {
    lazy = false,
event = 'VeryLazy',
    'akinsho/bufferline.nvim',
    version = "*",
    dependencies = {'nvim-tree/nvim-web-devicons'},
    config = function ()
        require('bufferline').setup({
            options = {
                -- 使用 nvim 内置lsp
                diagnostics = "nvim_lsp",
                -- 左侧让出 nvim-tree 的位置
                -- offsets = {{
                --     filetype = "NvimTree",
                --     text = "File Explorer",
                --     highlight = "Directory",
                --     text_align = "left"
                -- }},
                -- close_command = "bdelete! %d",       -- can be a string | function, see "Mouse actions"
                buffer_close_icon = '',
                -- buffer_close_icon = '', -- 不想展示关闭符号
                modified_icon = '●',
                diagnostics_indicator = function(count, level, diagnostics_dict, context)
                    local icon = level:match("error") and " " or " "
                    return " " .. icon .. count
                end
            },
        -- how to configure this plugin in details please see :h bufferline-configuration
            highlights = {
 fill = {
                fg = 'red',
                bg = 'green',
            },
            background = {
                fg = 'yellow',
                bg = 'blue'
            },
                buffer_selected = {
                    fg = normal_fg,
                    bold = true,
                    italic = true,
                },
            },
        })
    end
}