" vim-plug插件配置
call plug#begin('~/.vim/plugged')

Plug 'vim-scripts/L9'
"Plug 'vim-scripts/FuzzyFinder'
Plug 'scrooloose/nerdtree'

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

" erlang
Plug 'vim-erlang/vim-erlang-tags'
Plug 'vim-erlang/vim-erlang-omnicomplete'
"Plug 'vim-erlang/vim-erlang-runtime'
"Plug 'jimenezrick/vimerl'
"Plug 'vim-erlang/vim-erlang-compiler'
" 语法检查 
Plug 'w0rp/ale'
Plug 'ten0s/syntaxerl'
" 自动补全
Plug 'maralla/completor.vim'
" 显示缩进
Plug 'nathanaelkane/vim-indent-guides'
" 配色方案
Plug 'tyrannicaltoucan/vim-quantum'
" 括号自动补全
Plug 'Raimondi/delimitMate'

if has("gui_running")
" 括号颜色
Plug 'luochen1990/rainbow'
" git diff
Plug 'airblade/vim-gitgutter'
" git branch
Plug 'tpope/vim-fugitive'
endif
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
call plug#end()

" 设置leader键
let mapleader = ","
let g:mapleader = ","
" 默认目录
"cd /data/xx.dev/server
" 文件浏览相关
map <f1> :NERDTreeToggle<cr>
map <leader>` :NERDTree %:p:h<cr>
map <leader>1 :cd /data/xx.dev/server<cr>
map <leader>2 :cd /data/xx.dev/tools<cr>
map <leader>3 :cd /data/xxwy.dev/server<cr>
map <leader>4 :cd /data/xxwy.dev/tools<cr>
map <leader>cd :cd %:p:h<cr>
" 分割打开当前目录
map <leader>f :new ./<cr>
map <leader>v :vnew ./<cr>
map <leader>s :sp<cr>
" tab切换
map <leader>n :tabnew ./<cr>
map <leader>b :tabp<cr>
map <leader>g :tabn<cr>
map <leader>t :tabe<cr>
map <C-h> :tabp<cr>
map <C-l> :tabn<cr>
" 梆定quickfix快捷键
"nmap <leader>cc :cc<cr>     "跳转到当前
"nmap <leader>cn :cn<cr>     "跳转到下一个
"nmap <leader>cp :cp<cr>     "跳转到上一个
"nmap <leader>co :copen<cr>  "打开quickfix窗口
"nmap <leader>cq :cclose<cr> "关闭quickfix窗口
"nmap <leader>cw :cw<cr>     "
"nmap <leader>cr :cr<cr>
"nmap <leader>cl :cl<cr>
" 调整窗口尺寸
map <leader>j :resize +2<cr>
map <leader>k :resize -2<cr>
map <leader>h :vertical resize +2<cr>
map <leader>l :vertical resize -2<cr>
" buffer 切换
"nmap <silent> <m-h> :bp<cr> "切换到上一个buffer
"nmap <silent> <m-l> :bn<cr> "切换到下一个buffer
"nmap <silent> <m-n> :noh<cr> "取消高亮显示
"nmap <leader>, :noh<cr> "取消高亮显示

" 编辑模式移动光标hjkl
inoremap ¬ <Right>
inoremap ˙ <Left>
inoremap ˚ <Up>
inoremap ∆ <Down>

" 插件: luochen1990/rainbow
let g:rainbow_active=1
let g:rainbow_conf={
    \	'guifgs': ['#b7bdc0', '#7681de',  'seagreen3', 'darkorange3'],
    \}

" 插件: vim-indent-guides
let g:indent_guides_enable_on_vim_startup = 1
set ts=4 sw=4 et
let g:indent_guides_start_level=2
let g:indent_guides_guide_size=1

" 插件: vim-erlang-tags
set tags+=/data/xx.dev/server/tags
set tags+=/data/xxwy.dev/server/tags
let g:erlang_tags_ignore = ['/data/xxwy.dev/tools', '/data/xxwy.dev/server/cbin', '/data/xxwy.dev/server/doc', '/data/xxwy.dev/server/ebin', '/data/xxwy.dev/server/tester', '/data/xx.dev/tools', '/data/xx.dev/server/cbin', '/data/xx.dev/server/doc', '/data/xx.dev/server/ebin', '/data/xx.dev/server/tester']

" 插件: airline
let g:airline_theme='dark_minimal'
"let g:airline_theme='dark'
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
if has("gui_running")
    let g:airline_extensions=[ctrlspace]
endif
let g:airline_highlighting_cache = 1

" 插件: vim-quantum
let g:quantum_black=1
set background=dark
"set termguicolors
colorscheme quantum

" 插件: syntaxerl
let g:syntastic_erlang_checkers=['syntaxerl']
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" 插件: ale [-I -pa -o -D均为erlang的erlc命令的配置项]
"let g:ale_erlang_erlc_options='-I./inc/ -I./gen_battle/inc/ -I./gen_data/inc/ -I./gen_lang/inc/ -I../server/inc/ -pa./ebin/ -o../../temp/ -Denable_gm_cmd=true -DTEST=true'
let g:ale_lint_delay=300 
let g:ale_set_balloons=0
let g:ale_maximum_file_size=1048576
let g:ale_linters={
\   'erlang': ['syntaxerl'],
\}
nmap <silent> <C-e> <Plug>(ale_next_wrap)
" 切换语法检查
map <leader>c :ALEToggle<cr>

" 插件: completor.vim
let g:completor_erlang_omni_trigger='[\w-]+:$'
let g:completor_complete_options='menuone,noselect'
"let g:completor_filesize_limit='1024'

" 插件: fzf
let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }
function! SearchServer()
    cd /data/xx.dev/server
    :FZF
endfunction
function! SearchTools()
    cd /data/xx.dev/tools
    :FZF
endfunction
function! SearchServerWy()
    cd /data/xxwy.dev/server
    :FZF
endfunction
function! SearchToolsWy()
    cd /data/xxwy.dev/tools
    :FZF
endfunction
map <leader>q :call SearchServer()<cr>
map <leader>w :call SearchTools()<cr>
map <leader>e :call SearchServerWy()<cr>
map <leader>r :call SearchToolsWy()<cr>

" 插件: vim-gitgutter
let g:gitgutter_enabled=0
let g:gitgutter_map_keys=0
" 切换显示
map <leader>d :GitGutterToggle<cr>
"autocmd  BufWritePost  * GitGutter

behave mswin
filetype plugin on
filetype plugin indent on
" 开启语法高亮
syntax enable
syntax on
source $VIMRUNTIME/defaults.vim
"source $VIMRUNTIME/delmenu.vim
"source $VIMRUNTIME/menu.vim
set nocompatible " 关闭兼容模式 
:let $LANG = 'en_US'
set fileformats=unix,dos,mac "文件格式选择顺序
set fileencodings=utf8,gbk,big5,ucs-bom "按照顺序选择编码格式
set termencoding=utf-8 "终端编码格式
set encoding=utf-8 "内部编码格式 buffer 菜单 消息等
set langmenu=en_US.UTF-8 "菜单编码
" tab缩进
set tabstop=4
set shiftwidth=4
set expandtab
set smarttab
" 设置行间距
set linespace=1
" 文件自动检测外部更改
"set autoread
set showcmd "显示输入命令
" 关闭自动备份 不生成临时文件 显示行号
set nobk nu
set noswapfile
set nowb
" 配置括号匹配颜色
hi MatchParen guifg=#ffffff ctermfg=16 guibg=#007425 ctermbg=189 gui=NONE cterm=NONE
" 显示匹配的括号
"set showmatch
" 搜索高亮
set hlsearch
" 打开增量搜索模式,随着键入即时搜索
set incsearch
" 设置字体
set guifont=SourceCodeProForPowerline-Medium:h12
" 状态栏高度
set cmdheight=2
" 设置行间距
"set linespace=2
" 取消换行自动注释
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
" 自动保存
"set autowrite
" 突出显示当前行
set cursorline
" 顶部底部保持5行距离
set scrolloff=5
" 窗口简洁一下
if has("gui_running")
    " 始终显示侧边栏
    set signcolumn=yes
    set guioptions=
    let g:indent_guides_guide_size = 1
    let g:indent_guides_enable_on_vim_startup = 1
endif
" 终端退出保留内容
set t_ti= t_te=
" 去掉输入错误的提示声音
set novisualbell
set noerrorbells
set t_vb=
set tm=500
" 启动鼠标
set mouse=a

" 获取剪贴板内容
function Clipboard()
  "paste from clipboard
  normal! "+P
  "do more stuff
endfunction

" erlang代码缩写
" 代码片段
iab <do> %%<cr>do_qing([], Qing, _) -><cr>{ok, Qing};<cr>do_qing([F \| _], _Qing, Args) -><cr>?ERR("do_qing[~w]:~w", [F, Args]),<cr>{false, ?T("未知错误")}.
iab <doa> %%<cr>do_qing([], Qing, Args) -><cr>{ok, Qing, Args};<cr>do_qing([F \| _], _Qing, Args) -><cr>?ERR("do_qing[~w]:~w", [F, Args]),<cr>{false, ?T("未知错误")}.
iab <etslup> %% @doc 查询数据<cr>-spec lookup(Id) -> Data when<cr>Id      :: term(),<cr>Data    :: [] \| [#qing{}].<cr>lookup(Id) -><cr>ets:lookup(qing, Id).
iab <etsupd> %% @doc 更新数据<cr>-spec update(Data) -> ok when<cr>Data    :: #qing{} \| [#qing{}].<cr>update(#qing{} = Data) -><cr>ets:insert(qing, Data),<cr>ok.<cr>update([Data \| T]) -><cr>update(Data),<cr>update(T);<cr>update(Data) -><cr>?ERR("更新数据失败，数据不匹配:~w", [Data]),<cr>ok.
iab <etsdel> %% @doc 删除数据<cr>-spec delete(Data) -> ok when<cr>Data    :: #qing{} \| term().<cr>delete(#qing{id = Id}) -><cr>delete(Id);<cr>delete(Id) -><cr>ets:delete(qing, Id),<cr>ok.
iab <etsinit> %% @doc 初始化缓存<cr>-spec init_cache() -> ok.<cr>init_cache() -><cr>ets:new(qing, [set, named_table, public, {keypos, #qing.id}]),<cr>ok.
iab <etsclean> %% @doc 清除缓存<cr>-spec clean_cache() -> ok.<cr>clean_cache() -><cr>ets:delete_all_objects(qing),<cr>ok.

" 配置文件
iab <cfg> <esc>:set filetype=erlang<cr>:set fileencoding=utf-8<cr>i%%----------------------------------------------------<cr>%% @doc<cr>%% <cr>%% @author shaolin<cr>%% @end<cr>%%----------------------------------------------------<cr>-module(Qing).<cr>-export([<cr>cfg/0<cr>]).<cr><cr>-include("data_config.hrl").<cr><cr>cfg() -><cr>#data_cfg{<cr>name = Qing<cr>,lua_name =<cr>,desc = ""<cr>,source = "Qing.xml"<cr>,target = "Qing.erl"<cr>,callback = [<cr>]<cr>,callback_cli = [<cr>]<cr>,sheet = [<cr>]<cr>}.

" 普通Erlang文件 
iab <erl> <esc>:set filetype=erlang<cr>:set fileencoding=utf-8<cr>i%%----------------------------------------------------<cr>%% @doc<cr>%% <cr>%% @author shaolin<cr>%% @end<cr>%%----------------------------------------------------<cr>-module().<cr>-export([]).<cr><cr>-include("common.hrl").<cr><cr>%%----------------------------------------------------<cr>%% 外部接口<cr>%%----------------------------------------------------<cr><cr>%%----------------------------------------------------<cr>%% 内部私有<cr>%%----------------------------------------------------<cr><cr>%%----------------------------------------------------<cr>%% 测试用例<cr>%%----------------------------------------------------<cr><cr>-include_lib("eunit/include/eunit.hrl").<cr>-ifdef(TEST).<cr><cr>-endif.<esc>4kl
" 注释
iab <%%> <esc>i%%----------------------------------------------------<cr>%%<cr>%%----------------------------------------------------<cr><esc>2kl
" gen_server
iab <gs> <esc>:set filetype=erlang<cr>:set fileencoding=utf-8<cr>i%%----------------------------------------------------<cr>%% @doc<cr>%% <cr>%% @author shaolin<cr>%% @end<cr>%%----------------------------------------------------<cr>-module().<cr>-behaviour(gen_server).<cr>-export([<cr>    start_link/0<cr>]).<cr>-export([init/1, handle_call/3, handle_cast/2, handle_info/2, terminate/2, code_change/3]).<cr><cr>-include("common.hrl").<cr><cr>-record(state, {}).<cr><cr>%%----------------------------------------------------<cr>%% 外部接口<cr>%%----------------------------------------------------<cr><cr>%% @doc 启动进程<cr>-spec start_link() -> Result when<cr>Result  :: {ok, Pid} \| ignore \| {error, Error},<cr>Pid     :: pid(),<cr>Error   :: {already_started, Pid} \| term().<cr>start_link() -><cr>gen_server:start_link({local, ?MODULE}, ?MODULE, [], []).<cr><cr>%%----------------------------------------------------<cr>%% OTP apis<cr>%%----------------------------------------------------<cr><cr>init([]) -><cr>State = #state{},<cr>{ok, State}.<cr><cr>handle_call(_Request, _From, State) -><cr>?DEBUG("未知请求 ~w", [_Request]),<cr>{reply, false, State}.<cr><cr>handle_cast(_Msg, State) -><cr>?DEBUG("未知消息 ~w", [_Msg]),<cr>{noreply, State}.<cr><cr>handle_info(_Info, State) -><cr>?DEBUG("未知消息 ~w", [_Info]),<cr>{noreply, State}.<cr><cr>terminate(_Reason, _State) -><cr>ok.<cr><cr>code_change(_OldVsn, State, _Extra) -><cr>{ok, State}.<cr><cr>%%----------------------------------------------------<cr>%% 内部私有<cr>%%----------------------------------------------------<cr><cr>%%----------------------------------------------------<cr>%% 测试用例<cr>%%----------------------------------------------------<cr><cr>-include_lib("eunit/include/eunit.hrl").<cr>-ifdef(TEST).<cr><cr>-endif.<esc>2GA
" gen_fsm
iab <gf> <esc>:set filetype=erlang<cr>:set fileencoding=utf-8<cr>i%%----------------------------------------------------<cr>%% @doc<cr>%%<cr>%% @author shaolin<cr>%% @end<cr>%%----------------------------------------------------<cr>-module().<cr>-behaviour(gen_fsm).<cr>-export([<cr>    start_link/0<cr>]).<cr>-export([init/1, handle_event/3, handle_sync_event/4, handle_info/3, terminate/3, code_change/4]).<cr><cr>-include("common.hrl").<cr><cr>-record(state, {<cr>%% 状态时间<cr>ts = 0     :: tuple()<cr>    %% 状态超时时间<cr>    ,timeout = infinity   :: infinity \| non_neg_integer()<cr>}).<cr><cr>%%----------------------------------------------------<cr>%% 外部接口<cr>%%----------------------------------------------------<cr><cr>%% @doc 启动进程<cr>-spec start_link() -> Result when<cr>Result  :: {ok, Pid} \| ignore \| {error, Error},<cr>Pid     :: pid(),<cr>Error   :: {already_started, Pid} \| term().<cr>start_link()-><cr>gen_fsm:start_link(?MODULE, [], []).<cr><cr>%%----------------------------------------------------<cr>%% 状态方法<cr>%%----------------------------------------------------<cr><cr>%%----------------------------------------------------<cr>%% OTP apis<cr>%%----------------------------------------------------<cr><cr>init([])-><cr>{ok, xxxx, #state{}}.<cr><cr>handle_event(_Event, StateName, State) -><cr>?DEBUG("未知事件 ~w", [_Event]),<cr>continue(StateName, State).<cr><cr>handle_sync_event(_Event, _From, StateName, State) -><cr>?DEBUG("未知请求 ~w", [_Event]),<cr>Reply = false,<cr>continue(Reply, StateName, State).<cr><cr>handle_info(_Info, StateName, State) -><cr>?DEBUG("未知消息 ~w", [_Info]),<cr>continue(StateName, State).<cr><cr>terminate(_Reason, _StateName, _State) -><cr>ok.<cr><cr>code_change(_OldVsn, StateName, State, _Extra) -><cr>{ok, StateName, State}.<cr><cr>%%----------------------------------------------------<cr>%% 内部私有<cr>%%----------------------------------------------------<cr><cr>%% 继续下一个状态<cr>continue(StateName, State = #state{timeout = infinity}) -><cr>{next_state, StateName, State, infinity};<cr>continue(StateName, State = #state{ts = Ts, timeout = Timeout}) -><cr>{next_state, StateName, State, util:time_left(Timeout, Ts)}.<cr><cr>continue(Reply, StateName, State = #state{timeout = infinity}) -><cr>{reply, Reply, StateName, State, infinity};<cr>continue(Reply, StateName, State = #state{ts = Ts, timeout = Timeout}) -><cr>{reply, Reply, StateName, State, util:time_left(Timeout, Ts)}.<cr><cr>%%----------------------------------------------------<cr>%% 测试用例<cr>%%----------------------------------------------------<cr><cr>-include_lib("eunit/include/eunit.hrl").<cr>-ifdef(TEST).<cr><cr>-endif.<esc>2GA
" supervisor
iab <sv> <esc>:set filetype=erlang<cr>:set fileencoding=utf-8<cr>i%%----------------------------------------------------<cr>%% @doc<cr>%%<cr>%% @author shaolin<cr>%% @end<cr>%%----------------------------------------------------<cr>-module().<cr>-behaviour(supervisor).<cr>-export(<cr>[start_link/0]<cr>).<cr>-export([init/1]).<cr>start_link()-><cr>supervisor:start_link({local, ?MODULE}, ?MODULE, []).<cr><cr>init(_Arg)-><cr>{ok, {{one_for_one, 10, 10},<cr>[{ch, {ch, start_link, []}, permanent, 1000, worker, [ch]}]}}.<cr><esc>2GA
iab <**> <esc>i/*****************************************************<cr>* <cr>*****************************************************/<cr><esc>2kA
iab <hrl> <esc>:set filetype=erlang<cr>:set fileencoding=utf-8<cr>i%%----------------------------------------------------<cr>%% @doc<cr>%%<cr>%% @author shaolin<cr>%% @end<cr>%%----------------------------------------------------<cr><esc>2GA


