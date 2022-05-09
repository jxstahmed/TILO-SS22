% Aufgabe 1

% präfix(Xs, Ys) : Liste Ys beginnt mit Liste Xs.
präfix([],Xs).
präfix([X|Xs],[X|Ys]) :- präfix(Xs,Ys).

% postfix1(Xs,Ys) : Die Liste Ys endet mit der Liste Xs.
postfix1(Xs,Ys) :- reverse(Ys,Bs), reverse(Xs,As), präfix(As,Bs).

% postfix2(Xs,Ys) : Die Liste Ys endet mit der Liste Xs.
postfix2(Xs,Ys) :- append(_,Xs,Ys).

% Aufgabe 2

% binbaum(Xb): Xb ist ein Binärbaum
binbaum(empty).
binbaum(node(Eintrag,Lb,Rb)) :- binbaum(Lb), binbaum(Rb).

% membertree(X,Xb): Der Eintrag X ist im Baum Xb enthalten.
membertree(X,node(X,Lb,Rb)) :- binbaum(Lb), binbaum(Rb).
membertree(X,node(Eintrag,Lb,Rb)) :- membertree(X,Lb), binbaum(Lb), binbaum(Rb).
membertree(X,node(Eintrag,Lb,Rb)) :- membertree(X,Rb), binbaum(Lb), binbaum(Rb).

% Aufgabe 3

% präorder(Xb,Ys): Ys ist die Liste der Knotenbeschriftungen des Binärbaumes Xb in Präorder.
präorder(empty,[]).
präorder(node(X,Lb,Rb),[X|Ys]) :- präorder(Lb,Ls), präorder(Rb,Rs), append(Ls,Rs,Ys).

% postorder(Xb,Ys): Ys ist die Liste der Knotenbeschriftungen des Binärbaumes Xb in Postorder.
postorder(empty,[]).
postorder(node(X,Lb,Rb),Ys) :- postorder(Lb,Ls), postorder(Rb,Rs), append(Ls,Rs,As), append(As,[X],Ys).

% roots(Xbs,Ys) :- Xbs ist eine Liste von Binärbaumen. Die Liste Ys ist die Liste der Wurzeln der Binärbäume in Xbs in der richtigen Reihenfolge.
roots([],[]).
roots([empty|Xbs],Ys) :- roots(Xbs,Ys).
roots([node(X,Lb,Rb)|Xbs],[X|Ys]) :- roots(Xbs,Ys), binbaum(Lb), binbaum(Rb).
