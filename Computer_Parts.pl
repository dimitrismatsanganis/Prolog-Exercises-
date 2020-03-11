%Facts_database
computer(
    object(screen, glass), %screen
    [
      object(hdmiCable, plastic),
      object(powerCable, plastic)
    ]
).
computer(
  object(mouse, plastic), %mouse
  [
    object(connectionCable, plastic)
  ]
).
computer(
  object(keyboard, plastic), %keyboard
  [
    object(connectionCable, plastic)
  ]
).
computer(
  object(tower, iron), %tower
  [
    object(graphicsCard, iron),
    object(motherboard, iron),
    object(cpu, iron),
    object(hardDrive, iron),
    object(memoryRam, iron),
    object(fan, iron),
    object(powerCable, plastic)
  ]
).
computer(
  object(speakers, plastic), %speakers
  [
    object(connectionCable, plastic),
    object(powerCable, plastic)
  ]
).
computer(
  object(microphone, iron), %microphone
  [
    object(connectionCable, plastic)
  ]
).
computer(
  object(camera, plastic), %camera
  [
    object(connectionCable, plastic)
  ]
).
computer(
  object(powerSupply, iron), %powerSupply 
  [
    object(fan, iron),
    object(powerCable, plastic),
    object(connectionCable, plastic)
  ]
).
%End_of_facts_database

composition(Name):-					 %composition/1 rule.
  computer(object(Name,_),Y),		 %gets Y variable.
  writeObjectsList(Y);				 %Write the list of objects of the selected parts.         
  Name = 'computer',			     %Initialize name equals to computer.		
  computer(object(X,_),_),			 %gets X variable.
  write(X);							 %Write the parts of the selected part.	
  write('There are not more parts'). %No more or none parts. 
  
writeObjects(object(Name,_)):-
  write(Name).

writeObjectsList([H|T]):-   %writeObjectsList/1 rule.
  writeObjects(H),          %first for Head.
  nl,
  writeObjectsList(T).		%then recall itself for Tail.

materialOf(Name):-                         %materialOf/1 rule.
	(
		computer(object(Name,Type),_),	   %write the type of the matching
		write(Type)						   %name from the facts' database 
	);
	(
		computer(_,Y),                     %checks the whole list
		nameOf(Name,Y)					   %with the typeOf/2 rule	
	);
	write('There is not such an object').  %error message appears

nameOf(GivenName,[object(Name, Type)|T]):- %Checks the name the object.
	(
		GivenName = Name,		%GivenName variable equals to Name.
		write(Type)				%writes matching type 
	);
	nameOf(GivenName,T). 		%and then recall itself in order to check the tail.

madeFrom(Type):-  						%madeFrom/1 rule.
	(
		computer(object(Name,Type),_),	%write the name of the matching
		write(Name)						%type from the facts' database 
	);
	(
		computer(_,X),					%checks the whole list
		typeOf(Type,X)					%with the typeOf/2 rule
	).

typeOf(GivenType,[(object(Name,Type)|T)]):- %Checks the type of the object.
	(
		GivenType=Type,	   %GivenType variable equals to Type.
		write(Name)  	   %writes matching name 
	);
	typeOf(GivenType,T).   %and then recall itself in order to check the tail.
