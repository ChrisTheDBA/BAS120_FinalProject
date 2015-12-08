LIBNAME hbirths "/folders/myfolders/HB";

proc means data=hbirths.healthybirths;
	var GravidaNumber ParaNumber;
	class Geoteam;
run;

proc chart data=hbirths.healthybirths;
	vbar MotherRace;
run;

title "Delivery Type By Infant Weight";
title2 "Year:2013";
proc sgplot data=hbirths.healthybirths_cs;
	vbar DeliveryType /group=Year groupdisplay=cluster dataskin=PRESSED;
	styleattrs datacolors=(cyan);
run;