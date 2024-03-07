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
-export([get_data/0, number_of_readings/2, calculate_max/2, calculate_mean/2]).

getdata() ->
  [
  {"Puszkarska", {{2024,3,7}, {12,00,30}},[{'pm10',35},{'pm2.5',28},{'pm1',18}
  ,{'temp',1},{'wilg',88},{'wiatr',18}]},

  {"Na Kozłówce", {{2024,3,7}, {12,00,30}},[{'pm10',35},{'pm2.5',28},{'pm1',18}
  ,{'temp',1},{'wilg',88},{'wiatr',18}]},

  {"Wielicka", {{2024,3,7}, {12,00,30}},[{'pm10',35},{'pm2.5',28},{'pm1',18}
  ,{'temp',1},{'wilg',88},{'wiatr',18}]},

  {"Świętego Wawrzyńca", {{date()}, {time()}},[{'pm10',35},{'pm2.5',28},{'pm1',18}
  ,{'temp',1},{'wilg',88},{'wiatr',18}]}
    ].

number_of_readings([], _) -> 0;
number_of_readings([{_,{Date,_},_} | T], Date) -> 1 + number_of_readings(T, Date);
number_of_readings([_ | T], Date) -> number_of_readings(T, Date).





