-module(example).
-export([power/2]).

power(base, 0) -> 1;
power(base, N) -> base*power(base, N-1).
