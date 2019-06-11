% load: ?- consult('prolog1.pl').

% check/set file path:
% working_directory(X,'C:/Users/stefa/OneDrive/Bureaublad/prolog').

%Bier specificaties

%biername
bier(heineken_pils).
bier(grolsch_herfstbok).
bier(guinnes_ale).
bier(de_klok).
bier(duvel).
bier(lindemans_kriek).
bier(neude_wit).
bier(kwak).
bier(amster_radler).
bier(grolsch_kanon).
bier(hertog_jan_weizener).
%alcohol content
alcohol(heineken_pils, 5).
alcohol(grolsch_herfstbok, 6.5).
alcohol(guinnes_ale, 4.2).
alcohol(de_klok, 4.8).
alcohol(duvel, 8.5).
alcohol(lindemans_kriek, 3.5).
alcohol(neude_wit, 6).
alcohol(kwak, 8.4).
alcohol(amster_radler, 2).
alcohol(grolsch_kanon, 11,6).
alcohol(hertog_jan_weizener, 5.7).
%colour of the beer
colour(heineken_pils, light).
colour(grolsch_herfstbok,dark).
colour(guinnes_ale,dark).
colour(de_klok,light).
colour(duvel,medium).
colour(lindemans_kriek,red).
colour(neude_wit,light).
colour(kwak,light).
colour(amster_radler,light).
colour(grolsch_kanon,medium).
colour(hertog_jan_weizener,light).
%clarity of the beer
clarity().
%aftertaste...
aftertaste().
%bitterness...
bitterness().
%body...
body().
%mouthfeel...
mouthfeel().

%Bier context
%season fitting
%hier moeten we ff goed overnadenken hoe we elk biertje een lijst kunnen meegeven van bij welke seizoenen ze passen!!!

%Region context --> vragen of klant een bepaald land wil qua biertje (slaat natuurlijk nergens op met voornamelijk nederlandse bieren)

%occasion

%drinking place

%food involved?