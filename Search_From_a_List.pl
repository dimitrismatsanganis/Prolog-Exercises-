family(person(name(alex,kapelos),date(17,may,1955),unemployed), /*A complex "person" term. Male Parent.*/
	   person(name(nantia,gotsougia),date(16,march,1953),works(puma,6350)), /*A complex "person" term. Female Parent.*/
	   [person(name(nikos,kapelos),date(21,may,1975),works(star,11000)), /*A list that contains complex terms (family's childs). 1st child.*/
	   person(name(mario,kapelos),date(21,may,1975),works(star,10000)), /*2nd child.*/
	   person(name(virginia,kapelou),date(7,april,1985),works(nissan,9000))]). /*3rd child.*/
	
family(person(name(petros,nikolaou),date(7,june,1964),unemployed), /*A complex "person" term. Male Parent.*/
	   person(name(eugenia,magoula),date(6,february,1957),unemployed), /*A complex "person" term. Female Parent.*/
	   [person(name(nikos,nikolaou),date(1,may,1985),works(alpha,11000))]). /*A list that contains complex terms (family's childs). 1st child.*/

family(person(name(thomas,markou),date(17,may,1955),works(aegean,11350)), /*A complex "person" term. Male Parent.*/
	   person(name(sofia,papadopoulou),date(16,march,1964),works(olympicair,10350)), /*A complex "person" term. Female Parent.*/
	   [person(name(xristina,markou),date(21,august,1977),works(audi,12000)), /*A list that contains complex terms (family's childs).*/
	   person(name(sokratis,markou),date(5,december,1986),unemployed)]). /*2nd child.*/

family(person(name(sotiris,koutsoukos),date(25,june,1945),works(ikea,7500)), /*A complex "person" term. Male Parent.*/
	   person(name(alexandra,harri),date(8,july,1946),unemployed), /*A complex "person" term. Female Parent.*/
	   [person(name(stelios,koutsoukos),date(16,may,1965),works(veneti,8000))]). /*A list that contains complex terms (family's childs). 1st child.*/	

family(person(name(tom,fox), date(7, may, 1950), works(bbc, 15200)),/*A complex "person" term. Male Parent.*/
       person(name(ann,fox), date(9, may, 1951), unemployed), /*A complex "person" term. Female Parent.*/
       [person(name(pat,fox), date(5, may, 1973), unemployed),/*A list that contains complex terms (family's childs). 1st child.*/
	   person(name(jim,fox), date(5, may, 1973), unemployed)]). /*2nd child.*/
	
wife(Employed_Wife):-
	family(_,person(Employed_Wife,_,works(_,_)),[_|_]).	/*A complex argument, which prints the employed wives.*/

exists(Unemployed_Parent):-
	family(person(Unemployed_Parent,date(_,_,Year),unemployed),_,[_|_]), /*A complex argument, which prints the unemployed men, who born before the 1963.*/
	Year < 1963.
		
exists(Unemployed_Parent):-
	family(_,person(Unemployed_Parent,date(_,_,Year),unemployed),[_|_]), /*A complex argument, which prints the unemployed women, who born before the 1963.*/
	Year < 1963.