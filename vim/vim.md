# vim 配置说明
备注vim配置，以免忘记和速查, 部分参考 SpaceVim 配置  
[TOC]
## 快捷键配置
| 键值   | 含义             |
| ------ | ---------------- |
| \<c-/> | 快速注释         |
| \<c-t> | NerdTree快速启动 |

leader_key = `<space>`      "空格键方便按，并且不占用其他手势
### \<leader>w  切换工作区和改变窗口大小 (workbrench/windows)
| 键值                | 含义         |
| ------------------- | ------------ |
| \<leader>w[1-n]     | 切换工作区   |
| \<leader>w[h,j,k,m] | 改变窗口大小 |
### \<leader>b     Buff缓冲区操作  
| 键值        | 含义             |
| ----------- | ---------------- |
| \<leader>bd | 删除缓冲区       |
| \<leader>bn | 切换下一个缓冲区 |
| \<leader>bp | 切换上一个缓冲区 |
### \<leader>t   Tab页签操作 / NerdTree
| 键值        | 含义                |
| ----------- | ------------------- |
| \<leader>t  | 启动nerdtree toggle |
| \<leader>tn | 开启新页签 ./       |
| \<leader>tc | 关闭当前页签        |
| \<leader>te | 开启页签并修改      |
###  \<leader>y  复制到粘贴版（通y）
| 键值       | 含义                     |
| ---------- | ------------------------ |
| \<leader>y | 适应wsl.vim 复制到粘贴板 |

###  \<leader>l  loclist （位置列表相关）[quickfix本地版] 
| 键值        | 含义                          |
| ----------- | ----------------------------- |
| \<leader>lo | 开启loclist窗口(open)         |
| \<leader>ll | 开启loclist窗口(快捷启动辅助) |
| \<leader>lc | 关闭loclist窗口(close))       |
| \<leader>ln | 快速定位下一个                |
| \<leader>lp | 快速定位上一个                |
###  \<leader>q   quickfix 
| 键值        | 含义                       |
| ----------- | -------------------------- |
| \<leader>qo | 开启quickfix(open)         |
| \<leader>qq | 开启quickfix(快捷启动辅助) |
| \<leader>qc | 关闭quickfix(close))       |
| \<leader>qn | 快速定位下一个             |
| \<leader>qp | 快速定位上一个             |
quickfix Toggle占用主键位比较麻烦 直接leader键处理
### \<leader>f   Fzf 快速搜索工具 (find)
| 键值            | 含义                        |
| --------------- | --------------------------- |
| \<leader>f      | 快速补全FZF                 |
| \<leader>ff     | 快速搜索当前文件夹          |
| \<leader>fb     | 快速搜索已启动缓冲区        |
| \<leader>fl     | 快速搜索当前缓冲区/文件内容 |
| \<leader>fa     | 快速启动 Ag                 |
| \<leader>fr     | 快速启动 Rg                 |
| \<leader>f[1-n] | 快速搜索工作区1-n           |
### \<leader>g   Git 类插件快捷键
| 键值        | 含义           |
| ----------- | -------------- |
| \<leader>gr | 刷新git标签    |
| \<leader>gj | 跳转下一个修改 |
| \<leader>gk | 跳转上一个修改 |
