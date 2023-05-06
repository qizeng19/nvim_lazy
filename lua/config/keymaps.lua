-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
-- This file is automatically loaded by lazyvim.plugins.config

-- set leader key to space
vim.g.mapleader = " "
local keymap = vim.keymap -- for conciseness

---------------------
-- General Keymaps
---------------------
-- 注意 这里的keymap.set 就和其他地方的map差不多 eg.:  map('n', '<leader>f', ':Telescope find_files <CR>') 
-- use jk to exit insert mode
keymap.set("i", "jk", "<ESC>")

-- change :wa --> c-s
keymap.set("n", "<leader>sa", ":wa<CR>")
-- keymap.set("n", "<D-s>", ":wa<CR>")

-- show marks
keymap.set("n", "<leader>ma", ":marks<CR>")

-- clear search highlights
-- keymap.set("n", "<leader>nh", ":nohl<CR>")-已经设置按esc取消高亮

-- delete single character without copying into register
keymap.set("n", "x", '"_x')

-- increment/decrement numbers
-- keymap.set("n", "<leader>+", "<C-a>") -- increment
-- keymap.set("n", "<leader>-", "<C-x>") -- decrement
-- 设置交换上一行和下一行
keymap.set("v", "J", ":m '>+1<CR>gv=gv")
keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- 设置全局替换
keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- window management
keymap.set("n", "<leader>sh", "<C-w>v") -- 水平方向打开一个窗口
-- keymap.set("n", "<leader>sh", "<C-w>s") -- split window horizontally 和下面的冲突 平时很少用这个
-- keymap.set("n", "<leader>sn", "<C-w>n") -- prev window 
-- keymap.set("n", "<leader>sp", "<C-w>p") -- next window 

-- 窗口 上下左右
keymap.set('n', '<leader>sj', '<C-w>h') -- 光标移动到左边窗口
keymap.set('n', '<leader>sk', '<C-w>l')-- 光标移动到右边窗口
-- keymap.set('n', '<leader>sk', '<C-w>k')
-- keymap.set('n', '<leader>sj', '<C-w>j')
-- 多个窗口平均分
keymap.set("n", "<leader>se", "<C-w>=") -- make split windows equal width & height
keymap.set("n", "<leader>sx", ":close<CR>") -- close current split window

-- 目前没什么用
-- keymap.set("n", "<leader>to", ":tabnew<CR>") -- open new tab
-- keymap.set("n", "<leader>tx", ":tabclose<CR>") -- close current tab
-- keymap.set("n", "<leader>tn", ":tabn<CR>") --  go to next tab
-- keymap.set("n", "<leader>tp", ":tabp<CR>") --  go to previous tab

----------------------
-- Plugin Keybinds
----------------------

-- vim-maximizer
keymap.set("n", "<leader>sm", ":MaximizerToggle<CR>") -- toggle split window maximization

-- nvim-tree
keymap.set("n", "<leader>e", ":Neotree toggle<CR>") -- toggle file explorer
keymap.set("n", "<leader>h", ":Neotree reveal<CR>") -- focus on nvimTree

-- telescope
keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>") -- find files within current working directory, respects .gitignore
keymap.set("n", "<leader>fs", "<cmd>Telescope live_grep<cr>") -- find string in current working directory as you type
keymap.set("n", "<leader>fc", "<cmd>Telescope grep_string<cr>") -- find string under cursor in current working directory
keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<cr>") -- list open buffers in current neovim instance
keymap.set("n", "<leader>fh", "<cmd>Telescope help_tags<cr>") -- list available help tags

-- 查看telescope的buffers 按ctrl + u 可以关掉某一个buffer
-- vim.api.nvim_set_keymap('n', '<leader>b', ":lua require('zq/plugins/telescope-del-buffer').my_buffer()<cr>", {noremap = true}) 

-- telescope git commands (not on youtube nvim video)
-- keymap.set("n", "<leader>gc", "<cmd>Telescope git_commits<cr>") -- list all git commits (use <cr> to checkout) ["gc" for git commits]
-- keymap.set("n", "<leader>gfc", "<cmd>Telescope git_bcommits<cr>") -- list git commits for current file/buffer (use <cr> to checkout) ["gfc" for git file commits]
keymap.set("n", "<leader>gb", "<cmd>Telescope git_branches<cr>") -- list git branches (use <cr> to checkout) ["gb" for git branch]
keymap.set("n", "<leader>gs", "<cmd>Telescope git_status<cr>") -- list current changes per file with diff preview ["gs" for git status]

-- gitsigns 相关
keymap.set("n", "<leader>gp", "<cmd>Gitsigns preview_hunk<cr>") -- 查看当前这个位置的修改记录
keymap.set("n", "<leader>gn", "<cmd>Gitsigns next_hunk<cr>") -- 查看页面的修改记录
keymap.set("n", "<leader>gr", "<cmd>Gitsigns reset_hunk<cr>") -- 撤销当前这个位置的修改
keymap.set("n", "<leader>grb", "<cmd>Gitsigns reset_buffer<cr>") -- 撤销当前页面的修改

-- restart lsp server (not on youtube nvim video)
keymap.set("n", "<leader>rs", ":LspRestart<CR>") -- mapping to restart lsp if necessary

-- vim-terminal-help
keymap.set("n", "<leader>te", ":call TerminalToggle()<CR>") -- 在当前位置打开terminal
-- 设置terminal 模式下的命令
vim.api.nvim_set_keymap("t", "<ESC>", "<C-\\><C-n>", {noremap = true, silent = true})

-- 切换buffer
keymap.set("n", "<leader>kk", ":bnext<CR>")
keymap.set("n", "<leader>jj", ":bprevious<CR>")
keymap.set("n", "<leader>bd", ":bdelete<CR>") -- 关闭当前的buffer
-- bufferline
keymap.set("n", "<leader>bp", ":BufferLinePick<CR>") -- 快速选择一个buffer
keymap.set("n", "<leader>bc", ":BufferLinePickClose<CR>") -- 快速关闭一个buffer
--   nnoremap <silent> gD :BufferLinePickClose<CR> -- 快速关闭一个buffer
keymap.set("n", "<leader>ba", ":BufferLineCloseLeft<CR>:BufferLineCloseRight<CR>") -- 关闭所有 除了当前buffer
keymap.set("n", "<leader>bb", ":e #<CR>") -- 切换buffer
-- quit
keymap.set("n", "<leader>qq", ":qa<CR>") -- 退出

keymap.set("n", "<leader>p", "\"0p") -- 粘贴增强 选中再粘贴会把选中的那个放到register里面 所以使用leader p
-- Paste over currently selected text without yanking it
keymap.set("v", "p", '"_dP', {silent = true})
-- 重新载入配置文件
vim.keymap.set("n", "<leader>vv", ":source ~/.config/nvim/init.lua<CR>")
-- better indenting
vim.keymap.set("v", "<", "<gv")
vim.keymap.set("v", ">", ">gv")
vim.keymap.set("n", "<", "v<g")
vim.keymap.set("n", ">", "v>g")
vim.keymap.set({ "n", "v", "o" }, "H", "^", { desc = "Use 'H' as '^'" })
vim.keymap.set({ "n", "v", "o" }, "L", "$", { desc = "Use 'L' as '$'" })
-- search
vim.keymap.set({ "i", "n" }, "<esc>", "<cmd>noh<cr><esc>", { desc = "Escape and clear hlsearch" })-- 按esc取消高亮
vim.keymap.set({ "n", "x" }, "gw", "*N", { desc = "Search word under cursor" }) --- 和 输入* 一样的作用