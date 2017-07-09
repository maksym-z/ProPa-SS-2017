final(q5).
final(q6).

transition(s,a,q1).
transition(s,c,q1).
transition(s,b,q3).

transition(q1,a,q1).
transition(q1,b,q2).

transition(q2,a,q6).

transition(q3,a,q3).
transition(q3,c,q4).

transition(q4,a,q3).
transition(q4,b,q5).

transition(q5,c,q6).

transition(q6,b,q5).

% After Task 6.4.4
transition(q4,b,q6).

empty([], true).
fsmstep(CurrentState,LIST):-  empty(LIST,true), trace, final(CurrentState).
fsmstep(CurrentState,[HEAD|TAIL]):- transition(CurrentState,HEAD,NewState), fsmstep(NewState,TAIL).
fsmsim(S, LIST):- fsmstep(S,LIST).