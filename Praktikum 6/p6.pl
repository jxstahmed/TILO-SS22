% PDA für gerade Palindrome über Binär-Alphabet

% start(X) : X ist ein Startzustand.
start(z0).

% ende(X) : X ist der Kellerboden.
ende(#).

% z(X) : X ist ein Zustand in der Zustandsmenge.
z(z0).
z(z1).

% sigma(X) : X ist im Alphabet Sigma enthalten.
sigma(0).
sigma(1).
% Muss keine Schnittmenge geben.
% keller(X) :  X ist im Keller Alphabet enthalten.
keller(0).
keller(1).
keller(#).

% delta(Zustand, Eingabe, Keller, NeuZustand, NeuerKeller) : Hier bei handelt es sich um eine Transrelationen.
delta(z0, 0, #, z0, [0, #]).
delta(z0, 0, 0, z0, [0, 0]).
delta(z0, 0, 1, z0, [0, 1]).
delta(z0, 1, #, z0, [1, #]).
delta(z0, 1, 0, z0, [1, 0]).
delta(z0, 1, 1, z0, [1, 1]).

% Erweiterung für ungerade Palindrome
% delta(z0, 0, #, z1, [#]).
% delta(z0, 0, 0, z1, [0]).
% delta(z0, 0, 1, z1, [1]).
% delta(z0, 1, #, z1, [#]).
% delta(z0, 1, 0, z1, [0]).
% delta(z0, 1, 1, z1, [1]).

delta(z0, nix, #, z1, [#]).
delta(z0, nix, 0, z1, [0]).
delta(z0, nix, 1, z1, [1]).

delta(z1, 0, 0, z1, []).
delta(z1, 1, 1, z1, []).
delta(z1, nix, #, z1, []).

% sigma_stern([X|Xs] : X ist in Sigma enthalten und Xs ist in sigma_stern enthalten.
sigma_stern([]).
sigma_stern([X|Xs]) :- sigma_stern(Xs), sigma(X).

% es() : Hierbei handelt es sich um eine Einzelschrittrelationen.
%(z, aw, gs, z', w, s's) ? |-M falls (z, a, g, z', s')
es(Altzustand, [A|Ws], [G|Gs], Neuzustand, Ws, NeuerKeller) :- delta(Altzustand, A, G, Neuzustand, ZwischenKeller), sigma(A), append(ZwischenKeller, Gs, NeuerKeller).

%(z, w, gs, z', w, s's) ? |-M falls (z, nix, g, z', s')
es(Altzustand, Ws, [G|Gs], Neuzustand, Ws, NeuerKeller) :- delta(Altzustand, nix, G, Neuzustand, ZwischenKeller), append(ZwischenKeller, Gs, NeuerKeller).

% es_plus() : Hierbei handelt es sich um eine Transitiver Abschluss Einzelschrittrelationen
% es_plus(_, [], [Endzustand]) :- ende(Endzustand).
% es_plus(Zustand, Ws, Keller) :- es(Zustand, Ws, Keller, Neuzustand, NeuWs, NeuerKeller), es_plus(Neuzustand, NeuWs, NeuerKeller).

es_plus(Altzustand, Ws, Gs, Neuzustand, Wneus, Neuerkeller) :- es(Altzustand, Ws, Gs, Neuzustand, Wneus, Neuerkeller).
es_plus(Altzustand, Ws, Gs, Neuzustand2, Wneu2s, Neuerkeller2) :- es(Altzustand, Ws, Gs, Neuzustand, Wneus, Neuerkeller), es_plus(Neuzustand, Wneus, Neuerkeller, Neuzustand2, Wneu2s, Neuerkeller2).

% lvonM(Xs) : Xs ist in der allgeminen Sprache des PDAs enthalten und wird erkannt.
lvonM(Xs) :- sigma_stern(Xs), start(Zustand), z(Zustand), ende(Ende), keller(Ende), z(NeuerZustand), es_plus(Zustand, Xs, [Ende], NeuerZustand, [], []).
