% zustand(X): X ist in der endlichen Zustandsmenge Z.
zustand(s).
zustand(a).
zustand(ende).

% sigma(X): X ist im Eingabealphabet enthalten.
sigma(0).
sigma(1).

% delta(Zustand, Eingabe, NeuerZustand): Der NeuerZustand ergibt sich durch den aktuellen Zustand und einer Eingabe.
delta(s, 0, a).
delta(s, 0, s).
delta(s, 1, s).
delta(a, 1, ende).

% start(X): X ist in der Startzustandsmenge S.
start(s).

% ende(X): X ist in der Endzustandsmenge E.
ende(ende).

% delta_stern(Zustand, Eingabe, ZustandNeu): Der neue Zustand ZustandNeu ergibt sich durch den alten Zustand und einer Eingabe.
delta_stern(Zustand, [], Zustand).
delta_stern(Zustand, [Eingabe|Rest], ZustandNeu) :- delta(Zustand, Eingabe, Zustand2), delta_stern(Zustand2, Rest, ZustandNeu).

% sigma_stern(X): X ist ein Wort gebildet aus dem Alphabet der Grammatik.
sigma_stern([]).
sigma_stern([X | Ws]) :- sigma(X), sigma_stern(Ws).

% lvonN(X): X ist in L(N).
lvonN(Ws) :- start(Zustand), sigma_stern(Ws), ende(NeuZ), delta_stern(Zustand,Ws,NeuZ).
