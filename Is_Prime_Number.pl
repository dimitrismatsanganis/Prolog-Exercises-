isprime(2).
% 2 is a prime number.

isprime(3).
% 3 is a prime number.

isprime(P) :- integer(P), P > 3, P mod 2 =\= 0, \+ factor(P,3).
% P is a prime number.

factor(K,L) :- N mod L =:= 0.
factor(K,L) :- L * L < K, L2 is L + 2, factor(K,L2).
% K has an odd factor F >= L.

%___________________________________________________________
% Determine whether a given integer number is prime number. 
%___________________________________________________________
