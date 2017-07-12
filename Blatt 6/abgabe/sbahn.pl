% S5
connection(tamm,ludwigsburg).
connection(ludwigsburg,zuffenhausen).
connection(zuffenhausen,hbf).

% S1
connection(plochingen,esslingen).
connection(esslingen,cannstatt).
connection(cannstatt,hbf).
connection(hbf,universitaet).
connection(universitaet,vaihingen).
connection(vaihingen,boeblingen).
connection(ehningen,boeblingen).
connection(herrenberg,boeblingen).

% S6
connection(renningen,leonberg).
connection(leonberg,ditzingen).
connection(ditzingen,korntal).
connection(korntal,zuffenhausen).
connection(zuffenhausen,hbf).

% S60
connection(hbf,zuffenhausen).
connection(zuffenhausen,korntal).
connection(korntal,ditzingen).
connection(ditzingen,leonberg).
connection(leonberg,renningen).
connection(renningen,sindelfingen).
connection(sindelfingen,boeblingen).

% Fuegen Sie hier unten Ihre eigenen Definitionen ein.
% 6.5.1
% Trains go in both directions
connectedEitherWay(X,Y):- connection(X,Y); connection(Y,X).
% Keep track of already visited nodes
connectedWithoutCycles(X,Y,L):- 
	connectedEitherWay(X, Z),
    \+ memberchk(Z, L),
    connectedWithoutCycles(Z, Y, [Z|L]),
    X \= Y.
% If a direct connection exists
connectedWithoutCycles(X,Y,_):- 
    connectedEitherWay(X, Y).
connected(X,Y):- connectedWithoutCycles(X,Y,[]).

% 6.5.2
empty([], true).
% Iterating through a list
validStep(X,[H|L]):- connectedEitherWay(X,H), X \= H, (   
                                              empty(L,true);
                                              validStep(H,L)).
valid([H|L]):- validStep(H,L).