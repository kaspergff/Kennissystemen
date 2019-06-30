%TO DO
% 1b.Zoek een andere manier om een beschrijving van een biertje te krijgen(kan bij describe), let er ff op dat alles in dezelfde taal moet zijn. Stannnn
% 2. Voeg rules toe!!!! zou niet weten welke maar zonder rules is het geen kennissysteem!!! keen idee
% 3. Begin met uitzoeken hoe we een enumeratie kunnen krijgen van alle brouwerijen ipv dat we die zelf handmatig moeten toevoegen aan de answers van de vraag, 
%    en hoe we ervoor kunnen zorgen dat zodra er geen voorkeur voor is de vraag overgeslagen kan worden, dus dat elk biertje ofwel none of een bepaalde brouwerij heeft.
% 4. Denk na over hoe we een functie kunnen maken om terug te gaan naar de vorige vraag als er geen bier uit een pad komt ben hier al eens mee bezig geweest in 'go_back'.
% 5. Denk na over een methode om aan het einde zodra een biertje aangeboden word de kb gegevens daarbij te krijgen (ben hiermee aan het prutsen in 'getdetails').
%    Dus: Heineken pils
%    alcohol(medium_alcohol)
%    colour(light)
%    clarity(high_transparency)
%    enz....
main :- intro, reset_answers, find_beer(Bier),outro(Bier).
intro :-
  write('welcome to the beer suggestion program'), nl,
  write('To answer, input the number shown next to each answer, followed by a dot (.).'),nl,
  write('If a certain beer cannot be found "false" will be shown in the console.'),nl,
  write('If you want to go back to the previous question write "go_back(Bier)." in the console.'),nl,
  write('This does not work once a beer has been found, please re enter "main." to start over.'),nl.

reset_answers :-
  retract(progress(_, _)),
  fail.
reset_answers.

%it is a known bug that this function cannot be used more than once in each iteration of main because the user can get stuck in a loop of questions.
%once the questions are going in another order then before you know that there is not a beer that fullfills all requirements.

go_back(Bier) :-
    retract(progress(X, _)),
    bier(Bier),
    outro(Bier).

find_beer(Bier) :-
  bier(Bier), !.
  :- dynamic(progress/2).

outro(Bier) :-
  write('Based on your answers we propose the following beer:'),nl,nl,
  describe(Bier),nl,
  write('If this beer is not really what your looking for type "go_back_(Bier)." to go back one step.'),nl,
  write('Or restart the entire process by typing "main." in the constole.').

parse(0, [H|_], H).
parse(Index, [H|T], Response) :-
  Index > 0,
  NextIndex is Index - 1,
  parse(NextIndex, T, Response).

% creates a list of possible answers
answers([], _).
answers([H|T], Index) :-
  write(Index), write(' '), answer(H), nl,
  NextIndex is Index + 1,
  answers(T, NextIndex).

% Asks the Question to the user and saves the Answer
ask(Question, Answer, Choices) :-
    nl,
  question(Question),
    nl,
  answers(Choices, 0),
  read(Index),
  parse(Index, Choices, Response),
  asserta(progress(Question, Response)),
  Response = Answer.

alcohol/1.
colour/1.
clarity/1.
bitterness/1.
region/1.
season/1.
foam/1
taste/1.
brewery/1.

bier(bavaria_radler)) :-
    alcohol(low_alcohol),
    colour(light),
    clarity(high_transparency),
    bitterness(low),
    season(summer),
    taste(refreshing),     
    brewery(bavaria_brewery),
    foam(low),
    region(holland).

bier(duvel_triple_hop) :-
    alcohol(high_alcohol),
    colour(medium),
    clarity(medium_transparency),
    bitterness(low),
    season(none),
    taste(bitter),     
    brewery(duvel_brewery),
    foam(medium),
    region(belgium).

bier(amstel_pils) :-
    alcohol(medium_alcohol),
    colour(light),
    clarity(low_transparency),
    bitterness(low),
    season(none),
    taste(bitter),     
    brewery(amstel),
    foam(low),
    region(holland).

bier(grolsch_radler) :-
    alcohol(low_alcohol),
    colour(light),
    clarity(medium_transparency),
    bitterness(low),
    season(summer),
    taste(refreshing),     
    brewery(grolsch_brewery),
    foam(low),
    region(holland).

bier(heineken_radler) :-
    alcohol(low_alcohol),
    colour(light),
    clarity(medium_transparency),
    bitterness(low),
    season(summer),
    taste(refreshing),     
    brewery(heineken_brewery),
    foam(low),
    region(holland).

bier(heineken_pils) :-
    alcohol(medium_alcohol),
    colour(light),
    clarity(high_transparency),
    bitterness(low),
    season(none),
    taste(bitter),     
    brewery(heineken_brewery),
    foam(medium),
    region(holland).

bier(heineken_pils_0) :-
    alcohol(none),
    colour(light),
    clarity(high_transparency),
    bitterness(low),
    season(none),
    taste(bitter),     
    brewery(heineken_brewery),
    foam(medium),
    region(holland).
	
bier(bavaria_pils) :-
    alcohol(medium_alcohol),
    colour(light),
    clarity(high_transparency),
    bitterness(low),
    season(none),
    taste(bitter),     
    brewery(bavaria_brewery),
    foam(medium),
    region(holland).

bier(hertog_jan_pils) :-
    alcohol(medium_alcohol),
    colour(light),
    clarity(high_transparency),
    bitterness(low),
    season(none),
    taste(bitter),     
    brewery(hertog_jan_brewery),
    foam(medium),
    region(holland).

bier(grolsch_herfstbok):-
    alcohol(medium_alcohol),
    colour(dark),
    clarity(low_transparency),
    bitterness(medium),
    season(autumn),
    taste(bitter),     
    brewery(grolsch_brewery),
    foam(low),
    region(holland).

bier(grolsch_lentebok):-
    alcohol(medium_alcohol),
    colour(dark),
    clarity(low_transparency),
    bitterness(medium),
    season(spring),
    taste(sweet),     
    brewery(grolsch_brewery),
    foam(low),
    region(holland).

bier(guinness_ale):-
    alcohol(medium_alcohol),
    colour(dark),
    clarity(low_transparency),
    bitterness(low),
    season(none),
    taste(bitter),     
    brewery(guinness_brewery),
    foam(low),
    region(ireland).

bier(de_klok_pils):-
    alcohol(medium_alcohol),
    colour(light),
    clarity(high_transparency),
    bitterness(low),
    season(none),
    taste(bitter),     
    brewery(de_klok_brewery),
    foam(medium),
    region(holland).

bier(duvel):-
    alcohol(high_alcohol),
    colour(medium),
    clarity(high_transparency),
    bitterness(low),
    season(none),
    taste(bitter),     
    brewery(duvel_brewery),
    foam(high),
    region(belgium).

bier(lindemans_kriek) :-
    alcohol(low_alcohol),
    colour(red),
    clarity(low_transparency),
    bitterness(low),
    season(none),
    taste(sweet),     
    brewery(lindemans),
    foam(low),
    region(belgium).

bier(neude_wit) :-
    alcohol(medium_alcohol),
    colour(light),
    clarity(medium_transparency),
    bitterness(low),
    season(none),
    taste(refreshing),     
    brewery(neude_bier),
    foam(medium),
    region(holland).

bier(kwak) :-
    alcohol(high_alcohol),
    colour(light),
    clarity(high_transparency),
    bitterness(low),
    season(none),
    taste(bitter),     
    brewery(bosteels),
    foam(medium),
    region(belgium).

bier(amstel_radler) :-
    alcohol(low_alcohol),
    colour(light),
    clarity(high_transparency),
    bitterness(low),
    season(summer),
    taste(refreshing),     
    brewery(amstel),
    foam(little),
    region(holland).

bier(grolsch_kanon) :-
    alcohol(high_alcohol),
    colour(medium),
    clarity(medium_transparency),
    bitterness(medium),
    season(none),
    taste(bitter),     
    brewery(grolsch_brewery),
    foam(medium),
    region(holland).

bier(hertog_jan_weizener) :-
    alcohol(medium_alcohol),
    colour(light),
    clarity(medium_transparency),
    bitterness(high),
    season(summer),
    taste(refreshing),     
    brewery(hertog_jan_brewery),
    foam(little),
    region(holland).
	
bier(achel_extra_blond) :-
    alcohol(high_alcohol),
    colour(light),
    clarity(high_transparency),
    bitterness(low),
    season(summer),
    taste(refreshing),     
    brewery(achel),
    foam(medium),
    region(belgium).
	
bier(achel_extra_bruin) :-
    alcohol(high_alcohol),
    colour(dark),
    clarity(low_transparency),
    bitterness(high),
    season(none),
    taste(bitter),     
    brewery(achel),
    foam(high),
    region(belgium).

bier(adnams_old_ale) :-
    alcohol(medium_alcohol),
    colour(dark),
    clarity(medium_transparency),
    bitterness(medium),
    season(winter),
    taste(bitter),
    brewery(adnams),
    foam(medium),
    region(england).

bier(schutzenberger_bieres_de_noel) :-
    alcohol(high_alcohol),
    colour(dark),
    clarity(high_transparency),
    bitterness(high),
    season(winter),
    taste(sweet),
    brewery(schutzenberger),
    foam(little),
    region(france).

bier(anchor_porter) :-
    alcohol(medium_alcohol),
    colour(dark),
    clarity(medium_transparency),
    bitterness(low),
    season(winter),
    taste(sweet),     
    brewery(anchor),
    foam(medium),
    region(england).

bier(straffe_hendrik_quadrupel) :-
    alcohol(high_alcohol),
    colour(dark),
    clarity(low_transparency),
    bitterness(high),
    season(none),
    taste(bitter),     
    brewery(straffe_hendrik),
    foam(high),
    region(belgium).

bier(speciale_palm) :-
    alcohol(medium_alcohol),
    colour(red),
    clarity(high_transparency),
    bitterness(medium),
    season(none),
    taste(fruity),     
    brewery(palm),
    foam(medium),
    region(belgium).

bier(desperados) :-
    alcohol(medium_alcohol),
    colour(light),
    clarity(high_transparency),
    bitterness(low),
    season(summer),
    taste(refreshing),     
    brewery(heineken_brewery),
    foam(little),
    region(mexico).

bier(corona) :-
    alcohol(medium_alcohol),
    colour(light),
    clarity(high_transparency),
    bitterness(low),
    season(summer),
    taste(refreshing),     
    brewery(corona),
    foam(little),
    region(mexico).

bier(boon_geuze) :-
    alcohol(high_alcohol),
    colour(red),
    clarity(high_transparency),
    bitterness(medium),
    season(none),
    taste(sweet),     
    brewery(boon),
    foam(medium),
    region(belgium).

bier(vedett_extra_white) :-
    alcohol(medium_alcohol),
    colour(light),
    clarity(high_transparency),
    bitterness(low),
    season(summer),
    taste(refreshing),     
    brewery(vedett),
    foam(medium),
    region(belgium).

bier(kasteel_donker) :-
    alcohol(high_alcohol),
    colour(dark),
    clarity(high_transparency),
    bitterness(high),
    season(none),
    taste(bitter),     
    brewery(kasteel),
    foam(high),
    region(belgium).

bier(chimay_blauw) :-
    alcohol(high_alcohol),
    colour(dark),
    clarity(low_transparency),
    bitterness(medium),
    season(none),
    taste(bitter),     
    brewery(chimay),
    foam(medium),
    region(belgium).

bier(chimay_tripel_wit) :-
    alcohol(high_alcohol),
    colour(light),
    clarity(high_transparency),
    bitterness(low),
    season(none),
    taste(bitter),     
    brewery(chimay),
    foam(medium),
    region(belgium).

bier(ij_natte) :-
    alcohol(medium_alcohol),
    colour(medium),
    clarity(medium_transparency),
    bitterness(medium),
    season(none),
    taste(bitter),     
    brewery(brouwerij_t_IJ),
    foam(medium),
    region(belgium).

bier(hertog_jan_lentebock) :-
    alcohol(medium_alcohol),
    colour(medium),
    clarity(low_transparency),
    bitterness(medium),
    season(spring),
    taste(refreshing),     
    brewery(hertog_jan_brewery),
    foam(low),
    region(holland).

bier(bax_rokkenjager) :-
    alcohol(high_alcohol),
    colour(dark),
    clarity(medium_transparency),
    bitterness(medium),
    season(spring),
    taste(sweet),     
    brewery(bax),
    foam(medium),
    region(holland).

bier(gulpener_ijsbock) :-
    alcohol(high_alcohol),
    colour(medium),
    clarity(medium_transparency),
    bitterness(low),
    season(winter),
    taste(bitter),     
    brewery(gulpener),
    foam(medium),
    region(holland).

bier(brewdog_dead_pony_club) :-
    alcohol(low_alcohol),
    colour(medium),
    clarity(high_transparency),
    bitterness(medium),
    season(none),
    taste(fruity),     
    brewery(brewdog),
    foam(medium),
    region(california).

bier(brand_session_india_pale_ale) :-
    alcohol(low_alcohol),
    colour(medium),
    clarity(medium_transparency),
    bitterness(low),
    season(none),
    taste(fruity),     
    brewery(brand),
    foam(low),
    region(california).

bier(punk_ipa_pale_ale) :-
    alcohol(medium_alcohol),
    colour(medium),
    clarity(high_transparency),
    bitterness(medium),
    season(none),
    taste(fruity),     
    brewery(brewdog),
    foam(low),
    region(california).

bier(guinness_stout_original) :-
    alcohol(medium_alcohol),
    colour(dark),
    clarity(medium_transparency),
    bitterness(low),
    season(none),
    taste(bitter),     
    brewery(guinness_brewery),
    foam(low),
    region(ireland).

bier(apple_bandit_cider_crisp_apple) :-
    alcohol(medium_alcohol),
    colour(medium),
    clarity(high_transparency),
    bitterness(low),
    season(summer),
    taste(refreshing),     
    brewery(apple_bandit),
    foam(low),
    region(holland).

%questions, denk ff goed na over de volgorde van de vragen
question(alcohol):- write('How much alcohol do you want?'),nl.
question(colour):- write('What colour would you like your beer to have?'),nl.
question(clarity):- write('Would you like a transparent beer?'),nl.
question(bitterness):- write('would you like a bitter beer?'),nl.
question(season):- write('For which season would you like an appropriate beer?'),nl.
question(taste):- write('Which general taste do desire in your beer?'),nl.
question(region) :- write('From which region would you like a beer?'),nl.
question(brewery):- write('From which brewery would you like a beer?'),nl.
question(foam) :- write('How much foam would you like your beer to have?'),nl.
%answers
answer(low_alcohol):- write('Low alcohol pecentage, 0.5-3%').
answer(medium_alcohol):-write('Medium alcohol percentage, 3-7%').
answer(high_alcohol):- write('High alcohol percentage, >7%').
answer(low):- write('Low').
answer(medium):-write('Medium').
answer(high):- write('High').
answer(red):- write('Red').
answer(light) :- write('Light').
answer(dark) :- write('Dark').
answer(high_transparency) :- write('High transparency').
answer(medium_transparency) :- write('Medium transparency').
answer(low_transparency) :- write('Low transparency').
answer(summer):- write('Summer').
answer(autumn):- write('Autumn').
answer(spring):- write('Spring').
answer(winter):- write('Winter').
answer(none):- write('None').
%taste 
answer(bitter):- write('Bitter').
answer(fruity):- write('Fruity').
answer(refreshing):- write('Refreshing').
answer(sweet):- write('Sweet').
%countries/regions
answer(holland):- write('Holland').
answer(belgium):- write('Belgium').
answer(ireland):- write('Ireland').
answer(california):- write('California').
answer(france):- write('France').
answer(mexico):- write('Mexico').
answer(england):- write('England').
%breweries
answer(heineken_brewery):- write('Heineken brouwerij').
answer(bavaria_brewery):- write('Bavaria brouwerij').
answer(hertog_jan_brewery):- write('Hertog Jan brouwerij').
answer(guinness_brewery):- write('Guinness brouwerij').
answer(de_klok_brewery):- write('De Klok brouwerij').
answer(lindemans):- write('Lindemans brouwerij').
answer(grolsch_brewery):- write('Grolsch brouwerij').
answer(duvel_brewery):- write('Duvel brouwerij').
answer(neude_bier):- write('Neude bier brouwerij').
answer(bosteels):- write('Bosteels').
answer(amstel):- write('Amstel brouwerij').
answer(achel):- write('Achel').
answer(anchor):- write('Anchor').
answer(adnams):- write('Adnams').
answer(schutzenberger):- write('Schutzenberger').
answer(straffe_hendrik):- write('Straffe Hendrik').
answer(palm):- write('Palm').
answer(corona):- write('Corona').
answer(boon):- write('Boon').
answer(vedett):- write('Vedett').
answer(kasteel):- write('Kasteel').
answer(chimay):- write('Chimay').
answer(brouwerij_t_IJ):- write('Brouwerij tIJ').
answer(bax):- write('Bax').
answer(gulpener):- write('Gulpener').
answer(brewdog):- write('Brewdog').
answer(apple_bandit):- write('Apple bandit').
answer(brand):- write('brand brouwerij').
% Assigns an answer to questions from the knowledge base
alcohol(Answer) :-
  progress(alcohol, Answer).
alcohol(Answer) :-
  \+ progress(alcohol, _),
  ask(alcohol, Answer, [none,low_alcohol,medium_alcohol,high_alcohol]).

colour(Answer) :-
  progress(colour,Answer).
colour(Answer) :-
    \+ progress(colour, _),
  ask(colour, Answer, [light,medium,dark,red]).

clarity(Answer) :-
  progress(clarity, Answer).
clarity(Answer) :-
  \+ progress(clarity, _),
  ask(clarity, Answer, [high_transparency,medium_transparency,low_transparency]).

bitterness(Answer):-
  progress(bitterness,Answer).
bitterness(Answer) :- 
 \+ progress(bitterness, _),
  ask(bitterness, Answer, [low,medium,high]).

season(Answer) :-
  progress(season,Answer).
season(Answer) :-
\+ progress(season, _),
  ask(season, Answer, [none,winter,spring,summer,autumn]).

region(Answer) :-
  progress(region,Answer).
region(Answer) :-
\+ progress(region, _),
  ask(region, Answer, [holland,belgium,ireland,france,california,mexico,england]).

foam(Answer) :-
 progress(foam,Answer).
foam(Answer) :-
\+ progress(foam, _),
 ask(foam, Answer, [low,medium,high]).

taste(Answer) :-
  progress(taste,Answer).
taste(Answer) :-
\+ progress(taste, _),
  ask(taste, Answer, [bitter,fruity,refreshing,sweet]).

brewery(Answer) :-
progress(brewery,Answer).
brewery(Answer) :-
\+ progress(brewery, _),
  ask(brewery, Answer,[achel,adnams,amstel,anchor,apple_bandit,bavaria_brewery,bax,boon,bosteels,brand,brewdog,brouwerij_t_IJ,chimay,corona,de_klok_brewery,duvel_brewery,grolsch_brewery,guinness_brewery,gulpener,heineken_brewery,hertog_jan_brewery,kasteel,lindemans,neude_bier,palm,schutzenberger,straffe_hendrik,vedett]).

%descriptions
describe(heineken_pils):- write('Heineken pils'),nl.
describe(heineken_pils_0) :- write('heineken pils 0.0'),nl.
describe(grolsch_herfstbok):- write('Grolsch herfstbok'),nl.
describe(grolsch_lentebok):- write('Grolsch lentebok'),nl.
describe(hertog_jan_lentebock):- write('Hertog Jan lentebok'),nl.
describe(hertog_jan_pils):- write('Hertog Jan pils')
describe(grolsch_kanon):- write('Grolsch kanon'),nl.
describe(guinness_ale):- write('Guinnes ale'),nl.
describe(de_klok_pils):- write('De klok bier'),nl.
describe(duvel):- write('Duvel'),nl.
describe(lindemans_kriek):- write('Lindemans kriek'),nl.
describe(neude_wit):- write('Neude wit'),nl.
describe(kwak):- write('Pauwel kwak'),nl.
describe(amstel_radler):- write('Amstel radler'),nl.
describe(hertog_jan_weizener):- write('Hertog Jan weizener'),nl.
describe(bavaria_pils):- write('Bavaria pils'),nl.
describe(achel_extra_blond):- write('Achel extra blond'),nl.
describe(achel_extra_bruin):- write('Achel extra bruin'),nl.
describe(old_ale):- write('Old ale'),nl.
describe(schutzenberger_bieres_de_noel):- write('Bières de noël'),nl.
describe(anchor_porter):- write('Anchor porter'),nl.
describe(straffe_hendrik_quadrupel):- write('Straffe hendrik quadrupel'),nl.
describe(speciale_palm):- write('Speciale palm'),nl.
describe(desperados):- write('Desperados'),nl.
describe(corona):- write('Corona'),nl.
describe(boon_geuze):- write('Boom geuze'),nl.
describe(vedett_extra_white):- write('Vedett extra white'),nl.
describe(kasteel_donker):- write('Kasteel donker'),nl.
describe(chimay_blauw):- write('Chimay blauw'),nl.
describe(chimay_tripel_wit):- write('Chimay tripel wit'),nl.
describe(ij_natte):- write('IJ natte'),nl.
describe(bax_rokkenjager):- write('Bax rokkenjager'),nl.
describe(gulpener_ijsbock):- write('Gulpener ijsbock'),nl.
describe(brewdog_dead_pony_club):- write('Brewdog dead pony club'),nl.
describe(brand_session_india_pale_ale):- write('Brand session indiana pale ale'),nl. 
describe(punk_ipa_pale_ale) :- write('Punk ipa pale ale'),nl.
describe(guinness_stout_original):- write('Guinness stout original'),nl.
describe(apple_bandit_cider_crisp_apple):- write('Apple bandit cider crisp apple'),nl. 



