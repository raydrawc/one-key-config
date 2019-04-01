" -------------------------------------------------------------
"vim配置"
"@author raydrawc@gmail.com"
" -------------------------------------------------------------

"" 工具标准路径
" $VIM  vim安装路径
" $HOME  用户目录  /home/$User
" $VIMRUNTIME $VIM/vim81
" ~     $HOME/

"plug.vim 插件管理配置"
call plug#begin('~/.vim/plugged')
" Plug 'vim-scripts/L9'
Plug 'scrooloose/nerdtree'
Plug 'vim-airline/vim-airline'          " 美化导航栏
Plug 'vim-airline/vim-airline-themes'   " 导航栏主题
" Plug 'vim-erlang/vim-erlang-compiler' " erlang 同步语法检查工具（保存触发
Plug 'vim-erlang/vim-erlang-omnicomplete' " 语法提示 
Plug 'vim-erlang/vim-erlang-tags'          
" Plug 'easymotion/vim-easymotion'        " 快速跳转工具
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }   
Plug 'junegunn/fzf.vim'                 " 异步模糊搜索插件  必须先装fzf插件
" Plug 'rking/ag.vim'                     " 高速文件内容搜索，需要先安装'ag(the_silver_searcher)'命令
" Plug 'nathanaelkane/vim-indent-guides'  " 显示缩进
Plug 'Yggdroot/indentLine'              " 显示缩进 “线” 
Plug 'maralla/completor.vim'            " 自动补全
Plug 'scrooloose/nerdcommenter'         " 快速注释
Plug 'w0rp/ale'                         " 异步语法检查
Plug 'scrooloose/nerdtree'              " 文件管理树 r 刷新
Plug 'Xuyuanp/nerdtree-git-plugin'      " nerdtree 显示 git 最新修改标志
Plug 'joshdick/onedark.vim'             " 配色方案 onedrak
Plug 'ten0s/syntaxerl'                  " erlang语法检查工具
Plug 'SirVer/ultisnips'                 " 代码片段主函数
Plug 'honza/vim-snippets'               " 代码片段集合
" Plug 'airblade/vim-gitgutter'           " 显示git差异  [c ]c 跳转 差异位置
Plug 'mhinz/vim-signify'
Plug 'tpope/vim-fugitive'               " vim 操作 git 并显示分支
Plug 'luochen1990/rainbow'              " 括号颜色
Plug 'Raimondi/delimitMate'             " 自动补全括号等
" Plug 'sheerun/vim-polyglot'             " 语法高亮/缩进语言包集合
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' } " GO语言辅助包
" Plug 'PangPangPangPangPang/vim-terminal' " 终端管理
call plug#end()

" --- [ 基本配置 ] -----------------------------------------------
set nocompatible                    " 关闭vi兼容模式
syntax enable                       " 语法识别
syntax on                           " 语法高亮
filetype on                         " 识别文件类型
filetype plugin on                  " 根据文件类型匹配插件
filetype indent on                  " 根据文件类型匹配缩进规则
:let $LANG = 'en_US'
set fileformats=unix,dos,mac        " 文件格式选择顺序
set fileencodings=utf8,gbk,big5,ucs-bom " 按照顺序选择编码格式
set termencoding=utf-8              " 终端编码格式
set encoding=utf-8                  " 内部编码格式 buffer 菜单 消息等
set langmenu=en_US.UTF-8            " 菜单编码
set t_Co=256                        " 强制开启256色  mintty:option->termain->type->xterm-256color
" colorscheme desert                  " 设置配色方案
colorscheme onedark                  " 设置配色方案
set showmode                        " 显示命令模式
set showcmd                         " 显示当前操作命令
set mouse=a                         " 支持鼠标点击
set autoindent                      " 自动缩进（下一行依赖上一行的规则）
set smartindent                     " 智能缩进
set tabstop=4                       " tab键对应的空格数
set shiftwidth=4                    " >>缩进规则的字符数 (>>:增加一级缩进 <<:减少一级缩进 =:取消全部缩进)
set expandtab                       " tab转换为空格
set smarttab                        
set softtabstop=4                   " tab转换为4个空格
set backspace=2                     " 修复退格键失效
set number                          " 显示行号
" set relativenumber
" set textwidth=80                    " 设置超过行数自动换行 (添加换行符)
set wrap                            " 设置自动折行
"搜索
set showmatch                       " 光标自动标亮另一个括号
set hlsearch                        " 高亮搜索结果
set incsearch                       " 打开增量搜索
set ignorecase                      " 搜索忽略大小写
set smartcase                       " 自动调整大小写敏感
" 文件相关备份
set nobackup                        " 不创建备份文件
set noswapfile                      " 不创建减缓文件
set undofile                        " 保留撤销历史
"设置文件保存路径
"set backupdir=~/.vim/.backup//
"set directory=~/.vim/.swp//
set undodir=~/.vim/.undo//          " 转移撤销文件路径
set vb t_vb=                        " 关闭声音
set guioptions=                     " 关闭菜单栏
set shellslash                      " 使用'/'作目录分隔符
set cursorline                      " 设置当前行高亮
" set autochdir                       " 设当前编辑文件为当前工作路径
set noautochdir                       " 不随意更改工作路径 

" ---- [ wild列表 ] --------------------------------------------
set wildmenu
set wildmode=longest:full,list:full      " 设置命令行模式 显示列表并快速补全
set wildignore+=*/tmp/*,            " MacOSX/Linux
set wildignore+=*\\tmp\\*,          " Windows
set wildignore+=.hg,.git.,svn        " 版本控制
set wildignore+=*.so,*.swp,*.zip,*.beam,*.meta,*.dll,*.dll.mdb,*.exe,*.pyc
set wildignore+=*.png,*.bmp,*.jpg,*.jpeg,*.FBX,*.tga
set wildignore+=*.unity3d,*.prefab,*.unity,*.asset,*.mat,*.meta

" ---- [ autocmd ] --------------------------------------------
if has("autocmd")                                                          
    " 记录上次修改文件的位置
    au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif                                                        
    " 关闭换行自动补全注释符
    autocmd FileType * setlocal formatoptions-=c fo-=r fo-=o 
    " 设置loclist 和 quickfix在跨越底部栏显示
    autocmd FileType qf wincmd J        
    " 当NerdTree 为剩下唯一窗口是自动关闭
    autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
endif 

" ---- [ highligh表 修改配色] -----------------------------------------------------

" erlang 语法颜色配置  (部分绘色分离不清可用)
hi link erlangGlobalFuncCall Function
hi link erlangGlobalFuncRef Function
hi link erlangLocalFuncCall Function
hi link erlangLocalFuncRef Function
hi link erlangInclude Macro
hi link erlangDefine Macro
hi link erlangOperator Normal
hi link erlangRightArrow Normal
hi link erlangCommentAnnotation Comment
hi link erlangStringModifier Normal

" hi Keyword ctermfg=170
hi Keyword term=bold ctermfg=170 guifg=#c678DD
hi Function ctermfg=33
hi erlangMacro ctermfg=Blue
hi erlangVariable ctermfg=Red guifg=#c678DD term=bold
hi erlangAtom ctermfg=cyan guifg=#c678DD term=bold


" hi erlangDefine ctermfg=darkblue
" let g:onedark_termcolors=256

" --- [ 非插件快捷键配置 ] ---------------------------------------------------
" 重置leader键
let mapleader =  "\<space>"
let g:mapleader = "\<space>"

map <leader>= <esc>gg=G<cr>        " 快速格式化代码
nnoremap <leader># :<C-u>let @/=expand('<cword>')<cr>:set hlsearch<cr>  " 高亮当前单词

" 快速切换工作区 workbrench
map <Leader>w1 :cd /data/xxwy.dev/server<CR>
map <Leader>w2 :cd /data/xxwy.dev/tools<CR>

" 快速导航
" imap <m-k> <Up>           " Alt + K 插入模式下光标向上移动 
" imap <m-j> <Down>         " Alt + J 插入模式下光标向下移动
" imap <m-h> <Left>         " Alt + H 插入模式下光标向左移动
" imap <m-l> <Right>        " Alt + L 插入模式下光标向右移动
imap <C-a> <esc>I
imap <C-e> <esc>A

" buff
noremap <leader>bd :bd<cr>
noremap <leader>bn :bn<cr>
noremap <leader>bp :bp<cr>

" 调整窗口
" nmap <M-k> :resize -3<CR>
" nmap <M-j> :resize +3<CR>
" nmap <M-h> :vertical resize +3<CR>
" nmap <M-l> :vertical resize -3<CR>
nmap <leader>wk <esc>:resize -3<CR>
nmap <leader>wj <esc>:resize +3<CR>
nmap <leader>wl <esc>:vertical resize +3<CR>
nmap <leader>wh <esc>:vertical resize -3<CR>

" tab
" map <c-tab> :tabnext<cr>        " gt
" map <c-s-tab> :tabprevious<cr>  " gT
map <leader>tn :tabnew ./<cr>
map <leader>tc :tabclose<cr>
map <leader>te :tabe<cr>

" 改写 alt 键为双leader键  wsl不识别alt键
" for i in range(97,122)
"   let c = nr2char(i)
"   exec "map <leader><leader>".c." <M-".c.">"
"   " exec "map! \e".c." <M-".c.">"
" endfor

" copy in wsl
if has("clipboard") && executable("clip.exe")
    noremap <leader>y :call system('clip.exe', GetSelectedText())<CR>
endif

func! GetSelectedText()
    normal gv"xy
    let result = getreg("x")
    return result
endfunc

" loclist
map <leader>lo :lopen<cr>
map <leader>ll :lopen<cr>
map <leader>lw :lopen<cr>
" map <leader>lw :lwindow<cr>       " 不会自动force到loclist
map <leader>lc :lclose<cr>
map <leader>ln :lnext<cr>
map <leader>lp :lprevious<cr>

" quickfix 
map <leader>qq :copen<cr>
map <leader>qo :copen<cr>
map <leader>qw :copen<cr>           
" map <leader>qw :cwindow<cr>       " 不会自动 force 到quickfix
map <leader>qc :cclose<cr>
map <leader>qn :cnext<cr>
map <leader>qp :cprevious<cr>

"" 临时快捷键
" 打开vimrc快捷键
nnoremap <leader>ev  :split $MYVIMRC<cr>
" 运行当前vimrc脚本
nnoremap <leader>sv  :source $MYVIMRC<cr>

" ---- [ 插件: vim-indent-guides ] --------------------------------------
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_start_level=2
let g:indent_guides_guide_size=1

" ---- [ 插件 scrooloose/nerdcommenter ] --------------------------------
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
map <C-_> <Plug>NERDCommenterToggle 

" 插件 scroloose/nerdtree -------------------------------------
nmap <f1> :NERDTreeToggle<cr>
nmap <C-t> :NERDTreeToggle<CR>
imap <F1> <esc>:NERDTreeToggle<CR> 
imap <C-t> <esc>:NERDTreeToggle<CR>

" let NERDTreeShowHidden=1            " 设置显示隐藏文件
let NERDTreeIgnore=[
\ '\.(swp|svn|pyc)$' 
\ ,'\.(png|dll|so|exe)$' 
\ , '\.(git|svn)'
\ , '\.(beam)'
\ ]

" ---- [ 插件 junegunn/fzf ] ---------------------------------------
let g:fzf_layout = {'down': '~20%'}
noremap <leader>f :FZF                  
noremap <leader>ff :FZF<CR>             " 搜索当前目录下所有文件
noremap <leader>fb :Buffers<CR>         " 搜索buffs
noremap <leader>fl :BLines<CR>          " 当前buff搜索内容
" 快速启动Ag rg搜索
noremap <leader>fa :Ag  
noremap <leader>fr :Rg  

" 快速搜索工作区
noremap <leader>f1 :FZF /data/xxwy.dev/server<cr>
noremap <leader>f2 :FZF /data/xxwy.dev/tools<cr>

" ---- [ 插件 w0rp/ale ] -------------------------------------
"显示Linter名称,出错或警告等相关信息
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_lint_delay=1000                " 延时编译
" let g:ale_maximun_file_size=1048576     " 设置检查文件最大
let g:ale_lint_on_enter=0               " 打开文件不制动编译
" let g:ale_sign_column_always=1
" let g:ale_open_list=1 
" 设置使用不同的编译工具检查代码
let g:ale_linters = {
\   'erlang': ['syntaxerl'],
\}

" ---- [插件 airline ] -----------------------------------------
let g:airline_theme='onedark'
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_nr_show = 1
let g:airline#extensions#whitespace#enabled = 0
let g:airline#extensions#whitespace#symbol = '!'
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
"let g:airline_symbols.linenr = ''
let g:airline_symbols.linenr = ''
let g:airline_symbols.maxlinenr = '' 
" ---- [ 插件 completor ] ------------------------------------
let g:completor_erlang_omni_trigger = '[\w-]+:$'
let g:completor_complete_options = 'menuone,noselect'

" ---- [ luochen1990/rainbow] --------------------------------
let g:rainbow_active=1

" ---- [ mhinz/vim-signify ] --------------------------------
let g:signify_update_on_bufenter    = 0     " 缓冲区被修改时更新符号
let g:signify_update_on_focusgained = 1     " vim获取焦点时更新符号
nnoremap <leader>gr :SignifyRefresh<CR>
nmap <leader>gj <plug>(signify-next-hunk)
nmap <leader>gk <plug>(signify-prev-hunk)
