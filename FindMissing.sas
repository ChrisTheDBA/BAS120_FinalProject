LIBNAME hbirths "/folders/myfolders/HB";

proc format;
 value $missfmt ' '='Missing' other='Not Missing';
 value  missfmt  . ='Missing' other='Not Missing';
run;
 
proc freq data=hbirths.healthybirths; 
format _CHAR_ $missfmt.; /* apply format for the duration of this PROC */
tables _CHAR_ / missing missprint nocum nopercent;
format _NUMERIC_ missfmt.; /* apply format for the duration of this PROC */
tables _NUMERIC_ / missing missprint nocum nopercent;
run;


