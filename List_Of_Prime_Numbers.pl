isprime(2).
% 2 is a prime number.

isprime(3).
% 3 is a prime number.

isprime(P) :- integer(P), P > 3, P mod 2 =\= 0, \+ factor(P,3).
% P is a prime number.

factor(K,L) :- N mod L =:= 0.
factor(K,L) :- L * L < K, L2 is L + 2, factor(K,L2).
% K has an odd factor F >= L.

%__________________________________
% Imported from Is_Prime_Number.pl 
%__________________________________

primelist(A,B,L) :- A =< 2, !, p_list(2,B,L).
primelist(A,B,L) :- A1 is (A // 2) * 2 + 1, p_list(A1,B,L).
% L is the list of prime number P with A <= P <= B.

p_list(A,B,[]) :- A > B, !.
p_list(A,B,[A|L]) :- isprime(A), !,next(A,A1), p_list(A1,B,L). 
p_list(A,B,L) :-next(A,A1), p_list(A1,B,L).

next(2,3) :- !.
% If input number is 2 the next prime input is 3.

next(N,N1) :- N1 is N + 2.
% Next prime number.

%__________________________________________________________
% Given a range of integers by its lower and upper limit, 
% construct a list of all prime numbers in that range.
%__________________________________________________________
