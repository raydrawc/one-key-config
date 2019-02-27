" -------------------------------------------------------------
"vim配置"
"@author raydrawc@gmail.com"
" -------------------------------------------------------------

"" 工具标准路径
" $VIM  vim安装路径
" $HOME  用户目录  /home/$User
" $VIMRUNTIME $VIM/vim81
" ~     $HOME/

" 判断操作系统类型
" if has("win32")
"     let os = "win"
" elseif has("win64")
"     let os = "win"
" elseif has("win32unix")
"     let os = "cygwin"
" elseif has ("win64unix")
"     let os = "cygwin"
" elseif has("unix")
"     let s:uname = system("uname -s")
"     if s:uname == "Darwin\n"
"         let os = "mac"
"     else
"         let os = "unix"
"     endif
" endif

"set rtp+=$VIM/vimfiles/bundle/Vundle.vim "加入新插件目录"
" if os == 'win'
"     let path='$VIM/vimfiles/bundle/'
" else
"     if has("nvim")
"         let path='~/.config/nvim/plugged'
"     else
"         let path='~/.vim/bundle'
"     endif
" endif

"plug.vim 插件管理配置"
call plug#begin('~/.vim/plugged')
Plug 'vim-scripts/L9'
Plug 'scrooloose/nerdtree'
Plug 'vim-airline/vim-airline'          " 美化导航栏
Plug 'vim-airline/vim-airline-themes'   " 导航栏主题
Plug 'vim-erlang/vim-erlang-compiler'
Plug 'vim-erlang/vim-erlang-omnicomplete'
Plug 'vim-erlang/vim-erlang-tags'
Plug 'easymotion/vim-easymotion'        " 快速跳转工具
" Plug 'kien/ctrlp.vim' " 文件查找利器
" Plug 'JazzCore/ctrlp-cmatcher', {'do': './install.sh'} " ctrlp的匹配插件，由cpp实现，速度比较
Plug 'Yggdroot/LeaderF', { 'do' :'./install.sh' }                 " 异步模糊搜索工具 ctrlp替代  国人写的
Plug 'rking/ag.vim'                     " 高速文件内容搜索，需要先安装'ag(the_silver_searcher)'命令
Plug 'nathanaelkane/vim-indent-guides'  " 显示缩进
Plug 'scrooloose/nerdcommenter'         " 快速注释
Plug 'w0rp/ale'                         " 异步语法检查
Plug 'scrooloose/nerdtree'              " 文件管理树
Plug 'Xuyuanp/nerdtree-git-plugin'      " nerdtree 显示 git 最新修改标志
call plug#end()

" --- 基本配置 -----------------------------------------------
set nocompatible                    " 关闭vi兼容模式
syntax enable                       " 语法识别
syntax on                           " 语法高亮
filetype on                         " 识别文件类型
filetype plugin on                  " 根据文件类型匹配插件
filetype indent on                  " 根据文件类型匹配缩进规则
set t_Co=256                        " 强制开启256色  mintty:option->termain->type->xterm-256color
color desert                        " 设置配色方案
set showmode                        " 显示命令模式
set showcmd                         " 显示当前操作命令
set mouse=a                         " 支持鼠标点击
set encoding=utf-8                  " 使用utf8编码
set autoindent                      " 自动缩进（下一行依赖上一行的规则）
set smartindent                     " 智能缩进
set tabstop=4                       " tab键对应的空格数
set shiftwidth=4                    " >>缩进规则的字符数 (>>:增加一级缩进 <<:减少一级缩进 =:取消全部缩进)
set expandtab                       " tab转换为空格
set softtabstop=4                   " tab转换为4个空格
set nu                              " 显示行号
" set relativenumber
" set cusrorline                      " 光标行高亮
set textwidth=80                    " 设置行宽
set wrap                            " 设置自动折行
"搜索
set showmatch                       " 光标自动标亮另一个括号
set hlsearch                        " 高亮搜索结果
set incsearch                       " 自动跳转最适合结果
set ignorecase                      " 搜索忽略大小写
set smartcase                       " 自动调整大小写敏感
" 文件相关
set nobackup                        " 不创建备份文件
set noswapfile                      " 不创建减缓文件
set undofile                        " 保留撤销历史
"设置文件保存路径
"set backupdir=~/.vim/.backup//
"set directory=~/.vim/.swp//
set undodir=~/.vim/.undo// 
set autochdir                       " 自动切换工作目录
set vb t_vb=                        " 关闭声音
set guioptions=                     " 关闭菜单栏
set shellslash                      " 使用'/'作目录分隔符
autocmd FileType * setlocal formatoptions-=c fo-=r fo-=o " 关闭换行自动补全注释符

" 设置过滤文件夹
set wildignore+=*/tmp/*,            " MacOSX/Linux
set wildignore+=*\\tmp\\*,          " Windows
" 设置过滤文件类型
set wildignore+=*.so,*.swp,*.zip,*.beam,*.meta,*.dll,*.dll.mdb,*.exe,*.pyc
set wildignore+=*.png,*.bmp,*.jpg,*.jpeg,*.FBX,*.tga
set wildignore+=*.unity3d,*.prefab,*.unity,*.asset,*.mat,*.meta

set guioptions-=TmLrb              " 不显示工具栏/菜单栏

" --- 快捷键配置 ---------------------------------------------------
" 重置leader键
let mapleader =  "\<space>"
let g:mapleader = "\<space>"

imap <m-k> <Up> " Alt + K 插入模式下光标向上移动 
imap <m-j> <Down> " Alt + J 插入模式下光标向下移动
imap <m-h> <Left> " Alt + H 插入模式下光标向左移动
imap <m-l> <Right> " Alt + L 插入模式下光标向右移动

"" 临时快捷键
" 打开vimrc快捷键
nnoremap <leader>ev  :split $MYVIMRC<cr>
" 运行当前vimrc脚本
nnoremap<leader>sv  :source $MYVIMRC<cr>

" --- CtrlP插件配置 ------------------------------------------------
" let g:ctrlp_map = '<leader>p'               " 快捷键
" let g:ctrlp_cmd = 'CtrlP'
" let g:ctrlp_working_path_mode = ''        " 关闭自动根目录判定，改为手动':cd /这里/是/根目录'
" "let g:ctrlp_open_new_file='r'           " 打开新建文件的方式
" "let g:ctrlp_open_multiple_files='0vjr'  " 打开多个文件的方式
" let g:ctrlp_follow_symlinks=1           " 搜索时跟随链接
" " 文件过滤
" let g:ctrlp_custom_ignore = { 
"   \ 'dir':  '\v[\/]\.(git|hg|svn)$', 
"   \ 'file': '\v\.(exe|so|dll)$',
"   \ 'link': 'some_bad_symbolic_links',
"   \ }

" 插件: vim-indent-guides --------------------------------------
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_start_level=2
let g:indent_guides_guide_size=1

" 插件 scrooloose/nerdcommenter --------------------------------
" <leader>cc   加注释
" <leader>cu   解开注释
" <leader>ca 切换注释的样式:/*....*/和//..的切换
" <leader>c<space>  加上/解开注释, 智能判断
let g:NERDSpaceDelims = 1        " 在注释后加空格
let g:NERDToggleCheckAllLines = 1   " 检查选中行是否已注释
" 自定义注释
let g:NERDCustomDelimiters = { 
    \ 'c': { 'left': '/**','right': '*/' },
    \ 'erlang': {'left' : '%%' }, 
    \ }
let g:NERDDefaultAlign = 'left'         " 设置注释对齐方式 (左对齐)
" ctrl + / 快速注释 （ctrl + / 映射为 ctrl + _）
map <C-_> <Plug>NERDCommenterToggle " = <leader>c<space>

" 插件 scroloose/nerdtree -------------------------------------
map <f1> :NERDTreeToggle<cr>
map <leader>t :NERDTreeToggle<cr>
map <C-t> :NERDTreeToggle<CR>
imap <F1> <esc>:NERDTreeToggle<CR> 
imap <C-t> <esc>:NERDTreeToggle<CR>
" 档NerdTree 为剩下唯一窗口是自动关闭
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
" let NERDTreeShowHidden=1            " 设置显示隐藏文件
let NERDTreeIgnore=[
    \ '\.(swp|svn|pyc)$' 
    \ ,'\.(png|dll|so|exe)$' 
    \ , '\.(git|svn)'
    \ , '\.(beam)'
    \ ]

" 插件Yggdroot/LeaderF ---------------------------------------
let g:Lf_WildIgnore = {
            \ 'dir': ['.svn','.git','.hg'],
            \ 'file': ['*.sw?','~$*','*.bak','*.exe','*.o','*.so','*.py[co]', '*.beam' ]
            \}

" 插件 w0rp/ale -------------------------------------
"显示Linter名称,出错或警告等相关信息
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
"<Leader>d查看错误或警告的详细信息
nmap <Leader>d :ALEDetail<CR>
