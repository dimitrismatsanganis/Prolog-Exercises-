remove_duplicates(List, Result) :- 
	remove_duplicates(List, Result, []), !.
remove_duplicates([],[],_).
remove_duplicates([H|T], [H|Rest], Found) :-
	not(member(H, Found)),
	remove_duplicates(T, Rest, [H|Found]).
remove_duplicates([_|T], Result, Found) :-
	remove_duplicates(T, Result, Found). 