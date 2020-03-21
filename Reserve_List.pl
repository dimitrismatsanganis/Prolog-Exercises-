reverse(List, Reversed) :-
          reverse(List, [], Reversed).
% Initialize another rule with 3 objects.
reverse([], Reversed, Reversed).
% An empty list is already reversed.
reverse([Head|Tail], SoFar, Reversed) :-
          reverse(Tail, [Head|SoFar], Reversed).
% Every time "put" the list's head to another list (SoFar list) and continue the process without the list's head until the list become empty.         
