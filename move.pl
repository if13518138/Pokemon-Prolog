/*** MOVE - move procedure ***/
/* Moving up */
w :-
    checkStart(0),
    write('You have not started the game.'), !.

w :- letak_player(_,Y),
	edge(_,[_,YMax]),
	Y =:= YMax,
   	write('You cannot go there!'), nl, !.

w :- letak_player(X,Y),
    Ynew is Y + 1,
    terrain(river,X,Ynew),
    write('You cannot go there!'), nl, !.

w :- letak_player(X,Y),
    Ynew is Y + 1,
    terrain(block,X,Ynew),
    write('You cannot go there!'), nl, !.

w :- letak_player(X,Y),
    retract(letak_player(X,Y)),
    Ynew is Y + 1,
    asserta(letak_player(X,Ynew)),
    write('Player berbelok ke atas'),nl,
    map,
    !.

/* Moving down */
s :-
    checkStart(0),
    write('You have not started the game.'), !.

s :- letak_player(_,Y),
	edge(_,[YMin,_]),
	Y =:= YMin,
    write('You cannot go there!'), nl, !.

s :- letak_player(X,Y),
    Ynew is Y - 1,
    terrain(river,X,Ynew),
    write('You cannot go there!'), nl, !.

s :- letak_player(X,Y),
    Ynew is Y - 1,
    terrain(block,X,Ynew),
    write('You cannot go there!'), nl, !.

s :- letak_player(X,Y),
    retract(letak_player(X,Y)),
    Ynew is Y - 1,
    asserta(letak_player(X,Ynew)), 
    write('Player berbelok ke bawah'),nl,
    map, 
    !.

/* Moving right */
d :-
    checkStart(0),
    write('You have not started the game.'), !.

d :- letak_player(X,_),
	edge([_,XMax],_),
	X =:= XMax,
    write('You cannot go there!'), nl, !.

d :- letak_player(X,Y),
    Xnew is X + 1,
    terrain(river,Xnew,Y),
    write('You cannot go there!'), nl, !.

d :- letak_player(X,Y),
    Xnew is X + 1,
    terrain(block,Xnew,Y),
    write('You cannot go there!'), nl, !.


d :- letak_player(X,Y),
    retract(letak_player(X,Y)),
    Xnew is X + 1,
    asserta(letak_player(Xnew,Y)), 
    write('Player berbelok ke kanan'),nl,
    map, 
    !.

/* Moving left */
a :-
    checkStart(0),
    write('You have not started the game.'), !.

a :- letak_player(X,_),
	edge([XMin,_],_),
	X =:= XMin,
    write('You cannot go there!'), nl, !.

a :- letak_player(X,Y),
    Xnew is X - 1,
    terrain(river,Xnew,Y),
    write('You cannot go there!'), nl, !.

a :- letak_player(X,Y),
    Xnew is X - 1,
    terrain(block,Xnew,Y),
    write('You cannot go there!'), nl, !.

a :- letak_player(X,Y),
    retract(letak_player(X,Y)),
    Xnew is X - 1,
    asserta(letak_player(Xnew,Y)), 
    write('Player berbelok ke kiri'),nl,
    map, 
    !.
	