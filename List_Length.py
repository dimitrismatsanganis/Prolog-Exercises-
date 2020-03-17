size([],0). 
% Empty list has zero length.

size([H|T],N) :- size(T,N1), N is N1+1.
% Foreach list's head (if exist) increase by one the length counter. 
