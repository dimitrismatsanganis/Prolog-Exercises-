remove(X,[X|Xs],1,Xs).
% The first element in the list is number 1. 

remove(X,[Y|Xs],N,[Y|Ys]) :- N > 1, 
                             N1 is N - 1, remove(X,Xs,N1,Ys). 
                             
% Explanation of the rule remove/4;
% X is the Nth element of the list L.
% R is the list that remains when the Nth element is removed from L.


randomly_select(_,0,[]).
% If the list contains only one element the select this one.

randomly_select(Xs,N,[X|Zs]) :- N > 0,
    length(Xs,L),
    I is random(L) + 1,
    remove(X,Xs,I,Ys),
    N1 is N - 1,
    randomly_select(Ys,N1,Zs).
    
% Explanation of the rule randomly_select/3;
% R is a list which contains N randomly selected 
% items taken from the list L.
