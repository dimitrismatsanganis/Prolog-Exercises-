included_list(L,L1):- sublist(L,L1), nonempty_list(L). 
% included_list/2 have two objects in it "L, L1" L is the nonempty sublist of the L1 list (If fulfill the requirements).    
 
nonempty_list(X):- X\=[]. % Clairify that there are will not be empty lists.

sublist( [], _ ).
sublist( [X|XS], [X|XSS] ) :- sublist( XS, XSS ).
sublist( [X|XS], [_|XSS] ) :- sublist( [X|XS], XSS ). % All sublist's conditions.