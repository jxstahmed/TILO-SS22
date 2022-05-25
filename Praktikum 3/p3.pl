% Aufgabe 1

app(nil,Xs,Xs).
app(list(X,Xs),Ys,list(X,As)):- app(Xs,Ys,As).

% linListe(Xs): Xs ist eine gueltige Liste.
linListe(nil).
linListe(list(X,Ys)) :- linListe(Ys), not(linListe(X)).

% member2(X,Ys): Ys enthält das Element X
member2(X,list(X,Xs)).
member2(X,list(Y,Ys)). :- member2(X,Ys).

% infix(Xs,Ys) : Die Liste Xs ist in der Liste Ys vorhanden.
infix(Xs,Ys) :- app(_,Xs,As), app(As,_,Ys), linListe(As), linListe(Xs), linListe(Ys).

% attach(Xs,X,Ys) : Die Liste Ys ist die Liste Xs erweitert um Element X.
attach(Xs,nil,Xs).
attach(Xs,X,Ys) :- app(Xs,list(X,nil),Ys), linListe(Ys), linListe(Xs).

% rev(Xs,Ys) : Ys ist die gespiegelte Liste Xs.
rev(nil,nil).
rev(list(X,Xs),Ys) :- rev(Xs,As), attach(As,X,Ys), linListe(Xs), linListe(Ys).


% Aufgabe 2

% binbaum(X) : X ist ein binärer Baum.
binbaum(empty).
binbaum(node(Eintrag,Lb,Rb)) :- binbaum(Lb), binbaum(Rb).

% construct(Eintrag,Lb,Rb,Xneub): Xneub ist der Baum mit der Wurzel Eintrag, linkem Teilbaum Lb und rechtem Teilbaum Rb.
construct(Eintrag,Lb,Rb,node(Eintrag,Lb,Rb)) :- binbaum(Lb), binbaum(Rb).

% natSymb(X) :- X ist eine natürliche Zahl.
natSymb(o).
natSymb(s(X)):- natSymb(X).

% add(X,Y,A) : A ist das Ergebnis bei einer Addition von X und Y.
add(X,o,X):- natSymb(X).
add(X,s(Y),s(A)):- add(X,Y,A), natSymb(X), natSymb(Y), natSymb(A).

% knotenanz(Xb,N) :- N ist die Anzahl der Knoten des Baumes Xb.
knotenanz(empty,o).
knotenanz(node(Eintrag,Lb,Rb),s(N)) :- knotenanz(Lb,N1), knotenanz(Rb,N2), add(N1,N2,N), binbaum(Lb), binbaum(Rb), natSymb(N1), natSymb(N2), natSymb(N).
