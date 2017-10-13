# Prolog Array Sorting
		
# Signature of methods

* findExamsInRange(L, A, B, N): Returns in L all the exams with a vote range [A,B] stored in a BST. In N writes the number of controls done.
	
* listrange(L, A, B, N): Returns in L all the exams with a vote range [A,B] stored in a list. In N writes the number of controls done.

# Examples

	exam(geometria,23),
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
	exam(complementi_fisica,19)

## BST
	
	?- findExamsInRange(L, 23, 27, N).
	
	L = [exam(geometria, 23), exam(analisi_mat_1, 25), exam(analisi_mat_2, 24), exam(teoria_dei_sitemi, 24),
	exam(fondamenti_inf_2, 24), exam(reti_di_calcolatori, 25), exam(basi_di_dati, 25), exam(fisica, 26),
	exam(calc_elettronici, 26)],
	
	N = 24.

## List
	
	?- listrange(L, 23, 27, N).
	
	L = [exam(geometria, 23), exam(analisi_mat_1, 25), exam(fisica, 26), exam(calc_elettronici, 26),
	exam(analisi_mat_2, 24), exam(teoria_dei_sitemi, 24), exam(reti_di_calcolatori, 25),
	exam(fondamenti_inf_2, 24), exam(basi_di_dati, 25)],
	
	N = 26.