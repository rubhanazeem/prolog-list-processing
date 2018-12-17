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

%% Input – a list of atomics
%% Output – a list of numbers and a list of atoms in the
%% order of the “input list”
classify([], [], []).
classify([H|T], [H|Numbers], Atoms) :- number(H), classify(T, Numbers, Atoms).
classify([H|T], Numbers, [H|Atoms]) :- atom(H), classify(T, Numbers, Atoms).


%% saperate even numbers from a list
evens([H|T], [H|Evens]) :- mod(H,2) =:= 0, evens(T, Evens).
evens([H|T], Evens) :- mod(H,2) =\= 0, evens(T, Evens).
evens([], []).


%% saperate prime numbers from a list
primes([H|T], [H|Primes]) :- 
  H =\= 2,
  N is H-1,
  numlist(2,N,L),
  is_prime(L, H),
  primes(T, Primes).

primes([H|T], [H|Primes]) :- 
  H =:= 2,
  primes(T, Primes), !.

primes([_|T], Primes) :- primes(T, Primes), !.
primes([], []).

is_prime([H|T], X) :- mod(X,H) =\= 0, is_prime(T, X).
is_prime([], _).


%% get all the prime numbers till X.
get_all_primes(X, Primes) :- numlist(2,X,L), primes(L, Primes).


%% append two lists
append([Ha|Ta], ListB, [Ha|T]) :- append(Ta, ListB, T).
append([], [Hb|Tb], [Hb|T]) :- append([], Tb, T), !.
append([], [], []).


%% saperate even and prime numbers from a list and return two lists Evens and Primes
evens_and_primes([H|T], [H|Tev], Primes) :- 
  mod(H,2) =:= 0,
  evens_and_primes(T, Tev, Primes).

evens_and_primes([H|T], Evens, [H|Tpr]) :- 
  mod(H,2) =\= 0,
  N is H-1,
  numlist(2,N,L),
  is_prime(L, H),
  evens_and_primes(T, Evens, Tpr).

evens_and_primes([_|T], Evens, Primes) :- 
  evens_and_primes(T, Evens, Primes), !.

evens_and_primes([], [], []).