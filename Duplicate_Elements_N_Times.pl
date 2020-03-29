duplicate(L1,N,L2) :- duplicate(L1,N,L2,N).
% duplicate/3's, L2 is obtained from L1 by duplicating all elements N times.
% duplicate/4's, L2 is obtained from L1 by duplicating its leading element K times, all other elements N times.

duplicate([],_,[],_).
duplicate([_|Xs],N,Ys,0) :- duplicate(Xs,N,Ys,N).
duplicate([X|Xs],N,[X|Ys],K) :- K > 0, K1 is K - 1, duplicate([X|Xs],N,Ys,K1).

%----------------------------------------------------------
% Note the difference between duplicate/3 and duplicate/4.
%----------------------------------------------------------
