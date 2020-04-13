dfs([[State|Path]|_], [State|Path]):-  goal(State).
  
dfs([[State|Path]|RestFrontierSet], Solution):-  write('Expanding '),write(State),nl, 
						 expand(State,Path,ChildrenStates),
						 append(ChildrenStates,RestFrontierSet,NewFrontierSet),
						 dfs(NewFrontierSet, Solution).

expand(State,Path,Children):-  findall([Child,State|Path],
			       (operator(State,Child),not(member(Child,Path)) ),Children).

godfs(Solution):- initial_state(IS), 
		  dfs([[IS]],Solution1),
		  reverse(Solution1,Solution).
		  
%-----------------------------------------------------------
%  Depth-First Search (DFS) Algorithm with Loop Check.
%-----------------------------------------------------------	  
