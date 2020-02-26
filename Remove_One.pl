removeone(X, [X|T], T) :- !.
removeone(X, [H|T], [H|Rt]) :-
	removeone(X, T, Rt), !.