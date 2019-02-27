"erlang代码缩写
iab <erl> <esc>:set paste<cr>:set filetype=erlang<cr>:set fileencoding=utf-8<cr>i%%----------------------------------------------------<cr>%% @doc<cr>%% <cr>%% @author Raydraw@163.com<cr>%% @end<cr>%%----------------------------------------------------<cr>-module().<cr>-export([]).<esc>:set nopaste<cr>4kl

iab <gs> <esc>:set paste<cr>:set filetype=erlang<cr>:set fileencoding=utf-8<cr>i%%----------------------------------------------------<cr>%% @doc<cr>%% <cr>%% @author Raydraw@163.com<cr>%% @end<cr>%%----------------------------------------------------<cr>-module().<cr>-behaviour(gen_server).<cr>-export([start_link/0]).<cr>-export([init/1, handle_call/3, handle_cast/2, handle_info/2, terminate/2, code_change/3]).<cr>-record(state, {}).<cr><esc>:set nopaste<cr>i<cr><cr>start_link() -><cr>gen_server:start_link({local, ?MODULE}, ?MODULE, [], []).<cr><cr>init([]) -><cr>State = #state{},<cr>{ok, State}.<cr><cr>handle_call(_Request, _From, State) -><cr>{noreply, State}.<cr><cr>handle_cast(_Msg, State) -><cr>{noreply, State}.<cr><cr>handle_info(_Info, State) -><cr>{noreply, State}.<cr><cr>terminate(_Reason, _State) -><cr>ok.<cr><cr>code_change(_OldVsn, State, _Extra) -><cr>{ok, State}.<esc>2GA

iab <gf> <esc>:set paste<cr>:set filetype=erlang<cr>:set fileencoding=utf-8<cr>i%%----------------------------------------------------<cr>%% @doc<cr>%%<cr>%% @author Raydraw@163.com<cr>%% @end<cr>%%----------------------------------------------------<cr>-module().<cr>-behaviour(gen_fsm).<cr>-export(<cr>[<cr>start_link/1<cr>]<cr>).<cr>-export([init/1, handle_event/3, handle_sync_event/4, handle_info/3, terminate/3, code_change/4]).<cr>-record(state, {}).<cr><cr>start_link([])-><cr>gen_fsm:start_link(?MODULE, [], []).<cr><cr>init([])-><cr>{ok, xxxx, State}.<cr><cr>handle_event(_Event, StateName, State) -><cr>{next_state, StateName, State}.<cr><cr>handle_sync_event(_Event, _From, StateName, State) -><cr>Reply = ok,<cr>{reply, Reply, StateName, State}.<cr><cr>handle_info(_Info, StateName, State) -><cr>{next_state, StateName, State}.<cr><cr>terminate(_Reason, _StateName, _State) -><cr>ok.<cr><cr>code_change(_OldVsn, StateName, State, _Extra) -><cr>{ok, StateName, State}.<esc>:set nopaste<cr>2GA

iab <sv> <esc>:set paste<cr>:set filetype=erlang<cr>:set fileencoding=utf-8<cr>i%%----------------------------------------------------<cr>%% @doc<cr>%%<cr>%% @author Raydraw@163.com<cr>%% @end<cr>%%----------------------------------------------------<cr>-module().<cr>-behaviour(supervisor).<cr>-export(<cr>[start_link/0]<cr>).<cr>-export([init/1]).<cr>start_link()-><cr>supervisor:start_link(?MODULE, []).<cr><cr>init(_Arg)-><cr>{ok, {{one_for_one, 10, 10},<cr>[{ch, {ch, start_link, []}, permanent, 1000, worker, [ch]}]}}.<cr><esc>:set nopaste<cr>2GA

iab <--> <esc>:set paste<cr>:set filetype=erlang<cr>:set fileencoding=utf-8<cr>i%%---------------------------<cr>%%<cr>%%---------------------------<esc>:set nopaste<cr>kA

