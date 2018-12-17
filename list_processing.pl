%% get max element of the list
accMax([], A, A).
accMax([H|T], A, Max) :- A =< H, accMax(T, H, Max).
accMax([H|T], A, Max) :- A > H, accMax(T, A, Max).

max(List, X) :- List = [H|_], accMax(List, H, X).