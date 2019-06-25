% Expert system should be started from here
main :-
  intro,
  reset_answers,
  find_language(Language),
  describe(Language), nl.


intro :-
  write('Which programming language should I learn first?'), nl,
  write('To answer, input the number shown next to each answer, followed by a dot (.)'), nl, nl.


find_language(Language) :-
  language(Language), !.


% Store user answers to be able to track his progress
:- dynamic(progress/2).


% Clear stored user progress
% reset_answers must always return true; because retract can return either true
% or false, we fail the first and succeed with the second.
reset_answers :-
  retract(progress(_, _)),
  fail.
reset_answers.
