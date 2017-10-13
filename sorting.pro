construct(T) :- construct([exam(geometria,23),
							exam(fondamenti_inf_1,29),
							exam(calc_delle_prob,21),
							exam(analisi_mat_1,25),
							exam(fisica,26),
							exam(calc_elettronici,26),
							exam(analisi_mat_2,24),
							exam(controlli_autom,29),
							exam(teoria_dei_sitemi,24),
							exam(reti_di_calcolatori,25),
							exam(fondamenti_inf_2,24),
							exam(sistemi_operativi,28),
							exam(basi_di_dati,25),
							exam(telecomunicazioni,20),
							exam(ricerca_operativa,22),
							exam(contr_gest_reti,28),
							exam(complementi_fisica,19)],T).
	
add(X,nil,t(X,nil,nil)).
add(exam(Z,X),t(exam(V,Root),L,R),t(exam(V,Root),L1,R)) :- X =< Root, add(exam(Z,X),L,L1).
add(exam(Z,X),t(exam(V,Root),L,R),t(exam(V,Root),L,R1)) :- X > Root, add(exam(Z,X),R,R1).

construct(L,T) :- construct(L,T,nil).

construct([],T,T).
construct([N|Ns],T,T0) :- add(N,T0,T1), construct(Ns,T,T1).

append1([], Ys, Ys).
append1([X|Xs], Ys, [X|Zs]) :- append1(Xs, Ys, Zs).

findExamsInRange(L, A, B, N) :- construct(T), findExamsInRange(T, L, A, B, N),!.

findExamsInRange(nil, [], _, _, 0).
findExamsInRange(t(exam(Z,X), Left, Right), CompleteList, A, B, N):-
	X >= A, X =< B,
	findExamsInRange(Left, LeftList, A, B, N1),
	findExamsInRange(Right, RightList, A, B, N2),
	N is N1 + N2 + 2,
	append1([exam(Z,X)|LeftList], RightList, CompleteList).
findExamsInRange(t(exam(_,X), _, Right), CompleteList, A, B, N):-
	X < A,
	findExamsInRange(Right, RightList, A, B, N1),
	N is N1 + 1,
	append1([],RightList, CompleteList).
findExamsInRange(t(exam(_,X), Left, _), CompleteList, A, B, N):-
	X > B,
	findExamsInRange(Left, LeftList, A, B, N1),
	N is N1 + 1,
	append1(LeftList, [], CompleteList).


	
	
add1(X,List,[X|List]). 
	
listrange(L, A, B, N) :- listrange([exam(geometria,23),
							exam(fondamenti_inf_1,29),
							exam(calc_delle_prob,21),
							exam(analisi_mat_1,25),
							exam(fisica,26),
							exam(calc_elettronici,26),
							exam(analisi_mat_2,24),
							exam(controlli_autom,29),
							exam(teoria_dei_sitemi,24),
							exam(reti_di_calcolatori,25),
							exam(fondamenti_inf_2,24),
							exam(sistemi_operativi,28),
							exam(basi_di_dati,25),
							exam(telecomunicazioni,20),
							exam(ricerca_operativa,22),
							exam(contr_gest_reti,28),
							exam(complementi_fisica,19)], L, A, B, N),!.

listrange([], [], _, _, 0).
listrange([exam(Z,X)|Xs], L, A, B, N) :-
	X >= A, X =< B,
	listrange(Xs, Y, A, B, N1),
	N is N1 + 2,
	add1(exam(Z,X),Y,L).
listrange([exam(_,X)|Xs], L, A, B, N) :-
	X < A,
	listrange(Xs, L, A, B, N1),
	N is N1 + 1.
listrange([exam(_,X)|Xs], L, A, B, N) :-
	X > B,
	listrange(Xs, L, A, B, N1),
	N is N1 + 1.






