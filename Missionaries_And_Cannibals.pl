initial_state(state(left(3,3),right(0,0), boat_left)).

goal(state(left(0,0),right(3,3), boat_right)).

operator(state(left(ML,CL),right(MR,CR),boat_left), state(left(NML,NCL),right(NMR,NCR),boat_right)) :-
													move(M, C),
													M =< ML,
													C =< CL,
													NML is ML-M,
													NCL is CL-C,
													NMR is MR+M,
													NCR is CR+C,
													valid(NML, NCL).
	
operator(state(left(ML,CL),right(MR,CR),boat_right), state(left(NML,NCL),right(NMR,NCR),boat_left)) :-
													move(M, C),
													NML is ML+M,
													NCL is CL+C,
													NMR is MR-M,
													NCR is CR-C,
													NML =< 3,
													NCL =< 3,
													valid(NML, NCL).
	
valid(X, X) :- !.
valid(3, _) :- !.
valid(0, _).

move(2,0).
move(1,0).
move(1,1).
move(0,1).
move(0,2).
	
%-----------------------------------------------------------------------------------------------------------------------------
%  MISSIONARIES & CANNIBALS PROBLEM 
%_____________________________________________________________________________________________________________________________
% In the missionaries and cannibals problem, three missionaries and three cannibals must cross a river
% using a boat which can carry at most two people, under the constraint that, for both banks, 
% if there are missionaries present on the bank, they cannot be outnumbered by cannibals 
% (if they were, the cannibals would eat the missionaries). The boat cannot cross the river by itself with no people on board. 
% And, in some variations, one of the cannibals has only one arm and cannot row. 
% (https://en.wikipedia.org/wiki/Missionaries_and_cannibals_problem)
%-----------------------------------------------------------------------------------------------------------------------------
