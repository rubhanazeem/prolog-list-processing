%% get max element of the list
accMax([], A, A).
accMax([H|T], A, Max) :- A =< H, accMax(T, H, Max).
accMax([H|T], A, Max) :- A > H, accMax(T, A, Max).

max(List, X) :- List = [H|_], accMax(List, H, X).


%% get smallest element of the list
accSmall([H|T], A, Small) :- A > H, accSmall(T, H, Small).
accSmall([H|T], A, Small) :- A =< H, accSmall(T, A, Small).
accSmall([], A, A).

small(List, X) :- List = [H|_], accSmall(List, H, X).