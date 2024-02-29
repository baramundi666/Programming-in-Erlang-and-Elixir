%%%-------------------------------------------------------------------
%%% @author mateusz-krol
%%% @copyright (C) 2024, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 28. Feb 2024 4:07 PM
%%%-------------------------------------------------------------------
-module(lab1).
-author("mateusz-krol").

%% API
-export([power/2]).

power(_, 0) -> 1;
power(Base, N) -> Base*power(Base, N-1).

