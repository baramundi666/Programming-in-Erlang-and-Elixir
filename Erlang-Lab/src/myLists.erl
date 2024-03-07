%%%-------------------------------------------------------------------
%%% @author mateusz-krol
%%% @copyright (C) 2024, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 07. Mar 2024 12:19 PM
%%%-------------------------------------------------------------------
-module(myLists).
-author("mateusz-krol").

%% API
-export([contains/2, duplicateElements/1, sumFloats/1, sumFloats/2]).

%%contains([], _) -> false;
%%contains([Head | Tail], Value) ->
%%  case Head of
%%    Value -> true;
%%    _ -> contains(Tail, Value)
%%  end.

%%contains([], _) -> false;
%%contains([Value | _], Value) -> true;
%%contains([_ | T], V) -> contains(T, V).

contains([], _) -> false;
contains([Head| Tail], Value) -> Head == Value orelse contains(Tail, Value).

duplicateElements([]) -> [];
duplicateElements([Head | Tail]) ->
  [Head, Head] ++ duplicateElements(Tail).

sumFloats([]) -> 0.0;
sumFloats([Head | Tail]) ->
  case is_float(Head) of
    true -> Head + sumFloats(Tail);
    false -> sumFloats(Tail)
  end.

sumFloats([], Acc) -> Acc;
sumFloats([Head | Tail],Acc) ->
  case is_float(Head) of
    true -> sumFloats(Tail, Acc+Head);
    false -> sumFloats(Tail, Acc)
  end.







