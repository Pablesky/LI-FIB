camino( E,E, C,C ).
camino( EstadoActual, EstadoFinal, CaminoHastaAhora, CaminoTotal ):-
  unPaso( EstadoActual, EstSiguiente ),
  \+member(EstSiguiente,CaminoHastaAhora),
  camino( EstSiguiente, EstadoFinal, [EstSiguiente|CaminoHastaAhora], CaminoTotal ).

solucionOptima:-
  nat(N),
          %c %m %vj  %cr %mr
  camino([3, 3, ida, 0, 0], [0, 0, vuelta, 3, 3]),
  length(C,N),
  write(C).


legal([C, M, _, C2, M2]):-
  C >= 0, M >= 0, C2 >= 0, M2 >= 0,
  (C <= M; M = 0),
  (C2 <= M2, M2 = 0).

%se van dos misioneros
unPaso([C, M, ida, C2, M2], [C1, M1, vuelta, C21, M21]):-
  C1 is C,
  C21 is C2,
  M1 is M - 2,
  M21 is M2 + 2,
  legal([C1, M1, vuelta, C21, M21]).

%vuelven dos misioneros
unPaso([C, M, vuelta, C2, M2], [C1, M1, ida, C21, M21]):-
  C1 is C,
  C21 is C2,
  M1 is M + 2,
  M21 is M2 - 2,
  legal([C1, M1, ida, C21, M21]).

%se van dos canibales
unPaso([C, M, ida, C2, M2], [C1, M1, vuelta, C21, M21]):-
  C1 is C - 2,
  C21 is C2 + 2,
  M1 is M,
  M21 is M2,
  legal([C1, M1, vuelta, C21, M21]).

%vuelven dos canibales
unPaso([C, M, vuelta, C2, M2], [C1, M1, ida, C21, M21]):-
  C1 is C + 2,
  C21 is C2 - 2,
  M1 is M,
  M21 is M2,
  legal([C1, M1, ida, C21, M21]).

%se va un canibal y un misionera
unPaso([C, M, ida, C2, M2], [C1, M1, vuelta, C21, M21]):-
  C1 is C - 1,
  C21 is C2 + 1,
  M1 is M - 1,
  M21 is M2 + 1,
  legal([C1, M1, vuelta, C21, M21]).

%vuelve un canibal y un misionero
unPaso([C, M, vuelta, C2, M2], [C1, M1, ida, C21, M21]):-
  C1 is C + 1,
  C21 is C2 - 1,
  M1 is M + 1,
  M21 is M2 - 1,
  legal([C1, M1, ida, C21, M21]).

%se va un canibal
unPaso([C, M, ida, C2, M2], [C1, M1, vuelta, C21, M21]):-
  C1 is C - 1,
  C21 is C2 + 1,
  M1 is M,
  M21 is M2,
  legal([C1, M1, vuelta, C21, M21]).

%vuelve un canibal
unPaso([C, M, vuelta, C2, M2], [C1, M1, ida, C21, M21]):-
  C1 is C + 1,
  C21 is C2 - 1,
  M1 is M,
  M21 is M2,
  legal([C1, M1, ida, C21, M21]).

%se va un canibal
unPaso([C, M, ida, C2, M2], [C1, M1, vuelta, C21, M21]):-
  C1 is C,
  C21 is C2,
  M1 is M - 1,
  M21 is M2 + 1,
  legal([C1, M1, vuelta, C21, M21]).

%vuelve un canibal
unPaso([C, M, vuelta, C2, M2], [C1, M1, ida, C21, M21]):-
  C1 is C,
  C21 is C2,
  M1 is M + 1,
  M21 is M2 - 1,
  legal([C1, M1, ida, C21, M21]).
