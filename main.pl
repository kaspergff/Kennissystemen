% load: ?- consult('prolog1.pl').

% check/set file path:
% working_directory(X,'C:/Users/stefa/OneDrive/Bureaublad/prolog').

%Bier specificaties

%Biername
bier(heineken_pils).
bier(grolsch_herfstbok).
bier(grolsch_lentebok).
bier(guinnes_ale).
bier(de_klok).
bier(duvel).
bier(lindemans_kriek).
bier(neude_wit).
bier(kwak).
bier(amster_radler).
bier(grolsch_kanon).
bier(hertog_jan_weizener).
%Alcohol content
alcohol(heineken_pils, 5).
alcohol(grolsch_herfstbok, 6.5).
alcohol(grolsch_lentebok, 6.5).
alcohol(guinnes_ale, 4.2).
alcohol(de_klok, 4.8).
alcohol(duvel, 8.5).
alcohol(lindemans_kriek, 3.5).
alcohol(neude_wit, 6).
alcohol(kwak, 8.4).
alcohol(amster_radler, 2).
alcohol(grolsch_kanon, 11,6).
alcohol(hertog_jan_weizener, 5.7).
%Colour of the beer
colour(heineken_pils, light).
colour(grolsch_herfstbok,dark).
colour(grolsch_lentebok,dark).
colour(guinnes_ale,dark).
colour(de_klok,light).
colour(duvel,medium).
colour(lindemans_kriek,red).
colour(neude_wit,light).
colour(kwak,light).
colour(amster_radler,light).
colour(grolsch_kanon,medium).
colour(hertog_jan_weizener,light).
%Clarity of the beer
clarity(heineken_pils,7).
clarity(grolsch_herfstbok,75).
clarity(grolsch_lentebok,75).
clarity(guinnes_ale,130).
clarity(de_klok,7).
clarity(duvel,5.7).
clarity(lindemans_kriek,39).
clarity(neude_wit,8).
clarity(kwak,7).
clarity(amster_radler,3.5).
clarity(grolsch_kanon,15).
clarity(hertog_jan_weizener,12).
%Aftertaste...
aftertaste().
%Bitterness...IBU
bitterness(heineken_pils,small).
bitterness(grolsch_herfstbok,medium).
bitterness(grolsch_lentebok,,medium).
bitterness(guinnes_ale,small).
bitterness(de_klok, small).
bitterness(duvel, medium).
bitterness(lindemans_kriek, small).
bitterness(neude_wit, small).
bitterness(kwak, small).
bitterness(amster_radler, small).
bitterness(grolsch_kanon, high).
bitterness(hertog_jan_weizener, medium).
%Body...
body().
%Mouthfeel...
mouthfeel().

%Bier context
%season fitting
%hier moeten we ff goed overnadenken hoe we elk biertje een lijst kunnen meegeven van bij welke seizoenen ze passen!!!
season(grolsch_herfstbok,autumn).
season(amster_radler,summer).
season(grolsch_lentebok,spring).
season(hertog_jan_weizener,summer).
%Region context --> vragen of klant een bepaald land wil qua biertje (slaat natuurlijk nergens op met voornamelijk nederlandse bieren)
region(heineken_pils, holland).
region(grolsch_herfstbok, holland).
region(grolsch_lentebok, holland).
region(guinnes_ale, ireland).
region(de_klok, holland).
region(duvel, belgium).
region(lindemans_kriek, belgium).
region(neude_wit, holland).
region(kwak, belgium).
region(amster_radler, holland).
region(grolsch_kanon, holland).
region(hertog_jan_weizener, holland).

%Occasion

%Drinking place

%Food involved?



