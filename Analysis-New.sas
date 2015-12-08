LIBNAME hbirths "/folders/myfolders/HB";

data hbirths.healthybirths_2013_NOVBAC;
	set  hbirths.healthybirths;
	
	where YearDelivery = 2013 And DeliveryType ^= 'VBAC';		
run;

title "Delivery Type By Age Group";
title2 "Year:2013";
proc sgplot data=hbirths.healthybirths_2013_NOVBAC;
	vbar AgeGroup /group=DeliveryType groupdisplay=cluster dataskin=PRESSED;
run;

title "Delivery Type By Infant Weight";
title2 "Year:2013";
proc sgplot data=hbirths.healthybirths_2013_NOVBAC;
	vbar WeightGroup /group=DeliveryType groupdisplay=cluster dataskin=PRESSED;
run;

title "Delivery Type By Mother Race";
title2 "Year:2013";
proc sgplot data=hbirths.healthybirths_2013_NOVBAC;
	vbar MotherRace /group=DeliveryType groupdisplay=cluster dataskin=PRESSED;
run;


title "Delivery Type By Insurance";
title2 "Year:2013";
proc sgplot data=hbirths.healthybirths_2013_NOVBAC;
	vbar Insurance /group=DeliveryType groupdisplay=cluster dataskin=PRESSED;
run;

data hbirths.healthybirths_cs;
	set  hbirths.healthybirths;
	
	where DeliveryType = 'C-Section';		
run;

data hbirths.healthybirths_cs;
	set  hbirths.healthybirths_cs;
	
	Year=Year(DeliveryDate);		
run;

title "C-Section Deliveries By Year";
proc sgplot data=hbirths.healthybirths_cs;
	vbar DeliveryType /group=Year 
		groupdisplay=cluster 
		dataskin=PRESSED;
		styleattrs datacolors=(cyan);
run;

proc sgplot data=hbirths.healthybirths_cs noautolegend;
   title1 "Mother's Age By Year";
   title2 "C-Section Births";
   styleattrs datacolors=(cyan);
   vbox MotherAge / category=year group=Year;
run;

proc sgplot data=hbirths.healthybirths noautolegend;
   title1 "Mother's Age By Year";
   title2 "C-Section Births";
   styleattrs datacolors=(cyan);
   histigram MotherAge;
   Density MotherAge;
run;

proc corr data=hbirths.healthybirths;
   var MotherAge InfantWeight InfantGestation;
run;

