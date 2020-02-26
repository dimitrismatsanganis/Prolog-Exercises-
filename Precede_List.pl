precede_list([X|T1],[X|T2]):-pre_list(T1,T2).
pre_list([],_).
pre_list([X|T1],[X|T2]):-pre_list(T1,T2).







