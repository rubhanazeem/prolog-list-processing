%% Exercise  1.4

%% 1: Butch is a killer.
%% 2: Mia and Marsellus are married.
%% 3: Zed is dead.
%% 4: Marsellus kills everyone who gives Mia a footmassage.
%% 5: Mia loves everyone who is a good dancer.
%% 6: Jules eats anything that is nutritious or tasty.

killer(butch).
married(mia, marsellus).
dead(zed).
kills(marsellus, X) :- footmassage(X, mia).
loves(mia, X) :- good_dancer(X).
eats_anything(jules, X) :- nutritious(X); tasty(X).

%% Exercise  1.5

wizard(ron).
hasWand(harry).
quidditchPlayer(harry).
wizard(X):- hasBroom(X), hasWand(X).
hasBroom(X):- quidditchPlayer(X).

%% How does Prolog respond to the following queries?

%% wizard(ron).         - true
%% witch(ron).          - error, Undefined procedure: witch/1
%% wizard(hermione).    - false
%% witch(hermione).     - error, Undefined procedure: witch/1
%% wizard(harry).       - true
%% wizard(Y).           - Y = ron; Y = harry
%% witch(Y).            - error, Undefined procedure: witch/1