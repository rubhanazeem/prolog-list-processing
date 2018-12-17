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


%% iterate list
iterate([H|T]) :- write(H), write(' '), iterate(T).
iterate([]).

%% length of a list
accLength([_|T], A, Length) :- N is A+1, accLength(T, N, Length).
accLength([], A, A).

list_length(List, X) :- accLength(List, 0, X).


%% check if X is a member of the given list
member(X, [X|_]) :- !.
member(X, [_|T]) :- member(X, T).


%% compare if two lists are equal
compare([Ha|Ta], [Ha|Tb]) :- compare(Ta, Tb).
compare([], []).