size([],0). 
% Empty list has zero length.

size([_|T],N) :- size(T,N1), N is N1+1.
% While list's head exists increase by one the length counter 
% and continue checking the list's tail. 
