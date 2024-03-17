%%%-------------------------------------------------------------------
%%% @author mateusz-krol
%%% @copyright (C) 2024, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 07. Mar 2024 12:42 PM
%%%-------------------------------------------------------------------
-module(polution).
-author("mateusz-krol").

%% API
-export([number_of_readings/2, calculate_max/2, calculate_mean/2, list_sum_and_count/2, getdata/0]).

getdata() ->
  [
  {"Puszkarska", {{2024,3,7}, {12,00,30}},[{'pm10',35},{'pm2.5',28},{'pm1',18}
  ,{'temp',1},{'wilg',88},{'wiatr',18}]},

  {"Na Kozłówce", {{2024,3,7}, {12,00,30}},[{'pm2.5',28},{'pm1',18}
  ,{'temp',1},{'wilg',88},{'wiatr',18}]},

  {"Wielicka", {{2024,3,7}, {12,00,30}},[{'pm10',399},{'pm2.5',28},{'pm1',18}
  ,{'temp',1},{'wilg',88},{'wiatr',18}]},

  {"Świętego Wawrzyńca", {{date()}, {time()}},[{'pm10',3.5},{'pm2.5',28},{'pm1',18}
  ,{'temp',1},{'wilg',88},{'wiatr',18}]}
    ].

number_of_readings([], _) -> 0;
number_of_readings([{_,{Date,_},_} | T], Date) -> 1 + number_of_readings(T, Date);
number_of_readings([_ | T], Date) -> number_of_readings(T, Date).


%%No more readings
calculate_max([], _) -> -274.0;
%%No more data in current reading
calculate_max([{_, _, []} | Tail], Type) -> calculate_max(Tail, Type);
%%Current data in the reading has correct type
calculate_max([{_, _, [{Type, Value} | _]} | Tail], Type) ->
  Tmp = calculate_max(Tail, Type),
  case Value > Tmp of
    true -> Value;
    false -> Tmp
  end;
%%Current data in the reading does not have correct type
calculate_max([{Name, Date, [_ | Rest]} | Tail], Type) -> calculate_max([{Name, Date, Rest} | Tail], Type).


calculate_mean([], _) -> {error, "Empty list"};
calculate_mean(List, Type) ->
  {Sum, Count} = list_sum_and_count(List, Type),
  case Count of
    0 -> {error, "No readings"};
    _ -> Sum / Count
  end.


list_sum_and_count([], _) ->
  {0.0, 0};
list_sum_and_count([{_, _, []} | Tail], Type) -> list_sum_and_count(Tail, Type);
list_sum_and_count([{_, _, [{Type, Value}| _]} | Tail], Type) ->
  {Sum, Count} = list_sum_and_count(Tail, Type),
  {Value + Sum, 1 + Count};
list_sum_and_count([{Name, Date, [_| Rest]} | Tail], Type) ->
  list_sum_and_count([{Name, Date, Rest} | Tail], Type).










