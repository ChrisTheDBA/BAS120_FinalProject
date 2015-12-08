LIBNAME hbirths "/folders/myfolders/HB";

data hbirths.healthybirths;
	set hbirths.healthybirths_merge;

   InfantGestTotalDay = InfantGestNumWeek * 7 + InfantGestNumDay;
    
    /* FormDate functions */
    FormDateYear = Year(FormDate);
    FormDateMonth = Month(FormDate);
    FormDateQuarter = QTR(FormDate);
    FormDateMonYear = FormDateYear || '-' || put(input(FormDateMonth,best32.),z2.);
    FormDateQtrYear = FormDateYear || '-' || FormDateQuarter;
    
    /* Mother's Age */
    MotherAge=Intck('Year', MotherBirthDate, DeliveryDate);
    MotherYear=Year(MotherBirthDate);
 
 format FormDate date9. 
			MotherBirthDate date9. 
			WellClinicApptDate date9. 
			PostPartumapptDate date9.
			DeliveryDate date9.;
			
run;

/*proc contents data=hbirths.healthybirths varnum;
run;*/




 
