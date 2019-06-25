main :- intro, reset_answers, find_beer(Bier),describe_beer(Bier).

intro :-
  write('welcome to the beer suggestion program'), nl,
  write('To answer, input the number shown next to each answer, followed by a dot (.)'), nl, nl.

reset_answers :-
  retract(progress(_, _)),
  fail.
reset_answers.

find_beer(Bier) :-
  bier(Bier), !.

  :- dynamic(progress/2).

%Bierelier....
alcohol/1.

bier(heineken_pilsje) :-
    alcohol(low).

bier(guinnes_ale):-
    alcohol(4.2).

bier(kwak) :-
    alcohol(8.4).

bier(amster_radler) :-
    alcohol(2).

%questions
question(alcohol):- write('How much alcohol do you want?'),nl.
%answers
answer(low):- write('low').
answer(medium):-write('medium').
answer(high):- write('high').
%desrb
describe_beer(heineken_pilsje) :-
  write('Heineken sukkels'), nl.
describe_beer(guinnes_ale) :-
  write('Guinnesssss'), nl.
describe_beer(kwak) :-
  write('Kwakkie'), nl.
describe_beer(amster_radler) :-
  write('Amsteeel'), nl.
%check sterkte



% Assigns an answer to questions from the knowledge base
alcohol(Answer) :-
  progress(alcohol, Answer).
alcohol(Answer) :-
  \+ progress(alcohol, _),
 
  ask(alcohol, Answer, [low,medium,high]).

  % [First|Rest] is the Choices list, Index is the index of First in Choices
answers([], _).
answers([First|Rest], Index) :-
  write(Index), write(' '), answer(First), nl,
  NextIndex is Index + 1,
  answers(Rest, NextIndex).


% Parses an Index and returns a Response representing the "Indexth" element in
% Choices (the [First|Rest] list)
parse(0, [First|_], First).
parse(Index, [First|Rest], Response) :-
  Index > 0,
  NextIndex is Index - 1,
  parse(NextIndex, Rest, Response).

% Asks the Question to the user and saves the Answer
ask(Question, Answer, Choices) :-
  question(Question),
  answers(Choices, 0),
  read(Index),
  parse(Index, Choices, Response),
  asserta(progress(Question, Response)),
  Response = Answer.