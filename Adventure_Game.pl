:- dynamic here/1.
:- dynamic hand/2.
here(car).
hand(soda,no).
hand(newspaper,no).

thing(soda,gas_station,'2$').
thing(newspaper,gas_station,'1$').

path(car,car_door,outside_car).
path(outside_car,street,outside_gas_station).
path(outside_gas_station,gas_station_door,gas_station).
path(gas_station,gas_station_door,outside_gas_station).
path(outside_gas_station,street,outside_car).
path(outside_car,car_door,car).

start:- write('You are inside the car, your goal is to buy a soda and the newspaper and return to the car.'),nl,
	retract(here(_)),
	asserta(here(car)),
	help.

help:- write('Available commands are:'), nl,
       write('start.                   -- to start the game.'), nl,
       write('goto(Place). 	       -- to go to that place.'), nl,
       write('open(Door).              -- to open a door.'), nl,
       write('take(Thing).             -- to buy a thing.'), nl,
       write('look.                    -- to look around you.'), nl,
       write('help.                    -- to see this message again.'), nl,
       write('halt.                    -- to end the game and quit.'), nl,
       nl.

finish :- write('The game is over. Please enter the ''halt.'' command.'), nl.

open(Door):- can_open(Door),
	     open_door(Door).

can_open(Door):- here(X),
		 path(X,Door,_).
can_open(_):- write('You can''t open this door from here.'), nl, !, fail.
	
open_door(car_door):- hand(soda,yes),
		      hand(newspaper,yes),
		      here(X),
		      path(X,car_door,car),
		      retract(here(_)),
	      	      asserta(here(car)),	
		      write('You returned to the car with soda and newspaper successfully.'), nl,
		      finish.
open_door(car_door):- here(X),
		      path(X,car_door,car),
		      retract(here(_)),
	      	      asserta(here(car)),	
		      write('You returned to the car but you forgot something.'), nl.
open_door(Door):- here(X),
		  path(X,Door,Y),
		  retract(here(_)),
	      	  asserta(here(Y)),
	     	  write('You opened the '), 
	      	  write(Door), nl,
		  write('You are in the '),
                  write(Y), nl.


goto(Place):- can_go(Place),
	      move(Place).

can_go(Place):- here(X),
		path(X,street,Place).
can_go(_):- write('You can''t get there from here, try opening a door first.'), nl, !, fail.
move(Place):- retract(here(_)),
	      asserta(here(Place)),
	      write('You crossed the street and you are '), 
	      write(Place), nl.


take(Thing):- can_take(Thing),
	      buy(Thing).

can_take(Thing):- here(X),
		  thing(Thing,X,_).
can_take(_):- write('You can''t take this thing from here, try going to the gas station.'), nl, !,fail.
buy(Thing):- here(X),
	     thing(Thing,X,Y),
	     retract(hand(Thing,_)),
	     asserta(hand(Thing,yes)),
	     write('You bought '), 
	     write(Thing),
	     write(' for '),
	     write(Y).

look:- here(X),
       path(X,Door,_),
       Door\==street,
       write('You can open('),
       write(Door),
       write(')'), nl,
       here(X),
       path(X,street,Y),
       write('You can goto('), 
       write(Y),
       write(')'), nl.