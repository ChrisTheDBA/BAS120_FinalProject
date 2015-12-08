LIBNAME hbirths "/folders/myfolders/HB";

data hbirths.healthybirths_2013;
	set  hbirths.healthybirths;
	
	where YearDelivery = 2013;		
run;

data hbirths.healthybirths_2013_CS;
	set  hbirths.healthybirths;
	
	where YearDelivery = 2013 and DeliveryType= 'C-Section';		
run;

data hbirths.healthybirths_2013_PP_WM;
	set  hbirths.healthybirths;
	
	where YearDelivery = 2013 and PrimiPara = 1 and DeliverySite = 'Wake Med';		
run;

data hbirths.healthybirths_2013_CS_PP_WM;
	set  hbirths.healthybirths;
	
	where YearDelivery = 2013 and PrimiPara = 1 and DeliverySite = 'Wake Med' and Deliverytype = 'C-Section';		
run;

data hbirths.healthybirths_2013_REX;
	set  hbirths.healthybirths;
	
	where YearDelivery = 2013 and DeliverySite = 'Rex';		
run;

data hbirths.healthybirths_2013_WMC;
	set  hbirths.healthybirths;
	
	where YearDelivery = 2013 and DeliverySite = 'Western Wake';		
run;

title "C-Section Births by Day of Week";
title2 "year:2013 WakeMed";
proc sgplot data=hbirths.healthybirths_2013_CS_PP_WM;
   vbar BirthDOW /
   dataskin=PRESSED;
   styleattrs datacolors=(cyan);
run;

title "All Births by Day of Week";
title2 "year:2013 WakeMed";
proc sgplot data=hbirths.healthybirths_2013_PP_WM;
   vbar BirthDOW /
   dataskin=PRESSED;
   styleattrs datacolors=(cyan);
run;

title "C-Section Births by Mother Race";
title2 "year;2013";
proc sgplot data=hbirths.healthybirths_2013_CS;
   vbar MotherRace /
   dataskin=PRESSED;
   styleattrs datacolors=(cyan);
run;

title "C-Section Births by Insurance Type";
title2 "year;2013";
proc sgplot data=hbirths.healthybirths_2013_CS;
   vbar Insurance /
   dataskin=PRESSED;
   styleattrs datacolors=(cyan);
run;

title "C-Section Births by Mother Age";
title2 "year;2013";
proc sgplot data=hbirths.healthybirths_2013_CS;
   vbar AgeGroup /
   dataskin=PRESSED;
   styleattrs datacolors=(cyan);
run;

title "C-Section Births by Infant Birth Weight";
title2 "year;2013";
proc sgplot data=hbirths.healthybirths_2013_CS;
   vbar WeightGroup /
   dataskin=PRESSED;
   styleattrs datacolors=(cyan);
run;




title "C-Section Births by Day of Week";
proc sgplot data=hbirths.healthybirths_2013_REX;
   vbar BirthDOW /grouporder=data;
run;


title "C-Section Births by Day of Week";
proc sgplot data=hbirths.healthybirths_2013_WMC;
   vbar BirthDOW /grouporder=data;
run;


data hbirths.healthybirths_cs_2010;
	set  hbirths.healthybirths;
	
	where DeliveryType = 'C-Section' and YearDelivery > 2009;		
run;

title "C-Section Births by Day of Week";
proc sgplot data=hbirths.healthybirths_cs_2010;
   vbar BirthDOW /grouporder=data;
run;

title "Birth Types by Delivery Site";
proc freq data=hbirths.healthybirths_2013;
	tables DeliveryType*DeliverySite /norow nopercent;
run;	

title "Birth Types by Delivery Site";
title2 "PrimiPara";
proc freq data=hbirths.healthybirths_2013_PrimiPara;
	tables DeliveryType*DeliverySite /norow nopercent;
run;
/*
proc freq data=hbirths.healthybirths;
	tables DeliveryType*DeliverySite /norow nopercent;
run;	

proc freq data=hbirths.healthybirths;
	tables DeliveryType*MotherRace /norow nopercent;
run;	

proc freq data=hbirths.healthybirths;
	tables DeliveryType*MotherPrimaryLang /norow nopercent;
run;	

proc freq data=hbirths.healthybirths order=formatted;
	tables WeightGroup*DeliveryType /norow nopercent;
run;	

*/

LIBNAME hbirths "/folders/myfolders/HB";

%let gpath='C:\';
%let dpi=200;
ods html close;
ods listing gpath=&gpath image_dpi=&dpi;

/*--Macro by Perry Watts--*/
%macro RGBHex(rr,gg,bb);
  %sysfunc(compress(CX%sysfunc(putn(&rr,hex2.))
  %sysfunc(putn(&gg,hex2.))
  %sysfunc(putn(&bb,hex2.))))
%mend RGBHex;

/*--Simple replica of original graph--*/
/*ods graphics / reset width=4.25in height=1.6in noscale noborder imagename='Visits';
proc sgplot data=hbirths.healthybirths_2013 nowall noborder;
  styleattrs datacolors=(%rgbhex(140, 185, 202) %rgbhex(19, 85, 137));
  vbar BirthDOW / response=GravidaNumber nostatlabel nooutline baselineattrs=(thickness=0);
  /*vbar BirthDOW / response=MotherAge nostatlabel barwidth=0.5 nooutline baselineattrs=(thickness=0);
  keylegend / location=outside position=topright noborder valueattrs=(size=5 color=gray);
  xaxis fitpolicy=thin display=(nolabel noticks noline) valueattrs=(size=6 color=gray);
  yaxis grid display=(noline noticks nolabel noline) valueattrs=(size=6  color=gray);
run;
*/

LIBNAME hbirths "/folders/myfolders/HB";

data hbirths.healthybirths_2013;
	set  hbirths.healthybirths;
	
	where YearDelivery = 2013 And DeliveryType ^= 'VBAC';		
run;
title "Delivery Type By Age Group";
title2 "Year:2013";
proc sgplot data=hbirths.healthybirths_2013;
	vbar AgeGroup /group=DeliveryType groupdisplay=cluster dataskin=PRESSED;
run;

title "Delivery Type By Infant Weight";
title2 "Year:2013";
proc sgplot data=hbirths.healthybirths_2013;
	vbar WeightGroup /group=DeliveryType groupdisplay=cluster dataskin=PRESSED;
run;