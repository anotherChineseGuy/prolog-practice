my_reverse(Prev, Rev) :- my_reverse(Prev, [], Rev).

my_reverse([], Rev, Rev).     
my_reverse([H|T], Prev, Rev) :- my_reverse(T, [H|Prev], Rev).



my_length(L, Len):- my_length(L,0,Len).
my_length([], Length, Length).
my_length([_|L], N, Length) :-
        N1 is N+1,
        my_length(L, N1, Length).


my_member(X, [Y|T]) :- X = Y; member(X, T).


my_subset(X,[H1|T],[H2|Y]):-
    call(X,H1), my_member(H1,[H2|Y]), my_subset(X,T,Y)
    ;
    my_subset(X,T,[H2|Y]).
my_subset(_,[],[]).



my_intersection( [], _, []).
my_intersection([H|L1tail], L2, L3) :-
        my_member(H, L2),
        L3 = [H|L3tail],
    	!,
        my_intersection(L1tail, L2, L3tail)
    	;
    	my_intersection(L1tail,L2,L3).

compute-change(0,Q,Q,D,D,N,N,P,P). 
compute-change(M,Q,D,N,P):- compute-change(M,0,Q,0,D,0,N,0,P).
compute-change(M,TQ,Q,TD,D,TN,N,TP,P):-
    (   
    M >= 25 ->  NewM is M -25, NewQ is TQ +1, compute-change(NewM,NewQ,Q,TD,D,TN,N,TP,P)
    ;  
    M >= 10 ->  NewM is M -10, NewD is TD +1, compute-change(NewM,TQ,Q,NewD,D,TN,N,TP,P)
    ;   
    M >= 5 ->  NewM is M -5, NewN is TN +1, compute-change(NewM,TQ,Q,TD,D,NewN,N,TP,P)
    ;   
    M >= 1 ->  NewM is M -1, NewP is TP +1, compute-change(NewM,TQ,Q,TD,D,TN,N,NewP,P)
    ).


my_compose([H1|L1], [H2|L2], [H1,H2|L3]) :- my_compose(L1, L2, L3).
my_compose([], L2, L2).
my_compose(L1, [], L1).



palindrome(L,R):- my_reverse(L,RevL), palindrome(L,R,RevL).
palindrome([],R,R).
palindrome([H|L],[H|R],RevL):- palindrome(L,R,RevL).
