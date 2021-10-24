maxCost(10).
numCities(20).

adjacency(1,[10]).
adjacency(2,[7,5,17]).  % Three one-way roads from city 2:  2->7, 2->5 and 2->17.
adjacency(3,[6,20,11]).
adjacency(4,[14,15,1,8,5]).
adjacency(5,[16,4,9,10,11]).
adjacency(6,[1,13,17]).
adjacency(7,[16,9,13,11]).
adjacency(8,[7,3,10,6,17]).
adjacency(9,[6,17,11]).
adjacency(10,[7,11,5,6,4]).
adjacency(11,[20,8,15,4,1,16,3]).
adjacency(12,[15,11,3]).
adjacency(13,[5,2,19,3,6]).
adjacency(14,[10,12,9,7]).
adjacency(15,[20,1,14,18,12,2]).
adjacency(16,[7,6,4,8,2,10]).
adjacency(17,[20,5,16,3,8]).
adjacency(18,[15,16,7,14,3]).
adjacency(19,[13,6]).
adjacency(20,[12,6,18,7,16]).

visited(1,0).
visited(2,1).
visited(3,2).
visited(4,3).
visited(5,4).
visited(6,5).
visited(7,6).
visited(8,7).
visited(9,8).
visited(10,9).
visited(11,10).
visited(12,11).
visited(13,12).
visited(14,13).
visited(15,14).
visited(16,15).
visited(17,16).
visited(18,17).
visited(19,18).
visited(20,19).
visited(1,20).

position(P):- numCities(N), between(0,N,P).
city(I):-     adjacency(I,_).

sonAdyacentes(I1, I2):- adjacency(I1, L), member(I2, L), !.
sonAdyacentes(I1, I2):- write('Error: la ciudad '), write(I1), write(' no es adyacente a '), write(I2), nl, !.

menorque(C):- C =< 20, !.
menorque(C):- write('Error: el precio es '), write(C), nl, !.

check():- position(P1), not(position(P1) = position(20)), P2 is P1 + 1, visited(I1, P1), visited(I2, P2), not(city(I1) = city(I2)), coste(0, C), menorque(C), sonAdyacentes(I1, I2), fail.
