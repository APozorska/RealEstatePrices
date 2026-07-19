*Model dynamiczny - Gdansk (wersja demo, dane wpisane bezposrednio);
*Dynamic model - Gdansk (self-contained demo: a few real rows inline);
*cena ~ Wsk_cen + cena z poprzedniego okresu;
options obs=100;
data gdansk;
  input cena Wsk_cen "cena-1"n;
  datalines;
5695.75 100.6 5730.95
5617.39 100.1976 5695.75
5564.01 100.0974 5617.39
5413.68 99.4968 5564.01
5517.48 100.0938 5413.68
5688.82 99.9937 5517.48
5725.84 100.6937 5688.82
6043.25 101.7006 5725.84
6283.44 102.1074 6043.25
6574.01 101.9032 6283.44
6713.74 102.9222 6574.01
7352.78 103.3339 6713.74
7419.03 104.2639 7352.78
7530.44 104.1596 7419.03
7725.84 104.5763 7530.44
;
run;
proc autoreg data=gdansk;
  model cena = Wsk_cen "cena-1"n;
run;
