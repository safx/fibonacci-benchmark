-module(fib).
-export([start/0, fib/1]).

fib(0) -> 0;
fib(1) -> 1;
fib(N) -> fib(N-1) + fib(N-2).

start() ->
    io:format("~p~n", [fib:fib(35)]).
