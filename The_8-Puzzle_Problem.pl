/*-------------------------------------------------
   The 8-Puzzle problem
-------------------------------------------------*/

% Various examples of initial states

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

trans( 	[(1,1,T1),(1,2,T2),(1,3,T3),
	(2,1,T4),(2,2,T5),(2,3,T6),
	(3,1,T7),(3,2,T8),(3,3,T9)],
	[T1,T2,T3,T4,T5,T6,T7,T8,T9]).

move(X,Y,X,NY):-NY is Y-1,NY>0.	
% down
move(X,Y,X,NY):-NY is Y+1,NY<4.	
% up
move(X,Y,NX,Y):-NX is X-1,NX>0.	
% left
move(X,Y,NX,Y):-NX is X+1,NX<4.	
% right

change(_X,_Y,_X1,_Y1,_T,[],[]).
change(X,Y,X1,Y1,T,[(X,Y,e)|R],[(X,Y,T)|CR]):-
						change(X,Y,X1,Y1,T,R,CR).
						
change(X,Y,X1,Y1,T,[(X1,Y1,T)|R],[(X1,Y1,e)|CR]):-
						change(X,Y,X1,Y1,T,R,CR).
change(X,Y,X1,Y1,T,[(AX,AY,AT)|R],[(AX,AY,AT)|CR]):-
						   AT\=e, AT\=T,
						   change(X,Y,X1,Y1,T,R,CR).
