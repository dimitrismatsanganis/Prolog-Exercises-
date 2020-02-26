common_lists([H | _], [H | _]).
common_lists([H | _], [_ | T]) :- member(H, T). 
common_lists([_ | T], [H | _]) :- member(H, T). 
common_lists([_ | T1], [_ | T2]) :- common_lists(T1, T2).
