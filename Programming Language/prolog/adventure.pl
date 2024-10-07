% Descriptions of the places in the game. valley, path, cliff, fork, maze, mountaintop, cave, lake, forest.
description(valley, 'You are in a pleasant valley, with a trail ahead.').
description(path, 'You are on a path, with ravines on both sides.').
description(cliff, 'You are teetering on the edge of a cliff.').
description(fork, 'You are at a fork in the path.').
description(maze(_), 'You are in a maze of twisty trails, all alike.').
description(mountaintop, 'You are on the mountaintop.').
description(cave, "You're in a dark cave. You can't see anything.").
description(lake, "You are at the edge of a lake with a treasure chest.").
desciption(forest, "You are in the ancient forest. The trees are tall and the air is thick.").

% Prints the description of the players current location.
report :-
  at(you, X),
  description(X, Y),
  write(Y), nl.

% Connections between locations. 
connect(valley, forward, path).
connect(path, right, cliff).
connect(path, left, cliff).
connect(path, forward, fork).
connect(fork, left, maze(0)).
connect(fork, right, mountaintop).
connect(maze(0), left, maze(1)).
connect(maze(0), right, maze(3)).
connect(maze(1), left, maze(0)).
connect(maze(1), right, maze(2)).
connect(maze(2), left, cave).
connect(maze(2), right, maze(0)).
connect(maze(3), left, maze(0)).
connect(maze(3), right, maze(3)).
connect(cave, left, lake).
connect(cave, right, forest).

% Move the player in a direction.
move(Dir) :-
  at(you, Loc),
  connect(Loc, Dir, Next),
  retract(at(you, Loc)),
  assert(at(you, Next)),
  report,
  !.

% If the move is illegal.
move(_) :-
  write('That is not a legal move.\n'),
  report.


% Shorthand commands movements.
forward :- move(forward).
left :- move(left).
right :- move(right).

% monsters - ogre, unicorn
% If the player and the ogre are at the same place, the player dies.
ogre :-
  at(ogre, Loc),
  at(you, Loc),
  write('An ogre sucks your brain out through\n'),
  write('your eyesockets, and you die.\n'),
  retract(at(you, Loc)),
  assert(at(you, done)),
  !.

% If the player and the ogre are not in the same place, nothing happens.
ogre.

unicorn :-
    at(witch, Loc),
    at(you, Loc),
    write('Unicorn stabbed you with its horn.\n'),
    write('You died alone.\n'),
    retract(at(you, Loc)),
    assert(at(you, done)),
    !.

unicorn.


% If the player and the treasure are at the same place, the player wins.
treasure :-
  at(treasure, Loc),
  at(you, Loc),
  write('There is a treasure here.\n'),
  write('Congratulations, you win!\n'),
  retract(at(you, Loc)),
  assert(at(you, done)),
  !.

treasureChest :-
  at(treasure, Loc),
  at(you, Loc),
  write('There is a treasure chest here.\n'),
  write('Congratulations, you win!\n'),
  retract(at(you, Loc)),
  assert(at(you, done)),
  !.

% If the player and the treasure are not in the same place, nothing happens.
treasure.


% If the player is at the cliff, they fall off.
cliff :-
  at(you, cliff),
  write('You fall off and die.\n'),
  retract(at(you, cliff)),
  assert(at(you, done)),
  !.

% If the player is not at the cliff, nothing happens.
cliff.


% The main loop stops if the player won or lost.
main :-
  at(you, done),
  write('Thanks for playing.\n'), !.

main :-
  write('\nNext move -- '),
  read(Move),
  call(Move),
  cliff,      % Check if the player falls off the cliff (this is now checked first)
  ogre,       % Check if the player encounters the ogre
  treasure,   % Check if the player finds the treasure
  main.

% Start the game by initializing the players location, the ogres location, and the treasures location.
go :-
  retractall(at(_,_)),  % Clean up from previous runs.
  assert(at(you, valley)),
  assert(at(ogre, maze(3))),
  assert(at(treasureChest, lake)),
  assert(at(unicorn, forest)),
  assert(at(treasure, mountaintop)),
  write('This is an adventure game.\n'),
  write('Legal moves are left, right, or forward.\n'),
  write('End each move with a period.\n\n'),
  report,
  main.
