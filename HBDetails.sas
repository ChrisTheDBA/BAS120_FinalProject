LIBNAME hbirths "/folders/myfolders/HB";

data hbirths.Births;
	infile "/folders/myfolders/HB/HBDetails.csv" dsd firstobs = 2 ;
	informat HBID					6.
		  FormDate					mmddyy10.
		  MotherID                  6.
		  MotherBirthDate           mmddyy10.
		  MothrBDateNull            1.
		  MothrSSNNull				1.
		  PrimaryLanguage           $15.
		  MotherOtherPrimLang       $15.
		  Race                      $15.
		  GravidaNumber             2.
		  PrimiPara                 1.
		  ParaNumber                2.
		  InfantGestNumWeek         2.
		  InfantGestNumDay          1.
		  GestationNull             1.
		  ProblemNote               $50.
		  PrenatalSiteOther         $20. 
		  NumBirth                  1.
		  NumBirthDesc              $6.
		  DeliveryType              $10.
		  PrenatalSite              $15.
		  DelSite                   $15.
		  WellClinicApptDate        mmddyy10.
		  WellClinicApptNote        $80.
		  WellClinicOther           $20.       
		  PostPartumApptDate        mmddyy10.
		  PostPartumApptNote        $80.
		  PostPartumOther           $30.        
		  WellClinic                $20.
		  FeedingType               $10.
		  PostPartum                $10.
		  ContraMethod              $20.
		  WCHSInfoID                6.
		  WCHSMedRecNumber          10.
		  FamPlanChrt               1.
		  MCCName                   $30.
		  TeenFlag                  1.
		  WICFlag                   1.
		  Insurance                 $15.
		  Mo 						$char6.
		  Year 						$char4.;
	input HBID
		  FormDate
		  MotherID
		  MotherBirthDate
		  MothrBDateNull
		  MothrSSNNull
		  PrimaryLanguage
		  MotherOtherPrimLang
		  Race
		  GravidaNumber
		  PrimiPara
		  ParaNumber
		  InfantGestNumWeek
		  InfantGestNumDay
		  GestationNull
		  ProblemNote
		  PrenatalSiteOther
		  NumBirth
		  NumBirthDesc
		  DeliveryType
		  PrenatalSite
		  DelSite
		  WellClinicApptDate
		  WellClinicApptNote
		  WellClinicOther
		  PostPartumApptDate
		  PostPartumApptNote
		  PostPartumOther
		  WellClinic
		  FeedingType
		  PostPartum
		  ContraMethod
		  WCHSInfoID
		  WCHSMedRecNumber
		  FamPlanChrt
		  MCCName
		  TeenFlag
		  WICFlag
		  Insurance;
 
run;

data hbirths.Addresses;
	infile "/folders/myfolders/HB/HBAddress.csv" dsd firstobs = 2 ;
	informat AddressType 	$20.
			City			$25.
			ZipCode			$9.
			State			$2.
			AddressComment	$80.
			MotherID		6.;
	imput AddressType
			City
			ZipCode
			State
			AddressComment
			MotherID;
run;

data hbirths.Infants;
	infile "/folders/myfolders/HB/HBInfant.csv" dsd firstobs = 2 ;
	informat MotherID			6.
			LbInfantWeight		3.
			OzInfantWeight		2.
			GramInfantWeight	5.
			InftWeightNull		1.
			OneMinAPGARScore	1.
			APGARNull			1.
			FiveMinAPGARScore	1.
			InfantSex			$6.
			DeliveryDate		mmddyy10.
			DelvryDateNull		1.
			PregOutcome			$20.;
	imput MotherID
			LbInfantWeight
			OzInfantWeight
			GramInfantWeight
			InftWeightNull
			OneMinAPGARScore
			APGARNull
			FiveMinAPGARScore
			InfantSex
			DeliveryDate
			DelvryDateNull
			PregOutcome;
run;

data hbirths.geoteam;
	infile '/folders/myfolders/hb/HBGeoteam.csv' firstobs=2 dsd;
	informat GeoTeamAssgnID  			6.
		GeoTeamAssgnUser				$15.
		GeoteamAssgnDate				mmddyy10.
		GeoTeamAssgnReasonText			$60.
		Geoteam2gbst_elm				6.
		GeoTeamChangeHist2WCHSInfo		6.
		ID								6.
		Desc							$20.
		Status							$10.
		Is_System						1.
		gbst_elm2gbst_lst				6.;
	input GeoTeamAssgnID
		GeoTeamAssgnUser
		GeoteamAssgnDate
		GeoTeamAssgnReasonText
		Geoteam2gbst_elm
		GeoTeamChangeHist2WCHSInfo
		ID
		Desc
		Status
		Is_System
		gbst_elm2gbst_lst;
run;
	
