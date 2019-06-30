%main function
main :- intro, reset_answers, find_beer(Bier),outro(Bier).
%intro function
intro :-
  write('welcome to the beer suggestion program'), nl,
  write('To answer, input the number shown next to each answer, followed by a dot (.).'),nl,
  write('If a certain beer cannot be found "false" will be shown in the console.'),nl,
  write('If you want to go back to the previous question write "go_back(Bier)." in the console.'),nl,
  write('This does not work once a beer has been found, please re enter "main." to start over.'),nl.

%reset all answers for the next run
reset_answers :-
  retract(progress(_, _)),
  fail.
reset_answers.

%go back to the previous question
%it is a known bug that this function cannot be used more than once in each iteration of main because the user can get stuck in a loop of questions.
%once the questions are going in another order then before you know that there is not a beer that fullfills all requirements.
go_back(Bier) :-
    retract(progress(X, _)),
    bier(Bier),
    outro(Bier).

%find the fitting beer
find_beer(Bier) :-
  bier(Bier), !.
  :- dynamic(progress/2).

%add description to the beer
outro(Bier) :-
  write('Based on your answers we propose the following beer:'),nl,nl,
  beschrijving(Bier),nl,
  write('If this beer is not really what your looking for type "go_back_(Bier)." to go back one step.'),nl,
  write('Or restart the entire process by typing "main." in the constole.').

%parser
parse(0, [H|_], H).
parse(Index, [H|T], Reactie) :-
  Index > 0,
  VolgendeIndex is Index - 1,
  parse(VolgendeIndex, T, Reactie).

% creates a list of possible answers
answers([], _).
answers([H|T], Index) :-
  write(Index), write(' '), answer(H), nl,
  VolgendeIndex is Index + 1,
  answers(T, VolgendeIndex).

% Asks the Question to the user and saves the Answer
stelvraag(Vraag, Antwoord, Keuzes) :-
    nl,
  question(Vraag),
    nl,
  answers(Keuzes, 0),
  read(Index),
  parse(Index, Keuzes, Reactie),
  asserta(progress(Vraag, Reactie)),
  Reactie = Antwoord.

alcohol/1.
colour/1.
clarity/1.
bitterness/1.
region/1.
season/1.
foam/1.
taste/1.
brewery/1.
%beers
bier(bavaria_radler) :-
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
    region(holland).

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

%Assigns an answer to questions from the knowledge base
alcohol(Antwoord) :-
  progress(alcohol, Antwoord).
alcohol(Antwoord) :-
  \+ progress(alcohol, _),
  stelvraag(alcohol, Antwoord, [none,low_alcohol,medium_alcohol,high_alcohol]).
colour(Antwoord) :-
  progress(colour,Antwoord).
colour(Antwoord) :-
    \+ progress(colour, _),
  stelvraag(colour, Antwoord, [light,medium,dark,red]).
clarity(Antwoord) :-
  progress(clarity, Antwoord).
clarity(Antwoord) :-
  \+ progress(clarity, _),
  stelvraag(clarity, Antwoord, [high_transparency,medium_transparency,low_transparency]).
bitterness(Antwoord):-
  progress(bitterness,Antwoord).
bitterness(Antwoord) :- 
 \+ progress(bitterness, _),
  stelvraag(bitterness, Antwoord, [low,medium,high]).
season(Antwoord) :-
  progress(season,Antwoord).
season(Antwoord) :-
\+ progress(season, _),
  stelvraag(season, Antwoord, [none,winter,spring,summer,autumn]).
region(Antwoord) :-
  progress(region,Antwoord).
region(Antwoord) :-
\+ progress(region, _),
  stelvraag(region, Antwoord, [holland,belgium,ireland,france,california,mexico,england]).
foam(Antwoord) :-
 progress(foam,Antwoord).
foam(Antwoord) :-
\+ progress(foam, _),
 stelvraag(foam, Antwoord, [low,medium,high]).
taste(Antwoord) :-
  progress(taste,Antwoord).
taste(Antwoord) :-
\+ progress(taste, _),
  stelvraag(taste, Antwoord, [bitter,fruity,refreshing,sweet]).
brewery(Antwoord) :-
progress(brewery,Antwoord).
brewery(Antwoord) :-
\+ progress(brewery, _),
  stelvraag(brewery, Antwoord,[achel,adnams,amstel,anchor,apple_bandit,bavaria_brewery,bax,boon,bosteels,brand,brewdog,brouwerij_t_IJ,chimay,corona,de_klok_brewery,duvel_brewery,grolsch_brewery,guinness_brewery,gulpener,heineken_brewery,hertog_jan_brewery,kasteel,lindemans,neude_bier,palm,schutzenberger,straffe_hendrik,vedett]).

%descriptions

beschrijving(heineken_pils):- write('Heineken pils'),nl,write('A famous beer from brewery Heineken.'),nl,write('This beer has an alcohol percentage of 5% and has a fresh bitter taste.'),nl.
beschrijving(heineken_pils_0) :- write('heineken pils 0.0'),nl,write('The alcohol-free brother of Heineken pils.'),nl,write('This beer tastes bitter and fresh with a soft malty body.'),nl.
beschrijving(grolsch_herfstbok):- write('Grolsch herfstbok'),nl,write('This season beer with 6,5% alcohol tastes bitter and hints of caramel'),nl,write('and is a perfect drink for Autumn.'),nl.
beschrijving(grolsch_lentebok):- write('Grolsch lentebok'),nl,write('Best drank in Spring. This gold-yellow beer has a fruity,'),nl,write('sweet taste and strong aftertaste.'),nl.
beschrijving(hertog_jan_lentebock):- write('Hertog Jan lentebok'),nl,write('This beer by Hertog Jan is best enjoyed in Spring.'),nl,write('This gold-yellow beer has a fruity, sweet taste and strong aftertaste.'),nl.
beschrijving(hertog_jan_pils):- write('Hertog Jan pils'),nl,write('A bitter and tasty beer by Hertog Jan.'),nl,write('Has an alcohol percentage of 5% and is a solid beverage for all occassions.'),nl.
beschrijving(grolsch_kanon):- write('Grolsch kanon'),nl,write('A very strong beer with an alcohol percentage of 11,6%.'),nl,write('It is a blond beer with a strong sweet taste.'),nl.
beschrijving(guinness_ale):- write('Guinness ale'),nl,write('A dark beer brewed in Ireland.'),nl,write('Has an alcohol percentage of 5% and an strong bitter taste.'),nl.
beschrijving(de_klok_pils):- write('De klok bier'),nl,write('Well... its something :('),nl.
beschrijving(duvel):- write('Duvel'),nl,write('A belgium classic. This light-bitter blond beer has an alcohol percentage of 8,5%,'),nl,write('the brewing process takes about 90 days.'),nl.
beschrijving(lindemans_kriek):- write('Lindemans kriek'),nl,write('Lindemans Kriek is a kriek beer which means it has a sweet, fruity taste.'),nl,write('It is best served with ice to cool down from good weather.'),nl.
beschrijving(neude_wit):- write('Neude wit'),nl,write('Best enjoyed whilst discussing korfball'),nl.
beschrijving(kwak):- write('Pauwel kwak'),nl,write('Pauwel kwak is a strong beer with an alcohol percentage of 8,4%.'),nl,write('It is a sweat oaky accent and bitter aftertaste served in an iconic glass.'),nl.
beschrijving(amstel_radler):- write('Amstel radler'),nl,write('Amstel Radler is a light-alcoholic, very refreshing beverage.'),nl,write('A mix of Amstel beer and lemonwater, this is best enjoyed in the summer.'),nl.
beschrijving(hertog_jan_weizener):- write('Hertog Jan weizener'),nl,write('Hertog Jan Weizener is a full,'),nl,write('strong beer with an alcohol percentage of 5,7%.'),nl.
beschrijving(bavaria_pils):- write('Bavaria pils'),nl,write('This beer from the Bavaria brewery is very refreshing with a bitter aftertaste.'),nl.
beschrijving(achel_extra_blond):- write('Achel extra blond'),nl,write('This extra blond beer from Achel has a high alcohol-percentage'),nl,write('and is very refreshing with a sweet aftertaste.'),nl.
beschrijving(achel_extra_bruin):- write('Achel extra bruin'),nl,write('A counterpart from Achel extra blond, this brown beer has a high-alcohol percentage,'),nl,write('is bitter and has hints of oak.'),nl.
beschrijving(adnams_old_ale):- write('Adnams old ale'),nl,write('This beer is only brewed for cunsumption during the winter season.'),nl,write('It is an English beer with a bitter taste and medium alcohol content.'),nl.
beschrijving(schutzenberger_bieres_de_noel):- write('Schutzenberge bières de noël'),nl,write('A French winter warmer, this dark beer has a high alcohol percentage'),nl,write('and is bitter with a sweet aftertaste.'),nl.
beschrijving(anchor_porter):- write('Anchor porter'),nl,write('A sweet English winter warmer which is a great addition'),nl,write('when drank with meat as a meal. Has 5% alcohol.'),nl.
beschrijving(straffe_hendrik_quadrupel):- write('Straffe hendrik quadrupel'),nl,write('This queadrupel beer has a whopping 11% alcohol content.'),nl,write('It is a rich, dark beer witha complex character and taste.'),nl.
beschrijving(speciale_palm):- write('Speciale palm'),nl,write('This amber beer is a honey-tasting belgium beer with fruity accents.'),nl,write('It has an alcohol percentage of 5,4%.'),nl.
beschrijving(desperados):- write('Desperados'),nl,write('A popular Mexican beer. Desperados is a true summer beer.'),nl,write(' Very refreshing as it is enriched with the flavor of Tequila. A good party beverage'),nl.
beschrijving(corona):- write('Corona'),nl,write('Corona is an excellent summer beverage made on Mexican soil.'),nl,write('It has an alcohol percentage of 4,6%. Featured in Fast & Furious a lot.'),nl.
beschrijving(boon_geuze):- write('Boom geuze'),nl,write('A fruity kriek beer. With an alcohol percentage of 7%,'),nl,write('it is a unique and rich beer.'),nl.
beschrijving(vedett_extra_white):- write('Vedett extra white'),nl,write('A very light and refreshing beer which taskes good next ot chicken meals.'),nl,write('Has medium alcohol contents. '),nl.
beschrijving(kasteel_donker):- write('Kasteel donker'),nl,write('Kasteel Donker, a bitter dark beer from Belgium with a high alcohol percentage.'),nl.
beschrijving(chimay_blauw):- write('Chimay blauw'),nl,write('Chimay blue is a dark, cloudy beer with a nice head. The alcohol percentage is high.'),nl.
beschrijving(chimay_tripel_wit):- write('Chimay tripel wit'),nl,write('Triple white is a light colored beer from Belgium with a high alcohol percentage. It is brewed by the Chimay brewery'),nl.
beschrijving(ij_natte):- write('IJ natte'),nl,write('Natte is a beer from the IJ brewery. It is a beer that can be drunk all year round and it is a beer with an average alcohol percentage.'),nl.
beschrijving(bax_rokkenjager):- write('Bax rokkenjager'),nl,write('Rokkenjager is a sweet beer that is drunk especially in the spring.'),nl,write(' It comes from brewery Bax and it has a high alcohol percentage.'),nl.
beschrijving(gulpener_ijsbock):- write('Gulpener ijsbock'),nl,write('Ijsbock is a beer with a high alcohol percentage from the Netherlands.'),nl,write(' It is brewed by Gulpener who call themselves the free brewer.'),nl.
beschrijving(brewdog_dead_pony_club):- write('Brewdog dead pony club'),nl,write('Brewdog dead pony club is a beer with a very large Blockchain.'),nl,write(' But dont forget the Cyber ​​Quantom with this beer.'),nl.
beschrijving(brand_session_india_pale_ale):- write('Brand session indiana pale ale'),nl,write('Brand session indiana pale ale is a nice beer brewed in California, it has a low alcohol percentage.'),nl,write(' A nice funfact with this beer is that it is the favorite beer from Bas, the CEO of AFAS.'),nl.
beschrijving(punk_ipa_pale_ale) :- write('Punk ipa pale ale'),nl,write('Punk ipa pale ale is a beer from California from brewery Brewdog'),nl,write('. It is a fruity beer with an average alcohol percentage.'),nl.
beschrijving(guinness_stout_original):- write('Guinness stout original'),nl,write('Guinness stout original, is of course a very famous beer with its recognizable dark color.'),nl,write(' It comes naturally from Ireland and has a small foam layer.'),nl.
beschrijving(apple_bandit_cider_crisp_apple):- write('Apple bandit cider crisp apple'),nl,write('Very sweet and refreshing cider with an iconic fox as the icon.'),nl.
beschrijving(bavaria_radler):- write('Bavaria radler'),nl,write('Radler is a drink that consists of half beer and half lemonade. It is therefore a soft drink with alcohol.'),nl,write(' Radler is different from fruit beer. This is brewed by the Bavaria brewery.'),nl.
beschrijving(duvel_triple_hop):- write('Duvel triple hop'),nl,write('Tripel hop is a nice tripel from Duvel.'),nl,write(' It is a fairly bitter beer with a high alcohol percentage.'),nl.
beschrijving(amstel_pils):- write('Amstel pils'),nl,write('Radler is a drink that consists of half beer and half lemonade.'),nl,write(' It is therefore a soft drink with alcohol. Radler is different from fruit beer. This is brewed by the Amstel brewery..'),nl.
beschrijving(grolsch_radler):- write('Grolsch radler'),nl,write('Radler is a drink that consists of half beer and half lemonade.'),nl,write(' It is therefore a soft drink with alcohol. Radler is different from fruit beer. This is brewed by the Grolsch brewery.'),nl.
beschrijving(heineken_radler):- write('Heineken radler'),nl,write('Radler is a drink that consists of half beer and half lemonade.'),nl,write(' It is therefore a soft drink with alcohol. Radler is different from fruit beer. This is brewed by the Heineken brewery.'),nl.




