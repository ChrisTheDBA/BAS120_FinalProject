LIBNAME hbirths "/folders/myfolders/HB";

data hbirths.healthybirths;
	set  hbirths.healthybirths_merge;
		
	keep HBID_system
		MotherBirthDate
		DeliveryDate
		MothrBDateNull
		MotherPrimaryLang
		MotherRace
		PreNatalSite
		GravidaNumber
		ParaNumber
		PrimiPara
		InfantGestNumWeek
		InfantGestNumDay
		DeliveryType
		DeliverySite
		WellClinicApptDate
		PostPartumApptDate
		Insurance
		PostPartumSite
		WellClinic
		PCMSVisitDate
		WICFlag
		PCMSMedicaidFlag
		InfantSex
		LBInfantWeight
		OzInfantWeight
		GramInfantWeight
		OneMinAPGARScore
		FiveMinAPGARScore
		PregOutcome
		Zipcode
		AddrType
		PhoneType
		WCHSProgram
		ContraceptiveMethod
		FeedingType
		Geoteam
		PCMSVisitDate
		WICFlag
		PCMSMedicaidFlag
		;
	format 
		DeliveryDate	date9.
		MotherBirthDate	date9.;
			
run;

proc format;
	value agefmt  0 - <15 = 'under 15'
				 15 - <20 = '15 to 20'
				 20 - <25 = '20 to 25'
				 25 - <30 = '25 to 30'
				 30 - <35 = '30 to 35'
				 35 - <40 = '35 to 40'
				 40 - <45 = '40 to 45'
				 45 - <50 = '45 to 50'
				 50 - high = '50 and Over';
				 
	value weightfmt 0 - <1000 = 'ELBW'
					1000 - <1500 = 'VLBW'
					1500 - <2500 = 'LBW'
					2500 - <4200 = 'NBW'
					4200 - high = 'HBW';
run;	 
				 
				 
				 

data hbirths.healthybirths;
	set  hbirths.healthybirths;
	
	InfantGestation = InfantGestNumWeek * 7 + InfantGestNumDay;
	
	BirthDOW = put(DeliveryDate, DOWNAME3.);
	
	YearDelivery = Year(DeliveryDate);
	
	If GramInfantWeight > 0 then InfantWeight = GramInfantWeight;
		else if LBInfantWeight > 0 then InfantWeight = ((LBInfantWeight * 16) + OzInfantWeight) * 28.3495231;
		else InfantWeight = ".";
	
	MotherAge = Intck('Year', MotherBirthDate, DeliveryDate);
	
	DaysToPCMSVisit = Intck('Day', DeliveryDate, PCMSVisitDate);
	
	AgeGroup = put(MotherAge,agefmt.);
	
	WeightGroup = put(InfantWeight, weightfmt.);
	
	If WellClinicApptDate = "." Then WellClinicFlag = 0;
		else WellClinicFlag = 1;
	
	If PostPartumApptDate = "." Then PostPartumFlag = 0;
		else PostPartumFlag = 1;
		
	If PCMSVisitDate = "." The PCMSVisitFlag = 0;
		else PCMSVisitFlag = 1;
	
run;


proc sgplot data=hbirths.healthybirths;
   histogram InfantWeight / binwidth=100;
run;


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

