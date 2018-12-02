%% Exercise  3.1
%% Yes, because in case of 'descend(anne,donna).' there is no fact that match with the query so, prolog will use the rule 2 to find answer and this
%% is always going to be a recurisve call that will never end and the Prolog will run out of memmory saying, 'Error: Out of local stack'.

%% Exercise  3.2

directlyIn(katarina, olga).
directlyIn(olga, natasha).
directlyIn(natasha, irina).

in(X,Y) :- directlyIn(X,Y).
in(X,Y) :- directlyIn(X,Z), in(Z,Y).