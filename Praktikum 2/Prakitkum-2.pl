% elternteil(X,Y): X ist ein Elternteil von Y [Vater oder Mutter].
elternteil(awad,awadjr).
elternteil(awad,kheer).
elternteil(awad,nasser).
elternteil(kheer,samer).
elternteil(kheer,fatima).
elternteil(kheer,sarah).
elternteil(kheer,ahmed).
elternteil(khadijeh,samer).
elternteil(khadijeh,fatima).
elternteil(khadijeh,sarah).
elternteil(khadijeh,ahmed).
elternteil(samer,zaina).
elternteil(samer,zunaira).
elternteil(samer,djibril).
elternteil(samer,djumana).
elternteil(corinna,zaina).
elternteil(corinna,zunaira).
elternteil(corinna,djibril).
elternteil(corinna,djumana).
elternteil(fatima,hamza).
elternteil(fatima,israa).
elternteil(nidal,hamza).
elternteil(nidal,israa).

% maennlich(X): X ist Maennlich.
maennlich(awad).
maennlich(nasser).
maennlich(awadjr).
maennlich(kheer).
maennlich(samer).
maennlich(ahmed).
maennlich(djibril).
maennlich(hamza).
maennlich(nidal).

% weiblich(X): X ist Weiblich.
weiblich(khadijeh).
weiblich(fatima).
weiblich(sarah).
weiblich(zaina).
weiblich(zunaira).
weiblich(djumana).
weiblich(corinna).
weiblich(israa).


% vater(X,Y): X ist Vater von Y.
vater(X,Y) :- maennlich(X), elternteil(X,Y).

% mutter(X,Y): X ist Mutter von Y.
mutter(X,Y) :- weiblich(X), elternteil(X,Y).

% sohn(X,Y): X ist Sohn von Y.
sohn(X,Y) :- elternteil(Y,X), maennlich(X).

% tochter(X,Y): X ist Tochter von Y.
tochter(X,Y) :- elternteil(Y,X), weiblich(X).

% nichtgleich(X,Y): X ist nicht gleich Y [Nicht die selbe Person].
nichtgleich(X,Y) :-  X\==Y.

% bruder(X,Y): X ist Bruder von Y [aber nicht die selbe Person].
bruder(X,Y) :- maennlich(X), vater(A,X), vater(A,Y), mutter(B,X), mutter(B,Y), nichtgleich(X,Y).

% schwester(X,Y): X ist Schwester von Y [aber nicht die selbe Person].
schwester(X,Y) :- weiblich(X), vater(A,X), vater(A,Y), mutter(B,X), mutter(B,Y), nichtgleich(X,Y).

% onkel(X,Y): X ist Onkel von Y.
onkel(X,Y) :- elternteil(A,Y), bruder(X,A).

% tante(X,Y): X ist Tante von Y.
tante(X,Y) :- elternteil(A,Y), schwester(X,A).

% cousine(X,Y): X ist Cousine von Y.
cousine(X,Y) :- weiblich(X), onkel(A,Y), elternteil(A,X).
cousine(X,Y) :- weiblich(X), tante(A,Y), elternteil(A,X).

% großvater(X,Y): X ist Großvater von Y.
großvater(X,Y) :- maennlich(X), elternteil(X,A), elternteil(A,Y).
