LIBNAME hbirths "/folders/myfolders/HB";

data hbirths.Address_import;
	infile "/folders/myfolders/HB/SourceData/Address.csv" dsd firstobs = 2 ;

	informat 
		PrimStreetText		$40.
		City				$30.
		AddrState			$2.
		ZipCode				$5.
		AddressComment		$50.
		AddrType			$20.
		MotherID_system		7.;
		
	input
		PrimStreetText
		City
		AddrState
		ZipCode
		AddressComment
		AddrType
		MotherID_system;
run;

data hbirths.CurrentGeoteam_import;
	infile "/folders/myfolders/HB/SourceData/CurrentGeoteam.csv" dsd firstobs = 2 ;

	informat
	 	Geoteam						$20.
	 	GeoTeamAssgnUser			$10.
	 	GeoteamAssgnDate			mmddyy10.
	 	GeoTeamAssgnReasonText		$50.
	 	WCHSInfoID_system			7.;
	 	
	 input
	 	Geoteam
	 	GeoTeamAssgnUser
	 	GeoTeamAssgnDate
	 	GeoTeamAssgnReasonText		
	 	WCHSInfoID_system;
run;

data hbirths.Geoteam_import;
	infile "/folders/myfolders/HB/SourceData/Geoteam.csv" dsd firstobs = 2 ;

	informat
		Geoteam					$20.
		GeoTeamAssgnUser		$10.
		GeoteamAssgnDate		mmddyy10.
		GeoTeamAssgnReasonText	$50.
		WCHSInfoID_system		7.;
		
	input
		Geoteam
		GeoTeamAssgnUser
		GeoteamAssgnDate
		GeoTeamAssgnReasonText
		WCHSInfoID_system;
run;

data hbirths.Infant_import;
	infile "/folders/myfolders/HB/SourceData/Infant.csv" dsd firstobs = 2 ;

	informat
		InfantName				$30.
		InfantSex				$6.
		LbInfantWeight			2.
		OzInfantWeight			2.
		GramInfantWeight      	5.
		InftWeightNull			1.
		OneMinAPGARScore		2.
		FiveMinAPGARScore		2.
		APGARNull				1.
		DeliveryDate			mmddyy10.
		DelvryDateNull			1.
		PregOutome				$15.
		MotherID_system			7.;
		
	input
		InfantName
		InfantSex
		LbInfantWeight
		OzInfantWeight
		GramInfantWeight
		InftWeightNull
		OneMinAPGARScore
		FiveMinAPGARScore
		APGARNull
		DeliveryDate
		DelvryDateNull
		PregOutome
		MotherID_system;
run;

data hbirths.Mother_import;
	infile "/folders/myfolders/HB/SourceData/Mother.csv" dsd firstobs = 2 ;

	informat
		HBID_system					7.
		FormDate					mmddyy10.
		OriginalUser				$10.
		LastUser					$10.
		CheckoutUser				$10.
		CheckoutDate				mmddyy10.
		MotherID_system				7.
		MotherFirstName				$30.
		MotherMidInitial			$1.
		MotherLastName				$30.
		MotherBirthDate				mmddyy10.
		MothrBdateNull				1.
		MotherSSN					10.
		MothrSSNNull				1.
		StateTempID					20.
		MotherOtherPrimLang			$25.
		PreNatalSite				$25.
		MotherPrimaryLang			$25.
		MotherRace					$25.
		HospMRNumber				$20.
		MRNumbNull					1.
		HospRoomNumber				$10.
		GravidaNumber				2.
		GravidaNumNull				1.
		PrimiPara					1.
		ParaNumber					2.
		ParaNull					1.
		InfantGestNumWeek			2.
		InfantGestNumDay			1.
		GestationNull				1.
		DeliveryDate				mmddyy10.
		ProblemNote					$75.
		PrenatalSiteOther			$25.
		NumBirth					2.
		WhiteRoseFlag				1.	
		DeliverySIte				$25.
		DeliveryType				$25.
		WellClinicApptDate			mmddyy10.
		WellClinicApptNote			$50.
		WellClinicOther				$50.
		PostPartumApptDate			mmddyy10.
		PostPartumApptNote			$50.
		PostPartumOther				$50.
		Insurance					$20.
		PostPartumSIte				$25.
		WellClinic					$30.
		ContraceptiveMethod			$25.
		FeedingType					$25.
		WCHSinfo_system				7.
		WCHSMedRecNumber			12.
		FamPlanChrt					1.
		MCCName						$30.
		TeenFlag					1.
		PCMSVisitDate				mmddyy10.
		WICFlag						1.
		PCMSMedicaidFlag			1.
		CreateDate					mmddyy10.;
		
	input
		HBID_system
		FormDate
		OriginalUser
		LastUser
		CheckoutUser
		CheckoutDate
		MotherID_system
		MotherFirstName
		MotherMidInitial
		MotherLastName
		MotherBirthDate
		MothrBdateNull
		MotherSSN
		MothrSSNNull
		StateTempID
		MotherOtherPrimLang
		PreNatalSite
		MotherPrimaryLang
		MotherRace
		HospMRNumber
		MRNumbNull
		HospRoomNumber
		GravidaNumber
		GravidaNumNull
		PrimiPara
		ParaNumber
		ParaNull
		InfantGestNumWeek
		InfantGestNumDay
		GestationNull
		DeliveryDate
		ProblemNote
		PrenatalSiteOther
		NumBirth
		WhiteRoseFlag
		DeliverySIte
		DeliveryType
		WellClinicApptDate
		WellClinicApptNote
		WellClinicOther
		PostPartumApptDate
		PostPartumApptNote
		PostPartumOther
		Insurance
		PostPartumSIte
		WellClinic
		ContraceptiveMethod
		FeedingType
		WCHSinfo_system
		WCHSMedRecNumber
		FamPlanChrt
		MCCName
		TeenFlag
		PCMSVisitDate
		WICFlag
		PCMSMedicaidFlag
		CreateDate;
run;

data hbirths.Phone_import;
	infile "/folders/myfolders/HB/SourceData/Phone.csv" dsd firstobs = 2 ;

	informat
		PhoneNumber			$15.
		PhoneComment		$50.
		PhoneType			$10.
		MotherID_system		7.;
		
	input
		PhoneNumber
		PhoneComment
		PhoneType
		MotherID_system;
run;

data hbirths.Program_import;
	infile "/folders/myfolders/HB/SourceData/Program.csv" dsd firstobs = 2 ;

	informat
		WCHSProgram			$20.
		MotherID_system		7.;
		
	input
		WCHSProgram
		MotherID_system;
run;
