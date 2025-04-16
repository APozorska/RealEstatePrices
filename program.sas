LIBNAME lib 'E:\2-Matematyka\praca licencjacka\biblioteki_SAS';
************************************************
*Model liniowy statyczny;
************************************************
*Import danach - Gdañsk;
proc import datafile="E:\2-Matematyka\praca licencjacka\dane_panelowe_2.xlsx" 
	out=lib.Gdansk_dane_panelowe
	dbms=xlsx
	replace;
	Sheet="Gdansk_2";
	getnames=yes;
run;
*Import danach - Wroc³aw;
proc import datafile="E:\2-Matematyka\praca licencjacka\dane_panelowe_2.xlsx" 
	out=lib.Wroclaw_dane_panelowe
	dbms=xlsx
	replace;
	Sheet="Wroclaw_2";
	getnames=yes;
run;
*Import danach - Kraków;
proc import datafile="E:\2-Matematyka\praca licencjacka\dane_panelowe_2.xlsx" 
	out=lib.Krakow_dane_panelowe
	dbms=xlsx
	replace;
	Sheet="Krakow_2";
	getnames=yes;
run;
*Import danach - Warszawa;
proc import datafile="E:\2-Matematyka\praca licencjacka\dane_panelowe_2.xlsx" 
	out=lib.Warszawa_dane_panelowe
	dbms=xlsx
	replace;
	Sheet="Warszawa_2";
	getnames=yes;
run;
************************************************
*Model liniowy dynamiczny;
************************************************
*Import danach - Gdañsk;
proc import datafile="E:\2-Matematyka\praca licencjacka\dane_panelowe_2.xlsx" 
	out=lib.Gdansk_dane_panelowe_d
	dbms=xlsx
	replace;
	Sheet="Gdansk_2d";
	getnames=yes;
run;
*Import danach - Wroc³aw;
proc import datafile="E:\2-Matematyka\praca licencjacka\dane_panelowe_2.xlsx" 
	out=lib.Wroclaw_dane_panelowe_d
	dbms=xlsx
	replace;
	Sheet="Wroclaw_2d";
	getnames=yes;
run;
*Import danach - Kraków;
proc import datafile="E:\2-Matematyka\praca licencjacka\dane_panelowe_2.xlsx" 
	out=lib.Krakow_dane_panelowe_d
	dbms=xlsx
	replace;
	Sheet="Krakow_2d";
	getnames=yes;
run;
*Import danach - Warszawa;
proc import datafile="E:\2-Matematyka\praca licencjacka\dane_panelowe_2.xlsx" 
	out=lib.Warszawa_dane_panelowe_d
	dbms=xlsx
	replace;
	Sheet="Warszawa_2d";
	getnames=yes;
run;
************************************************
*Prognozowanie
************************************************
*test Chowa - Gdañsk; 
proc autoreg data=lib.gdansk_dane_panelowe_d;
	model cena=M_do35 "M_50-80"n Wsk_cen "cena-1"n / chow=(32 48);
run;
 
*test Chowa - Wroc³aw; 
proc autoreg data=lib.wroclaw_dane_panelowe_d;
	model cena=M_do35 "M_50-80"n "cena-1"n / chow=(32 48);
run;

*test Chowa - Kraków; 
proc autoreg data=lib.krakow_dane_panelowe_d;
	model cena=M_do35 "M_35-50"n "M_50-80"n "cena-1"n / chow=(32 48);
run;
 
*test Chowa - Warszawa; 
proc autoreg data=lib.warszawa_dane_panelowe_d;
	model cena=M_do35 "M_35-50"n "M_50-80"n Wsk_cen "cena-1"n / chow=(32 48);
run;


