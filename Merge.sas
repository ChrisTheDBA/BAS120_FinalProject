LIBNAME hbirths "/folders/myfolders/HB";

proc sort data=hbirths.address_import;
	By MotherID_system;
run;

proc sort data=hbirths.mother_import;
	by MotherID_system;
run;

proc sort data =hbirths.infant_import;
	By MotherID_system;
run;

proc sort data =hbirths.phone_import;
	By MotherID_system;
run;

proc sort data =hbirths.program_import;
	By MotherID_system;
run;


data hbirths.hb_merge_1;
	merge 
		hbirths.mother_import(in=a) 
		hbirths.infant_import
		hbirths.address_import 
		hbirths.phone_import 
		hbirths.program_import; 
	by MotherID_system;
	if a;
run;



proc sort data =hbirths.currentgeoteam_import;
	By WCHSInfoID_system;
run;

proc sort data =hbirths.geoteam_import;
	By WCHSInfoID_system;
run;

proc sort data=hbirths.hb_merge_1;
	by WCHSinfo_system;
run;

data hbirths.healthybirths_merge;
	merge 
		hbirths.hb_merge_1(RENAME = (WCHSInfo_system = WCHSInfoID_system) in=a)
		/* hbirths.geoteam_import */
		hbirths.currentgeoteam_import;
	by WCHSInfoID_system;
	if a;
run;
 
 

