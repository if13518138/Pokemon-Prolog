%% Setup for enemies
enemy_setup(X):-
	monsta_health(X,Health),
	retract(enemy_monsta(_)),
	retract(enemy_monsta_health(_,_)),
	asserta(enemy_monsta(X)),
	asserta(enemy_monsta_health(X,Health)),!.

%% attack for enemy 
enemy_attack:-
	in_battle(0).

enemy_attack :- 
    in_battle(1),
	%% get monsta attack + affinity
	curr_monsta(OwnedMonsta),
	monsta_owned_health(OwnedMonsta, OwnedHealth),
	monsta_defense(OwnedMonsta, OwnedDefense),
	monsta_affinity_type(OwnedMonsta, OwnedAffinity),
	%% get enemies defense + affinity 
	enemy_monsta(EnemyMonsta),
	monsta_attack(EnemyMonsta,EnemyAttack),
	monsta_affinity_type(EnemyMonsta, EnemyAffinity),
	%% use the affinity_checker
	affinity_checker(EnemyAffinity, OwnedAffinity, AffinityBalance),
	%% decrease the amount of health by the attack
	Damage is round((EnemyAttack - (0.3 * OwnedDefense))* AffinityBalance),
	NewHealth is OwnedHealth - Damage,
	retract(monsta_owned_health(OwnedMonsta,OwnedHealth)),
	asserta(monsta_owned_health(OwnedMonsta,NewHealth)),
	tab(3),write('Opponent has attacked your monsta!'),nl,
	battle_checker.