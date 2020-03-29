remove(X,[X|Xs],1,Xs).

remove(X,[Y|Xs],N,[Y|Ys]) :- N > 1, 
                             N1 is N - 1, remove(X,Xs,N1,Ys). 
randomly_select(_,0,[]).

randomly_select(Xs,N,[X|Zs]) :- N > 0,
    length(Xs,L),
    I is random(L) + 1,
    remove(X,Xs,I,Ys),
    N1 is N - 1,
    randomly_select(Ys,N1,Zs).
--
