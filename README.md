# 💤 LazyVim

A starter template for [LazyVim](https://github.com/LazyVim/LazyVim).
Refer to the [documentation](https://lazyvim.github.io/installation) to get started.

参考：
https://github.com/jyf-111/nvim

字体图标：https://www.nerdfonts.com/cheat-sheet

当不小心导致页面的float层不再是最顶层，就会导致按q无法关闭，这个时候按ctrl + w 切换到那个float层，再按q就可以退出了

### 快捷键
l 表示leader 

- 回到normal模式 jk
- 保存文件 l + sa
- 展示marks l + ma
- 在vision模式 交换上一行和下一行 ： 大写J/K
- 当前页面全局替换 l + s
- 垂直打开一个窗口 l + wv
- 水平打开一个窗口 l + ww
- 窗口切换 l + w h/l/j/k
- 关闭当前窗口 l + wx
- 多个窗口平均分 l + we
- 将某一个窗口最大化 l+sm // 简易调整为wm

- 切换左边文件浏览器 l + e
- 聚焦到左边文件浏览器 l + h

#### 文件管理
- 找文件 l + ff
- 找字符串 l + fs
- xxx l + fc
- 打开open的buffer l + fb
- xxx l + fh 

#### git相关
- 查看当前这个位置的修改记录 l + gp
- 查看页面的修改记录 l + gn
- 撤销当前这个位置的修改 l + gr
- 撤销当前页面的修改 l + grb

#### buffer 操作
- l + jj
- l + kk
- l + bd

#### 代码操作
- n/v模式下面，代码自动引入 l + ca
- 看定义 l + gd
- 看申明 l + gt
- 查看这一行的错误诊断 l + sl
- 查看这个buffer的诊断 l + sb
- 查看工作区的诊断 l + sw
- 查看当前位置的诊断 l + sc
- 查看上一个诊断 [d 下一个 ]d   / [E ]E
- xxx l + o
- hover的作用  K
- 查看定义和引用 gf


#### neotree
- 重命名 r
- 显示隐藏的文件 大写H
- 删除 d
- 
#### 其他
- lspserver restart l + rs
- 在当前位置打开terminal l + te
- 退出 l + qq
- vision/normal 模式下面 使用  > 和 < 实现缩进
- vision/normal 使用- 进行折叠
- 注释 gcc / gbc
- 反撤消 ctrl + r
- keys = { "cs", "ds", "ys", "Y"}, 包裹 替换 cs"' 将双引号替换为单引号 , 选中 再S 再输入需要增加的东西 比如 选中+S+" 表示添加双引号, ds" 删除双引号， 
- md文档自动换行 \w