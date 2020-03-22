remove_at(X,[X|Xs],1,Xs).
% The first element in the list is number 1.

remove_at(X,[Y|Xs],N,[Y|Ys]) :- N > 1, 
                                N1 is N - 1, remove_at(X,Xs,N1,Ys). 
                                
% Explanation of the rule remove_at/4;
% X is the Nth element of the list L.
% R is the list that remains when the Nth element is removed from L.
