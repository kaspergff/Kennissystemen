main :- intro, reset_answers, find_beer(Bier),describe(Bier).
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
colour/1.
clarity/1.
bitterness/1.
region/1.
season/1.

bier(heineken_pils) :-
    alcohol(medium),
    colour(light),
    clarity(little_turbid),
    bitterness(low),
    season(none),
    region(holland).

bier(grolsch_herfstbok):-
    alcohol(medium),
    colour(dark),
    clarity(lots_turbid),
    bitterness(medium),
    season(autumn),
    region(holland).

bier(grolsch_lentebok):-
    alcohol(medium),
    colour(dark),
    clarity(lots_turbid),
    bitterness(medium),
    season(spring),
    region(holland).

bier(guinnes_ale):-
    alcohol(medium),
    colour(dark),
    clarity(lots_turbid),
    bitterness(low),
    season(none),
    region(ireland).

bier(de_klok):-
    alcohol(medium),
    colour(light),
    clarity(little_turbid),
    bitterness(low),
    season(none),
    region(holland).

bier(duvel):-
    alcohol(high),
    colour(medium),
    clarity(little_turbid),
    bitterness(low),
    season(none),
    region(belgium).

bier(lindemans_kriek) :-
    alcohol(low),
    colour(red),
    clarity(lots_turbid),
    bitterness(low),
    season(none),
    region(belgium).

bier(neude_wit) :-
    alcohol(medium),
    colour(light),
    clarity(medium_turbid),
    bitterness(low),
    season(none),
    region(holland).

bier(kwak) :-
    alcohol(high),
    colour(light),
    clarity(little_turbid),
    bitterness(low),
    season(none),
    region(belgium).

bier(amster_radler) :-
    alcohol(low),
    colour(light),
    clarity(little_turbid),
    bitterness(low),
    season(summer),
    region(holland).

bier(grolsch_kanon) :-
    alcohol(high),
    colour(medium),
    clarity(medium_turbid),
    bitterness(medium),
    season(none),
    region(holland).

bier(hertog_jan_weizener) :-
    alcohol(medium),
    colour(light),
    clarity(medium_turbid),
    bitterness(high),
    season(summer),
    region(holland).

%questions
question(alcohol):- write('How much alcohol do you want?'),nl.%done
question(colour):- write('What colour would you like your beer to have?'),nl.%done
question(clarity):- write('Would you like a turbid beer?'),nl.%done
question(bitterness):- write('would you like a bitter beer?'),nl.%done
question(season):- write('for which season would you like an appropriate beer?'),nl.%done
question(region) :- write('from which region would you like a beer?'),nl.%done
%answers
answer(low):- write('low').
answer(medium):-write('medium').
answer(high):- write('high').
answer(red):- write('red').
answer(light) :- write('light').
answer(dark) :- write('dark').
answer(little_turbid) :- write('little turbid').
answer(medium_turbid) :- write('medium turbid').
answer(lots_turbid) :- write('high turbid').
answer(summer):- write('summer').
answer(autumn):- write('autumn').
answer(spring):- write('spring').
answer(winter):- write('winter').
answer(none):- write('none').
answer(holland):- write('Holland').
answer(belgium):- write('Belgium').
answer(ireland):- write('Ireland').

%REGION ANSWERS MOETEN GAAN BESTAAN UIT DE BESCHIKBARE MOGELIJKHEDEN!!!!! ANDERS GAAT DE INFERENCE NIET LOSSTAAN VAN DE KB!!!!
% Assigns an answer to questions from the knowledge base
alcohol(Answer) :-
  progress(alcohol, Answer).
alcohol(Answer) :-
  \+ progress(alcohol, _),
  ask(alcohol, Answer, [low,medium,high]).

colour(Answer) :-
  progress(colour,Answer).
colour(Answer) :-
    \+ progress(colour, _),
  ask(colour, Answer, [light,medium,red,dark]).

clarity(Answer) :-
  progress(clarity, Answer).
clarity(Answer) :-
  \+ progress(clarity, _),
  ask(clarity, Answer, [little_turbid,medium_turbid,lots_turbid]).

bitterness(Answer):-
  progress(bitterness,Answer).
bitterness(Answer) :- 
 \+ progress(bitterness, _),
  ask(bitterness, Answer, [low,medium,high]).

season(Answer) :-
  progress(season,Answer).
season(Answer) :-
\+ progress(season, _),
  ask(season, Answer, [winter,spring,summer,autumn,none]).

region(Answer) :-
  progress(region,Answer).
region(Answer) :-
\+ progress(region, _),
  ask(region, Answer, [holland,belgium,ireland]).

  % [First|Rest] is the Choices list, Index is the index of First in Choices
answers([], _).
answers([First|Rest], Index) :-
  write(Index), write(' '), answer(First), nl,
  NextIndex is Index + 1,
  answers(Rest, NextIndex).
%descriptions
describe(heineken_pils):- write('heineken pils').
describe(grolsch_herfstbok):- write('grolsch herfstbok').
describe(grolsch_lentebok):- write('grolsch lentebok').
describe(grolsch_kanon):- write('grolsch kanon').
describe(guinnes_ale):- write('guinnes ale').
describe(de_klok):- write('de klok bier').
describe(duvel):- write('duvel').
describe(lindemans_kriek):- write('lindemans kriek').
describe(neude_wit):- write('neude wit').
describe(kwak):- write('kwak').
describe(amster_radler):- write('amstel radler').
describe(hertog_jan_weizener):- write('hertog jan weizener').

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