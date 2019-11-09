/*****************************************/
/*Initializing an initial map condition*/
terrain(forest,1,1).
terrain(forest,2,1).
terrain(forest,3,1).
terrain(forest,4,1).
terrain(wasteland,5,1).
terrain(wasteland,6,1).
terrain(wasteland,7,1).
terrain(wasteland,8,1).
terrain(wasteland,9,1).
terrain(wasteland,10,1).
terrain(wasteland,11,1).
terrain(river,1,2).
terrain(river,2,2).
terrain(river,3,2).
terrain(grassland,4,2).
terrain(river,5,2).
terrain(wasteland,6,2).
terrain(wasteland,7,2).
terrain(desert,8,2).
terrain(desert,9,2).
terrain(desert,10,2).
terrain(wasteland,11,2).
terrain(forest,1,3).
terrain(forest,2,3).
terrain(forest,3,3).
terrain(forest,4,3).
terrain(river,5,3).
terrain(wasteland,6,3).
terrain(wasteland,7,3).
terrain(desert,8,3).
terrain(desert,9,3).
terrain(desert,10,3).
terrain(wasteland,11,3).
terrain(forest,1,4).
terrain(forest,2,4).
terrain(forest,3,4).
terrain(forest,4,4).
terrain(river,5,4).
terrain(wasteland,6,4).
terrain(block,7,4).
terrain(desert,8,4).
terrain(desert,9,4).
terrain(desert,10,4).
terrain(wasteland,11,4).
terrain(forest,1,5).
terrain(forest,2,5).
terrain(forest,3,5).
terrain(forest,4,5).
terrain(river,5,5).
terrain(wasteland,6,5).
terrain(wasteland,7,5).
terrain(wasteland,8,5).
terrain(wasteland,9,5).
terrain(wasteland,10,5).
terrain(wasteland,11,5).
terrain(forest,1,6).
terrain(forest,2,6).
terrain(forest,3,6).
terrain(forest,4,6).
terrain(river,5,6).
terrain(river,6,6).
terrain(river,7,6).
terrain(grassland,8,6).
terrain(grassland,9,6).
terrain(wasteland,10,6).
terrain(wasteland,11,6).
terrain(forest,1,7).
terrain(forest,2,7).
terrain(forest,3,7).
terrain(forest,4,7).
terrain(river,5,7).
terrain(river,6,7).
terrain(river,7,7).
terrain(grassland,8,7).
terrain(grassland,9,7).
terrain(wasteland,10,7).
terrain(wasteland,11,7).
terrain(forest,1,8).
terrain(forest,2,8).
terrain(forest,3,8).
terrain(forest,4,8).
terrain(grassland,5,8).
terrain(grassland,6,8).
terrain(gym,7,8).
terrain(grassland,8,8).
terrain(grassland,9,8).
terrain(grassland,10,8).
terrain(grassland,11,8).
terrain(mountain,1,9).
terrain(mountain,2,9).
terrain(mountain,3,9).
terrain(mountain,4,9).
terrain(river,5,9).
terrain(river,6,9).
terrain(river,7,9).
terrain(grassland,8,9).
terrain(grassland,9,9).
terrain(grassland,10,9).
terrain(grassland,11,9).
terrain(lava,1,10).
terrain(lava,2,10).
terrain(mountain,3,10).
terrain(mountain,4,10).
terrain(mountain,5,10).
terrain(mountain,6,10).
terrain(mountain,7,10).
terrain(mountain,8,10).
terrain(grassland,9,10).
terrain(home,10,10).
terrain(grassland,11,10).
terrain(lava,1,11).
terrain(lava,2,11).
terrain(lava,3,11).
terrain(mountain,4,11).
terrain(mountain,5,11).
terrain(mountain,6,11).
terrain(mountain,7,11).
terrain(mountain,8,11).
terrain(grassland,9,11).
terrain(grassland,10,11).
terrain(grassland,11,11).

/*** MAP - Printing map with radar ***/	
map :-
	checkStart(0),
    write('Permainan Belum dimulai'), !.
map :-
	edgeOffset([XMin,_],[_,YMax]),
    recPrintRadar(XMin,YMax), !.	
/********************************/
/*** MAP function dependencies***/
recPrintRadar(X,Y) :-
	edgeOffset([_,X],[Y,_]),
	printOneTile(X,Y), tab(1), !.
	
recPrintRadar(X,Y) :-
	\+edgeOffset([_,X],_),
	XPlus is X+1,
	printOneTile(X,Y), tab(1),
	recPrintRadar(XPlus,Y), !.
	
recPrintRadar(X,Y) :-
	edgeOffset([_,X],_),
	edgeOffset([XMin,_],_),
	YMin is Y-1,
	printOneTile(X,Y), tab(1),
	nl,
	recPrintRadar(XMin,YMin).	
/************************************/
/** For printing MAP **/
printOneTile(X,Y) :-    % home
    terrain(home,X,Y),
    write('H'), !.
printOneTile(X,Y) :-    % gym
    terrain(gym,X,Y),
    write('G'), !.
printOneTile(X,Y) :-    % block
    terrain(block,X,Y),
    write('O'), !.
printOneTile(X,Y) :-    % player
    letak_player(X,Y),
    write('P'), !.
printOneTile(X,Y) :-    % player
    letak_item(_,X,Y),
    write('I'), !.
printOneTile(X,Y) :-    % forest
    terrain(forest,X,Y),
    write('-'), !.
printOneTile(X,Y) :-    % wasteland
    terrain(wasteland,X,Y),
    write('-'), !.
printOneTile(X,Y) :-    % river
    terrain(river,X,Y),
    write('R'), !.
printOneTile(X,Y) :-    % grassland
    terrain(grassland,X,Y),
    write('-'), !.
printOneTile(X,Y) :-    % desert
    terrain(desert,X,Y),
    write('-'), !.
printOneTile(X,Y) :-    % mountain
    terrain(mountain,X,Y),
    write('-'), !.
printOneTile(X,Y) :-    % lava
    terrain(lava,X,Y),
    write('-'), !.
printOneTile(_,_) :-	%inaccessible
    write('X').
/***********************************/