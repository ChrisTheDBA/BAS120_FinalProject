LIBNAME hbirths "/folders/myfolders/HB";

/*
proc means data=hbirths.Births;
    class FormDate;
    var InfantGestTotalDay;
    format FormDate MonYY7.;
run;
*/
/*
proc sgplot data=hbirths.Births;
   histogram InfantGestTotalDay / binwidth=5;
run;
*/


proc print data=hbirths.healthybirths(obs=10) noobs;
	var MotherID InfantGestTotalDay MotherAge;
run;

Proc means data=hbirths.healthybirths mean std ;
var MotherAge;
class DeliveryType;
run;

proc freq dat=hbirths.healthybirths;
 	table MotherAge;
 run;

proc Freq data=hbirths.healthybirths_2013;
	table DeliveryType*DeliverySite /norow nopercent;
run;   

title "Delivery Type vs Delivery Site Crosstab";
title2 "year:2013";
proc Freq data=hbirths.healthybirths_2013;
		table DeliveryType*DeliverySite /norow nopercent nofreq;
run;   

title "Delivery Type vs Delivery Site Crosstab";
title2 "year:2013";
proc Freq data=hbirths.healthybirths_2013_primipara;
		table DeliveryType*DeliverySite /norow nopercent nofreq;
run; 

