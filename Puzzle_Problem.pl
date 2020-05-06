%---------------------------------------------------------------------------
% The Puzzle Probles is the following:
%
% 1. There are 3 boys and 3 girls.  Each boy dances with a different girl.
%
% 2. One boy is dressed in red, one in green, one in blue.
%
% 3. One girl is dressed in red, one in green, one in blue.
%
% 4. The boy in red dances with the girl in green.
%
% 5. No boy dances with a girl who was dressed in the same color as he.
% 
% 6. Which boy danced with the girl dressed in red?
%
%       (The Solution must be presented by the following way: 
%             [[red, Girl1], [green, Girl2], [blue, Girl3]] )
%---------------------------------------------------------------------------


member(A, [A | _]).
member(A, [_ | X]) :- 
                     member(A, X).
% member(A, L) is true only when A is a member of L. 

perm([], []).
perm(L, [A | M]) :-
                   remove(A, L, R),
                   perm(R, M).
% perm(L, M) is true only when list M is a permutation of list L. 

remove(A, [A | L], L).
remove(A, [B | L], [B | M]) :-
                              remove(A, L, M).
% remove(A, L, M) is true only when A is a member of list L and M is the
% residue when A is removed from L.

solve:- nl,
        write('The boy in '),
        boyWhoDancesWithGirlInRed(X),
        write(X),
        write(' dances with the girl in red.'),
        nl,
        nl.
