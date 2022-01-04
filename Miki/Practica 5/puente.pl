



nat(0).
nat(N) :- nat(N1), N is N1 + 1.

persona("Pau", 15).
persona("Truji", 16).
persona("Mari", 70).
persona("Eli", 65).
persona("Miquel", 90).

max(Ta,Tb,Ta):- Ta > Tb.
max(Ta,Tb,Tb):- Ta < Tb.

unPaso([N,Per,T1],[N2,[P,P2|Per],T2]):-
  persona(P,Ta),persona(P2,Tb),
  not(member(P,Per)), not(member(P2,Per)),
  max(Ta,Tb,Taux),
  T2 is T1 + Taux,
  N2 is N + 2.

unPaso([N,Per,T1],[N2,[P|Per],T2]):-
  persona(P,Ta),
  not(member(P,Per)),
  T2 is T1 + Ta,
  N2 is N + 1.


camino( E,E, C,C ).
camino( EstadoActual, EstadoFinal, CaminoHastaAhora, CaminoTotal ):-
        unPaso( EstadoActual, EstSiguiente ),
        \+member(EstSiguiente,CaminoHastaAhora),
        camino( EstSiguiente, EstadoFinal, [EstSiguiente|CaminoHastaAhora], CaminoTotal ).
solucionOptima:-
    nat(N),
    camino([0,[],0], [5,_,N], [[0,[],0]] , C),
    write(C),!.
