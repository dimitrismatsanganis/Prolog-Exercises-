bfs([[State|Path]|_], [State|Path]):-  goal(State).
  
bfs([[State|Path]|RestFrontierSet], Solution):-  write('Expanding '),write(State),nl, 
	                                               expand(State,Path,ChildrenStates),
	                                               append(RestFrontierSet,ChildrenStates,NewFrontierSet),
	                                               bfs(NewFrontierSet, Solution).	
						       
expand(State,Path,Children):-  findall([Child,State|Path],
			       (operator(State,Child),not(member(Child,Path)) ),Children).

gobfs(Solution):-  initial_state(IS), 
		   bfs([[IS]],Solution1),
		   reverse(Solution1,Solution).
		   
%------------------------------------------------------------
%  Breadth-First Search (DFS) Algorithm with Loop Check.
%------------------------------------------------------------
