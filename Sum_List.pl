sumlist([],0).
% The sum of an empty list's elements is zero.

sumlist([H|T],N) :- sumlist(T,N1), N is N1+H.
% Foreach list's head (while head exists), add the head to sum counter and continue the process for the list's tail.
