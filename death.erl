-module(death).
-export([create_processes/2]).

create_processes(N, M) ->
	statistics(runtime),
	H = lists:foldl(
    		fun(Id, Pid) -> spawn_link(fun() -> loop(Id, Pid, M) end) end,
    		self(),
    		lists:seq(N, 2, -1)),
	{_, Time} = statistics(runtime),
	io:format("~p processes spawned in ~p ms~n", [N, Time]),
	get_time(H, M).

loop(Id, Pid, M) ->
		%io:format("oi, eu sou o processo ~p e estou cedendo minha vez~n", [Pid]),
		case M > 1 of
			true -> 
				erlang:yield(), loop(Id, Pid, M - 1);
			false ->  
             			true
		end.

get_time(H, M) -> 
	statistics(runtime),
	loop(1, H, M),
	{_, Time} = statistics(runtime),
	io:format("it took ~p ms to execute~n", [Time]),
	exit(self(), ok).



