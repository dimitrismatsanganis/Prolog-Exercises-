/*-------------------------------------------------
   The 8-Puzzle problem
-------------------------------------------------*/

initial_state([2,4,3,1,e,5,7,8,6]).
%initial_state([2,3,6,1,5,4,7,e,8]).

goal([1,2,3,4,5,6,7,8,e]).

operator(P,NP):-
	trans(TempP,P),
	member((X,Y,e),TempP),
	move(X,Y,X1,Y1),
	member((X1,Y1,T),TempP),
	change(X,Y,X1,Y1,T,TempP,NewTempP),
	trans(NewTempP,NP).
