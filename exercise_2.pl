% EX 2.1

%% Knowledge base

bread.
food(_).
food(_,_).
food(_,_,_).
meal(food(_),drink(_)).
meal(food(_),_).

%% solutions
%%  1. bread = bread                                    - true
%%  2. 'Bread' = Bread                                  - false
%%  3. 'bread' = bread                                  - true
%%  4. Bread = bread                                    - Bread = bread.
%%  5. bread = sausage                                  - false
%%  6. food(bread) = bread                              - false
%%  7. food(bread) = X                                  - X = food(bread).
%%  8. food(X) = food(bread)                            - X = bread.
%%  9. food(bread, X) = food(Y, sausage)                - X = sausage, Y = bread.
%% 10. food(bread, X, beer) = food(Y, sausage, X)       - false
%% 11. food(bread, X, beer) = food(Y, kahuna_burger)    - false
%% 12. food(X) = X                                      - X = food(X). howerer, it should be false with `unify_with_occurs_check(food(X), X).`
%% 13. meal(food(bread), drink(beer)) = meal(X,Y)       - X = food(bread), Y = drink(beer).
%% 14. meal(food(bread), X) = meal(X, drink(beer))      - false

% EX 2.2

%% Knowledge base

house_elf(dobby).
witch(hermione).
witch('McGonagall').
witch(rita_skeeter).
magic(X):-  house_elf(X).
magic(X):-  wizard(X).
magic(X):-  witch(X).

%% Which of the following queries are satisfied? Where relevant, give all the variable instantiations that lead to success.

%% magic(house_elf).      - false. error, Undefined procedure: wizard/1
%% wizard(harry).         - false. error, Undefined procedure: wizard/1
%% magic(wizard).         - false. error, Undefined procedure: wizard/1
%% magic('McGonagall').   - true
%% magic(Hermione).       - Hermione = dobby ;
                            Hermione = hermione ;
                            Hermione = mcGonagall ;
                            Hermione = rita_skeeter.


%% Draw the search tree for 'magic(Hermione).'

%%                               -------------------------------------------------
%%                               |             ?- magic(Hermione)                |
%%                               -------------------------------------------------
%%                                           /              |                     \
%%                           Hermione = X   /               | Hermione = X       \ Hermione = X
%%                                         /                |                       \
%%                           -------------------    ------------------        ----------------------------------
%%                           | ?- house_elf(X) |    | ?- wizard(X)   |        |         ?- witch(X)            |
%%                           -------------------    ------------------        ----------------------------------
%%                                     |                  |                     /     |                     \
%%                           X = dobby |                  |       X = hermione /      | X = 'McGonagall'\    \ X = rita_skeeter
%%                                     |                  |                   /       |      mcGonagall       \
%%                                    ---                 X                ---       ---                      ---
%%                                    | |                                  | |       | |                      | |
%%                                    ---                                  ---       ---                      ---

