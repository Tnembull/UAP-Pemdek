% Nama : Muhammad Nur Ashiddiqi
% NPM  : 1857051014
% Ujian Tengah Praktikum

%fact

family(
    person( tom, fox, date( 7, may, 1960), works( bbc, 15200) ),
    person( ann, fox, date( 9, may, 1961), unemployed),
    [person( pat, fox, date( 5, may, 1983), unemployed),
     person( jim, fox, date( 5, may, 1983), unemployed) ] ).
 family(
    person( henry, stern, date( 7, may, 1960), unemployed),
    person( beth, stern, date( 9, may, 1961), works( microsoft, 15200)),
    [person( joe, stern, date( 6, june, 1985), works( mcdonalds, 9000)),
    person( jeff, stern, date( 4, july, 1986), works( arbys, 10000)) ] ).
family(
    person(naruto, uzumaki, date(10, october, 1999), works(hokage, 100000)),
	person(hinata, uzumaki, date(27, december, 2000), unemployed),
	[person(boruto, uzumaki, date(27, march, 2021), unemployed),
	person(himawari, uzumaki, date(11, august, 2025), unemployed)]).



%rules
 husband( X) :-
    family( X, _, _).
 

 wife( X) :-
    family( _, X, _).
 
 child( X) :-
    family( _, _, Children),
    member( X, Children).
 
 exists( Person) :-
    husband( Person)
    ;
    wife( Person)
    ;
    child( Person).

children(Family, ChildList) :- 
    family(person(_, Family, _, _), _,  ChildList).


twins(person(X, Y, D, _), person(X, Y, D, _)).

twin_children(Child1, Child2) :-
	child(Child1),
	child(Child2),
	twins(Child1, Child2).

nth_member(1, [person(Person, _, _, _)|_], Person).
nth_member(N, [_|Tail], Person) :-
    nth_member(N1, Tail, Person), 
    N is N1 + 1.
    

nthchild(N, Family, Child) :- 
    children(Family, ChildList), 
    nth_member(N, ChildList, Child).
 
 dateofbirth( person( _, _, Date, _), Date).
 
 salary( person( _, _, _, works( _, S) ), S).
 salary( person( _, _, _, unemployed), 0).
 
 
 total( [], 0).
 
 total( [Person|List], Sum) :-
    salary( Person, S),
    total( List, Rest),
    Sum is S + Rest.
 
 final( s3).
 
 trans( s1, a, s1).
 trans( s1, a, s2).
 trans( s1, b, s1).
 trans( s2, b, s3).
 trans( s3, b, s4).
 
 silent( s2, s4).
 silent( s3, s1).
 
 accepts( State, []) :-
    final( State).
 
 accepts( State, [X|Rest]) :-
    trans( State, X, State1),
    accepts( State1, Rest).
 
 accepts( State, String) :-
    silent( State, State1),
    accepts( State1, String).
 
