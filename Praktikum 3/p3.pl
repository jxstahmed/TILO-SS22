% Aufgabe 1

app(nil,Xs,Xs).
app(list(X,X1s),Ys,list(X,X2s)):- app(X1s,Ys,X2s).

% linListe(list(A,Ys)) : list(A,Ys) ist eine gültige Liste, wenn Ys eine gültige Liste ist.
linListe(nil).
linListe(list(A,Ys)) :- linListe(Ys).

% member2(X,list(X,Xs)). : Das Element X befindet sich in der liste.
member2(X,list(X,Xs)).
member2(X,list(Y,Ys)). :- member2(X,Ys).

% infix(Xs,Ys) : Die Liste X2 ist in der Liste Ys vorhanden.
infix(Xs,Ys) :- app(A,Xs,Bs), app(Bs,A,Ys).

% attach(Xs,X,Ys) : Die Liste Ys ist die Liste Xs erweitert um Element X.
attach(Xs,X,Ys) :- app(Xs,X,Ys).

% rev(Xs,Ys) : Ys ist die gespiegelte Liste Xs.
rev(nil,nil).
rev(list(X,Xs),Ys) :- rev(Xs,Ys), attach(Ys,X,Xs).


% Aufgabe 2

% binbaum(Root,Lb,Rb,node(Root,Lb,Rb)) : Node besteht aus der Beschriftung Root, dem linken Teilbaum Lb und dem Rechten Teilbaum Rb.
binbaum(leer).
binbaum(node(eintrag,links,rechts)) :- binbaum(links), binbaum(rechts).
binbaum(Root,Lb,Rb,node(Root,Lb,Rb)) :- binbaum(Lb), binbaum(Rb).

% natSymb(o) :- o ist die 0 in Darstellung der Natürlichen Symbole.
natSymb(o).
natSymb(s(X)):- natSymb(X).
% add(X,Y,A) : A ist das Ergebnis bei Addition von X und Y.
add(X,o,X):- natSymb(X).
add(X,s(Y),s(A)):- add(X,Y,A).

% knotenanz(Xb,N) :- N ist die Anzahl der Knoten des Baumes Xb.
knotenanz(nil,o).
knotenanz(node(Eintrag,Links,Rechts),s(N)) :- knotenanz(Links, N1), knotenanz(Rechts, N2), add(N1,N2,N).
