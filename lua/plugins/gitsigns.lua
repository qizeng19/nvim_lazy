return {
  "lewis6991/gitsigns.nvim",
  config = function()
    require('gitsigns').setup({
      current_line_blame = true,-- 提交历史 Toggle with `:Gitsigns toggle_current_line_blame`
    })
  end
}
