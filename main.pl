

%TO DO
% allereerst: check ff de 'old_ale' & 'bières_de_noël' daar staan wat comments bij.
% 1. het invullen van de taste,smell en foam parameters van alle biertjes.
% 1b.Zoek een andere manier om een beschrijving van een biertje te krijgen(kan bij describe), let er ff op dat alles in dezelfde taal moet zijn.
% 2. Voeg rules toe!!!! zou niet weten welke maar zonder rules is het geen kennissysteem!!!
% 3. Begin met uitzoeken hoe we een enumeratie kunnen krijgen van alle brouwerijen ipv dat we die zelf handmatig moeten toevoegen aan de answers van de vraag, 
%    en hoe we ervoor kunnen zorgen dat zodra er geen voorkeur voor is de vraag overgeslagen kan worden, dus dat elk biertje ofwel none of een bepaalde brouwerij heeft.
% 4. Denk na over hoe we een functie kunnen maken om terug te gaan naar de vorige vraag als er geen bier uit een pad komt.
% 5. Denk na over een methode om aan het einde zodra een biertje aangeboden word de kb gegevens daarbij te krijgen (ben hiermee aan het prutsen in 'getdetails').
%    Dus: Heineken pils
%    alcohol(medium_alcohol)
%    colour(light)
%    clarity(high_transparency)
%    enz....


main :- intro, reset_answers, find_beer(Bier),describe(Bier).%,getdetails(X).
intro :-
  write('welcome to the beer suggestion program'), nl,
  write('To answer, input the number shown next to each answer, followed by a dot (.)'), nl, nl.

%getdetails(X):-
% write(alcohol(bier(X))),nl,
% write(colour(bier(X))),nl,
% write(clarity(bier(X))),nl,
% write(bitterness(bier(X))),nl,
% write(region(bier(X))),nl,
% write(season(bier(X))),nl,
% write(brewery(bier(X))).

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
taste/1.
smell/1.
brewery/1.

bier(heineken_pils) :-
    alcohol(medium_alcohol),
    colour(light),
    clarity(high_transparency),
    bitterness(low),
    season(none),
    % taste(),
    % smell(),
    brewery(heineken_brewery),
    % foam(),
    region(holland).

bier(heineken_pils_0) :-
    alcohol(none),
    colour(light),
    clarity(high_transparency),
    bitterness(low),
    season(none),
    % taste(),
    % smell(),
    brewery(heineken_brewery),
    % foam(),
    region(holland).
	
bier(bavaria_pils) :-
    alcohol(medium_alcohol),
    colour(light),
    clarity(high_transparency),
    bitterness(low),
    season(none),
    % taste(),
    % smell(),
    brewery(bavaria_brewery),
    % foam(),
    region(holland).

bier(hertog_jan_pils) :-
    alcohol(medium_alcohol),
    colour(light),
    clarity(high_transparency),
    bitterness(low),
    season(none),
    % taste(),
    % smell(),
    brewery(hertog_jan_brewery),
    % foam(),
    region(holland).

bier(grolsch_herfstbok):-
    alcohol(medium_alcohol),
    colour(dark),
    clarity(low_transparency),
    bitterness(medium),
    season(autumn),
    % taste(),
    % smell(),
    brewery(grolsch_brewery),
    % foam(),
    region(holland).

bier(grolsch_lentebok):-
    alcohol(medium_alcohol),
    colour(dark),
    clarity(low_transparency),
    bitterness(medium),
    season(spring),
    % taste(),
    % smell(),
    brewery(grolsch_brewery),
    % foam(),
    region(holland).

bier(guinness_ale):-
    alcohol(medium_alcohol),
    colour(dark),
    clarity(low_transparency),
    bitterness(low),
    season(none),
    % taste(),
    % smell(),
    brewery(guinness_brewery),
    % foam(),
    region(ireland).

bier(de_klok_pils):-
    alcohol(medium_alcohol),
    colour(light),
    clarity(high_transparency),
    bitterness(low),
    season(none),
    % taste(),
    % smell(),
    brewery(de_klok_brewery),
    % foam(),
    region(holland).

bier(duvel):-
    alcohol(high_alcohol),
    colour(medium),
    clarity(high_transparency),
    bitterness(low),
    season(none),
    % taste(),
    % smell(),
    brewery(duvel_brewery),
    % foam(),
    region(belgium).

bier(lindemans_kriek) :-
    alcohol(low_alcohol),
    colour(red),
    clarity(low_transparency),
    bitterness(low),
    season(none),
    % taste(),
    % smell(),
    brewery(lindemans),
    % foam(),
    region(belgium).

bier(neude_wit) :-
    alcohol(medium_alcohol),
    colour(light),
    clarity(medium_transparency),
    bitterness(low),
    season(none),
    % taste(),
    % smell(),
    brewery(neude_bier),
    % foam(),
    region(holland).

bier(kwak) :-
    alcohol(high_alcohol),
    colour(light),
    clarity(high_transparency),
    bitterness(low),
    season(none),
    % taste(),
    % smell(),
    brewery(bosteels),
    % foam(),
    region(belgium).

bier(amstel_radler) :-
    alcohol(low_alcohol),
    colour(light),
    clarity(high_transparency),
    bitterness(low),
    season(summer),
    % taste(),
    % smell(),
    brewery(amstel),
    % foam(),
    region(holland).

bier(grolsch_kanon) :-
    alcohol(high_alcohol),
    colour(medium),
    clarity(medium_transparency),
    bitterness(medium),
    season(none),
    % taste(),
    % smell(),
    brewery(grolsch_brewery),
    % foam(),
    region(holland).

bier(hertog_jan_weizener) :-
    alcohol(medium_alcohol),
    colour(light),
    clarity(medium_transparency),
    bitterness(high),
    season(summer),
    % taste(),
    % smell(),
    brewery(hertog_jan_brewery),
    % foam(),
    region(holland).
	
bier(achel_extra_blond) :-
    alcohol(high_alcohol),
    colour(light),
    clarity(high_transparency),
    bitterness(low),
    season(summer),
    % taste(),
    % smell(),
    brewery(achel),
    % foam(),
    region(belgium).
	
bier(achel_extra_bruin) :-
    alcohol(high_alcohol),
    colour(dark),
    clarity(low_transparency),
    bitterness(high),
    season(none),
    % taste(),
    % smell(),
    brewery(achel),
    % foam(),
    region(belgium).

%van welk merk is deze?
%bier(old_ale) :-
%    alcohol(medium_alcohol),
%    colour(dark),
%    clarity(medium_transparency),
%    bitterness(medium),
%    season(winter),
%    taste(),
%    smell(),
%    brewery(),
%    foam(),
%    region(england).

%same voor deze
%bier(bières_de_noël) :-
%    alcohol(high_alcohol),
%    colour(dark),
%    clarity(high_transparency),
%    bitterness(high),
%    season(winter),
%    taste(),
%    smell(),
%    brewery(),
%    foam(),
%    region(france).

bier(anchor_porter) :-
    alcohol(medium_alcohol),
    colour(dark),
    clarity(medium_transparency),
    bitterness(low),
    season(winter),
    % taste(),
    % smell(),
    brewery(anchor),
    % foam(),
    region(england).

bier(straffe_hendrik_quadrupel) :-
    alcohol(high_alcohol),
    colour(dark),
    clarity(low_transparency),
    bitterness(high),
    season(none),
    % taste(),
    % smell(),
    brewery(straffe_hendrik),
    % foam(),
    region(belgium).

bier(speciale_palm) :-
    alcohol(medium_alcohol),
    colour(red),
    clarity(high_transparency),
    bitterness(medium),
    season(none),
    % taste(),
    % smell(),
    brewery(palm),
    % foam(),
    region(belgium).

bier(desperados) :-
    alcohol(medium_alcohol),
    colour(light),
    clarity(high_transparency),
    bitterness(low),
    season(summer),
    % taste(),
    % smell(),
    brewery(heineken_brewery),
    % foam(),
    region(mexico).

bier(corona) :-
    alcohol(medium_alcohol),
    colour(light),
    clarity(high_transparency),
    bitterness(low),
    season(summer),
    % taste(),
    % smell(),
    brewery(corona),
    % foam(),
    region(mexico).

bier(boon_geuze) :-
    alcohol(high_alcohol),
    colour(red),
    clarity(high_transparency),
    bitterness(medium),
    season(none),
    % taste(),
    % smell(),
    brewery(boon),
    % foam(),
    region(belgium).

bier(vedett_extra_white) :-
    alcohol(medium_alcohol),
    colour(light),
    clarity(high_transparency),
    bitterness(low),
    season(summer),
    % taste(),
    % smell(),
    brewery(vedett),
    % foam(),
    region(belgium).

bier(kasteel_donker) :-
    alcohol(high_alcohol),
    colour(dark),
    clarity(high_transparency),
    bitterness(high),
    season(none),
    % taste(),
    % smell(),
    brewery(kasteel),
    % foam(),
    region(belgium).

bier(chimay_blauw) :-
    alcohol(high_alcohol),
    colour(dark),
    clarity(low_transparency),
    bitterness(medium),
    season(none),
    % taste(),
    % smell(),
    brewery(chimay),
    % foam(),
    region(belgium).

bier(chimay_tripel_wit) :-
    alcohol(high_alcohol),
    colour(light),
    clarity(high_transparency),
    bitterness(low),
    season(none),
    % taste(),
    % smell(),
    brewery(chimay),
    % foam(),
    region(belgium).

bier(ij_natte) :-
    alcohol(medium_alcohol),
    colour(medium),
    clarity(medium_transparency),
    bitterness(medium),
    season(none),
    % taste(),
    % smell(),
    brewery(brouwerij_t_IJ),
    % foam(),
    region(belgium).

bier(hertog_jan_lentebock) :-
    alcohol(medium_alcohol),
    colour(medium),
    clarity(low_transparency),
    bitterness(medium),
    season(spring),
    % taste(),
    % smell(),
    brewery(hertog_jan_brewery),
    % foam(),
    region(holland).

bier(bax_rokkenjager) :-
    alcohol(high_alcohol),
    colour(dark),
    clarity(medium_transparency),
    bitterness(medium),
    season(spring),
    % taste(),
    % smell(),
    brewery(bax),
    % foam(),
    region(holland).

bier(gulpener_ijsbock) :-
    alcohol(high_alcohol),
    colour(medium),
    clarity(medium_transparency),
    bitterness(low),
    season(winter),
    % taste(),
    % smell(),
    brewery(gulpener),
    % foam(),
    region(holland).

bier(brewdog_dead_pony_club) :-
    alcohol(low_alcohol),
    colour(medium),
    clarity(high_transparency),
    bitterness(medium),
    season(none),
    % taste(),
    % smell(),
    brewery(brewdog),%is dit de juiste brouwerij?
    % foam(),
    region(california).

bier(brand_session_india_pale_ale) :-
    alcohol(low_alcohol),
    colour(medium),
    clarity(medium_transparency),
    bitterness(low),
    season(none),
    % taste(),
    % smell(),
    brewery(brand),
    % foam(),
    region(california).

bier(punk_ipa_pale_ale) :-
    alcohol(medium_alcohol),
    colour(medium),
    clarity(high_transparency),
    bitterness(medium),
    season(none),
    % taste(),
    % smell(),
    brewery(brewdog),
    % foam(),
    region(california).

bier(guinness_stout_original) :-
    alcohol(medium_alcohol),
    colour(dark),
    clarity(medium_transparency),
    bitterness(low),
    season(none),
    % taste(),
    % smell(),
    brewery(guinness_brewery),
    % foam(),
    region(ireland).

bier(apple_bandit_cider_crisp_apple) :-
    alcohol(medium_alcohol),
    colour(medium),
    clarity(high_transparency),
    bitterness(low),
    season(summer),
    % taste(),
    % smell(),
    brewery(apple_bandit),
    % foam(),
    region(holland).

%questions, dnek ff goed na over de volgorde van de vragen
question(alcohol):- write('How much alcohol do you want?'),nl.
question(colour):- write('What colour would you like your beer to have?'),nl.
question(clarity):- write('Would you like a transparent beer?'),nl.
question(bitterness):- write('would you like a bitter beer?'),nl.
question(season):- write('for which season would you like an appropriate beer?'),nl.
question(region) :- write('from which region would you like a beer?'),nl.
%brewery, werkt nu niet niet omdat de biertjes geen brewery property hebben.
%we moeten nadenken over hoe we een enumeratie van alle brouwerijen maken, anders moet alles handmatig.
question(brewery):- write('from which brewery would you like a beer?'),nl.
%smell, werkt nu niet niet omdat de biertjes geen smell property hebben.-> deze vraag is echt wack
%question(smell):- write('what smell do you prefer for your beer?'),nl.
%foam, werkt nu niet niet omdat de biertjes geen foam property hebben.
%question(foam) :- write('how much foam would you like your beer to have?'),nl.
%taste, werkt nu niet niet omdat de biertjes geen taste property hebben.
%question(taste) :-write('what kind of taste would you like your beer to have?'),nl.
%answers
answer(low_alcohol):- write('low alcohol pecentage, 0.5-3%').
answer(medium_alcohol):-write('medium alcohol percentage, 3-7%').
answer(high_alcohol):- write('high alcohol percentage, >7%').
answer(low):- write('low').
answer(medium):-write('medium').
answer(high):- write('high').
answer(red):- write('red').
answer(light) :- write('light').
answer(dark) :- write('dark').
answer(high_transparency) :- write('high transparency').
answer(medium_transparency) :- write('medium transparency').
answer(low_transparency) :- write('low transparency').
answer(summer):- write('summer').
answer(autumn):- write('autumn').
answer(spring):- write('spring').
answer(winter):- write('winter').
answer(none):- write('none').
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


%voeg antoorden toe voor [brewery,smell,foam,taste]

%REGION ANSWERS MOETEN GAAN BESTAAN UIT DE BESCHIKBARE MOGELIJKHEDEN!!!!! ANDERS GAAT DE INFERENCE NIET LOSSTAAN VAN DE KB!!!!
%Gaat ons naar alle waarschijnlijkheid niet lukken..... je kan ook geen arithmetic enzo meer doen op een of andere manier
%Probeer maar eens met alcohol(X)
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

%onderstaande is gecomment omdat de smell,foam en taste parameters nog niet zijn ingevuld
%  smell(Answer) :-
%  progress(smell,Answer).
%smell(Answer) :-
%\+ progress(smell, _),
%  ask(smell, Answer, [L smells]).

%foam(Answer) :-
%  progress(foam,Answer).
%foam(Answer) :-
%\+ progress(foam, _),
%  ask(foam, Answer, [L foam]).

%taste(Answer) :-
%  progress(taste,Answer).
%taste(Answer) :-
%\+ progress(taste, _),
%  ask(taste, Answer, [L taste]).

brewery(Answer) :-
progress(brewery,Answer).
brewery(Answer) :-
\+ progress(brewery, _),
  ask(brewery, Answer,[achel,amstel,anchor,apple_bandit,bavaria_brewery,bax,boon,bosteels,brand,brewdog,brouwerij_t_IJ,chimay,corona,de_klok_brewery,duvel_brewery,grolsch_brewery,guinness_brewery,gulpener,heineken_brewery,hertog_jan_brewery,kasteel,lindemans,neude_bier,palm,straffe_hendrik,vedett]).

  % [First|Rest] is the Choices list, Index is the index of First in Choices
answers([], _).
answers([First|Rest], Index) :-
  write(Index), write(' '), answer(First), nl,
  NextIndex is Index + 1,
  answers(Rest, NextIndex).
%descriptions
describe(heineken_pils):- write('Heineken pils'),nl.
describe(heineken_pils_0) :- write('heineken pils 0.0'),nl.
describe(grolsch_herfstbok):- write('Grolsch herfstbok'),nl.
describe(grolsch_lentebok):- write('Grolsch lentebok'),nl.
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
describe(bières_de_noël):- write('Bières de noël'),nl.
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

% Parses an Index and returns a Response representing the "Indexth" element in
% Choices (the [First|Rest] list)
parse(0, [First|_], First).
parse(Index, [First|Rest], Response) :-
  Index > 0,
  NextIndex is Index - 1,
  parse(NextIndex, Rest, Response).

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
