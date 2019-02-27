"------------------------------------------------------------+
" vim8配置文件  gvim
" @author raydraw@163.com
"------------------------------------------------------------+
set nocompatible "关闭vi兼容"
" filetype off

" 判断操作系统类型
if has("win32")
    let os = "win"
elseif has("win64")
    let os = "win"
elseif has("win32unix")
    let os = "cygwin"
elseif has ("win64unix")
    let os = "cygwin"
elseif has("unix")
    let s:uname = system("uname -s")
    if s:uname == "Darwin\n"
        let os = "mac"
    else
        let os = "unix"
    endif
endif

if os == 'win'
    "模仿windows快捷键 Ctrl+A全选、Ctrl+C复制、Ctrl+V粘贴
    source $VIMRUNTIME/vimrc_example.vim
  source $VIMRUNTIME/mswin.vim
  behave mswin

  set diffexpr=MyDiff()
  function MyDiff()
    let opt = '-a --binary '
    if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
    if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
    let arg1 = v:fname_in
    if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
   let arg2 = v:fname_new
   if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
   let arg3 = v:fname_out
   if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
   if $VIMRUNTIME =~ ' '
     if &sh =~ '\<cmd'
       if empty(&shellxquote)
         let l:shxq_sav = ''
         set shellxquote&
       endif
       let cmd = '"' . $VIMRUNTIME . '\diff"'
     else
       let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
     endif
    else
      let cmd = $VIMRUNTIME . '\diff'
    endif
    silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3
    if exists('l:shxq_sav')
      let &shellxquote=l:shxq_sav
    endif
  endfunction
endif


" Vundle插件配置=========================================================================  
if os == 'win'
    let path='$VIM/vimfiles/bundle/'
    set rtp+=$VIM/vimfiles/bundle/Vundle.vim
else
    if has("nvim")
        let path='~/.config/nvim/plugged'
    else
        let path='~/.vim/bundle'
        set rtp+=,~/.vim/bundle/Vundle.vim
    endif
endif
call vundle#begin(path)

Plugin 'VundleVim/Vundle.vim'

Plugin 'scrooloose/nerdtree'" 树形文件查看工具
Plugin 'ctrlpvim/ctrlp.vim'   "快速打开文件 模糊搜索"
"Plugin 'majutsushi/tagbar'  "函数管理器"
Plugin 'vim-airline/vim-airline'  "状态栏增强"
Plugin 'vim-airline/vim-airline-themes'"状态栏主题"
Plugin 'haya14busa/incsearch.vim'
Plugin 'mhinz/vim-startify' "初始化界面"
Plugin 'scrooloose/syntastic' " 牛B的语法检查插件
Plugin 'L9'  "库文件"
"Plugin 'jimenezrick/vimerl'


"Plugin 'powerline/fonts'  "字体"
"Plugin 'Valloric/YouCompleteMe'
"Plugin 'jiangmiao/auto-pairs'"括号自动补全"
"Plugin 'Shougo/neocomplete.vim'
"Plugin 'jimenezrick/vimerl'
"Plugin 'tomasr/molokai'
"Plugin 'vim-scripts/a.vim'
"Plugin 'vim-scripts/DoxygenToolkit.vim'
"Plugin 'vim-scripts/SQLComplete.vim'
"Plugin 'vim-scripts/txt.vim'
"Plugin 'ryanoasis/vim-devicons'
"Plugin 'gorodinskiy/vim-coloresque'
"Plugin 'will133/vim-dirdiff'
"Plugin 'chxuan/change-colorscheme'
"Plugin 'scrooloose/nerdcommenter' "注释文本用
"Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
"Plugin 'Valloric/MatchTagAlways' "自动匹配html标签，支持在标签间跳转"
"Plugin 'docunext/closetag.vim' "" 自动补全html/xml标签
"Plugin 'godlygeek/tabular'
"Plugin 'tpope/vim-fugitive' "在vim处理git冲突
"Plugin 'tpope/vim-surround'  "快速的删除、修改和添加 括号、引号、XML标签等等
"Plugin 'tpope/vim-commentary' "注释文本用"
"Plugin 'tpope/vim-repeat'
"Plugin 'tpope/vim-endwise' "自动补全end关键字"
"Plugin 'octol/vim-cpp-enhanced-highlight'


call vundle#end()            
" load vim default plugin
runtime macros/matchit.vim
"---------------------------------------------------------------------
" 基础配置
"--------------------------------------------------------------------
" colorscheme "颜色配置"
:highlight Normal guibg=Black
set background=dark
let g:solarized_termcolors=256
colorscheme desert


" 关闭声音和屏闪
set noerrorbells visualbell t_vb=
autocmd GUIEnter * set visualbell t_vb=

" 关闭自动备份
set nobackup
set nowritebackup
set noswapfile
set noundofile

" 设置语言
set encoding=utf-8
set fileformats=unix,dos,mac " 文件格式选择顺序
set fileencodings=ucs-bom,utf-8,chinese
set termencoding=utf-8
set langmenu=en_US
set helplang=cn
language message zh_CN.UTF-8 " 解决提示信息乱码

" 缩进相关配置
set lazyredraw
set confirm " 确认保存
" set clipboard+=unnamed " 共享剪切板
set autoindent " 启动自动缩进
set smartindent " 启用智能缩进
set expandtab " 将TAB转为空格
set tabstop=4
set softtabstop=4
set shiftwidth=4
set smarttab

" 设置需忽略的文件
set wildignore+=*/tmp/*,*/Library/*,*/Temp/*
set wildignore+=*.so,*.swp,*.zip,*.beam,*.meta,*.dll,*.dll.mdb,*.exe,*.pyc
set wildignore+=*.png,*.bmp,*.jpg,*.jpeg,*.FBX,*.tga
set wildignore+=*.unity3d,*.prefab,*.unity,*.asset,*.mat,*.meta
set wildignore+=*.beam


set history=999 " 历史命令记录最大条数
set backspace=indent,eol,start " 退格键设置
set wrap " 折行显示超出屏幕的单行文本
"set shellslash " 使用'/'作目录分隔符
set hidden " 不开启的话，在切换buffer后会丢失history
set magic " 文档建议始终将 'magic' 选项保持在缺省值
set ignorecase  " 搜索时不区分大小写
set incsearch " 实时匹配
set hlsearch " 高亮搜索关键字
set number " 显示行号
set scrolloff=3 " 滚屏触发边界
set grepprg=grep\ -nri\ --include=*.{erl,php,js,c,cpp,as,cs,html,py,pyw}
set nopaste " 禁用粘贴模式
set pastetoggle=<f12> " 粘贴模式切换
" set showtabline=2 " 一直显示tab bar
set formatoptions= " 关闭自动注释
set updatetime=500 "5秒后刷新"


mapclear " 重置所有按键映射
syntax on " 语法自动识别
filetype on " 文件类型自动识别
filetype plugin on
filetype indent on

"set wildmode=list,full " 命令行补全相关设置

let $LANG='en_US'
" 设置语言后需重载菜单
source $VIMRUNTIME/delmenu.vim
source $VIMRUNTIME/menu.vim

" gui模式下的窗口配置
if has("gui_running")
    " 不显示工具条和菜单
    set guioptions=

    " 字体下载地址:https://github.com/Lokaltog/powerline-fonts
   if os == "mac"
       set guifont=Sauce\ Code\ Powerline\ Light:h14
   elseif os == "win"
       "set guifont=Source_Code_Pro_Light:h11
       set guifont=仿宋:h12
   else
       set guifont=Source\ Code\ Pro\ for\ Powerline\ Light\ 14
    endif

    " 设置窗口大小
    if os == "win"
   ""     set columns=168
    ""    set lines=54
    else
        set columns=999
        set lines=999
    endif

    " 光标辅助线配色
    hi Search guibg=#ff6600 guifg=#ffffff
    hi IncSearch guibg=#ff6600 guifg=#ffffff
    hi cursorline guibg=#222222
    hi cursorcolumn guibg=#222222

    " 调整窗口位置快捷键
" "   map <c-a-left> :call s:ChangeWindowsPosition("left")<cr>
" "   map <c-a-right> :call s:ChangeWindowsPosition("right")<cr>
" "   map <c-a-up> :call s:ChangeWindowsPosition("up")<cr>
" "   map <c-a-down> :call s:ChangeWindowsPosition("down")<cr>
" "   function! s:ChangeWindowsPosition(dir)
" "       if "left" == a:dir
" "           exec ':winpos '.(getwinposx() - 44).' '.(getwinposy())
" "       endif
" "       if "right" == a:dir
" "           exec ':winpos '.(getwinposx() + 44).' '.(getwinposy())
" "       endif
" "       if "up" == a:dir
" "           exec ':winpos '.(getwinposx()).' '.(getwinposy() - 44)
" "       endif
" "       if "down" == a:dir
" "           exec ':winpos '.(getwinposx()).' '.(getwinposy() + 44)
" "       endif
" "   endfunction
endif

set cul 
autocmd InsertEnter * se cul    
filetype plugin indent on    

"=======================================
"自动处理"
"======================================

" 将app文件当成erlang文件处理
autocmd BufRead,BufNewFile *.app set filetype=erlang
" ActionScript,flex,air
autocmd BufRead,BufNewFile *.as set filetype=actionscript
"将heXa文件也当成actionscript文件显示
autocmd BufRead,BufNewFile *.hx set filetype=actionscript
"将mxml设成XML文件显示
autocmd BufRead,BufNewFile *.mxml set filetype=mxml

"打开智能补全
autocmd FileType python set omnifunc=pythoncomplete#Complete
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags
autocmd FileType php set omnifunc=phpcomplete#CompletePHP
autocmd FileType c set omnifunc=ccomplete#Complete
autocmd FileType erlang set omnifunc=erlang_complete#Complete



" nerdtree
"autocmd vimenter * if !argc() | NERDTree | endif
"autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == primary") | q | endif



" tagbar
"let g:tagbar_ctags_bin = 'ctags'
"let g:tagbar_width = 30
"map <F4> :TagbarToggle<CR>
"imap <F4> <ESC> :TagbarToggle<CR>


"状态栏的显示形式
set laststatus=2
set statusline=%f\ \%h%m%r%r%=%-35(%l,%c\ [0x%B]\ (%L\ lines)\ [%{&ff}:%{&fenc}]\ %y%)\ %P
set statusline=%<%f%m\ \[%{&ff}:%{&fenc}:%Y]\ %{getcwd()}\ \ \[%{strftime('%Y/%b/%d\ %a\ %I:%M\ %p')}\]\ %=\ Line:%l\/%L\ Column:%c%V\ %P
set statusline=\ %f%m%r%h%w\ %=%({%{&ff}\|%{(&fenc==\"\"?&enc:&fenc).((exists(\"+bomb\")\ &&\ &bomb)?\",B\":\"\")}%k\|%Y}%)\ %([%l,%v][%p%%]\ %)

" airline
let g:airline_theme="luna"
" let g:airline_theme="badwolf"
let g:airline_powerline_fonts = 1
"let g:airline_section_b = '%{strftime("%c")}'
"let g:airline_section_y = 'BN: %{bufnr("%")}'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif
let g:airline_left_sep = ' '
let g:airline_left_alt_sep = ' '
let g:airline_right_sep = ' '
let g:airline_right_alt_sep = ' '
"let g:airline_powerline_fonts=1 " 需安装powerline-fonts

" ctrlp
let g:ctrlp_map = '<leader>p'
let g:ctrlp_cmd = ':CtrlP'
let g:ctrlp_working_path_mode = ''
"set wildignore+=,*/tmp/*,*.so,*.swp,*.zip,*.beam,     " MacOSX/Linux
set wildignore+=*\\tmp\\*,*.swp,*.zip,*.exe,*.beam,  " Windows

"let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn)$',
  \ 'file': '\v\.(exe|so|dll)$',
  \ 'link': 'some_bad_symbolic_links',
  \ }

if os == 'win'
	let g:ctrlp_user_command = 'dir %s /-n /b /s /a-d'  " Windows
else 
	let g:ctrlp_user_command = 'find %s -type f'        " MacOSX/Linux
endif


"synstiac设置语法检查工具
let g:syntastic_enable_signs=1
" let g:syntastic_auto_loc_list=1
" set statusline+=%#warningmsg#
" set statusline+=%{SyntasticStatuslineFlag()}
" set statusline+=%*



"=======================================================
"快捷键配置
"=======================================================
"<leader> 前导键
"<silent> 静默执行


" nerdtree
map <f2> :NERDTreeToggle<CR>
imap <f2> <ESC> :NERDTreeToggle<CR>

" quickfix开关键
map! <m-q> <c-o> :call ToggleQuickfix()<cr>
map <m-q> :call ToggleQuickfix()<cr>

"Errors显示切换
map! <m-e> <c-o>:call ToggleErrors()<cr>
map <m-e> :call ToggleErrors()<cr>

"粘贴设置
set pastetoggle=<F12>

"梆定标签相关的快捷键
map <leader>tn :tabnew<cr>
map <leader>tc :tabclose<cr>
map <c-tab> :tabnext<cr>
map <c-s-tab> :tabNext<cr>
map <m-1> 1gt
map <m-2> 2gt
map <m-3> 3gt
map <m-4> 4gt
map <m-5> 5gt

"快捷键
map <m-space> :simalt ~<cr> "弹出窗口调整菜单
map <leader>v :e $vim/.vimrc<cr> "编辑vimrc
map <leader>n :enew<cr> "打开一个空Buffer
nmap <silent> <m-n> :noh<cr> "取消高亮显示


"设置leader键
let mapleader = ","
let g:mapleader = ","
let g:fuf_coveragefile_exclude = '\v\~$|\.(o|exe|dll|beam|html|bak|orig|sw[po])$|(^|[/\\])\.(hg|git|bzr)($|[/\\])'
"let g:fuf_coveragefile_globPatterns = ['**/*.erl', '**/*.hrl', '**/*.sql', '**/*.sh', '**/*.bat']


" 编辑vimrc快捷键  刷新vimrc
map <leader>v :e $MYVIMRC<cr>



"梆定quickfix快捷键
nmap <leader>cc :cc<cr>     "跳转到当前
nmap <leader>cn :cn<cr>     "跳转到下一个
nmap <leader>cp :cp<cr>     "跳转到上一个
nmap <leader>co :copen<cr>  "打开quickfix窗口
nmap <leader>cq :cclose<cr> "关闭quickfix窗口
nmap <leader>cw :cw<cr>     "
nmap <leader>cr :cr<cr>
nmap <leader>cl :cl<cr>

" quickfix开关键
map! <m-q> <c-o> :call ToggleQuickfix()<cr>
map <m-q> :call ToggleQuickfix()<cr>


" incsearch.vim
map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)


nmap    <c-m-down>  :resize +3<CR>
nmap    <c-m-up>  :resize -3<CR>
nmap    <c-m-right>  :vertical resize +3<CR>
nmap    <c-m-left>  :vertical resize -3<CR>

"切换buffers"
nmap <silent> <m-h> :bp<cr> "切换到上一个buffer
nmap <silent> <m-l> :bn<cr> "切换到下一个buffer
"nnoremap <C-N> :bn<CR>
"nnoremap <C-P> :bp<CR>

"状态栏"
map <F11> :if &guioptions =~# 'T' <Bar>
        \set guioptions-=T <Bar>
        \set guioptions-=m <bar>
    \else <Bar>
        \set guioptions+=T <Bar>
        \set guioptions+=m <Bar>
    \endif<CR>

"=============================================================================
"自定义函数
"============================================================================

" quickfix开关键
function! ToggleQuickfix()
    if !exists("g:quickfix_is_show")
        let g:quickfix_is_show = 0
    endif
    if g:quickfix_is_show
        let g:quickfix_is_show = 0
        cclose
    else
        let g:quickfix_is_show = 1
        copen
    endif
endfunction

"Errors显示切换
function! ToggleErrors()
    if !exists("g:errors_is_show")
        let g:errors_is_show = 0
    endif
    if g:errors_is_show
        let g:errors_is_show = 0
        lclose
    else
        let g:errors_is_show = 1
        " Errors 需要Syntastic插件支持
        Errors
    endif
endfunction

" quickfix开关键
function! ToggleQuickfix()
    if !exists("g:quickfix_is_show")
        let g:quickfix_is_show = 0
    endif
    if g:quickfix_is_show
        let g:quickfix_is_show = 0
        cclose
    else
        let g:quickfix_is_show = 1
        copen
    endif
endfunction

"""""""""""""""""""""""""""""""""
" 缩写
"""""""""""""""""""""""""""""""""
"erlang代码缩写
iab <erl> <esc>:set paste<cr>:set filetype=erlang<cr>:set fileencoding=utf-8<cr>i%%----------------------------------------------------<cr>%% @doc<cr>%% <cr>%% @author Raydraw@163.com<cr>%% @end<cr>%%----------------------------------------------------<cr>-module().<cr>-export([]).<esc>:set nopaste<cr>4kl

iab <gs> <esc>:set paste<cr>:set filetype=erlang<cr>:set fileencoding=utf-8<cr>i%%----------------------------------------------------<cr>%% @doc<cr>%% <cr>%% @author Raydraw@163.com<cr>%% @end<cr>%%----------------------------------------------------<cr>-module().<cr>-behaviour(gen_server).<cr>-export([start_link/0]).<cr>-export([init/1, handle_call/3, handle_cast/2, handle_info/2, terminate/2, code_change/3]).<cr>-record(state, {}).<cr><esc>:set nopaste<cr>i<cr><cr>start_link() -><cr>gen_server:start_link({local, ?MODULE}, ?MODULE, [], []).<cr><cr>init([]) -><cr>State = #state{},<cr>{ok, State}.<cr><cr>handle_call(_Request, _From, State) -><cr>{noreply, State}.<cr><cr>handle_cast(_Msg, State) -><cr>{noreply, State}.<cr><cr>handle_info(_Info, State) -><cr>{noreply, State}.<cr><cr>terminate(_Reason, _State) -><cr>ok.<cr><cr>code_change(_OldVsn, State, _Extra) -><cr>{ok, State}.<esc>2GA

iab <gf> <esc>:set paste<cr>:set filetype=erlang<cr>:set fileencoding=utf-8<cr>i%%----------------------------------------------------<cr>%% @doc<cr>%%<cr>%% @author Raydraw@163.com<cr>%% @end<cr>%%----------------------------------------------------<cr>-module().<cr>-behaviour(gen_fsm).<cr>-export(<cr>[<cr>start_link/1<cr>]<cr>).<cr>-export([init/1, handle_event/3, handle_sync_event/4, handle_info/3, terminate/3, code_change/4]).<cr>-record(state, {}).<cr><cr>start_link([])-><cr>gen_fsm:start_link(?MODULE, [], []).<cr><cr>init([])-><cr>{ok, xxxx, State}.<cr><cr>handle_event(_Event, StateName, State) -><cr>{next_state, StateName, State}.<cr><cr>handle_sync_event(_Event, _From, StateName, State) -><cr>Reply = ok,<cr>{reply, Reply, StateName, State}.<cr><cr>handle_info(_Info, StateName, State) -><cr>{next_state, StateName, State}.<cr><cr>terminate(_Reason, _StateName, _State) -><cr>ok.<cr><cr>code_change(_OldVsn, StateName, State, _Extra) -><cr>{ok, StateName, State}.<esc>:set nopaste<cr>2GA

iab <sv> <esc>:set paste<cr>:set filetype=erlang<cr>:set fileencoding=utf-8<cr>i%%----------------------------------------------------<cr>%% @doc<cr>%%<cr>%% @author Raydraw@163.com<cr>%% @end<cr>%%----------------------------------------------------<cr>-module().<cr>-behaviour(supervisor).<cr>-export(<cr>[start_link/0]<cr>).<cr>-export([init/1]).<cr>start_link()-><cr>supervisor:start_link(?MODULE, []).<cr><cr>init(_Arg)-><cr>{ok, {{one_for_one, 10, 10},<cr>[{ch, {ch, start_link, []}, permanent, 1000, worker, [ch]}]}}.<cr><esc>:set nopaste<cr>2GA

iab <--> <esc>:set paste<cr>:set filetype=erlang<cr>:set fileencoding=utf-8<cr>i%%---------------------------<cr>%%<cr>%%---------------------------<esc>:set nopaste<cr>kA

