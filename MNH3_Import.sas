***************************************************************************************************************************************************************************
Filename: MNH3_Import.sas
Location: /rtpnfil03/rtpnfil03_vol5/ANCPNC_Collective/Data Monitoring and Analysis/Datasets/Programs
Project: ARC PRiSMA MNH
Authors: Kay Hwang, Toby Bader
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------
Description: 	This program pulls the data from Synapse and creates a SAS dataset for each form with labels and formats added. 
				A macro is used to convert character values to numeric and date for variables that contain numbers or are in a date
				or date time format. 

				Currently includes data from Kenya and Ghana

				ADD MORE DETAILS

---------------------------------------------------------------------------------------------------------------------------------------------------------------------------
Input: CSV Files Downloaded from Synapse Using R:
/RTPNFIL03/ANCPNC_Collective/Data Monitoring and Analysis/Datasets/CSV Files
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------
Output:	SAS Datasets 
/rtpnfil03/rtpnfil03_vol5/ANCPNC_Collective/Data Monitoring and Analysis/Datasets/SAS Datasets/MNH01.sas7bdat
/rtpnfil03/rtpnfil03_vol5/ANCPNC_Collective/Data Monitoring and Analysis/Datasets/SAS Datasets/MNH02.sas7bdat
/rtpnfil03/rtpnfil03_vol5/ANCPNC_Collective/Data Monitoring and Analysis/Datasets/SAS Datasets/MNH03A.sas7bdat
/rtpnfil03/rtpnfil03_vol5/ANCPNC_Collective/Data Monitoring and Analysis/Datasets/SAS Datasets/MNH03B.sas7bdat
/rtpnfil03/rtpnfil03_vol5/ANCPNC_Collective/Data Monitoring and Analysis/Datasets/SAS Datasets/MNH04.sas7bdat
/rtpnfil03/rtpnfil03_vol5/ANCPNC_Collective/Data Monitoring and Analysis/Datasets/SAS Datasets/MNH05.sas7bdat
/rtpnfil03/rtpnfil03_vol5/ANCPNC_Collective/Data Monitoring and Analysis/Datasets/SAS Datasets/MNH06.sas7bdat
/rtpnfil03/rtpnfil03_vol5/ANCPNC_Collective/Data Monitoring and Analysis/Datasets/SAS Datasets/MNH07.sas7bdat
/rtpnfil03/rtpnfil03_vol5/ANCPNC_Collective/Data Monitoring and Analysis/Datasets/SAS Datasets/MNH08.sas7bdat
/rtpnfil03/rtpnfil03_vol5/ANCPNC_Collective/Data Monitoring and Analysis/Datasets/SAS Datasets/MNH09.sas7bdat
/rtpnfil03/rtpnfil03_vol5/ANCPNC_Collective/Data Monitoring and Analysis/Datasets/SAS Datasets/MNH10.sas7bdat
/rtpnfil03/rtpnfil03_vol5/ANCPNC_Collective/Data Monitoring and Analysis/Datasets/SAS Datasets/MNH10T.sas7bdat
/rtpnfil03/rtpnfil03_vol5/ANCPNC_Collective/Data Monitoring and Analysis/Datasets/SAS Datasets/MNH11.sas7bdat
/rtpnfil03/rtpnfil03_vol5/ANCPNC_Collective/Data Monitoring and Analysis/Datasets/SAS Datasets/MNH12.sas7bdat
/rtpnfil03/rtpnfil03_vol5/ANCPNC_Collective/Data Monitoring and Analysis/Datasets/SAS Datasets/MNH13.sas7bdat
/rtpnfil03/rtpnfil03_vol5/ANCPNC_Collective/Data Monitoring and Analysis/Datasets/SAS Datasets/MNH14.sas7bdat
/rtpnfil03/rtpnfil03_vol5/ANCPNC_Collective/Data Monitoring and Analysis/Datasets/SAS Datasets/MNH15.sas7bdat
/rtpnfil03/rtpnfil03_vol5/ANCPNC_Collective/Data Monitoring and Analysis/Datasets/SAS Datasets/MNH16.sas7bdat
/rtpnfil03/rtpnfil03_vol5/ANCPNC_Collective/Data Monitoring and Analysis/Datasets/SAS Datasets/MNH20.sas7bdat
/rtpnfil03/rtpnfil03_vol5/ANCPNC_Collective/Data Monitoring and Analysis/Datasets/SAS Datasets/MNH21.sas7bdat
/rtpnfil03/rtpnfil03_vol5/ANCPNC_Collective/Data Monitoring and Analysis/Datasets/SAS Datasets/MNH22.sas7bdat
/rtpnfil03/rtpnfil03_vol5/ANCPNC_Collective/Data Monitoring and Analysis/Datasets/SAS Datasets/MNH23.sas7bdat
/rtpnfil03/rtpnfil03_vol5/ANCPNC_Collective/Data Monitoring and Analysis/Datasets/SAS Datasets/MNH24.sas7bdat
/rtpnfil03/rtpnfil03_vol5/ANCPNC_Collective/Data Monitoring and Analysis/Datasets/SAS Datasets/MNH25.sas7bdat
/rtpnfil03/rtpnfil03_vol5/ANCPNC_Collective/Data Monitoring and Analysis/Datasets/SAS Datasets/MNH_Meta.sas7bdat
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------
Program History: 

Date				Author							Modification
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------
04/15/2021			Janet Moore						Initial program shell
05/11/2021 		    Toby Bader	                    Initial import
05/12/2021 		    Kay Hwang	                    Add macro to convert character to numeric
06/10/2021			Kay Hwang						Update Import CSV Macro to handle special carriages
06/14/2021			Toby Bader						Update Import CSV Macro to remove duplicate IDs
06/22/2021			Janet Moore						Add in meta data dataset (likely needs revisions - at end of program)
07/06/2021			Janet Moore						Add MN10T - not sure which table is trailing
07/15/2021			Janet Moore						Add basic code for the remaining forms MNH02, MNH03A, MNH03B, MNH17, MNH18,
													MNH19, MNH22, MNH23 and MNH24. Could not find tables for MNH16 and MNH21.
													Renamed MNH07A/B to MNH07 and MNH07T, Renamed MNH14A/B to MNH14 and MNH14T
													Correct sort IDs for all datasets to use caseid/participantid, Add form names
07/20/2021			Janet Moore						Add Ghana
07/22/2021			Kay Hwang						Combine Ghana and Kenya data
07/23/2021			Kay Hwang						Rename variables
08/09/2021			Janet Moore						Add prefix to MNH01, MNH06, MNHMeta
08/10/2021			Toby Bader						Add prefix to remaining forms
08/17/2021			Toby Bader						Update lengths to address truncation warnings
08/20/2021			Toby Bader						Update labels, formats, and frequency checks for MNH05, MNH13, MNH15, MNH20, MNH25
08/25/2021			Kay Hwang						Add MNH07, MNH08
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------
Notes: Currently only data from Kenya and Ghana
***************************************************************************************************************************************************************************

*MNH Libraries*;
%include "/rtpnfil03/rtpnfil03_vol5/ANCPNC_Collective/Data Monitoring and Analysis/Datasets/Programs/MNH1_Libraries.sas" / source2;

*Format Options*; 
options nodate nonumber fmtsearch=(mnhfmt.mnh_formats) nofmterr validvarname=v7; *mlogic symbolgen mprint;

*Macros*;
%include "/rtpnfil03/rtpnfil03_vol5/ANCPNC_Collective/Data Monitoring and Analysis/Datasets/Programs/Macros/Dataset Processing/char2num.sas" / source2;
%include "/rtpnfil03/rtpnfil03_vol5/ANCPNC_Collective/Data Monitoring and Analysis/Datasets/Programs/Macros/Dataset Processing/varsuffix.sas" / source2;
%include "/rtpnfil03/rtpnfil03_vol5/ANCPNC_Collective/Data Monitoring and Analysis/Datasets/Programs/Macros/Dataset Processing/varprefix.sas" / source2;
%include "/rtpnfil03/rtpnfil03_vol5/ANCPNC_Collective/Data Monitoring and Analysis/Datasets/Programs/Macros/SAS Templates/customc.sas" / source2;

**Macro to Import CSV Files, Delete Duplicates**;
%macro importcsv(dout=, tablename=);
filename inf temp;
data _null_;
  file inf;
  infile "/rtpnfil03/rtpnfil03_vol5/ANCPNC_Collective/Data Monitoring and Analysis/Datasets/CSV Files/&tablename..csv";
  input;
  put _infile_;
   if _n_=1 then do;
     do i=1 to countw(_infile_,',','mq');
       if i>1 then put ',' @;
       put '**********' @ ;
     end;
     put;
   end;
run;
proc import out=_&dout. dbms=csv replace
datafile=inf;
datarow=2; GUESSINGROWS=MAX;
run;
data &dout.; set _&dout.; drop row_id; run;
proc sort data=&dout.
nodupkey;
by id;
run;
proc datasets nolist;
delete _&dout.;
quit;
%mend;

*Macro to import CSV files forms and merge together form that is split into muliple files*;
%macro impmerge(sitename=, form=, tabname=, tabnum=, othertab1=, othertab2=, format=);
*Import csv files from Synapes for each site - currently only data from Kenya, may be more than one table per form*;
%do i=1 %to &tabnum;
%importcsv(dout=&sitename._&form._&i., tablename=&sitename._&tabname._&i.);
proc sort data=&sitename._&form._&i.; by id; run;
%end;
%if &othertab1^= %then %do;
%let next_tabnum1 = %eval(&tabnum. + 1);
%importcsv(dout=&sitename._&form._&next_tabnum1., tablename=&sitename._&othertab1.);
proc sort data=&sitename._&form._&next_tabnum1.; by id; run;
%end;
%if &othertab2^= %then %do;
%let next_tabnum2 = %eval(&tabnum. + 2);
%importcsv(dout=&sitename._&form._&next_tabnum2., tablename=&sitename._&othertab1.);
proc sort data=&sitename._&form._&next_tabnum2.; by id; run;
%end;
data &form._&sitename.;
&format.
merge &sitename._&form._:;
by id;
run; 
proc datasets nolist;
delete &sitename._&form._:;
quit;
%mend;


***************************************************************************************************************************************************************************
**Import CSV files for each Synapse table for each ARC MNH form by site**;
**Merge multiple CSV files for forms that were split due to Synapes variable limits**;
**Set Form Data from each site**;
**Run Char2Num macro to convert applicable character variables to numeric or date variables**;
**Output a processed SAS dataset for each MNH form**;
***************************************************************************************************************************************************************************


**MNH01: Screening and Enrollment**;

*Import csv files from Synapes for each site - may be more than one table per form*;
%importcsv(dout=mnh01_kenya, tablename=kenya_mnh_screening_and_enrollment_v2_1);
%impmerge(sitename=ghana, form=mnh01, tabname=mnh_screening_and_enrollment_v2, tabnum=2, othertab1=mnh_screening_and_enrollment_v2, othertab2=, format=);
proc import out=mnh01_pakistan dbms=csv replace
datafile="/rtpnfil03/rtpnfil03_vol5/ANCPNC_Collective/Data Monitoring and Analysis/Datasets/CSV Files/pakistan_MNH01_Screening_enrollement.csv";
datarow=2; GUESSINGROWS=MAX;
run;

/*ods noproctitle;*/
/*title 'MNH ARC Pakistan MNH01 Frequencies';*/
/*ods rtf file="/rtpnfil03/rtpnfil03_vol5/ANCPNC_Collective/Data Monitoring and Analysis/Datasets/ARC MNH Pakistan MNH01 Frequencies (2021.08.25).rtf" startpage=off style=customc;*/
/*proc freq data=mnh01_pakistan;*/
/*tables _all_;*/
/*run;*/
/*ods rtf close;*/

*Set datasets from each site and create site indicator;
data mnh01_char;
length 
EXCL_RSN_SPFY_IEORRES $60
ENR_MOTHER_VILLAGE_SCORRES $50
UNIQUEID1_SCORRES $15
UNIQUEID3_SCORRES $41;
set mnh01_kenya (in=inken) mnh01_ghana (in=ingha);
if caseid="**********" then delete;

*Site number for reports*;
if inken then siten=3;
	else if ingha then siten=2;

if PCM_IEORRES_1="BABATOKUMA" then PCM_IEORRES_1="";
if PCM_IEORRES_1="BANIANTWE" then PCM_IEORRES_1="";
if PCM_IEORRES_1="GULUMPE" then PCM_IEORRES_1="";

*Rename variables > 32 characters;
rename	SCRN_FAC_OBSLOC_region_descendan = SCRN_FAC_OBSLOC_region_dcnt
		SCRN_FAC_OBSLOC_location_descend  = SCRN_FAC_OBSLOC_location_dcnt
		SCRN_FAC_OBSLOC_facility_descend  = SCRN_FAC_OBSLOC_facility_dcnt
		SCRN_OBSLOC_Region_descendantsCo  = SCRN_OBSLOC_Region_dcnt
		SCRN_OBSLOC_District_descendants  = SCRN_OBSLOC_District_dcnt
		SCRN_OBSLOC_Type_descendantsCoun = SCRN_OBSLOC_Type_dcnt
 		SCRN_FAC_OBSLOC_location_label=SCRN_FAC_OBSLOC_LocLab 
		SCRN_FAC_OBSLOC_location_id=SCRN_FAC_OBSLOC_LocID 
		SCRN_FAC_OBSLOC_facility_label=SCRN_FAC_OBSLOC_FacLab 
		SCRN_FAC_OBSLOC_facility_id=SCRN_FAC_OBSLOC_FacID
		SCRN_OBSLOC_Village_or_Facility=SCRN_OBSLOC_Village 
		SCRN_OBSLOC_Village_or_Facility_=SCRN_OBSLOC_Village_
		SCRN_OBSLOC_Type_locationType=SCRN_OBSLOC_LocType 
		ENR_MOTHER_CONTACT_YN_SCORRES=ENR_MOM_CONTACT_YN_SCORRES;
run;
*Convert to numeric (continuous, check one and date variables - Dates contain text NA, Check one contain NA and SKIPPED)*;
%char2num(inputdsn=mnh01_char, outputdsn=mnh01_num, excludevars=);
proc contents data=mnh01_num order=varnum; run;
proc freq data=mnh01_num; tables _char_; run;

*Set converted dataset, add labels, add formats, review variables and drop system variables that are not useful;
data mnh01;
set mnh01_num;
*Delete empty records - Check if several key questions are all missing;
if cmiss(SCRN_OBSSTDAT, AGE_IEORRES, PC_IEORRES, EXCL_YN_IEORRES, CON_YN_DSDECOD, CON_DSSTDAT, SUBJID_YN, BRTHDAT, 
	LMP_RELIABLEYN_SCORRES, ESTIMATED_EDD_SCDAT)=10 then delete;
*Label variables - can make this more automated later*;
label	/*caseId="Case ID"
		participantId="Participant ID"
		eventId="Event ID"*/
		SITEN="Site number for reports"
		SUBJID="Subject ID"
		SCRNID="Screening ID"
		SCRN_OBSSTDAT="Screening Date"
		SCRN_OBSLOC="Screening Location"
		SCRN_FAC_OBSLOC_region_label="MNH01 Facility region"	
		SCRN_FAC_OBSLOC_region_id="MNH01 Facility region ID"	
		SCRN_FAC_OBSLOC_LocLab="MNH01 Facility location"	
		SCRN_FAC_OBSLOC_LocID="MNH01 Facility locationID"	
		SCRN_FAC_OBSLOC_FacLab="MNH01 Facility name"		
		SCRN_FAC_OBSLOC_FacID="MNH01 Facility ID"	
		SCRN_FAC_SPFY_OBSLOC="MNH01 Specify other location"
		AGE_IEORRES="Is maternal age >= 18 years (or legal age of consent per local regulations)?"
		PC_IEORRES="Has pregnancy been confirmed?"
		PCM_IEORRES="Specify pregnancy confirmation method"
		EXCL_YN_IEORRES="Is there any other reason to exclude the mother from participating in this study?"
		EXCL_RSN_IEORRES_1="Specify reason for exclusion: Not feasible to collect minimal required data" 
		EXCL_RSN_IEORRES_2="Specify reason for exclusion: Medical contraindication" 
		EXCL_RSN_IEORRES_88="Specify reason for exclusion: Other"
		EXCL_RSN_SPFY_IEORRES="Specify other reason for exclusion"
		CON_OTHR_DSDECOD_1="Witness required for consent" 
		CON_OTHR_DSDECOD_2="Legally authorized representative required for consent" 
		CON_OTHR_DSDECOD_77="Not applicable, only mother required for consent"
		CON_YN_DSDECOD="Is mother willing and able to provide consent?"
		CON_SIGNYN_DSDECOD="Is mother able to provide signature?"
		CON_DSSTDAT="Date consent signed"
		CON_SIGNATURE_PRYN="Confirm that mother provided consent on paper form"
/*		CON_DSSTDAT="Date consent obtained"*/
		CON_WITNESS_SIGNDAT="Date that witness signed consent"
		CON_LAR_SIGNDAT="Date that legal representative signed consent"
		CON_FUTURE_RES_DSDECOD="Indicate whether the mother authorizes the storage of data collected from herself or her baby as part of this study for use in future research"
		CON_NOTIFY_DSDECOD="Indicate whether mother wishes to be notified by investigators in the event of research findings of possible importance to herself or family members and agrees that her information (telephone number, etc) may be used to locate her in the future"
		CON_COVID_HDSS_DSDECOD="Indicate whether the mother authorizes the the linkage of her COVID-19 data to the HDSS and other research data"
		SUBJID_YN="Were you able to scan the study ID?"
		KNOWN_DOBYN_SCORRES="Is mother's exact date of birth known?"
		BRTHDAT="Mother's date of birth"
		ESTIMATED_AGE="If mother's date of birth is unknown, estimate age in years"
		KNOWN_LMP_SCORRES="Does the mother know the date of her last menstrual period (LMP)?"
		LMP_SCDAT="Record date of mother's last menstrual period (LMP)"
		LMP_RELIABLEYN_SCORRES="Is the date of LMP reliable?"
		GEST_AGE_LMP_SCORRES="GA based on LMP"
		GEST_AGE_AVAILYN_SCORRES="Is estimated GA available?"
		GEST_AGE_WKS_SCORRES="Estimated GA in weeks"
		GEST_AGE_MOS_SCORRES="Estimated GA in months"
		ESTIMATED_EDD_SCDAT="EDD based on LMP"
		EDD_AVAILYN_SCORRES="Is EDD available?"
		EDD_SCDAT="Record EDD"
		RESIDE_CATCH_YN_SCORRES="Does the mother currently reside in the study catchment area?"
		DELIVER_CATCH_YN_SCORRES="Does the mother intend to deliver in the study catchment area?"
		ENR_MOTHER_VILLAGE_SCORRES="Village of residence"
		SURV_STUDY_YN_SCORRES="Is mother enrolled in the pregnancy surveillance study?"
		SURV_STUDY_SUBJID="Record pregnancy surveillance study ID"
		UNIQUEID1_YN_SCORRES="Would you like to record an HDSS ID for this participant?"
		UNIQUEID1_SCORRES="Record the HDSS ID number"
		UNIQUEID2_YN_SCORRES="Would you like to record a facility registration ID for this participant?"
		UNIQUEID2_SCORRES="Record the facility registration ID"
		UNIQUEID3_YN_SCORRES="Would you like to record any other unique ID for this participant?"
		UNIQUEID3_SCORRES="Record unique ID 3"
		UNIQUEID3_TYPE_SCORRES="Specify type of ID"
		COYN="Would you like to provide any additional comments about screening, enrollment, or consent?"
		/*COVAL="Provide comments"
		FORMCOMPLID="Record indentifier of person completing this form, as appropriate for your site (e.g., Name, initials, ID, or code)"*/
		complete="Tangerine form completion variable?"
		caseid="Tangerine noted case ID"
		participantid="Tangerine noted participant ID"
		eventid="Tangerine noted event ID"
		eventformid="Tangerine noted form ID"
		startUnixtime="Tangerine noted Unix time";
*Format variables*;
format  AGE_IEORRES PC_IEORRES EXCL_YN_IEORRES CON_YN_DSDECOD CON_SIGNYN_DSDECOD KNOWN_DOBYN_SCORRES LMP_RELIABLEYN_SCORRES
		KNOWN_LMP_SCORRES RESIDE_CATCH_YN_SCORRES DELIVER_CATCH_YN_SCORRES SURV_STUDY_YN_SCORRES UNIQUEID1_YN_SCORRES 
		UNIQUEID2_YN_SCORRES UNIQUEID3_YN_SCORRES COYN EDD_AVAILYN_SCORRES complete SUBJID_YN yn. 
		EXCL_RSN_IEORRES_1 EXCL_RSN_IEORRES_2 EXCL_RSN_IEORRES_88 CON_OTHR_DSDECOD_1 CON_OTHR_DSDECOD_2 CON_OTHR_DSDECOD_77 ckall.
		SCRN_OBSSTDAT CON_DSSTDAT CON_WITNESS_SIGNDAT CON_LAR_SIGNDAT BRTHDAT LMP_SCDAT EDD_SCDAT date9. SCRN_OBSLOC MNH01_SCRN_OBSLOC.
		PCM_IEORRES MNH01_PCM_IEORRES. CON_SIGNATURE_PRYN MNH01_CON_SIGNATURE_PRYN. CON_FUTURE_RES_DSDECOD MNH01_CON_FUTURE_RES_DSDECOD.
		CON_NOTIFY_DSDECOD MNH01_CON_NOTIFY_DSDECOD. CON_COVID_HDSS_DSDECOD MNH01_CON_COVID_HDSS_DSDECOD. GEST_AGE_AVAILYN_SCORRES MNH01_GA_AVAILYN.;
*Drop Tangerine variables that are not useful;
drop 	ROW_VERSION formId formtitle buildId buildChannel groupId
		instructions Eligability_msg_no Eligibility_msg_yes eligsummary Consent_1 Consent_2 Consent_3 Consent_4
		Consent_Complet Sign_instructions sign_instructions_1b sign_instructions2 instructions2 instructions3 study_id_valid_msg_no
		study_id_valid_msg_yes calc_outputs calc_outputs2 Surveil_Intro enrolled eligible_non_consent_msg CON_DSSTDAT2
		barcode_data BARCODE_OUTPUT CONFIRMATION CONSENT_COMPLET2
		ANCOV1 ANCOV2 ANCOV2_1 ANCOV2_2 ANCOV2_3 ANCOV2_4 ANCOV2_5 ANCOV2_6 ANCOV3 ANCOV4 ANCOV_CON_DSSTDAT ANCOV_CON_LAR_SIGNDAT 
	    ANCOV_CON_SIGNATURE_PRYN ANCOV_CON_WITNESS_SIGNDAT ANCOV_CON_YN_DSDECOD ANCOV_NOTICE_DSDECOD ANCOV_SHIP_DSDECOD 
	    ANCOV_STORAGE_DSDECOD ANC_PREENROLL_1 ANC_PREENROLL_10 ANC_PREENROLL_2 ANC_PREENROLL_3 ANC_PREENROLL_4 ANC_PREENROLL_5 
	    ANC_PREENROLL_6 ANC_PREENROLL_7 ANC_PREENROLL_8 ANC_PREENROLL_9 ANC_PREENROLL_N ANC_PREENROLL_YN ANC_PRSCHDAT ANC_PRSCHDAT_YN 
	    CON_MNH_HDSS_DSDECOD FIRST_ANC_TODAY_YN HIDENEXT1 HIDENEXT2 HIDENEXT3 MANUAL_EVENT MNH06_TODAY_YN STUDY_ID_IN_USE_MSG_NO
		SCRN_FAC_OBSLOC_region SCRN_FAC_OBSLOC_region_parent SCRN_FAC_OBSLOC_region_level SCRN_FAC_OBSLOC_region_dcnt 
		SCRN_FAC_OBSLOC_location SCRN_FAC_OBSLOC_location_parent SCRN_FAC_OBSLOC_location_level SCRN_FAC_OBSLOC_location_dcnt
		SCRN_FAC_OBSLOC_facility SCRN_FAC_OBSLOC_facility_parent SCRN_FAC_OBSLOC_facility_level SCRN_FAC_OBSLOC_facility_dcnt
		SCRN_OBSLOC_Region_dcnt SCRN_OBSLOC_District_dcnt SCRN_OBSLOC_Type_dcnt
		eligible_non_consent_msg1 eligible_non_consent_msg2 eligible_non_consent_msg3 
		assntprocess ASSNT_YN_DSDECOD motherpaperconsent motherthumbprintconsent 
		ASSNT_SIGNATURE_PRYN motherpaperassnt ASSNT_DSSTDAT conlegal conreminder 
		CON_LAR_YN_DSDECOD conpaperlegal thumbprintlegalrep CON_LAR_SIGNATURE_PRYN 
		deviceId subjid_entered id SCRN_OBSLOC_Region SCRN_OBSLOC_Region_parent 
		SCRN_OBSLOC_Region_label SCRN_OBSLOC_Region_id SCRN_OBSLOC_Region_level
		SCRN_OBSLOC_District SCRN_OBSLOC_District_parent SCRN_OBSLOC_District_label 
		SCRN_OBSLOC_District_id SCRN_OBSLOC_District_level 
		SCRN_OBSLOC_Type_parent SCRN_OBSLOC_Type_label SCRN_OBSLOC_Type_id
		SCRN_OBSLOC_Type_level   
		 VAR41 VAR42 VAR43 VAR44 SCRN_VILLAGE_OBSLOC 
		SCRN_Loc_other_OHOLOC PCM_IEORRES_1 PCM_IEORRES_2 PCM_IEORRES_3 PCM_IEORRES_4 
		AGE_18_IEORRES rem LITERATE_IEORRES LITERATE_LAR_IEORRES mcon wcon 
		mconwrite mconprint mprint CON_SAMPLES_DSDECOD instructionslmp 
		CON_WITNESS_SIGNATURE_PRYN witnessmustsign  
		ENR_ALT_CONTACT_YN_SCORRES MULT_FAC_YN FAC_NUM enrolled1 enrolled2 
		WEIGHT_PEPERF WEIGHT_PREV_PEPERF WEIGHT_PERES WEIGH_PREV_PERES HEIGHT_PEPERF 
		HEIGHT_PREV_PEPERF HEIGHT_PERES HEIGHT_PREV_PERES _id 
		SCRN_OBSLOC_Type SCRN_OBSLOC_LocType SCRN_OBSLOC_Village SCRN_OBSLOC_Village_ ENR_MOM_CONTACT_YN_SCORRES;
run;

**Add prefix of M01_;
%varprefix(dset=mnh01, prefix=M01_, keepname="caseid" "scrnid" "participantid" "eventid" "eventformid" "siten")

*Check data;
proc contents data=mnh01 order=varnum; run;
proc freq data=mnh01;
*Variables in DD;
tables 	siten M01_SCRN_OBSSTDAT M01_SCRN_FAC_OBSLOC_region_label M01_SCRN_FAC_OBSLOC_region_id M01_SCRN_FAC_OBSLOC_LocLab
		M01_SCRN_FAC_OBSLOC_LocID M01_SCRN_FAC_OBSLOC_FacLab M01_SCRN_FAC_OBSLOC_FacID	
		M01_SCRN_FAC_SPFY_OBSLOC M01_AGE_IEORRES M01_PC_IEORRES M01_PCM_IEORRES M01_EXCL_YN_IEORRES M01_EXCL_RSN_IEORRES_1 
		M01_EXCL_RSN_IEORRES_2 M01_EXCL_RSN_IEORRES_88 M01_EXCL_RSN_SPFY_IEORRES M01_CON_YN_DSDECOD M01_CON_OTHR_DSDECOD_1 M01_CON_OTHR_DSDECOD_2 
		M01_CON_OTHR_DSDECOD_77 M01_CON_SIGNYN_DSDECOD M01_CON_SIGNATURE_PRYN M01_CON_DSSTDAT M01_CON_WITNESS_SIGNDAT M01_CON_LAR_SIGNDAT 
		M01_CON_FUTURE_RES_DSDECOD M01_CON_NOTIFY_DSDECOD M01_CON_COVID_HDSS_DSDECOD M01_SUBJID_YN M01_SUBJID M01_KNOWN_DOBYN_SCORRES 
		M01_BRTHDAT M01_ESTIMATED_AGE M01_KNOWN_LMP_SCORRES M01_LMP_SCDAT M01_LMP_RELIABLEYN_SCORRES M01_GEST_AGE_LMP_SCORRES 
		M01_GEST_AGE_AVAILYN_SCORRES M01_GEST_AGE_WKS_SCORRES M01_GEST_AGE_MOS_SCORRES M01_EDD_AVAILYN_SCORRES M01_EDD_SCDAT M01_ESTIMATED_EDD_SCDAT 
		M01_RESIDE_CATCH_YN_SCORRES M01_DELIVER_CATCH_YN_SCORRES M01_ENR_MOTHER_VILLAGE_SCORRES M01_SURV_STUDY_YN_SCORRES M01_SURV_STUDY_SUBJID 
		M01_UNIQUEID1_YN_SCORRES M01_UNIQUEID1_SCORRES M01_UNIQUEID2_YN_SCORRES M01_UNIQUEID2_SCORRES M01_UNIQUEID3_YN_SCORRES M01_UNIQUEID3_SCORRES 
		M01_UNIQUEID3_TYPE_SCORRES M01_COYN M01_Complete;
*Variables not in DD (related to Tangerine);
*tables instructions Eligability_msg_no Eligibility_msg_yes eligsummary Consent_1 Consent_2 Consent_3 Consent_4 Consent_Complet 
		Sign_instructions sign_instructions_1b sign_instructions2 instructions2 instructions3 study_id_valid_msg_no 
		study_id_valid_msg_yes calc_outputs calc_outputs2 Surveil_Intro enrolled eligible_non_consent_msg CON_DSSTDAT2
		complete barcode_data BARCODE_OUTPUT CONFIRMATION CONSENT_COMPLET2;
*Other variables not in DD;
*tables ANCOV1 ANCOV2 ANCOV2_1 ANCOV2_2 ANCOV2_3 ANCOV2_4 ANCOV2_5 ANCOV2_6 ANCOV3 ANCOV4 ANCOV_CON_DSSTDAT ANCOV_CON_LAR_SIGNDAT 
	    ANCOV_CON_SIGNATURE_PRYN ANCOV_CON_WITNESS_SIGNDAT ANCOV_CON_YN_DSDECOD ANCOV_NOTICE_DSDECOD ANCOV_SHIP_DSDECOD 
	    ANCOV_STORAGE_DSDECOD ANC_PREENROLL_1 ANC_PREENROLL_10 ANC_PREENROLL_2 ANC_PREENROLL_3 ANC_PREENROLL_4 ANC_PREENROLL_5 
	    ANC_PREENROLL_6 ANC_PREENROLL_7 ANC_PREENROLL_8 ANC_PREENROLL_9 ANC_PREENROLL_N ANC_PREENROLL_YN ANC_PRSCHDAT ANC_PRSCHDAT_YN 
	    CON_MNH_HDSS_DSDECOD FIRST_ANC_TODAY_YN HIDENEXT1 HIDENEXT2 HIDENEXT3 MANUAL_EVENT MNH06_TODAY_YN STUDY_ID_IN_USE_MSG_NO;
*Facility and GPS;
*tables SCRN_FAC_OBSLOC_region*SCRN_FAC_OBSLOC_region_parent*SCRN_FAC_OBSLOC_region_level*SCRN_FAC_OBSLOC_region_descendan 
		SCRN_FAC_OBSLOC_location*SCRN_FAC_OBSLOC_location_parent*SCRN_FAC_OBSLOC_location_level*SCRN_FAC_OBSLOC_location_descend
		SCRN_FAC_OBSLOC_facility*SCRN_FAC_OBSLOC_facility_parent*SCRN_FAC_OBSLOC_facility_level*SCRN_FAC_OBSLOC_facility_descend / list missing;
*Other vars no longer in data;
*tables caseId participantId eventId eventFormId caseEventId startDatetime;
run;

*In DD, but not in data: CON_LAR_NAME, CON_LAR_SIGN, CON_MOTHER_FAMILY_SCORRES, CON_MOTHER_FIRST_SCORRES, CON_MOTHER_SECOND_SCORRES
 CON_WITNESS_NAME, CON_WITNESS_SIGN, COVAL, ENR_GPS_SCORRES, ENR_MOTHER_ADDRESS_SCORRES, ENR_MOTHER_CONTACT_SCORRES, ENR_OTHR_CONTACT_SCORRES
 FORMCOMPLID, MOTHER_SIGN_SCORRES*;
proc contents data=mnh01;run;
*Output MNH01 datasets;
proc sort data=mnh01 out=mnh.mnh01; by caseid; run;

/*ods EXCEL file="/rtpnfil03/rtpnfil03_vol5/ANCPNC_Collective/Data Monitoring and Analysis/Datasets/Documentation/Contents/mnh01contents.xlsx";
proc contents data=mnh01 order=varnum; run;
ods EXCEL close;*/

**MNH02: Sociodemographic**;
%impmerge(sitename=kenya, form=mnh02, tabname=mnh_sociodemographic, tabnum=1, othertab1=, othertab2=, format=);
%impmerge(sitename=ghana, form=mnh02, tabname=mnh_sociodemographic, tabnum=2, othertab1=mnh_sociodemographic, othertab2=, format=);

data mnh02_char;
format LAND_USE_SPFY_FCORRES $37.; 
length TOILET_OTHR_FCORRES $32
ROOF_SPFY_FCORRES $33
ANIMAL_OTHR_SPFY_FCORRES $12;
set mnh02_kenya(in=inken) mnh02_ghana(in=ingha);
if caseid="**********" then delete;
*Site number for reports*;
if inken then siten=3;
else if ingha then siten=2;

*Rename variables > 32 characters;
rename	SD_FAC_OBSLOC_region_descendants = SD_FAC_OBSLOC_region_dcnt
		SD_FAC_OBSLOC_location_descendan  = SD_FAC_OBSLOC_location_dcnt
		SD_FAC_OBSLOC_facility_descendan  = SD_FAC_OBSLOC_facility_dcnt
		SD_OBSLOC_Region_descendantsCoun  = SD_OBSLOC_Region_dcnt
		SD_OBSLOC_District_descendantsCo  = SD_OBSLOC_District_dcnt
		SD_OBSLOC_Type_descendantsCount = SD_OBSLOC_Type_dcnt
		SD_OBSLOC_Village_or_Facility_de = SD_OBSLOC_Vil_or_Fac_dcnt
		PD_BIRTH_OBSLOC_Region_descendan  = PD_BIRTH_OBSLOC_Region_dcnt
		PD_BIRTH_OBSLOC_District_descend  = PD_BIRTH_OBSLOC_Dis_dcnt
		PD_BIRTH_OBSLOC_Type_descendants  = PD_BIRTH_OBSLOC_Type_dcnt
		SD_FAC_OBSLOC_location_parent=SD_FAC_OBSLOC_loc_parent
		SD_FAC_OBSLOC_facility_parent=SD_FAC_OBSLOC_fac_parent
		SD_OBSLOC_Village_or_Facility=SD_OBSLOC_Village_or_Fac
		SD_OBSLOC_Village_or_Facility_pa=SD_OBSLOC_Village_or_Fac_pa
		SD_OBSLOC_Village_or_Facility_la=SD_OBSLOC_Village_or_Fac_la
		SD_OBSLOC_Village_or_Facility_id=SD_OBSLOC_Village_or_Fac_id
		SD_OBSLOC_Village_or_Facility_le=SD_OBSLOC_Village_or_Fac_le
		PD_BIRTH_OBSLOC_Region_parent=PD_BIRTH_OBSLOC_Reg_par
		PD_BIRTH_OBSLOC_District_parent=PD_BIRTH_OBSLOC_Dist_parent
		PD_BIRTH_OBSLOC_District_label=PD_BIRTH_OBSLOC_Dis_label
		PD_BIRTH_OBSLOC_District_level=PD_BIRTH_OBSLOC_Dis_level
		PD_BIRTH_OBSLOC_Type_locationTyp=PD_BIRTH_OBSLOC_Type_locTyp
		PD_BIRTH_OBSLOC_Village_or_Facil=PD_BIRTH_OBSLOC_Vil_or_Facil;
run;
%char2num(inputdsn=mnh02_char, outputdsn=mnh02_num, excludevars=);

**Add prefix of M02_;
%varprefix(dset=mnh02_num, prefix=M02_, keepname="caseid" "scrnid" "participantid" "eventid" "eventformid" "siten")


proc contents data=mnh02_num; run;
proc freq data=mnh02_num; tables _char_; run;
proc sort data=mnh02_num out=mnh.mnh02; by caseid participantid; run;


**MNH03A: Pregnancy History Overview**;
%impmerge(sitename=kenya, form=mnh03a, tabname=mnh_pregnancy_history, tabnum=1, othertab1=, othertab2=, format=);
%impmerge(sitename=ghana, form=mnh03a, tabname=mnh_pregnancy_history, tabnum=1, othertab1=, othertab2=, format=);

data mnh03a_char;
set mnh03a_kenya(in=inken) mnh03a_ghana(in=ingha);
if caseid="**********" then delete;

*Site number for reports*;
if inken then siten=3;
else if ingha then siten=2;

*Rename variables > 32 characters;
rename	FAC_SPFY_OHOLOC_region_descendan = FAC_SPFY_OHOLOC_region_dcnt
		FAC_SPFY_OHOLOC_location_descend  = FAC_SPFY_OHOLOC_loc_dcnt
		FAC_SPFY_OHOLOC_facility_descend  = FAC_SPFY_OHOLOC_fac_dcnt
		PH_OBSLOC_Region_descendantsCoun  = PH_OBSLOC_Region_dcnt
		PH_OBSLOC_District_descendantsCo  = PH_OBSLOC_District_dcnt
		PH_OBSLOC_Type_descendantsCount = PH_OBSLOC_Type_dcnt
		PH_OBSLOC_Village_or_Facility_de = PH_OBSLOC_Vil_or_Fac_dcnt
		FAC_SPFY_OHOLOC_region_parent=FAC_SPFY_OHOLOC_reg_par
		FAC_SPFY_OHOLOC_region_label=FAC_SPFY_OHOLOC_reg_lab
		FAC_SPFY_OHOLOC_region_level=FAC_SPFY_OHOLOC_reg_lev
		FAC_SPFY_OHOLOC_location_parent=FAC_SPFY_OHOLOC_loc_parent
		FAC_SPFY_OHOLOC_location_label=FAC_SPFY_OHOLOC_loc_label
		FAC_SPFY_OHOLOC_location_level=FAC_SPFY_OHOLOC_loc_level
		FAC_SPFY_OHOLOC_facility_parent=FAC_SPFY_OHOLOC_fac_parent
		FAC_SPFY_OHOLOC_facility_label=FAC_SPFY_OHOLOC_fac_label
		FAC_SPFY_OHOLOC_facility_level=FAC_SPFY_OHOLOC_fac_level
		PH_OBSLOC_Village_or_Facility=PH_OBSLOC_Village_or_Fac
		PH_OBSLOC_Village_or_Facility_pa=PH_OBSLOC_Village_or_Fac_pa
		PH_OBSLOC_Village_or_Facility_la=PH_OBSLOC_Village_or_Fac_la
		PH_OBSLOC_Village_or_Facility_id=PH_OBSLOC_Village_or_Fac_id
		PH_OBSLOC_Village_or_Facility_le=PH_OBSLOC_Village_or_Fac_le;

run;
%char2num(inputdsn=mnh03a_char, outputdsn=mnh03a_num, excludevars=);

**Add prefix of M03A_;
%varprefix(dset=mnh03a_num, prefix=M03A_, keepname="caseid" "scrnid" "participantid" "eventid" "eventformid" "siten")

proc contents data=mnh03a_num; run;
proc freq data=mnh03a_num; tables _char_; run;
proc sort data=mnh03a_num out=mnh.mnh03a; by caseid participantid; run;


**MNH03B: Pregnancy History Details**;
%impmerge(sitename=kenya, form=mnh03b, tabname=mnh_pregnancy_history_detail, tabnum=1, othertab1=, othertab2=, format=);
%impmerge(sitename=ghana, form=mnh03b, tabname=mnh_pregnancy_history_detail, tabnum=1, othertab1=, othertab2=, format=);

data mnh03b_char;
length PH_LOC_SPFY $50;
set mnh03b_kenya(in=inken) mnh03b_ghana(in=ingha);
if caseid="**********" then delete;

*Site number for reports*;
if inken then siten=3;
else if ingha then siten=2;
run;
%char2num(inputdsn=mnh03b_char, outputdsn=mnh03b_num, excludevars=);

**Add prefix of M03B_;
%varprefix(dset=mnh03b_num, prefix=M03B_, keepname="caseid" "scrnid" "participantid" "eventid" "eventformid" "siten")

proc contents data=mnh03b_num; run;
proc freq data=mnh03b_num; tables _char_; run;
proc sort data=mnh03b_num out=mnh.mnh03b; by caseid participantid; run;


**MNH04: ANC Clinical Status**;
**Note: Currently receive truncations and a duplicate. We are dropping these anyways, but need to review this problem with Matt;
%impmerge(sitename=kenya, form=mnh04, tabname=mnh_medical_history, tabnum=3, othertab1=, othertab2=, format=format BIRTH_PLAN_FAC_OBSLOC_facility_l $50.;);
%impmerge(sitename=ghana, form=mnh04, tabname=mnh_medical_history, tabnum=3, othertab1=mnh_medical_history, othertab2=, format=);

*Set datasets from each site and create site indicator;
data mnh04_char;
format ANTIBX_OTHR_CMTRT BIRTH_TRAUMA_MHTERM $100.; 
length DX_OTHR_MHTERM $100
ANTIBX_OTHR_CMINDC $15
HOSP_OHOREAS  $100
HOSP_OHOLOC  $41
PPH_COMP_SPFY_RPORRES $50 
MALARIA_CMTRT $100
APH_COMP_OTHR_RPTEST $29
OTHR_COMP_MHTERM $100;
set mnh04_kenya (in=inken) mnh04_ghana(in=ingha);
if caseid="**********" then delete;

*Site number for reports*;
if inken then siten=3;
else if ingha then siten=2;

*Rename variables > 32 characters;
rename	FAC_OBSLOC_region_descendantsCou = FAC_OBSLOC_region_dcnt
		FAC_OBSLOC_location_descendantsC  = FAC_OBSLOC_location_dcnt
		FAC_OBSLOC_facility_descendantsC  = FAC_OBSLOC_facility_dcnt
		BIRTH_PLAN_FAC_OBSLOC_location_d  = BIRTH_PLAN_FAC_OBSLOC_loc_dcnt
		BIRTH_PLAN_FAC_OBSLOC_facility_d  = BIRTH_PLAN_FAC_OBSLOC_fac_dcnt
		BIRTH_PLAN_FAC_OBSLOC_region_des = BIRTH_PLAN_FAC_OBSLOC_reg_dcnt
		VISIT_OBSLOC_Region_descendantsC = VISIT_OBSLOC_Region_dcnt
		VISIT_OBSLOC_District_descendant  = VISIT_OBSLOC_District_dcnt
		VISIT_OBSLOC_Type_descendantsCou  = VISIT_OBSLOC_Type_dcnt
		BIRTH_PLAN_OBSLOC_Region_descend  = BIRTH_PLAN_OBSLOC_Region_dcnt
		BIRTH_PLAN_OBSLOC_District_desce = BIRTH_PLAN_OBSLOC_Dis_dcnt
		BIRTH_PLAN_OBSLOC_Type_descendan = BIRTH_PLAN_OBSLOC_Type_dcnt
		var43 = VISIT_OBSLOC_Vil_or_Fac_dcnt
		ANTIPHOSPHOLIPID_EVER_MHOCCUR= ANTIPHOSPHOLIPID_EVER_MHO
 		INSECTICIDE_LAST_NIGH_OBSOCCUR= INSECTICIDE_LAST_NIGH_OBSO
 		VISIT_OBSLOC_Type_locationType= VISIT_OBSLOC_Type_locType
 		VISIT_OBSLOC_Village_or_Facility= VISIT_OBSLOC_Village_or_Fac
 		BIRTH_PLAN_OBSLOC_District_label= BIRTH_PLAN_OBSLOC_Dis_label
 		BIRTH_PLAN_OBSLOC_District_id= BIRTH_PLAN_OBSLOC_Dis_id
 		BIRTH_PLAN_OBSLOC_District_level= BIRTH_PLAN_OBSLOC_Dis_level
 		BIRTH_PLAN_OBSLOC_Type_parent= BIRTH_PLAN_OBSLOC_Type_par
 		BIRTH_PLAN_OBSLOC_Village_or_Fac= BIRTH_PLAN_OBSLOC_Vil_or_Fac
 		BIRTH_PLAN_OBSLOC_Region_parent= BIRTH_PLAN_OBSLOC_Reg_parent
 		BIRTH_PLAN_OBSLOC_Region_label= BIRTH_PLAN_OBSLOC_Reg_label
 		BIRTH_PLAN_OBSLOC_Region_level= BIRTH_PLAN_OBSLOC_Reg_level
 		BIRTH_PLAN_OBSLOC_District_paren= BIRTH_PLAN_OBSLOC_Dis_paren
 		BIRTH_PLAN_OBSLOC_Type_locationT= BIRTH_PLAN_OBSLOC_Type_loc;
run;

*Convert to numeric (continuous, check one and date variables - Dates contain text NA, Check one contain NA and SKIPPED)*;
%char2num(inputdsn=mnh04_char, outputdsn=mnh04_num, excludevars=);
proc contents data=mnh04_num order=varnum; run;
proc freq data=mnh04_num; tables _char_; run;

*Set CSV files for each site, label and format variables and create site number variable;

data mnh04;
set mnh04_num;

*Label variables;
label	SITEN="Site number for reports"
		complete="Tangerine form completion variable?"
		id="Tangerine assigned ID"
		startunixtime="Tangerine noted Unix time"
		SUBJID="Subject ID"
		OBSSTDAT="Date of visit"
		VISIT_OBSLOC="Interview Location"
/*		FAC_OBSLOC="Specify name of facility "*/
/*		GPS_OBSLOC="Record GPS coordinates"*/
		FAC_SPFY_OBSLOC="Specify location"
		ANC_VISIT_N="Timing of visit"
		anc_n_visit="Ghana timing of visit variable"
		ANC_N_1="Is this the first ANC visit after enrollment?"
		PATIENT_DSDECOD="Vital status at time of planned visit"
		DTHDAT="Patient Date of death"
		PRG_DSDECOD="Pregnancy status at time of visit"
		PRG_DSSTDAT="Date of fetal loss"
		PRG_DSSTERM="Specify reason for undetermined"
		HTN_EVER_MHOCCUR="Chronic hypertension?"
		SYPH_EVER_MHOCCUR="Syphilis"
		HIV_EVER_MHOCCUR="HIV"
		ANTIPHOSPHOLIPID_EVER_MHO="Antiphospholipid antibodies?"
		DIABETES_EVER_MHOCCUR="Diabetes mellitus (pre-existing/chronic diabetes)?"
		CARDIAC_EVER_MHOCCUR="Cardiac disease?"
		BIRTH_RPORRES="Have you ever given birth?"
		MISCARRIAGE_RPORRES="Spontaneous miscarriage (pregnancy loss before 20 weeks GA)?"
		STILLBIRTH_RPORRES="Stillbirth (no signs of life at delivery occurring at >=20 weeks GA)?"
		PRETERM_RPORRES="Preterm delivery (delivery occuring between 20-37 weeks GA)?"
		POSTTERM_RPORRES="Post-term delivery (delivery occuring at >=42 weeks GA)?"
		PI_HTN_RPORRES="Pregnancy-induced hypertension?"
		PREECLAMPSIA_RPORRES="Preeclampsia/eclampsia"
		GEST_DIAB_RPORRES="Gestational diabetes?"
		PREMATURE_RUPTURE_RPORRES="Premature rupture of membranes (before labor began)?"
		OBSTR_LABOR_RPORRES="Obstructed or prolonged labor?"
		UNPL_CESARIAN_PROCCUR="Unplanned Cesarean delivery?"
		INTERUTER_GROWTH_RPORRES="Interuterine growth restriction?"
		LOWBIRTHWT_RPORRES="Low birth weight (less than 2500 g)?"
		MACROSOMIA_RPORRES="Macrosomia (birth weight greater than 4000 g)?"
		OLIGOHYDRAMNIOS_RPORRES="Oligohydramnios (too little amniotic fluid)?"
		APH_RPORRES="During any of your previous pregnancies, did you experience antepartum hemorrhage (bleeding from the genital tract before the birth of the baby)?"
/*		APH_COMP_RPTEST="Did you have any of the following complications that contributed to antepartum hemorrhage?"*/
		APH_COMP_RPTEST_1="Complications that contributed to antepartum hemorrhage: Placental abruption"
		APH_COMP_RPTEST_2="Complications that contributed to antepartum hemorrhage: Placenta previa"
		APH_COMP_RPTEST_88="Complications that contributed to antepartum hemorrhage: Other"
		APH_COMP_RPTEST_99="Complications that contributed to antepartum hemorrhage: Don't know"
		APH_COMP_OTHR_RPTEST="Specify other antepartum hemorrhage complication"
		PPH_RPORRES="During any of your previous pregnancies, did you experience postpartum hemorrhage (blood loss from the genital tract after delivery)?"
/*		PPH_COMP_RPORRES="Did you have any of the following complications that contributed to postpartum hemorrhage?"*/
		PPH_COMP_RPORRES_1="Complications that contributed to postpartum hemorrhage: Uterine atony"
		PPH_COMP_RPORRES_2="Complications that contributed to postpartum hemorrhage: Retained placenta"
		PPH_COMP_RPORRES_3="Complications that contributed to postpartum hemorrhage: Uterine rupture"
		PPH_COMP_RPORRES_4="Complications that contributed to postpartum hemorrhage: Cervical/vaginal laceration"
		PPH_COMP_RPORRES_88="Complications that contributed to postpartum hemorrhage: Other"
		PPH_COMP_RPORRES_99="Complications that contributed to postpartum hemorrhage: Don't know"
		PPH_COMP_SPFY_RPORRES="Specify other postpartum hemorrhage complication"
		MALFORM_MHOCCUR="During any of your previous pregnancies, did you give birth to an infant with any type of congenital anomaly/malformation?"
/*		MALFORM_MHTERM="Ask mother to specify type of anomaly/malformation. If she does not know the medical term, ask her to describe the anomaly and select the appropriate response(s). "*/
		MALFORM_MHTERM_1="Type of anomaly/malformation: Cleft lip/pallet"
		MALFORM_MHTERM_2="Type of anomaly/malformation: Neural tube defect"
		MALFORM_MHTERM_3="Type of anomaly/malformation: Abdominal wall defect"
		MALFORM_MHTERM_4="Type of anomaly/malformation: Bladder exstrophy"
		MALFORM_MHTERM_5="Type of anomaly/malformation: Kidney malformation"
		MALFORM_MHTERM_6="Type of anomaly/malformation: Anorectal malformation"
		MALFORM_MHTERM_7="Type of anomaly/malformation: Congenital heart defect"
		MALFORM_MHTERM_8="Type of anomaly/malformation: Bowel obstruction"
		MALFORM_MHTERM_9="Type of anomaly/malformation: Tracheoesophageal fistula"
		MALFORM_MHTERM_10="Type of anomaly/malformation: Hydrocephalus"
		MALFORM_MHTERM_11="Type of anomaly/malformation: Developmental dysplasia of the hip"
		MALFORM_MHTERM_12="Type of anomaly/malformation: Skeletal dysplasia"
		MALFORM_MHTERM_13="Type of anomaly/malformation: Club foot"
		MALFORM_MHTERM_88="Type of anomaly/malformation: Other"
		MALFORM_OTHR_MHTERM="Specify other anomaly/malformation"
		CORD_COMP_MHOCCUR="Cord complication?"
		BIRTH_TRAUMA_MHOCCUR="Birth trauma/difficult delivery?"
		BIRTH_TRAUMA_MHTERM="Specify birth trauma/difficult delivery"
		BIRTH_ASPHYXIA_MHOCCUR="Birth asphyxia/respiratory distress (required breathing assistance)?"
		BLOOD_DISORDER_MHOCCUR="Blood disorder?"
		OTHR_COMP_MHOCCUR="Any other complication?"
		OTHR_COMP_MHTERM="Specify other complication"
/*		CurrPreg_FP="In the 12 months before this pregnancy, were you or your partner using any of the following methods to delay or avoid getting pregnant? "*/
		CurrPreg_FP_1="Pregnancy prevention method used in last 12 months: Condoms"
		CurrPreg_FP_2="Pregnancy prevention method used in last 12 months: Progestin-only pills (POPs)"
		CurrPreg_FP_3="Pregnancy prevention method used in last 12 months: Combined oral contraceptives (COCs)"
		CurrPreg_FP_4="Pregnancy prevention method used in last 12 months: Progestogen-only injectable"
		CurrPreg_FP_5="Pregnancy prevention method used in last 12 months: Monthly injectibles (e.g., Mesgyna, Cyclofem)"
		CurrPreg_FP_6="Pregnancy prevention method used in last 12 months: Intrauterine device (IUD)"
		CurrPreg_FP_7="Pregnancy prevention method used in last 12 months: Implants (e.g., Norplant, Jadelle, Implanon)"
		CurrPreg_FP_8="Pregnancy prevention method used in last 12 months: Lactational Amenorrhea Method (LAM)"
		CurrPreg_FP_9="Pregnancy prevention method used in last 12 months: Periodic abstinence (e.g., Rhythm method, fertility awareness, standard days method)"
		CurrPreg_FP_10="Pregnancy prevention method used in last 12 months: Male sterilization"
		CurrPreg_FP_11="Pregnancy prevention method used in last 12 months: Female sterilization"
		CurrPreg_FP_12="Pregnancy prevention method used in last 12 months: Withdrawal"
		CurrPreg_FP_77="Pregnancy prevention method used in last 12 months: No family planning method used"
		CurrPreg_FP_88="Pregnancy prevention method used in last 12 months: Other"
		CurrPreg_FP_99="Pregnancy prevention method used in last 12 months: Don't know"
		CURRPREG_FP_SPFY="Specify other family planning method"
/*		CURRPREG_FP_REAS="What is the main reason you or your partner have not used a family planning method in the past 12 months?"*/
		CURRPREG_FP_REAS_1="Main reason for not using family planning method in last 12 months: Actively trying to become pregnant"
		CURRPREG_FP_REAS_2="Main reason for not using family planning method in last 12 months: Fear of side effects"
		CURRPREG_FP_REAS_3="Main reason for not using family planning method in last 12 months: Partner disapproval"
		CURRPREG_FP_REAS_4="Main reason for not using family planning method in last 12 months: Methods weren't available"
		CURRPREG_FP_REAS_5="Main reason for not using family planning method in last 12 months: No awareness of family planning options"
		CURRPREG_FP_REAS_88="Main reason for not using family planning method in last 12 months: Other"
		CURRPREG_FP_REAS_99="Main reason for not using family planning method in last 12 months: Don't know"
		CURREPREG_FP_REAS_SPFY="Specify other reason no family planning was used in past 12 months"
		CURREPREGN_DESIRE_YN="At the time that you became pregnant with the current pregnancy, did you want to get pregnant?"
		PIH_MHOCCUR="Pregnancy-induced hypertension (PIH)?"
		PIH_MHTERM="Specify type of PIH"
		PIH_MHSTDAT="Specify date of PIH diagnosis"
/*		PIH_OECTRT="Specify treatment"*/
		PIH_OECTRT_1="PIH treatment: Bedrest at home"
		PIH_OECTRT_2="PIH treatment: Bedrest at facility"
		PIH_OECTRT_3="PIH treatment: Magnesium Sulfate"
		PIH_OECTRT_4="PIH treatment: Hydralazine"
		PIH_OECTRT_5="PIH treatment: Nifedipine"
		PIH_OECTRT_6="PIH treatment: Labetalol"
		PIH_OECTRT_7="PIH treatment: Methyldopa"
		PIH_OECTRT_77="PIH treatment: No treatment"
		PIH_OECTRT_88="PIH treatment: Other treatment"
		PIH_OECTRT_99="PIH treatment: Don't know"
		PIH_OTHR_OECTRT="Specify other PIH treatment"
		PTL_MHOCCUR="Preterm labor/Risk of preterm birth?"
		PTL_MHSTDAT="Specify date of preterm labor/risk of preterm birth diagnosis"
/*		PTL_OECTRT="Specify treatment"*/
		PTL_OECTRT_1="Preterm Labor/Birth treatment: Bedrest at home"
		PTL_OECTRT_2="Preterm Labor/Birth treatment: Bedrest at facility"
		PTL_OECTRT_3="Preterm Labor/Birth treatment: Betamethasone"
		PTL_OECTRT_4="Preterm Labor/Birth treatment: Dexamethasone"
		PTL_OECTRT_5="Preterm Labor/Birth treatment: Magnesium Sulfate"
		PTL_OECTRT_6="Preterm Labor/Birth treatment: Nifedipine"
		PTL_OECTRT_7="Preterm Labor/Birth treatment: Terbutaline"
		PTL_OECTRT_77="Preterm Labor/Birth treatment: No treatment"
		PTL_OECTRT_88="Preterm Labor/Birth treatment: Other treatment"
		PTL_OECTRT_99="Preterm Labor/Birth treatment: Don't know"
		PTL_OTHR_OECTRT="Specify other treatment for preterm labor"
		HIV_MHOCCUR="HIV?"
		HIV_MHSTDAT="Specify date of HIV diagnosis"
		HIV_CMOCCUR="Did you begin treatment for HIV?"
		HIV_CMTRT_1="HIV treatment regimen: Abacavir (ABC, Zigen)"
		HIV_CMTRT_2="HIV treatment regimen: Didanosine (DDI, Videx)"
		HIV_CMTRT_3="HIV treatment regimen: Lamivudine (3TC, Epivir)"
		HIV_CMTRT_4="HIV treatment regimen: Stavudine (d4T, Zerit)"
		HIV_CMTRT_5="HIV treatment regimen: Zidovudine (ZDV, AZT, Retrovir)"
		HIV_CMTRT_6="HIV treatment regimen: Tenofovir (TNF, TDF)"
		HIV_CMTRT_7="HIV treatment regimen: Efavirenz (EFV, Sustiva, Stocrin)"
		HIV_CMTRT_8="HIV treatment regimen: Etravirine"
		HIV_CMTRT_9="HIV treatment regimen: Nevirapine (NVP, Viramune)"
		HIV_CMTRT_10="HIV treatment regimen: Rilpivirine"
		HIV_CMTRT_11="HIV treatment regimen: Lopinavir/ritonavir (LPV/rit, Kaletra)"
		HIV_CMTRT_12="HIV treatment regimen: Nelfinavir (NFV, Viracept)"
		HIV_CMTRT_13="HIV treatment regimen: Ritonavir (RTV, Norvir)"
		HIV_CMTRT_14="HIV treatment regimen: Atazanavi"
		HIV_CMTRT_15="HIV treatment regimen: Darunavir"
		HIV_CMTRT_16="HIV treatment regimen: Fosamprenavi"
		HIV_CMTRT_17="HIV treatment regimen: Indinavir"
		HIV_CMTRT_18="HIV treatment regimen: Saquinavir"
		HIV_CMTRT_19="HIV treatment regimen: Tipranavir"
		HIV_CMTRT_20="HIV treatment regimen: Enfuvirtide"
		HIV_CMTRT_21="HIV treatment regimen: Maraviroc"
		HIV_CMTRT_22="HIV treatment regimen: Dolutegravir"
		HIV_CMTRT_23="HIV treatment regimen: Elvitegravir"
		HIV_CMTRT_24="HIV treatment regimen: Raltegravir"
		HIV_CMTRT_25="HIV treatment regimen: Cobicistat"
		HIV_CMTRT_88="HIV treatment regimen: Other"
		HIV_CMTRT_99="HIV treatment regimen: Don't know"
		HIV_SPFY_CMTRT="Specify other HIV treatment received"
		HIV_CMSTDAT="Specify HIV treatment start date"
		SYPH_MHOCCUR="Syphilis"
		SYPH_MHSTDAT="Specify Syphilis date of diagnosis"
		SYPH_CMOCCUR="Did you receive treatment for syphilis infection?"
		SYPH_CMTRT="Specify syphilis treatment"
		OTHR_STI_MHOCCUR="Other STIs?"
		GONORRHEA_MHOCCUR="Gonorrhea?"
		GONORRHEA_MHSTDAT="Date of gonorrhea diagnosis"
		CHLAMYDIA_MHOCCUR="Chlamydia?"
		CHLAMYDIA_MHSTDAT="Date of chlamydia diagnosis"
		GENULCER_MHOCCUR="Genital ulcer?"
		GENULCER_MHSTDAT="Date of ulcer diagnosis"
		CHANC_MHOCCUR="Chancroid?"
		CHANC_MHSTDAT="Date of chancroid diagnosis"
		STI_OTHR_MHOCCUR="Other STI?"
		STI_OTHR_MHTERM="Specify other STI"
		STI_OTHR_MHSTDAT="Date of other STI diagnosis"
		STI_OTHR_CMOCCUR="Did you receive STI treatment?"
		STI_OTHR_CMTRT="Specify STI treatment"
		MALARIA_EVER_MHOCCUR="Malaria?"
		MALARIA_EVER_MHSTDAT="Specify date of malaria diagnosis"
		MALARIA_EVER_CMOCCUR="Did participant receive treatment for malaria infection?"
		MALARIA_CMTRT="Specify malaria treatment"
		ANTIPHOSPHOLIPID_LBORRES="Antiphospholid Antibodies?"
		ANTIPHOSPHOLIPID_LBDAT="Specify date of antiphospholid antibodies diagnosis"
		ANTIPHOSPHOLIPID_CMOCCUR="Did you receive treatment for antiphospholid antibodies?"
		ANTIPHOSPHOLIPID_CMTRT="Specify antiphospholid antibodies treatment"
/*		N/A="Have you had any of the following signs or symptoms of COVID-19 since you became pregnant?"*/
/*		N/A="Have you had any of the following signs or symptoms of COVID-19 since the last study visit?"*/
		FEVER_CEOCCUR="Fever (>=37.5 C)?"
		FEVER_CESTDAT="Date of fever onset"
		TEMP_VSTEST="Was temperature >=37.5 measured with a thermometer?"
		TEMP_VSORRES="Record highest known temperature >=37.5 C"
		sorethroat_CEOCCUR="Sore throat"
		sorethroat_cestdat_CESTDAT="Date of sore throat onset"
		runnynose_CEOCCUR="Runny nose or inflammation of the nasal membranes"
		runnynose_cestdat_CESTDAT="Date of runny nose onset"
		Cough_CEOCCUR="Cough"
		Cough_CESTDAT="Date of cough onset"
		Shortbreath_CEOCCUR="Shortness of breath"
		Shortbreath_CESTDAT="Date of shortness of breath onset"
		Chill_CEOCCUR="Chills"
		chill_CESTDAT="Date of shills onset"
		Nausea_CEOCCUR="Nausea or vomiting"
		Nauseavomit_CESTDAT="Date of nausea or vomiting onset"
		Diarrhoea_CEOCCUR="Diarrhoea"
		Diarrhoea_CESTDAT="Date of diarrhoea onset"
		Headache_CEOCCUR="Headache"
		Headache_CESTDAT="Date of headache onset"
		rash_CEOCCUR="Rash"
		rash_CESTDAT="Date of rash onset"
		Conjunct_CEOCCUR="Conjunctivitis"
		conjunct_CESTDAT="Date of conjunctivitis onset"
		myalgia_CEOCCUR="Muscle aches"
		myalgia_CESTDAT="Date of muscle aches onset"
		jointpain_CEOCCUR="Joint ache"
		jointpain_CESTDAT="Date of joint ache onset"
		anorexia_CEOCCUR="Loss of appetite"
		anorexia_CESTDAT="Date of loss of appetite onset"
		anosmia_CEOCCUR="Loss of smell (anosmia)"
		anosmia_CESTDAT="Date of anosmia onset"
		ageusia_CEOCCUR="Loss of taste (ageusia)"
		ageusia_CESTDAT="Date of ageusia onset"
		nosebleed_CEOCCUR="Nosebleed"
		nosebleed_CESTDAT="Date of nosebleed onset"
		fatigue_CEOCCUR="Weakness or fatigue"
		fatigue_CESTDAT="Date of weakness or fatigue onset"
		seizure_CEOCCUR="Seizures"
		seizure_CESTDAT="Date of seizures onset"
		confusion_CEOCCUR="Altered consciousness/confusion"
		confusion_CESTDAT="Date of altered consciousness/confusion onset"
		NEURO_OTHR_CEOCCUR="Other neurological signs"
		NEURO_OTHR_CETERM="Specify other neurological signs"
		NEURO_OTH_CESTDAT="Date of other neurological sign onset"
		SYMP_OTHR_CEOCCUR="Any other COVID-19 signs/symptoms?"
		SYMP_OTHR_CETERM="Specify other signs/symptoms"
		SYMP_CESTDAT="Specify date of onset of other signs/symptoms"
/*		CHEST_IMAGE_PROCCUR="Did you have any of the following type of chest imaging with findings suggestive of COVID-19?"*/
		CHEST_IMAGE_PROCCUR_1="Chest imaging type suggestive of COVID-19: Chest radiography"
		CHEST_IMAGE_PROCCUR_2="Chest imaging type suggestive of COVID-19: Chest CT"
		CHEST_IMAGE_PROCCUR_3="Chest imaging type suggestive of COVID-19: Lung ultrasound"
		CHEST_IMAGE_PROCCUR_77="Chest imaging type suggestive of COVID-19: No test imaging suggestive of COVID-19"
		CHEST_IMAGE_PROCCUR_99="Chest imaging type suggestive of COVID-19: Don't know"
		CHEST_IMAGE_PRSTDAT="Date of chest imaging"
		SARI_CEOCCUR="Were you diagnosed with severe acute respiratory disease?"
		SARI_CESTDAT="Date of severe acute respiratory disease diagnosis"
		COVID_CONTACT_YN="Did you have contact with a probable or confirmed COVID-19 case?"
		COVID_CONTACT_DAT="Date of most recent contact"
		COVID_PG_LBPERF="Have you been tested for COVID-19 since you became pregnant?"
		COVID_LAST_VISIT_LBPERF="Have you been tested for COVID-19 since the last study visit?"
		COVID_LBDAT="Date of COVID-19 test"
		COVID_LBTIM="COVID-19 test result"
		DX_OTHR_PG_MHOCCUR="Have you been diagnosed with any other conditions or illnesses since you became pregnant? Include diagnoses made during todays ANC visit"
		DX_OTHR_LAST_VISIT_MHOCCUR="Have you been diagnosed with any other conditions or illnesses since the last study visit? Include diagnoses made during todays ANC visit"
		DX_OTHR_MHTERM="Specify other condition(s) or illness(es)"
		DX_OTHR_MHSTDAT="Specify date of other condition(s) or illness(es) diagnosis"
		DX_OTHR_CMOCCUR="Did you receive any treatment for the condition(s) or illness(es)?"
		DX_OTHR_CMTRT="Specify treatment for the condition(s) or illness(es)"
		TETANUS_PG_CMOCCUR="Have you received a tetanus toxoid vaccination since you became pregnant? Include TT vaccination received at todays ANC visit"
		TETANUS_LAST_VISIT_CMOCCUR="Did you receive a tetanus toxoid vaccination since the last study visit? Include TT vaccination received at todays ANC visit"
		TETANUS_SOURCE="Do you have a vaccination card or other documentation of tetanus toxoid vaccination?"
		TETANUS_CMSTDAT="Record date of vaccination"
		TETANUS_GA_AGE="Record estimated GA at time of vaccination"
		ANTIBX_PG_CMOCCUR="Have you been prescribed antibiotics since you became pregnant? Include antibiotics prescribed during this ANC visit"
		ANTIBX_LAST_VISIT_CMOCCUR="Have you been prescribed antibiotics since the last study visit? Include antibiotics prescribed during this ANC visit"
/*		ANTIBX_CMTRT="Specify Antibiotic"*/
		ANTIBX_CMTRT_1="Current pregnancy antibiotic treatment: Penicillin, Ampicillin, or Amoxicillin"
		ANTIBX_CMTRT_2="Current pregnancy antibiotic treatment: Gentamycin"
		ANTIBX_CMTRT_3="Current pregnancy antibiotic treatment: Cephalosporin (Cefazolin, Ceftriaxone)"
		ANTIBX_CMTRT_4="Current pregnancy antibiotic treatment: Metronidazole/Flagyl"
		ANTIBX_CMTRT_5="Current pregnancy antibiotic treatment: Clindamycin"
		ANTIBX_CMTRT_6="Current pregnancy antibiotic treatment: Erythromycin"
		ANTIBX_CMTRT_7="Current pregnancy antibiotic treatment: Azithromycin"
		ANTIBX_CMTRT_88="Current pregnancy antibiotic treatment: Other"
		ANTIBX_CMTRT_99="Current pregnancy antibiotic treatment: Don't know"
		ANTIBX_OTHR_CMTRT="Specify other antibiotic"
/*		ANTIBX_CMINDC="Specify Indication:"*/
		ANTIBX_CMINDC_1="Antibiotic indication of use: Treatment of Infection"
		ANTIBX_CMINDC_2="Antibiotic indication of use: Prophylactic"
		ANTIBX_CMINDC_88="Antibiotic indication of use: Other"
		ANTIBX_CMINDC_99="Antibiotic indication of use: Don't Know"
		ANTIBX_OTHR_CMINDC="Specify other antibiotic indication"
		IPT_CMOCCUR="IPT-p for prevention of malaria?"
		FOLIC_ACID_CMOCCUR="Folic acid?"
		IRON_CMOCCUR="Iron?"
		CALCIUM_CMOCCUR="Calcium?"
		VITAMIN_CMOCCUR="Vitamin A?"
		ZINC_CMOCCUR="Zinc?"
		MICRONUTRIENT_CMOCCUR="Multiple micronutrient (MM) supplements?"
		ORAL_REHYD_CMOCCUR="Oral rehydration solution"
		ANTHELMINTHIC_CMOCCUR="Anthelminthic treatment?"
		ASPIRIN_CMOCCUR="Aspirin?"
		ANTIPYRETIC_CMOCCUR="Other antipyretics?"
		ANTIPYRETIC_CMTRT="Specify other antipyretic"
		RX_OTHER_CMOCCUR="Any other medications or treatments?"
		RX_OTHER_CMTRT="Specify other medication or treatment"
		HOSP_PG_OHOOCCUR="Have you been hospitalized for any illness or condition since you became pregnant?"
		HOSP_LAST_VISIT_OHOOCCUR="Were you admitted to a health facility for any illness or condition since the last study visit?"
		HOSP_OHOREAS="Specify reason for hospitalization"
		HOSP_OHOLOC="Specify location where participant was admitted"
		HOSP_OHOSTDAT="Specify date of admission"
		HOSP_OHOENDAT="Specify date of discharge"
		INSECTICIDE_LAST_NIGH_OBSO="Did you sleep under an insecticide treated mosquito net last night?"
		NUTR_COUNSEL_OBSOCCUR="Have you received nutritional counseling as part of ANC during the current pregnancy?"
		HEALTH_PROMOTION_OBSOCCUR="Have you received health promotion and counseling as part of ANC during the current pregnancy?"
		BIRTH_PLAN_OBSOCCUR="Have you developed a birth preparedness/birth plan as part of ANC during the current pregnancy?"
		BIRTH_PLAN_OBSLOC="Confirm location where the participant plans to give birth"
/*		BIRTH_PLAN_FAC_OBSLOC="Specify name of facility"*/
		BIRTH_PLAN_FAC_OTHR_OBSLOC="Specify other location"
		COYN="Would you like to record any additional comments about this visit?"
/*		COVAL="Record comments"*/
/*		FORMCOMPLID="Record identifier of person completing form, as appropriate for your site (e.g., Name, initial, ID, or code). "*/
		f_PIH_MHSTDAT="Pregnancy Induced Hypertension date of diagnosis missing day"
		/*f_HIV_MHSTDAT="HIV date of diagnosis missing day"*/
		/*f_HIV_CMSTDAT="HIV date of treatment missing day"*/
		f_STI_OTHR_MHSTDAT="Other STI date of diagnosis missing day"
		f_MALARIA_EVER_MHSTDAT="Malaria date of diagnosis missing day" 
		f_Shortbreath_CESTDAT="Shortness of breath date of onset missing day"
		f_Nauseavomit_CESTDAT="Nausea or vomiting date of onset missing day"
		f_Headache_CESTDAT="Headache date of onset missing day"
		f_rash_CESTDAT="Rash date of onset missing day"
		f_anorexia_CESTDAT="Anorexia date of onset missing day"
		f_fatigue_CESTDAT="Fatigue date of onset missing day"
		/*f_confusion_CESTDAT="Confusion date of onset missing day"*/
		f_COVID_CONTACT_DAT="Covid contact date missing day"
		f_COVID_LBDAT="Covid test date missing day"
		f_jointpain_CESTDAT="Joint pain date of onset missing day"
		f_nosebleed_CESTDAT="Nosebleed date of onset missing day" 
		f_SYMP_CESTDAT="Other symptoms date of onset missing day"
		f_DX_OTHR_MHSTDAT="Other diagnosis date of diagnosis missing day"
		complete="Tangerine form completion variable?"
		caseid="Tangerine noted case ID"
		participantid="Tangerine noted participant ID"
		eventid="Tangerine noted event ID"
		eventformid="Tangerine noted form ID"
		startUnixtime="Tangerine noted Unix time";

format  ANC_N_1 ANTIPHOSPHOLIPID_EVER_MHO BIRTH_RPORRES UNPL_CESARIAN_PROCCUR CURREPREGN_DESIRE_YN SYPH_CMOCCUR  
		MALARIA_EVER_CMOCCUR ANTIPHOSPHOLIPID_CMOCCUR COVID_PG_LBPERF DX_OTHR_CMOCCUR TETANUS_SOURCE HOSP_PG_OHOOCCUR 
		HOSP_LAST_VISIT_OHOOCCUR INSECTICIDE_LAST_NIGH_OBSO NUTR_COUNSEL_OBSOCCUR HEALTH_PROMOTION_OBSOCCUR 
		BIRTH_PLAN_OBSOCCUR COYN COVID_LAST_VISIT_LBPERF complete yn.
		HTN_EVER_MHOCCUR SYPH_EVER_MHOCCUR HIV_EVER_MHOCCUR DIABETES_EVER_MHOCCUR CARDIAC_EVER_MHOCCUR MISCARRIAGE_RPORRES  
		STILLBIRTH_RPORRES PRETERM_RPORRES POSTTERM_RPORRES PI_HTN_RPORRES PREECLAMPSIA_RPORRES GEST_DIAB_RPORRES PREMATURE_RUPTURE_RPORRES 
		OBSTR_LABOR_RPORRES INTERUTER_GROWTH_RPORRES LOWBIRTHWT_RPORRES MACROSOMIA_RPORRES OLIGOHYDRAMNIOS_RPORRES APH_RPORRES 
		PPH_RPORRES MALFORM_MHOCCUR CORD_COMP_MHOCCUR BIRTH_TRAUMA_MHOCCUR BIRTH_ASPHYXIA_MHOCCUR BLOOD_DISORDER_MHOCCUR OTHR_COMP_MHOCCUR 
		PIH_MHOCCUR PTL_MHOCCUR HIV_MHOCCUR SYPH_MHOCCUR OTHR_STI_MHOCCUR GONORRHEA_MHOCCUR CHLAMYDIA_MHOCCUR GENULCER_MHOCCUR
		CHANC_MHOCCUR STI_OTHR_MHOCCUR STI_OTHR_CMOCCUR MALARIA_EVER_MHOCCUR ANTIPHOSPHOLIPID_LBORRES SARI_CEOCCUR COVID_CONTACT_YN 
		DX_OTHR_PG_MHOCCUR DX_OTHR_LAST_VISIT_MHOCCUR TETANUS_PG_CMOCCUR ANTIBX_PG_CMOCCUR ANTIBX_LAST_VISIT_CMOCCUR IPT_CMOCCUR FOLIC_ACID_CMOCCUR 
		IRON_CMOCCUR CALCIUM_CMOCCUR VITAMIN_CMOCCUR ZINC_CMOCCUR MICRONUTRIENT_CMOCCUR ORAL_REHYD_CMOCCUR ANTHELMINTHIC_CMOCCUR
		ASPIRIN_CMOCCUR ANTIPYRETIC_CMOCCUR RX_OTHER_CMOCCUR f_PIH_MHSTDAT /*f_HIV_MHSTDAT*/ /*f_HIV_CMSTDAT*/ f_STI_OTHR_MHSTDAT f_MALARIA_EVER_MHSTDAT 
		f_Shortbreath_CESTDAT f_Nauseavomit_CESTDAT f_Headache_CESTDAT f_rash_CESTDAT f_anorexia_CESTDAT f_fatigue_CESTDAT
		/*f_confusion_CESTDAT*/ f_COVID_CONTACT_DAT f_COVID_LBDAT f_jointpain_CESTDAT f_nosebleed_CESTDAT f_SYMP_CESTDAT f_DX_OTHR_MHSTDAT yndk.
		HIV_CMOCCUR TETANUS_LAST_VISIT_CMOCCUR ynna.
		FEVER_CEOCCUR TEMP_VSTEST sorethroat_CEOCCUR runnynose_CEOCCUR Cough_CEOCCUR Shortbreath_CEOCCUR 
		Chill_CEOCCUR Nausea_CEOCCUR Diarrhoea_CEOCCUR Headache_CEOCCUR rash_CEOCCUR Conjunct_CEOCCUR 
		myalgia_CEOCCUR jointpain_CEOCCUR anorexia_CEOCCUR anosmia_CEOCCUR ageusia_CEOCCUR nosebleed_CEOCCUR 
		fatigue_CEOCCUR seizure_CEOCCUR confusion_CEOCCUR NEURO_OTHR_CEOCCUR 
		SYMP_OTHR_CEOCCUR ynuk.
		OBSSTDAT DTHDAT PRG_DSSTDAT PIH_MHSTDAT PTL_MHSTDAT HIV_MHSTDAT HIV_CMSTDAT SYPH_MHSTDAT GONORRHEA_MHSTDAT CHLAMYDIA_MHSTDAT GENULCER_MHSTDAT
		CHANC_MHSTDAT STI_OTHR_MHSTDAT MALARIA_EVER_MHSTDAT ANTIPHOSPHOLIPID_LBDAT FEVER_CESTDAT sorethroat_cestdat_CESTDAT Shortbreath_CESTDAT chill_CESTDAT
		rash_CESTDAT conjunct_CESTDAT myalgia_CESTDAT jointpain_CESTDAT anosmia_CESTDAT ageusia_CESTDAT nosebleed_CESTDAT NEURO_OTH_CESTDAT CHEST_IMAGE_PRSTDAT
		COVID_LBDAT DX_OTHR_MHSTDAT TETANUS_CMSTDAT HOSP_OHOSTDAT runnynose_cestdat_CESTDAT Cough_CESTDAT Nauseavomit_CESTDAT Diarrhoea_CESTDAT Headache_CESTDAT
		anorexia_cestdat fatigue_CESTDAT seizure_CESTDAT confusion_CESTDAT SYMP_CESTDAT SARI_CESTDAT COVID_CONTACT_DAT HOSP_OHOENDAT date9.
		APH_COMP_RPTEST_1 APH_COMP_RPTEST_2	APH_COMP_RPTEST_88 APH_COMP_RPTEST_99 PPH_COMP_RPORRES_1
		PPH_COMP_RPORRES_2	PPH_COMP_RPORRES_3	PPH_COMP_RPORRES_4	PPH_COMP_RPORRES_88	PPH_COMP_RPORRES_99	
		MALFORM_MHTERM_1 MALFORM_MHTERM_2 MALFORM_MHTERM_3 MALFORM_MHTERM_4	MALFORM_MHTERM_5 MALFORM_MHTERM_6
		MALFORM_MHTERM_7 MALFORM_MHTERM_8 MALFORM_MHTERM_9 MALFORM_MHTERM_10 MALFORM_MHTERM_11 MALFORM_MHTERM_12		
		MALFORM_MHTERM_13 MALFORM_MHTERM_88	CurrPreg_FP_1 CurrPreg_FP_2	CurrPreg_FP_3 CurrPreg_FP_4	CurrPreg_FP_5	
		CurrPreg_FP_6 CurrPreg_FP_7	CurrPreg_FP_8 CurrPreg_FP_9 CurrPreg_FP_10 CurrPreg_FP_11 CurrPreg_FP_12
		CurrPreg_FP_77 CurrPreg_FP_88 CurrPreg_FP_99 CURRPREG_FP_REAS_1	CURRPREG_FP_REAS_2 CURRPREG_FP_REAS_3 
		CURRPREG_FP_REAS_4 CURRPREG_FP_REAS_5 CURRPREG_FP_REAS_88 CURRPREG_FP_REAS_99 PIH_OECTRT_1 PIH_OECTRT_2
		PIH_OECTRT_3 PIH_OECTRT_4 PIH_OECTRT_5	PIH_OECTRT_6 PIH_OECTRT_7 PIH_OECTRT_77 PIH_OECTRT_88 PIH_OECTRT_99
		PTL_OECTRT_1 PTL_OECTRT_2 PTL_OECTRT_3  PTL_OECTRT_4 PTL_OECTRT_5 PTL_OECTRT_6	PTL_OECTRT_7 PTL_OECTRT_77
		PTL_OECTRT_88 PTL_OECTRT_99	HIV_CMTRT_1 HIV_CMTRT_2	HIV_CMTRT_3	HIV_CMTRT_4	HIV_CMTRT_5	HIV_CMTRT_6
		HIV_CMTRT_7	HIV_CMTRT_8	HIV_CMTRT_9	HIV_CMTRT_10 HIV_CMTRT_11 HIV_CMTRT_12 	HIV_CMTRT_13 HIV_CMTRT_14 HIV_CMTRT_15
		HIV_CMTRT_16 HIV_CMTRT_17 HIV_CMTRT_18	HIV_CMTRT_19 HIV_CMTRT_20 HIV_CMTRT_21 HIV_CMTRT_22	HIV_CMTRT_23 HIV_CMTRT_24
		HIV_CMTRT_25 HIV_CMTRT_88 HIV_CMTRT_99 CHEST_IMAGE_PROCCUR_1 CHEST_IMAGE_PROCCUR_2	CHEST_IMAGE_PROCCUR_3
		CHEST_IMAGE_PROCCUR_77 CHEST_IMAGE_PROCCUR_99 ANTIBX_CMTRT_1 ANTIBX_CMTRT_2 ANTIBX_CMTRT_3 ANTIBX_CMTRT_4
		ANTIBX_CMTRT_5 ANTIBX_CMTRT_6 ANTIBX_CMTRT_7 ANTIBX_CMTRT_88 ANTIBX_CMTRT_99 ANTIBX_CMINDC_1 ANTIBX_CMINDC_2
		ANTIBX_CMINDC_88 ANTIBX_CMINDC_99 ckall.	
		VISIT_OBSLOC      MNH04_VISIT_OBSLOC.
		ANC_VISIT_N       MNH04_ANC_VISIT_N.
		PATIENT_DSDECOD   MNH04_PATIENT_DSDECOD.
		PRG_DSDECOD		  MNH04_PRG_DSDECOD.
		PIH_MHTERM		  MNH04_PIH_MHTERM.
		COVID_LBTIM		  MNH04_COVID_LBTIM.
		BIRTH_PLAN_OBSLOC MNH04_BIRTH_PLAN_OBSLOC.;

*Drop Tangerine variables that are not useful;
drop   ROW_VERSION formId formtitle 
		_id buildId buildChannel deviceId groupId death_instructions hosp_instructions other_instructions 
		mh_instructions mh_intro ob_hist_instructions ob_hist_instructions2 status_instructions 
		status_intro1 status_intro2 covid_intro1 covid_intro2 treatments_intro1 treatments_intro2 
		Next_visit thanks complications_intro FAC_OBSLOC_region_dcnt 
		FAC_OBSLOC_location_dcnt FAC_OBSLOC_facility_dcnt BIRTH_PLAN_FAC_OBSLOC_region_par 
		BIRTH_PLAN_FAC_OBSLOC_region_lev BIRTH_PLAN_FAC_OBSLOC_reg_dcnt BIRTH_PLAN_FAC_OBSLOC_location_l  
		BIRTH_PLAN_FAC_OBSLOC_location_i BIRTH_PLAN_FAC_OBSLOC_location_l BIRTH_PLAN_FAC_OBSLOC_loc_dcnt  		
		BIRTH_PLAN_FAC_OBSLOC_facility_p BIRTH_PLAN_FAC_OBSLOC_facility_l BIRTH_PLAN_FAC_OBSLOC_facility_i  		
		BIRTH_PLAN_FAC_OBSLOC_fac_dcnt BIRTH_PLAN_FAC_OBSLOC_region_lab BIRTH_PLAN_FAC_OBSLOC_location_p  		
		BIRTH_PLAN_FAC_OBSLOC_facility_l BIRTH_PLAN_FAC_OBSLOC_location FAC_OBSLOC_region FAC_OBSLOC_region_parent FAC_OBSLOC_region_label FAC_OBSLOC_region_id 
		FAC_OBSLOC_region_level FAC_OBSLOC_location FAC_OBSLOC_location_parent FAC_OBSLOC_location_label FAC_OBSLOC_location_id 
		FAC_OBSLOC_location_level FAC_OBSLOC_facility FAC_OBSLOC_facility_parent FAC_OBSLOC_facility_label FAC_OBSLOC_facility_id 
		FAC_OBSLOC_facility_level BIRTH_PLAN_FAC_OBSLOC_region BIRTH_PLAN_FAC_OBSLOC_region_id BIRTH_PLAN_FAC_OBSLOC_facility 
		prismaContentVersion calc_outputs VISIT_OBSLOC_Region_dcnt VISIT_OBSLOC_District_dcnt VISIT_OBSLOC_Type_dcnt BIRTH_PLAN_OBSLOC_Region_dcnt 
		BIRTH_PLAN_OBSLOC_Dis_dcnt BIRTH_PLAN_OBSLOC_Type_dcnt VISIT_OBSLOC_Vil_or_Fac_dcnt; 
*drop Kenya specific vars;
drop	FETAL_LOSS_DSDECOD COVID_DOSE1_LSTVISIT_CMOCCUR COVID_DOSE1_NO_SPFY COVID_DOSE1_CMTRT 
		COVID_DOSE1_SPFY_CMTRT COVID_DOSE1_CMSTDAT_YN COVID_DOSE1_CMSTDAT COVID_DOSE2_NO_SPFY COVID_DOSE2_CMTRT 
		COVID_DOSE2_SPFY_CMTRT COVID_DOSE2_CMSTDAT_YN COVID_DOSE2_CMSTDAT
		COVID_DOSE1_PRG_CMOCCUR COVID_DOSE1_SOURCE COVID_DOSE2_PRG_CMOCCUR COVID_DOSE2_LSTVISIT_CMOCCUR 
		COVID_DOSE2_SOURCE Vomit_CEOCCUR ancovConsentVersion HIV_CMTRT ;
*drop Ghana specific vars;
drop 	f_COVID_DOSE1_CMSTDAT VAR105 VISIT_OBSLOC_Region VISIT_OBSLOC_Region_parent 
		VISIT_OBSLOC_Region_label VISIT_OBSLOC_Region_id VISIT_OBSLOC_Region_level 
		VISIT_OBSLOC_District VISIT_OBSLOC_District_parent VISIT_OBSLOC_District_label 
		VISIT_OBSLOC_District_id VISIT_OBSLOC_District_level VISIT_OBSLOC_Type VISIT_OBSLOC_Type_parent
		VISIT_OBSLOC_Type_label VISIT_OBSLOC_Type_id VISIT_OBSLOC_Type_level VISIT_OBSLOC_Type_locType 
		VISIT_OBSLOC_Village_or_Fac VAR39 VAR40 VAR41 VAR42 VISIT_VILLAGE_OBSLOC VISIT_Loc_other_OHOLOC 
		INTV_DSDECOD INTV_DSSTERM MOTHER_ADDRESS_CHANGE_YN MOTHER_VILLAGE_SCORRES MOTHER_CONTACT_CHANGE_YN 
		BIRTH_PLAN_OBSLOC_Region BIRTH_PLAN_OBSLOC_Region_id BIRTH_PLAN_OBSLOC_District 
		BIRTH_PLAN_OBSLOC_Dis_label BIRTH_PLAN_OBSLOC_Dis_id BIRTH_PLAN_OBSLOC_Dis_level 
		BIRTH_PLAN_OBSLOC_Type_par BIRTH_PLAN_OBSLOC_Type_label BIRTH_PLAN_OBSLOC_Type_id 
		BIRTH_PLAN_OBSLOC_Type_level BIRTH_PLAN_OBSLOC_Vil_or_Fac VAR148 VAR149 BIRTH_PLAN_VILLAGE_OBSLOC 
		BIRTH_PLAN_Loc_other_OHOLOC BIRTH_PLAN_OBSLOC_Reg_parent BIRTH_PLAN_OBSLOC_Reg_label 
		BIRTH_PLAN_OBSLOC_Reg_level BIRTH_PLAN_OBSLOC_Dis_paren BIRTH_PLAN_OBSLOC_Type 
		BIRTH_PLAN_OBSLOC_Type_loc VAR81 VAR82;  


run;

/*ods EXCEL file="/rtpnfil03/rtpnfil03_vol5/ANCPNC_Collective/Data Monitoring and Analysis/Datasets/Documentation/Contents/mnh04contents.xlsx";
proc contents data=mnh04 order=varnum; run;
ods EXCEL close;*/


**Add prefix of M04_;
%varprefix(dset=mnh04, prefix=M04_, keepname="caseid" "participantid" "eventid" "eventformid" "siten")


*Check data;
proc contents data=mnh04;run;

ods noproctitle;
title 'MNH ARC Ghana MNH04 Frequencies';
ods rtf file="/rtpnfil03/rtpnfil03_vol5/ANCPNC_Collective/Data Monitoring and Analysis/Datasets/ARC MNH Ghana MNH04 Frequencies (2021.08.05).rtf" startpage=off style=customc;

proc freq data=mnh04;
/**Variables in DD;*/
tables  M04_OBSSTDAT M04_VISIT_OBSLOC M04_FAC_SPFY_OBSLOC M04_ANC_VISIT_N M04_ANC_N_1 M04_PATIENT_DSDECOD M04_DTHDAT M04_PRG_DSDECOD 
		M04_PRG_DSSTDAT M04_PRG_DSSTERM M04_PIH_MHOCCUR M04_PIH_MHTERM M04_PIH_MHSTDAT M04_PIH_OECTRT_1 M04_PIH_OECTRT_2 M04_PIH_OECTRT_3 
		M04_PIH_OECTRT_4 M04_PIH_OECTRT_5 M04_PIH_OECTRT_6 M04_PIH_OECTRT_7 M04_PIH_OECTRT_88 M04_PIH_OECTRT_77 M04_PIH_OECTRT_99 
		M04_PIH_OTHR_OECTRT M04_PTL_MHOCCUR M04_PTL_MHSTDAT M04_PTL_OECTRT_1 M04_PTL_OECTRT_2 M04_PTL_OECTRT_3 M04_PTL_OECTRT_4 M04_PTL_OECTRT_5 
		M04_PTL_OECTRT_6 M04_PTL_OECTRT_7 M04_PTL_OECTRT_88 M04_PTL_OECTRT_77 M04_PTL_OECTRT_99 M04_PTL_OTHR_OECTRT M04_HIV_MHOCCUR M04_HIV_MHSTDAT 
		M04_HIV_CMOCCUR M04_HIV_CMTRT_1 M04_HIV_CMTRT_2 M04_HIV_CMTRT_3 M04_HIV_CMTRT_4 M04_HIV_CMTRT_5 M04_HIV_CMTRT_6 M04_HIV_CMTRT_7 M04_HIV_CMTRT_8 
		M04_HIV_CMTRT_9 M04_HIV_CMTRT_10 M04_HIV_CMTRT_11 M04_HIV_CMTRT_12 M04_HIV_CMTRT_13 M04_HIV_CMTRT_14 M04_HIV_CMTRT_15 M04_HIV_CMTRT_16 
		M04_HIV_CMTRT_17 M04_HIV_CMTRT_18 M04_HIV_CMTRT_19 M04_HIV_CMTRT_20 M04_HIV_CMTRT_21 M04_HIV_CMTRT_22 M04_HIV_CMTRT_23 M04_HIV_CMTRT_24 
		M04_HIV_CMTRT_25 M04_HIV_CMTRT_88 M04_HIV_CMTRT_99 M04_HIV_SPFY_CMTRT M04_HIV_CMSTDAT M04_SYPH_MHOCCUR M04_SYPH_MHSTDAT M04_SYPH_CMOCCUR 
		M04_SYPH_CMTRT M04_OTHR_STI_MHOCCUR M04_GONORRHEA_MHOCCUR M04_GONORRHEA_MHSTDAT M04_CHLAMYDIA_MHOCCUR M04_CHLAMYDIA_MHSTDAT 
		M04_GENULCER_MHOCCUR M04_GENULCER_MHSTDAT M04_CHANC_MHOCCUR M04_CHANC_MHSTDAT M04_STI_OTHR_MHOCCUR M04_STI_OTHR_MHTERM 
		M04_STI_OTHR_MHSTDAT M04_STI_OTHR_CMOCCUR M04_STI_OTHR_CMTRT M04_MALARIA_EVER_MHOCCUR M04_MALARIA_EVER_MHSTDAT M04_MALARIA_EVER_CMOCCUR 
		M04_MALARIA_CMTRT M04_ANTIPHOSPHOLIPID_LBORRES M04_ANTIPHOSPHOLIPID_LBDAT M04_ANTIPHOSPHOLIPID_CMOCCUR M04_ANTIPHOSPHOLIPID_CMTRT 
		M04_FEVER_CEOCCUR M04_FEVER_CESTDAT M04_TEMP_VSTEST M04_TEMP_VSORRES M04_sorethroat_CEOCCUR M04_sorethroat_cestdat_CESTDAT 
		M04_runnynose_CEOCCUR M04_runnynose_cestdat_CESTDAT M04_Cough_CEOCCUR M04_Cough_CESTDAT M04_Shortbreath_CEOCCUR M04_Shortbreath_CESTDAT 
		M04_Chill_CEOCCUR M04_chill_CESTDAT M04_Nausea_CEOCCUR M04_Nauseavomit_CESTDAT M04_Diarrhoea_CEOCCUR M04_Diarrhoea_CESTDAT M04_Headache_CEOCCUR 
		M04_Headache_CESTDAT M04_rash_CESTDAT M04_Conjunct_CEOCCUR M04_conjunct_CESTDAT M04_myalgia_CEOCCUR M04_jointpain_CEOCCUR M04_anorexia_CEOCCUR 
		M04_anorexia_CESTDAT M04_anosmia_CESTDAT M04_ageusia_CEOCCUR M04_fatigue_CESTDAT M04_seizure_CEOCCUR M04_confusion_CEOCCUR M04_confusion_CESTDAT 
		M04_NEURO_OTHR_CEOCCUR M04_NEURO_OTHR_CETERM M04_SYMP_OTHR_CEOCCUR M04_SYMP_OTHR_CETERM M04_CHEST_IMAGE_PROCCUR_1 M04_CHEST_IMAGE_PROCCUR_3 
		M04_CHEST_IMAGE_PROCCUR_77 M04_CHEST_IMAGE_PRSTDAT M04_COVID_CONTACT_YN M04_COVID_CONTACT_DAT M04_COVID_PG_LBPERF M04_COVID_LBDAT M04_COVID_LBTIM 
		M04_DX_OTHR_LAST_VISIT_MHOCCUR M04_DX_OTHR_MHTERM M04_DX_OTHR_CMOCCUR M04_DX_OTHR_CMTRT M04_TETANUS_LAST_VISIT_CMOCCUR M04_TETANUS_SOURCE 
		M04_TETANUS_CMSTDAT M04_TETANUS_GA_AGE M04_ANTIBX_PG_CMOCCUR M04_ANTIBX_LAST_VISIT_CMOCCUR M04_ANTIBX_CMTRT_1 M04_ANTIBX_CMTRT_2 M04_ANTIBX_CMTRT_3 
		M04_ANTIBX_CMTRT_4 M04_ANTIBX_CMTRT_6 M04_ANTIBX_CMTRT_7 M04_ANTIBX_CMTRT_99 M04_ANTIBX_OTHR_CMTRT M04_ANTIBX_CMINDC_1 M04_ANTIBX_CMINDC_88 
		M04_ANTIBX_CMINDC_99 M04_ANTIBX_OTHR_CMINDC M04_IPT_CMOCCUR M04_FOLIC_ACID_CMOCCUR M04_VITAMIN_CMOCCUR M04_ZINC_CMOCCUR M04_ANTIPYRETIC_CMTRT 
		M04_RX_OTHER_CMOCCUR M04_HOSP_PG_OHOOCCUR M04_HOSP_LAST_VISIT_OHOOCCUR M04_HOSP_OHOREAS M04_HOSP_OHOSTDAT M04_HOSP_OHOENDAT M04_INSECTICIDE_LAST_NIGH_OBSO 
		M04_NUTR_COUNSEL_OBSOCCUR M04_HEALTH_PROMOTION_OBSOCCUR M04_BIRTH_PLAN_OBSLOC M04_BIRTH_PLAN_FAC_OTHR_OBSLOC M04_COYN M04_ANTIPHOSPHOLIPID_EVER_MHO
		M04_DIABETES_EVER_MHOCCUR M04_CARDIAC_EVER_MHOCCUR M04_BIRTH_RPORRES M04_MISCARRIAGE_RPORRES M04_STILLBIRTH_RPORRES M04_PREECLAMPSIA_RPORRES 
		M04_CurrPreg_FP_1 M04_CurrPreg_FP_4 M04_CurrPreg_FP_6 M04_CurrPreg_FP_7 M04_CurrPreg_FP_11 M04_CurrPreg_FP_12 M04_CurrPreg_FP_88 M04_CURRPREG_FP_REAS_1 
		M04_CURRPREG_FP_REAS_3 M04_CURRPREG_FP_REAS_4 M04_CURRPREG_FP_REAS_5 M04_CURRPREG_FP_REAS_99 M04_CURREPREGN_DESIRE_YN M04_GEST_DIAB_RPORRES M04_UNPL_CESARIAN_PROCCUR
		M04_INTERUTER_GROWTH_RPORRES M04_LOWBIRTHWT_RPORRES M04_MACROSOMIA_RPORRES M04_OLIGOHYDRAMNIOS_RPORRES M04_APH_RPORRES M04_APH_COMP_RPTEST_1
		M04_APH_COMP_RPTEST_99 M04_PPH_RPORRES M04_PPH_COMP_RPORRES_1 M04_PPH_COMP_RPORRES_2 M04_PPH_COMP_RPORRES_3 M04_PPH_COMP_RPORRES_4 M04_PPH_COMP_RPORRES_88 
		M04_MALFORM_MHOCCUR M04_MALFORM_MHTERM_1 M04_MALFORM_MHTERM_2 M04_MALFORM_MHTERM_7 M04_MALFORM_MHTERM_8 M04_MALFORM_MHTERM_10 M04_MALFORM_MHTERM_11 M04_MALFORM_MHTERM_12
		M04_MALFORM_MHTERM_13 M04_MALFORM_OTHR_MHTERM M04_BIRTH_TRAUMA_MHOCCUR M04_BIRTH_TRAUMA_MHTERM M04_BIRTH_ASPHYXIA_MHOCCUR M04_BLOOD_DISORDER_MHOCCUR
		M04_OTHR_COMP_MHOCCUR M04_rash_CEOCCUR M04_myalgia_CESTDAT M04_jointpain_CESTDAT M04_anosmia_CEOCCUR M04_ageusia_CESTDAT M04_nosebleed_CEOCCUR
		M04_nosebleed_CESTDAT M04_fatigue_CEOCCUR M04_seizure_CESTDAT M04_NEURO_OTH_CESTDAT M04_SYMP_CESTDAT M04_CHEST_IMAGE_PROCCUR_2 M04_CHEST_IMAGE_PROCCUR_99
		M04_SARI_CEOCCUR M04_SARI_CESTDAT M04_COVID_LAST_VISIT_LBPERF M04_DX_OTHR_PG_MHOCCUR M04_DX_OTHR_MHSTDAT M04_TETANUS_PG_CMOCCUR M04_ANTIBX_CMTRT_5
		M04_ANTIBX_CMTRT_88 M04_ANTIBX_CMINDC_2 M04_IRON_CMOCCUR M04_CALCIUM_CMOCCUR M04_MICRONUTRIENT_CMOCCUR M04_ORAL_REHYD_CMOCCUR M04_ANTHELMINTHIC_CMOCCUR
		M04_ASPIRIN_CMOCCUR M04_ANTIPYRETIC_CMOCCUR M04_RX_OTHER_CMTRT M04_HOSP_OHOLOC M04_BIRTH_PLAN_OBSOCCUR M04_HTN_EVER_MHOCCUR M04_SYPH_EVER_MHOCCUR M04_HIV_EVER_MHOCCUR 
		M04_PRETERM_RPORRES M04_POSTTERM_RPORRES M04_PI_HTN_RPORRES M04_CurrPreg_FP_2 M04_CurrPreg_FP_3 M04_CurrPreg_FP_5 M04_CurrPreg_FP_8 M04_CurrPreg_FP_9 M04_CurrPreg_FP_10
		M04_CurrPreg_FP_77 M04_CurrPreg_FP_99 M04_CURRPREG_FP_SPFY M04_CURRPREG_FP_REAS_2 M04_CURRPREG_FP_REAS_88 M04_CURREPREG_FP_REAS_SPFY M04_PREMATURE_RUPTURE_RPORRES
		M04_OBSTR_LABOR_RPORRES M04_APH_COMP_RPTEST_2 M04_APH_COMP_RPTEST_88 M04_APH_COMP_OTHR_RPTEST M04_PPH_COMP_RPORRES_99 M04_PPH_COMP_SPFY_RPORRES M04_MALFORM_MHTERM_3
		M04_MALFORM_MHTERM_4 M04_MALFORM_MHTERM_5 M04_MALFORM_MHTERM_6 M04_MALFORM_MHTERM_9 M04_MALFORM_MHTERM_88 M04_CORD_COMP_MHOCCUR M04_OTHR_COMP_MHTERM
		M04_f_PIH_MHSTDAT /*M04_f_HIV_MHSTDAT M04_f_HIV_CMSTDAT*/ M04_f_STI_OTHR_MHSTDAT M04_f_MALARIA_EVER_MHSTDAT 
		M04_f_Shortbreath_CESTDAT M04_f_Nauseavomit_CESTDAT M04_f_Headache_CESTDAT M04_f_rash_CESTDAT M04_f_anorexia_CESTDAT 
		M04_f_fatigue_CESTDAT /*M04_f_confusion_CESTDAT*/ M04_f_COVID_CONTACT_DAT M04_f_COVID_LBDAT M04_f_jointpain_CESTDAT M04_f_nosebleed_CESTDAT 
		M04_f_SYMP_CESTDAT M04_f_DX_OTHR_MHSTDAT;
*Known IDs;
tables	/*caseId participantId eventId ID subjid*/ M04_complete /*startUnixtime*/;
/*Tangerine vars dropped;
		row_id ROW_VERSION formId formtitle 
		_id buildId buildChannel deviceId groupId death_instructions hosp_instructions other_instructions 
		mh_instructions mh_intro ob_hist_instructions ob_hist_instructions2 status_instructions 
		status_intro1 status_intro2 covid_intro1 covid_intro2 treatments_intro1 treatments_intro2 
		Next_visit thanks complications_intro FAC_OBSLOC_region_descendantsCou 
		FAC_OBSLOC_location_descendantsC FAC_OBSLOC_facility_descendantsC BIRTH_PLAN_FAC_OBSLOC_region_par 
		BIRTH_PLAN_FAC_OBSLOC_region_lev BIRTH_PLAN_FAC_OBSLOC_region_des BIRTH_PLAN_FAC_OBSLOC_location_l  
		BIRTH_PLAN_FAC_OBSLOC_location_i BIRTH_PLAN_FAC_OBSLOC_location_l BIRTH_PLAN_FAC_OBSLOC_location_d  		
		BIRTH_PLAN_FAC_OBSLOC_facility_p BIRTH_PLAN_FAC_OBSLOC_facility_l BIRTH_PLAN_FAC_OBSLOC_facility_i  		
		BIRTH_PLAN_FAC_OBSLOC_facility_d BIRTH_PLAN_FAC_OBSLOC_region_lab BIRTH_PLAN_FAC_OBSLOC_location_p  		
		BIRTH_PLAN_FAC_OBSLOC_facility_l BIRTH_PLAN_FAC_OBSLOC_location FAC_OBSLOC_region FAC_OBSLOC_region_parent FAC_OBSLOC_region_label FAC_OBSLOC_region_id 
		FAC_OBSLOC_region_level FAC_OBSLOC_location FAC_OBSLOC_location_parent FAC_OBSLOC_location_label FAC_OBSLOC_location_id 
		FAC_OBSLOC_location_level FAC_OBSLOC_facility FAC_OBSLOC_facility_parent FAC_OBSLOC_facility_label FAC_OBSLOC_facility_id 
		FAC_OBSLOC_facility_level BIRTH_PLAN_FAC_OBSLOC_region BIRTH_PLAN_FAC_OBSLOC_region_id VAR75 BIRTH_PLAN_FAC_OBSLOC_facility 
		prismaContentVersion calc_outputs;*/ 
/*Kenya specific vars dropped;
   		FETAL_LOSS_DSDECOD COVID_DOSE1_LSTVISIT_CMOCCUR COVID_DOSE1_NO_SPFY COVID_DOSE1_CMTRT 
		COVID_DOSE1_SPFY_CMTRT COVID_DOSE1_CMSTDAT_YN COVID_DOSE1_CMSTDAT COVID_DOSE2_NO_SPFY COVID_DOSE2_CMTRT 
		COVID_DOSE2_SPFY_CMTRT COVID_DOSE2_CMSTDAT_YN COVID_DOSE2_CMSTDAT
		COVID_DOSE1_PRG_CMOCCUR COVID_DOSE1_SOURCE COVID_DOSE2_PRG_CMOCCUR COVID_DOSE2_LSTVISIT_CMOCCUR 
		COVID_DOSE2_SOURCE Vomit_CEOCCUR ancovConsentVersion HIV_CMTRT;
*Ghana vars dropped;
		f_COVID_DOSE1_CMSTDAT VAR105 VISIT_OBSLOC_Region VISIT_OBSLOC_Region_parent 
		VISIT_OBSLOC_Region_label VISIT_OBSLOC_Region_id VISIT_OBSLOC_Region_level 
		VISIT_OBSLOC_District VISIT_OBSLOC_District_parent VISIT_OBSLOC_District_label 
		VISIT_OBSLOC_District_id VISIT_OBSLOC_District_level VISIT_OBSLOC_Type VISIT_OBSLOC_Type_parent
		VISIT_OBSLOC_Type_label VISIT_OBSLOC_Type_id VISIT_OBSLOC_Type_level VISIT_OBSLOC_Type_locType 
		VISIT_OBSLOC_Village_or_Fac VAR39 VAR40 VAR41 VAR42 VISIT_VILLAGE_OBSLOC VISIT_Loc_other_OHOLOC 
		INTV_DSDECOD INTV_DSSTERM MOTHER_ADDRESS_CHANGE_YN MOTHER_VILLAGE_SCORRES MOTHER_CONTACT_CHANGE_YN 
		BIRTH_PLAN_OBSLOC_Region BIRTH_PLAN_OBSLOC_Region_id BIRTH_PLAN_OBSLOC_District 
		BIRTH_PLAN_OBSLOC_Dis_label BIRTH_PLAN_OBSLOC_Dis_id BIRTH_PLAN_OBSLOC_Dis_level 
		BIRTH_PLAN_OBSLOC_Type_par BIRTH_PLAN_OBSLOC_Type_label BIRTH_PLAN_OBSLOC_Type_id 
		BIRTH_PLAN_OBSLOC_Type_level BIRTH_PLAN_OBSLOC_Vil_or_Fac VAR148 VAR149 BIRTH_PLAN_VILLAGE_OBSLOC 
		BIRTH_PLAN_Loc_other_OHOLOC BIRTH_PLAN_OBSLOC_Reg_parent BIRTH_PLAN_OBSLOC_Reg_label 
		BIRTH_PLAN_OBSLOC_Reg_level BIRTH_PLAN_OBSLOC_Dis_paren BIRTH_PLAN_OBSLOC_Type 
		BIRTH_PLAN_OBSLOC_Type_loc VAR81 VAR82;  
*/
run;
ods rtf close;


*Output MNH04 datasets;
proc sort data=mnh04 out=mnh.mnh04; by caseid participantid; run; run;


**MNH05: Maternal Antrhropometry**;

*Import csv files from Synapes for each site - currently only data from Kenya, may be more than one table per form*;
%importcsv(dout=mnh05_kenya, tablename=kenya_mnh_baseline_anthropometry_1);
%impmerge(sitename=ghana, form=mnh05, tabname=mnh_baseline_anthropometry, tabnum=1, othertab1=mnh_baseline_anthropometry, othertab2=, format=);

*Set datasets from each site and create site indicator;
data mnh05_char;
set mnh05_kenya (in=inken) mnh05_ghana (in=ingha);
if caseid="**********" then delete;
*Site number for reports*;
if inken then siten=3;
else if ingha then siten=2;

*Rename variables > 32 characters;
rename	ANT_SPFY_FAC_OBSLOC_region_desce = ANT_SPFY_FAC_OBSLOC_reg_dcnt
		ANT_SPFY_FAC_OBSLOC_location_des  = ANT_SPFY_FAC_OBSLOC_loc_dcnt
		ANT_SPFY_FAC_OBSLOC_facility_des  = ANT_SPFY_FAC_OBSLOC_fac_dcnt
		ANT_OBSLOC_Region_descendantsCou  = ANT_OBSLOC_Region_dcnt
		ANT_OBSLOC_District_descendantsC  = ANT_OBSLOC_District_dcnt
		ANT_OBSLOC_Type_descendantsCount = ANT_OBSLOC_Type_dcnt
		ANT_OBSLOC_Village_or_Facility_d = ANT_OBSLOC_Vil_or_Fac_dcnt
		var43 = ANT_OBSLOC_Vil_or_Fac_lev
		ANT_SPFY_FAC_OBSLOC_region_paren=ANT_SPFY_FAC_OBSLOC_reg_par
		ANT_SPFY_FAC_OBSLOC_region_label=ANT_SPFY_FAC_OBSLOC_reg_lab
		ANT_SPFY_FAC_OBSLOC_region_id=ANT_SPFY_FAC_OBSLOC_reg_id
		ANT_SPFY_FAC_OBSLOC_region_level=ANT_SPFY_FAC_OBSLOC_reg_lev
		ANT_SPFY_FAC_OBSLOC_location_par=ANT_SPFY_FAC_OBSLOC_loc_par
		ANT_SPFY_FAC_OBSLOC_location_lab=ANT_SPFY_FAC_OBSLOC_loc_lab
		ANT_SPFY_FAC_OBSLOC_location_id=ANT_SPFY_FAC_OBSLOC_loc_id
		ANT_SPFY_FAC_OBSLOC_location_lev=ANT_SPFY_FAC_OBSLOC_loc_lev
		ANT_SPFY_FAC_OBSLOC_facility_par=ANT_SPFY_FAC_OBSLOC_fac_par
		ANT_SPFY_FAC_OBSLOC_facility_lab=ANT_SPFY_FAC_OBSLOC_fac_lab
		ANT_SPFY_FAC_OBSLOC_facility_id=ANT_SPFY_FAC_OBSLOC_fac_id
		ANT_SPFY_FAC_OBSLOC_facility_lev=ANT_SPFY_FAC_OBSLOC_fac_lev
		ANT_OBSLOC_Village_or_Facility=ANT_OBSLOC_Village_or_Fac
		ANT_OBSLOC_Village_or_Facility_p=ANT_OBSLOC_Village_or_Fac_p
		ANT_OBSLOC_Village_or_Facility_l=ANT_OBSLOC_Village_or_Fac_l
		ANT_OBSLOC_Village_or_Facility_i=ANT_OBSLOC_Village_or_Fac_i;
*Correct improper values;
		if WEIGHT_PERES='"66.4' then WEIGHT_PERES="66.4";
		if WEIGHT_PERES='60.9i' then WEIGHT_PERES="60.9";
		if WEIGHT_PERES="58.0." then WEIGHT_PERES="58.0";
		if HEIGHT_PERES='"169.5' then HEIGHT_PERES="169.5";
		if HEIGHT_PERES='158.4.' then HEIGHT_PERES="158.4";
		if HEIGHT_PERES='163.0(' then HEIGHT_PERES="163.0";
		if MUAC_PERES='1.3.0' then MUAC_PERES="13.0";
run;

*Convert to numeric (continuous, check one and date variables - Dates contain text NA, Check one contain NA and SKIPPED)*;
%char2num(inputdsn=mnh05_char, outputdsn=mnh05_num, excludevars=);
proc contents data=mnh05_num order=varnum; run;
proc freq data=mnh05_num; tables _char_; run;

/*ods EXCEL file="/rtpnfil03/rtpnfil03_vol5/ANCPNC_Collective/Data Monitoring and Analysis/Datasets/Documentation/Contents/mnh05contents.xlsx";
proc contents data=mnh05_num order=varnum; run;
ods EXCEL close;*/
*Set datasets from each site and create site indicator;
data mnh05;
set mnh05_num;
label
		SUBJID="Subject ID"
		ANT_PEDAT="Date of anthropometric assessment "
		ANT_OBSLOC="Location of Visit"
		/*ANT_SPFY_FAC_OBSLOC="Specify name of facility"*/
		/*ANT_GPS_OBSLOC="Record GPS Coordinates"*/
		ANT_SPFY_OTHR_OBSLOC="Specify other location"
		/*ANT_VISIT_N="Indicate visit when the anthropometric measurements were collected."*/
		ANC_N_VISIT="Indicate visit when the anthropometric measurements were collected."
		WEIGHT_PEPERF="Was the woman's weight measured?"
		WEIGHT_PERES="Record weight"
		HEIGHT_PEPERF="Was the woman's height measured?"
		HEIGHT_PERES="Record height"
		BMI_PERES="Body-Mass Index (BMI)"
		MUAC_PEPERF="Was Mid-Upper Arm Circumference measured?"
		MUAC_PERES="Record MUAC"
		COYN="Would you like to record any additional comments about this visit?"
		/*COVAL="Record comments"*/
		/*FORMCOMPLID="Record identifier of person completing form, as appropriate for your site (e.g., Name, initial, ID, or code). "*/
		caseid="Tangerine Case ID"
		participantid="Tangerine Participant ID"
		eventid="Tangerine Event ID"
		eventformid="Tangerine Event Form ID"
		startUnixtime="Tangerine Noted Unix Time"
		complete="Tangerine Noted Complete"
		SITEN="Site number for reports";
format
		WEIGHT_PEPERF HEIGHT_PEPERF MUAC_PEPERF COYN yn.
		/*ANT_VISIT_N MNH05_VISIT_N.*/
		ANC_N_VISIT MNH05_VISIT_N.
		ANT_OBSLOC MNH05_ANT_OBSLOC.
		ANT_PEDAT date9.;
		*drop variables not in DD or useless Tangerine variables;
drop
		ROW_VERSION formId  formtitle intro _id buildId buildChannel deviceId groupId
		ANT_SPFY_FAC_OBSLOC_region ANT_SPFY_FAC_OBSLOC_reg_dcnt ANT_SPFY_FAC_OBSLOC_location  
		ANT_SPFY_FAC_OBSLOC_loc_dcnt ANT_SPFY_FAC_OBSLOC_facility  ANT_SPFY_FAC_OBSLOC_fac_dcnt 
		final id ancovConsentVersion prismaContentVersion 
		WAIST_HIP_PEPERF WAIST_PERES HIP_PERES WTH_RATIO_PERES ANT_Date 
		ANT_WEIGHT ANT_clothes ANT_HEIGHT ANT_Hair ANT_BMI ANT_MUAC ANT_WAIST 
		ANT_HIP ANT_WTH ANT_VISDAT ANT_OBSLOC_Region ANT_OBSLOC_Region_parent 
		ANT_OBSLOC_Region_label ANT_OBSLOC_Region_id ANT_OBSLOC_Region_level 
		ANT_OBSLOC_Region_dcnt ANT_OBSLOC_District ANT_OBSLOC_District_parent 
		ANT_OBSLOC_District_label ANT_OBSLOC_District_id ANT_OBSLOC_District_level 
		ANT_OBSLOC_District_dcnt ANT_OBSLOC_Type ANT_OBSLOC_Type_parent 
		ANT_OBSLOC_Type_label ANT_OBSLOC_Type_id ANT_OBSLOC_Type_level 
		ANT_OBSLOC_Type_locationType ANT_OBSLOC_Type_dcnt  
		ANT_OBSLOC_Vil_or_Fac_lev ANT_OBSLOC_Vil_or_Fac_dcnt ANT_VILLAGE_OBSLOC ANT_Loc_other_OHOLOC 
		ANT_SPFY_FAC_OBSLOC_reg_par ANT_SPFY_FAC_OBSLOC_reg_lab ANT_SPFY_FAC_OBSLOC_reg_id ANT_SPFY_FAC_OBSLOC_reg_lev
		ANT_SPFY_FAC_OBSLOC_loc_par ANT_SPFY_FAC_OBSLOC_loc_lab ANT_SPFY_FAC_OBSLOC_loc_id
		ANT_SPFY_FAC_OBSLOC_loc_lev ANT_SPFY_FAC_OBSLOC_fac_par
		ANT_SPFY_FAC_OBSLOC_fac_lab ANT_SPFY_FAC_OBSLOC_fac_id ANT_SPFY_FAC_OBSLOC_fac_lev
ANT_OBSLOC_Village_or_Fac ANT_OBSLOC_Village_or_Fac_p ANT_OBSLOC_Village_or_Fac_l ANT_OBSLOC_Village_or_Fac_i;
run;


**Add prefix of M05_;
%varprefix(dset=mnh05, prefix=M05_, keepname="caseid" "scrnid" "participantid" "eventid" "eventformid" "siten")


*Check data;

/*ods EXCEL file="/rtpnfil03/rtpnfil03_vol5/ANCPNC_Collective/Data Monitoring and Analysis/Datasets/Documentation/Contents/mnh05contents.xlsx";
proc contents data=mnh05 order=varnum; run;
ods EXCEL close;*/

proc freq data=mnh05;
*Variables in DD/Tangerine kept;
tables 	caseid participantid eventid eventformid M05_startUnixtime M05_complete
M05_SUBJID M05_ANT_PEDAT M05_ANT_OBSLOC M05_ANT_SPFY_OTHR_OBSLOC M05_ANC_N_VISIT
M05_WEIGHT_PEPERF M05_WEIGHT_PERES M05_HEIGHT_PEPERF M05_HEIGHT_PERES
M05_BMI_PERES M05_MUAC_PEPERF M05_MUAC_PERES M05_COYN siten / list missing;
;
*variables dropped/ not in DD;
/*tables  
M05_ROW_VERSION M05_formId  M05_formtitle M05_intro M05__id M05_buildId M05_buildChannel M05_deviceId M05_groupId
M05_ANT_SPFY_FAC_OBSLOC_region M05_ANT_SPFY_FAC_OBSLOC_reg_dcnt M05_ANT_SPFY_FAC_OBSLOC_location  
M05_ANT_SPFY_FAC_OBSLOC_loc_dcnt M05_ANT_SPFY_FAC_OBSLOC_facility  M05_ANT_SPFY_FAC_OBSLOC_fac_dcnt 
M05_final M05_id M05_ancovConsentVersion M05_prismaContentVersion 
M05_WAIST_HIP_PEPERF M05_WAIST_PERES M05_HIP_PERES M05_WTH_RATIO_PERES M05_ANT_Date 
M05_ANT_WEIGHT M05_ANT_clothes M05_ANT_HEIGHT M05_ANT_Hair M05_ANT_BMI M05_ANT_MUAC M05_ANT_WAIST 
M05_ANT_HIP M05_ANT_WTH M05_ANT_VISDAT M05_ANT_OBSLOC_Region M05_ANT_OBSLOC_Region_parent 
M05_ANT_OBSLOC_Region_label M05_ANT_OBSLOC_Region_id M05_ANT_OBSLOC_Region_level 
M05_ANT_OBSLOC_Region_dcnt M05_ANT_OBSLOC_District M05_ANT_OBSLOC_District_parent 
M05_ANT_OBSLOC_District_label M05_ANT_OBSLOC_District_id M05_ANT_OBSLOC_District_level 
M05_ANT_OBSLOC_District_dcnt M05_ANT_OBSLOC_Type M05_ANT_OBSLOC_Type_parent 
M05_ANT_OBSLOC_Type_label M05_ANT_OBSLOC_Type_id M05_ANT_OBSLOC_Type_level 
M05_ANT_OBSLOC_Type_locationType M05_ANT_OBSLOC_Type_dcnt  
M05_ANT_OBSLOC_Vil_or_Fac_lev M05_ANT_OBSLOC_Vil_or_Fac_dcnt M05_ANT_VILLAGE_OBSLOC M05_ANT_Loc_other_OHOLOC 
M05_ANT_SPFY_FAC_OBSLOC_reg_lab M05_ANT_SPFY_FAC_OBSLOC_reg_id M05_ANT_SPFY_FAC_OBSLOC_reg_lev
M05_ANT_SPFY_FAC_OBSLOC_loc_par M05_ANT_SPFY_FAC_OBSLOC_loc_lab M05_ANT_SPFY_FAC_OBSLOC_loc_id
M05_ANT_SPFY_FAC_OBSLOC_loc_lev M05_ANT_SPFY_FAC_OBSLOC_fac_par M05_ANT_SPFY_FAC_OBSLOC_fac_lab
M05_ANT_SPFY_FAC_OBSLOC_fac_id M05_ANT_SPFY_FAC_OBSLOC_fac_lev M05_ANT_OBSLOC_Village_or_Fac
M05_ANT_OBSLOC_Village_or_Fac_p M05_ANT_OBSLOC_Village_or_Fac_l M05_ANT_OBSLOC_Village_or_Fac_i
 / list missing;*/
run;

*Output MN05 datasets;
proc sort data=mnh05 out=mnh.mnh05;  by caseid participantid; run;


**MNH06: Ultrasound**;

*Import csv files from Synapes for each site - currently only data from Kenya*;
%impmerge(sitename=kenya, form=mnh06, tabname=mnh_ultrasound, tabnum=2, othertab1=mnh_ultrasound, othertab2=, format=);
%impmerge(sitename=ghana, form=mnh06, tabname=mnh_ultrasound, tabnum=1, othertab1=mnh_ultrasound, othertab2=, format=);
proc import out=mnh06_pakistan dbms=xlsx replace
datafile="/rtpnfil03/rtpnfil03_vol5/ANCPNC_Collective/Data Monitoring and Analysis/Datasets/CSV Files/pakistan_MNH06.xlsx";
datarow=2; 
run;
/*ods noproctitle;*/
/*title 'MNH ARC Pakistan MNH06 Frequencies';*/
/*ods rtf file="/rtpnfil03/rtpnfil03_vol5/ANCPNC_Collective/Data Monitoring and Analysis/Datasets/ARC MNH Pakistan MNH06 Frequencies (2021.08.26).rtf" startpage=off style=customc;*/
/*proc freq data=mnh06_pakistan;*/
/*tables _all_;*/
/*run;*/
/*ods rtf close;*/

*Set datasets from each site and create site indicator;
data mnh06_char;
format SPFY_OTHR_OHOLOC $100.;
set mnh06_kenya (in=inken) mnh06_ghana (in=ingha);
if caseid="**********" then delete;

*Site number for reports*;
if inken then siten=3;
else if ingha then siten=2;

*Rename truncated vars;
rename  FAC_SPFY_OHOLOC_region_descendan = FAC_SPFY_OHOLOC_region_dcnt
		FAC_SPFY_OHOLOC_location_descend = FAC_SPFY_OHOLOC_location_dcnt
		FAC_SPFY_OHOLOC_facility_descend = FAC_SPFY_OHOLOC_facility_dcnt
		VISIT_FAC_OBSLOC_region_descenda = VISIT_FAC_OBSLOC_region_dcnt
		VISIT_FAC_OBSLOC_location_descen = VISIT_FAC_OBSLOC_location_dcnt
		VISIT_FAC_OBSLOC_facility_descen = VISIT_FAC_OBSLOC_facility_dcnt
		SPFY_FAC_OBSLOC_facility_descend = SPFY_FAC_OBSLOC_facility_dcnt
		SPFY_FAC_OBSLOC_region_descendan = SPFY_FAC_OBSLOC_region_dcnt
		SPFY_FAC_OBSLOC_location_descend = SPFY_FAC_OBSLOC_location_dcnt;

*Rename vars that will throw errors during char2num macro;
rename	VISIT_FAC_OBSLOC_location_parent = VISIT_FAC_OBSLOC_location_par
		VISIT_FAC_OBSLOC_facility_level  = VISIT_FAC_OBSLOC_facility_lev
		VISIT_FAC_OBSLOC_location_level  = VISIT_FAC_OBSLOC_location_lev
		VISIT_FAC_OBSLOC_facility_label  = VISIT_FAC_OBSLOC_facility_lab
		VISIT_FAC_OBSLOC_location_label  = VISIT_FAC_OBSLOC_location_lab
		VISIT_FAC_OBSLOC_facility_parent = VISIT_FAC_OBSLOC_facility_par
		SPFY_FAC_OBSLOC_facility_parent  = SPFY_FAC_OBSLOC_facility_par
		SPFY_FAC_OBSLOC_location_parent  = SPFY_FAC_OBSLOC_location_par;

*Manually correct incorrect value*;
if US_EDD_BRTHDAT="ke02m2" then US_EDD_BRTHDAT="";
run;

*Convert to numeric*;
%char2num(inputdsn=mnh06_char, outputdsn=mnh06_num, excludevars=);
proc contents data=mnh06_num order=varnum; run;
proc freq data=mnh06_num; tables _char_; run;

*Set converted dataset, add labels, add formats, review variables and drop system and site-specific variables;
data mnh06;
set mnh06_num;

*Delete empty records - Check if several key questions are all missing;
if cmiss(US_OHOSTDAT, US_OHOLOC, ANC_N_VISIT, US_PROCCUR, CRL_FAPERF, US_GA_weeks_AGE, US_EDD_BRTHDAT, 
	SINGLE_FAORRES, Cal_EDD_BRTHDAT)=9 then delete;

*Label variables - can make this more automated later*;
label	/*caseId="Case ID"
		participantId="Participant ID"
		eventId="Event ID"*/
		SITEN="Site number for reports"
		SUBJID="Subject ID"
		US_OHOSTDAT="Date of ultrasound (US)"
		US_OHOLOC="Location where US exam was conducted"
		FAC_SPFY_OHOLOC_region_label="MNH06 Facility region"	
		FAC_SPFY_OHOLOC_region_id="MNH06 Facility region ID"	
		FAC_SPFY_OHOLOC_location_label="MNH06 Facility location"	
		FAC_SPFY_OHOLOC_location_id="MNH06 Facility locationID"	
		FAC_SPFY_OHOLOC_facility_label="MNH06 Facility name"		
		FAC_SPFY_OHOLOC_facility_id="MNH06 Facility ID"	
/*		GPS_OHOLOC_longitude="Specify GPS coordinates of Participant's Home, Longitude" */
/*		GPS_OHOLOC_latitude="Specify GPS coordinates of Participant's Home, Latitude" */
/*		GPS_OHOLOC_accuracy="Specify GPS coordinates of Participant's Home, Accuracy"*/
		SPFY_OTHR_OHOLOC="MNH06 Specify other location"
		ANC_N_VISIT="Indicate the ANC visit when this form was completed"
		Devabst_yn="Is the type of device used for the US examiniation documented in the clinical record"
		Dev_spfy="Specify type of device used for US examination"
		US_PRLOC="Specify localization of pregnancy"
		US_PROCCUR="Can US measurement be obtained at this time"
		US_PRREASND="Specify reason that US cannot be obtained"
		US_OTHR_PRREASND="Specify other reason that US cannot be obtained"
		CRL_FAPERF="Can crown-rump length (CRL) be measured at this time?"
		CRL1_FAPERF="Is 1st CRL measurement available"
		CRL1_FAORRES="Record the 1st available CRL measurement"
		CRL2_FAPERF="Is 2nd CRL measurement available"
		CRL2_FAORRES="Record the 2nd available CRL measurement"
		CRL3_FAPERF="Is 3rd CRL measurement available"
		CRL3_FAORRES="Record the 3rd available CRL measurement"
		CRL_mean_FAORRES="Average CRL measurement"
		BPD_FAPERF="Is biparietal diameter (BPD) available?"
		BPD_FAORRES="Record BPD measurement"
		HC_FAPERF="Is head circumference (HC) available?"
		HC_FAORRES="Record HC measurement"
		AC_FAPERF="Is abdominal circumference (AC) available"
		AC_FAORRES="Record AC measurement"
		FL_FAPERF="Is femur length (FL) available"
		FL_FAORRES="Record FL measurement"
		US_GA_weeks_AGE="Gestational age by US (weeks)"
		US_GA_days_AGE="Gestational age by US (days)"
		US_EDD_BRTHDAT="EDD by US"
		Cal_GA_weeks_AGE="Calculated GA (weeks)"
		Cal_GA_days_AGE="Calculated GA (days)"
		Cal_EDD_BRTHDAT="Calculated EDD"
		SINGLE_FAORRES="Is this a single uterine gestation"
		NOT_SINGLE_FAORRES="Specify # of fetuses visualized"
		FHR_VSSTAT="Can fetal heart rate be visualized"
		FHR_VSORRES="Fetal HR"
		ANOMALY_FAORRES="Does US indicate presence of fetal anomalies"
		ANOMALY_SPFY_FAORRES="Specify type of anomaly"
		PRESENTATION_FAORRES="Fetal presentation"
		FHR2_VSSTAT="Can fetal heart rate be visualized (fetus 2)"
		FHR2_VSORRES="Fetal HR (fetus 2)"
		ANOMALY2_FAORRES="Does US indicate presence of fetal anomalies (fetus 2)?"
		ANOMALY2_SPFY_FAORRES="Specify type of anomaly (fetus 2)"
		PRESENTATION2_FAORRES="Fetal presentation (fetus 2)"
		FHR3_VSSTAT="Can fetal heart rate be visualized (fetus 3)?"
		FHR3_VSORRES="Fetal HR (fetus 3)"
		ANOMALY3_FAORRES="Does US indicate presence of fetal anomalies (fetus 3)?"
		ANOMALY3_SPFY_FAORRES="Specify type of anomaly (fetus 3)"
		PRESENTATION3_FAORRES="Fetal presentation (fetus 3)"
		FHR4_VSSTAT="Can fetal heart rate be visualized (fetus 4)?"
		FHR4_VSORRES="Fetal HR (fetus 4)"
		ANOMALY4_FAORRES="Does US indicate presence of fetal anomalies (fetus 4)?"
		ANOMALY4_SPFY_FAORRES="Specify type of anomaly (fetus 4)"
		PRESENTATION4_FAORRES="Fetal presentation (fetus 4)"
		AFI_FAPERF="Is amniotic fluid index available?"
		AFI_FAORRES="Amniotic Fluid Index"
		ABRUPTION_FAORRES="Is there evidence of placental abruption"
		PREVIA_FAORRES="Is there evidence of placenta previa"
		COYN="Would you like to provide any additional comments about Ultrasound?"
/*		COVAL="Provide comments"*/
/*		FORMCOMPLID="Record indentifier of person completing MN06"*/
		complete="Tangerine form completion variable?"
		caseid="Tangerine Case ID"
		participantid="Tangerine Participant ID"
		eventid="Tangerine Event ID"
		eventformid="Tangerine Event Form ID"
		startUnixtime="Tangerine Noted Unix Time"
		complete="Tangerine Noted Complete"
		SITEN="Site number for reports"
		HID_CALC_CONCEPTION="Tangerine calculated conception date?";
*Format variables*;
format 	Devabst_yn US_PROCCUR CRL_FAPERF CRL1_FAPERF CRL2_FAPERF CRL3_FAPERF BPD_FAPERF HC_FAPERF AC_FAPERF FL_FAPERF
		SINGLE_FAORRES FHR_VSSTAT FHR2_VSSTAT FHR3_VSSTAT FHR4_VSSTAT AFI_FAPERF COYN complete yn.
		ANOMALY_FAORRES ANOMALY2_FAORRES ANOMALY3_FAORRES ANOMALY4_FAORRES ABRUPTION_FAORRES PREVIA_FAORRES yndk.
		NOT_SINGLE_FAORRES MNH06_NOT_SINGLE_FAORRES.
		ANC_N_VISIT MNH06_ANC_N_VISIT.
		PRESENTATION_FAORRES PRESENTATION2_FAORRES PRESENTATION3_FAORRES PRESENTATION4_FAORRES MNH06_PRESENTATION_FAORRES.
		US_PRREASND	MNH06_US_PRREASND.
		US_OHOLOC MNH06_US_OHOLOC.
		US_PRLOC MNH06_US_PRLOC.
		Cal_EDD_BRTHDAT US_EDD_BRTHDAT US_OHOSTDAT date9.;

*Drop Tangerine variables that are not useful;
drop 	ROW_VERSION formId formtitle Ultrasound_intro buildId buildChannel groupId
 		GA gestational_HTML1 refer_instructions Adjust_instructions calc_outputs final
		text1 text2 text3 text4 text5 instructions  notice warn GeneralUltrasound_intro2 GeneralUltrasound_intro3 GeneralUltrasound_intro4
		FAC_SPFY_OHOLOC_region FAC_SPFY_OHOLOC_region_parent FAC_SPFY_OHOLOC_region_level FAC_SPFY_OHOLOC_region_dcnt 
		FAC_SPFY_OHOLOC_location FAC_SPFY_OHOLOC_location_parent FAC_SPFY_OHOLOC_location_level FAC_SPFY_OHOLOC_location_dcnt
		FAC_SPFY_OHOLOC_facility FAC_SPFY_OHOLOC_facility_parent FAC_SPFY_OHOLOC_facility_level FAC_SPFY_OHOLOC_facility_dcnt
		SPFY_FAC_OBSLOC_facility SPFY_FAC_OBSLOC_facility_dcnt SPFY_FAC_OBSLOC_facility_id SPFY_FAC_OBSLOC_facility_label 
		SPFY_FAC_OBSLOC_facility_level SPFY_FAC_OBSLOC_facility_par SPFY_FAC_OBSLOC_location SPFY_FAC_OBSLOC_location_dcnt SPFY_FAC_OBSLOC_location_id SPFY_FAC_OBSLOC_location_label 
		SPFY_FAC_OBSLOC_location_level SPFY_FAC_OBSLOC_location_par SPFY_FAC_OBSLOC_region SPFY_FAC_OBSLOC_region_dcnt SPFY_FAC_OBSLOC_region_id SPFY_FAC_OBSLOC_region_label 
		SPFY_FAC_OBSLOC_region_level SPFY_FAC_OBSLOC_region_parent VISIT_FAC_OBSLOC_facility VISIT_FAC_OBSLOC_facility_dcnt VISIT_FAC_OBSLOC_facility_id VISIT_FAC_OBSLOC_facility_lab 
		VISIT_FAC_OBSLOC_facility_lev VISIT_FAC_OBSLOC_facility_par VISIT_FAC_OBSLOC_location VISIT_FAC_OBSLOC_location_dcnt VISIT_FAC_OBSLOC_location_id VISIT_FAC_OBSLOC_location_lab 
		VISIT_FAC_OBSLOC_location_lev VISIT_FAC_OBSLOC_location_par VISIT_FAC_OBSLOC_region VISIT_FAC_OBSLOC_region_dcnt VISIT_FAC_OBSLOC_region_id VISIT_FAC_OBSLOC_region_label 
		VISIT_FAC_OBSLOC_region_level VISIT_FAC_OBSLOC_region_parent;
*Rename variables names that are too long for a prefix;
rename 		FAC_SPFY_OHOLOC_location_label=FAC_SPFY_OHOLOC_LocLab FAC_SPFY_OHOLOC_facility_label=FAC_SPFY_OHOLOC_FacLab;
*Drop variables not in DD/empty;
drop	BRTH_ORDER INTERVIEW_OBSLOC MALARIA_LBORRES MALARIA_LBPERF MALARIA_SPCPERF RBC_LBORRES RBC_LBPERF SPFY_OTHR_OBSLOC Subjtype_SCORRES 
		TESTS_OTH_SPCPERF_1 TESTS_OTH_SPCPERF_2 TESTS_OTH_SPCPERF_3 TESTS_OTH_SPCPERF_4 TESTS_OTH_SPCPERF_5 TESTS_OTH_SPCPERF_77 THIAM_LBORRESU THIAM_LBPERF 
		THIAM_nmoll_LBORRES THIAM_ugdl_LBORRES VITB12_LBPERF VITB12_ngml_LBORRES VITB12_pmoll_LBORRES VitB12_LBORRESU ancovConsentVersion 
		VISIT_FAC_SPFY_OBSLOC VISIT_OBSLOC VISIT_OBSSTDAT lab_intro prismaContentVersion test_intro;
*Drop variables not in DD-unknown;
drop 	GA_LMP_AGE id _id deviceid;

run;

**Add prefix of M06_;
%varprefix(dset=mnh06, prefix=M06_, keepname="caseid" "participantid" "eventid" "eventformid" "siten")


*Check data;
proc freq data=mnh06;
*Variables in DD;
tables 	M06_ABRUPTION_FAORRES M06_AC_FAORRES M06_AC_FAPERF M06_AFI_FAORRES M06_AFI_FAPERF M06_ANC_N_VISIT M06_ANOMALY2_FAORRES M06_ANOMALY2_SPFY_FAORRES M06_ANOMALY_FAORRES 
		M06_ANOMALY_SPFY_FAORRES M06_BPD_FAORRES M06_BPD_FAPERF M06_COYN M06_CRL1_FAORRES M06_CRL1_FAPERF M06_CRL2_FAORRES M06_CRL2_FAPERF M06_CRL3_FAORRES M06_CRL3_FAPERF M06_CRL_FAPERF
		M06_CRL_mean_FAORRES M06_Cal_EDD_BRTHDAT M06_Dev_spfy M06_Devabst_yn M06_FHR2_VSORRES M06_FHR2_VSSTAT M06_FHR_VSORRES M06_FHR_VSSTAT M06_FL_FAORRES M06_FL_FAPERF M06_HC_FAORRES 
		M06_HC_FAPERF M06_NOT_SINGLE_FAORRES M06_PRESENTATION2_FAORRES M06_PRESENTATION_FAORRES M06_PREVIA_FAORRES M06_SINGLE_FAORRES M06_SPFY_OTHR_OHOLOC M06_US_EDD_BRTHDAT 
		M06_US_OHOLOC M06_US_OHOSTDAT M06_US_OTHR_PRREASND M06_US_PRLOC M06_US_PROCCUR M06_US_PRREASND M06_Cal_GA_days_AGE M06_Cal_GA_weeks_AGE M06_US_GA_days_AGE M06_US_GA_weeks_AGE 
		siten M06_Complete;
*tables  ANOMALY3_FAORRES ANOMALY3_SPFY_FAORRES ANOMALY4_FAORRES ANOMALY4_SPFY_FAORRES FHR3_VSORRES FHR3_VSSTAT FHR4_VSORRES FHR4_VSSTAT
		PRESENTATION3_FAORRES PRESENTATION4_FAORRES;
*Variables not in DD / Kenya-specific?: Empty;
*tables BRTH_ORDER INTERVIEW_OBSLOC MALARIA_LBORRES MALARIA_LBPERF MALARIA_SPCPERF RBC_LBORRES RBC_LBPERF SPFY_OTHR_OBSLOC Subjtype_SCORRES 
		TESTS_OTH_SPCPERF_1 TESTS_OTH_SPCPERF_2 TESTS_OTH_SPCPERF_3 TESTS_OTH_SPCPERF_4 TESTS_OTH_SPCPERF_5 TESTS_OTH_SPCPERF_77 THIAM_LBORRESU THIAM_LBPERF 
		THIAM_nmoll_LBORRES THIAM_ugdl_LBORRES VITB12_LBPERF VITB12_ngml_LBORRES VITB12_pmoll_LBORRES VitB12_LBORRESU ancovConsentVersion 
		VISIT_FAC_SPFY_OBSLOC VISIT_OBSLOC VISIT_OBSSTDAT lab_intro prismaContentVersion test_intro;
*Variables in DD, but not in form;
*tables COVAL FORMCOMPLID;
*Facility and GPS: Check variables that may go together;
*tables FAC_SPFY_OHOLOC_region*FAC_SPFY_OHOLOC_region_parent*FAC_SPFY_OHOLOC_region_level*FAC_SPFY_OHOLOC_region_dcount 
		FAC_SPFY_OHOLOC_location*FAC_SPFY_OHOLOC_location_parent*FAC_SPFY_OHOLOC_location_level*FAC_SPFY_OHOLOC_location_dcount
		FAC_SPFY_OHOLOC_facility*FAC_SPFY_OHOLOC_facility_parent*FAC_SPFY_OHOLOC_facility_level*FAC_SPFY_OHOLOC_facility_dcount
		SPFY_FAC_OBSLOC_facility*SPFY_FAC_OBSLOC_facility_dcount*SPFY_FAC_OBSLOC_facility_id*SPFY_FAC_OBSLOC_facility_label*SPFY_FAC_OBSLOC_facility_level*SPFY_FAC_OBSLOC_facility_par
		SPFY_FAC_OBSLOC_location*SPFY_FAC_OBSLOC_location_dcount*SPFY_FAC_OBSLOC_location_id*SPFY_FAC_OBSLOC_location_label*SPFY_FAC_OBSLOC_location_level*SPFY_FAC_OBSLOC_location_par
		SPFY_FAC_OBSLOC_region*SPFY_FAC_OBSLOC_region_dcount*SPFY_FAC_OBSLOC_region_id*SPFY_FAC_OBSLOC_region_label*SPFY_FAC_OBSLOC_region_level*SPFY_FAC_OBSLOC_region_parent
		VISIT_FAC_OBSLOC_facility*VISIT_FAC_OBSLOC_facility_dcount*VISIT_FAC_OBSLOC_facility_id*VISIT_FAC_OBSLOC_facility_lab*VISIT_FAC_OBSLOC_facility_lev*VISIT_FAC_OBSLOC_facility_par
		VISIT_FAC_OBSLOC_location*VISIT_FAC_OBSLOC_location_dcount*VISIT_FAC_OBSLOC_location_id*VISIT_FAC_OBSLOC_location_lab*VISIT_FAC_OBSLOC_location_lev*VISIT_FAC_OBSLOC_location_par
		VISIT_FAC_OBSLOC_region*VISIT_FAC_OBSLOC_region_dcount*VISIT_FAC_OBSLOC_region_id*VISIT_FAC_OBSLOC_region_label*VISIT_FAC_OBSLOC_region_level*VISIT_FAC_OBSLOC_region_parent
		/ list missing;
run;


*Output MN06 datasets;
proc sort data=mnh06 out=mnh.mnh06;  by caseid participantid; run;


**MNH07: ANC Lab**;

*Macro to import CSV files forms and merge together split into muliple files*;
%impmerge(sitename=kenya, form=mnh07, tabname=mnh_baseline_lab_v2, tabnum=3, othertab1=, othertab2=, format=);
%impmerge(sitename=ghana, form=mnh07, tabname=mnh_baseline_lab_v2, tabnum=2, othertab1=mnh_baseline_lab_v2, othertab2=, format=);

*Set datasets from each site and create site indicator;
data mnh07_char;
length SYPH_SPFY_LBTEST $12;
set mnh07_kenya (in=inken) mnh07_ghana (in=ingha);
if caseid="**********" then delete;

*Site number for reports*;
if inken then siten=3;
else if ingha then siten=2;

*Manually update character values so they can be processed to numeric;
if MALARIA_LBPERF="PROCESS NO" then MALARIA_LBPERF="0";

*Rename truncated vars;
rename  VISIT_FAC_OBSLOC_region_descenda = VISIT_FAC_OBSLOC_region_dcnt
		VISIT_FAC_OBSLOC_location_descen = VISIT_FAC_OBSLOC_loc_dcnt
		VISIT_FAC_OBSLOC_facility_descen = VISIT_FAC_OBSLOC_fac_dcnt
		FAC_SPFY_OBSLOC_region_descendan = FAC_SPFY_OBSLOC_region_dcnt
		FAC_SPFY_OBSLOC_location_descend = FAC_SPFY_OBSLOC_loc_dcnt
		FAC_SPFY_OBSLOC_facility_descend = FAC_SPFY_OBSLOC_fac_dcnt
		VISIT_OBSLOC_Region_descendantsC = VISIT_OBSLOC_Region_dcnt
		VISIT_OBSLOC_District_descendant = VISIT_OBSLOC_District_dcnt
		VISIT_OBSLOC_Type_descendantsCou = VISIT_OBSLOC_Type_dcnt
		VISIT_FAC_OBSLOC_region_parent=VISIT_FAC_OBSLOC_reg_parent
		VISIT_FAC_OBSLOC_region_label=VISIT_FAC_OBSLOC_reg_label
		VISIT_FAC_OBSLOC_region_level=VISIT_FAC_OBSLOC_reg_level
		VISIT_FAC_OBSLOC_location_parent=VISIT_FAC_OBSLOC_loc_parent
		VISIT_FAC_OBSLOC_location_label=VISIT_FAC_OBSLOC_loc_label
		VISIT_FAC_OBSLOC_location_level=VISIT_FAC_OBSLOC_loc_level
		VISIT_FAC_OBSLOC_facility_parent=VISIT_FAC_OBSLOC_fac_parent
		VISIT_FAC_OBSLOC_facility_label=VISIT_FAC_OBSLOC_fac_label
		VISIT_FAC_OBSLOC_facility_level=VISIT_FAC_OBSLOC_fac_level
		FAC_SPFY_OBSLOC_location_label=FAC_SPFY_OBSLOC_loc_label
		FAC_SPFY_OBSLOC_facility_label=FAC_SPFY_OBSLOC_fac_label
		FAC_SPFY_OBSLOC_facility_level=FAC_SPFY_OBSLOC_fac_level
		FAC_SPFY_OBSLOC_region_parent=FAC_SPFY_OBSLOC_reg_parent
		FAC_SPFY_OBSLOC_location_parent=FAC_SPFY_OBSLOC_loc_parent
		FAC_SPFY_OBSLOC_location_level=FAC_SPFY_OBSLOC_loc_level
		FAC_SPFY_OBSLOC_facility_parent=FAC_SPFY_OBSLOC_fac_parent
		BGLUC_oral2hrs_mmolpL_LBORRES=GLUC_oral2hrs_molpL_LBORRES
		VISIT_OBSLOC_Type_locationType=VISIT_OBSLOC_Type_locType
		VISIT_OBSLOC_Village_or_Facility=VISIT_OBSLOC_Village_or_fac;

run;

*Convert to numeric*;
%char2num(inputdsn=mnh07_char, outputdsn=mnh07_num, excludevars=);

*Set converted dataset, add labels, add formats, review variables and drop system variables that are not useful;
data mnh07;
set mnh07_num;
*Delete empty records - Check if several key questions are all missing;
if cmiss(VISIT_OBSSTDAT, ANC_N_VISIT, CBC_SPCPERF, HB_POC_SPCPERF, LIVER_SPCPERF, HBA1C_SPCPERF, BGLUC_SPCPERF, THYROID_SPCPERF, HIV_SPCPERF, HIV_VLOAD_SPCPERF)=10 then delete;
*Label variables - can make this more automated later*;
label	SUBJID="Subject ID"
		VISIT_OBSSTDAT="Date of specimen collection"
		ANC_N_VISIT="Indicate ANC visit when specimens were collected"
		CBC_SPCPERF="Was a specimen collected to perform a Complete Blood Count (CBC)/Full Blood Count (FBC) panel?"
		CBC_HB_LBORRES="Hemoglobin (Hb) result"
		CBC_HCT_LBORRES="Hematocrit (HCT) result"
		CBC_WBC_LBORRES="WBC result"
		CBC_NEU_PCT_LBORRES="Neutrophils result (%)"
		CBC_NEU_FCC_LBORRES="Neutrophils result (full cell count)"
		CBC_LYMPH_PCT_LBORRES="Lymphocyte result (%)"
		CBC_LYMPH_LBORRES="Lymphocyte result "
		CBC_ERYTH_MM_LBORRES="Erythrocyte count result"
		CBC_MCV_LBORRES="MCV result"
		CBC_MCH_LBORRES="MCH result "
		CBC_MCHC_LBORRESU="Specify MCHC measurement unit"
		CBC_MCHC_GL_LBORRES="MCHC result "
		CBC_MCHC_GDL_LBORRES="MCHC result "
		CBC_PLATE_LBORRES="Platelets count"
		CBC_WCC_LBORRES="WCC result"
		CBC_MONO_PCT_LBORRES="Monocyte result (%)"
		CBC_MONO_FCC_LBORRES="Monocytes result (full cell count)"
		CBC_EOS_PCT_LBORRES="Eosinophils result (%)"
		CBC_EOS_FCC_LBORRES="Eosinophils result (full cell count)"
		HB_POC_SPCPERF="Was a specimen collected for point-of-care hemoglobin (Hb) testing?"
		HB_POC_LBPERF="Are point of care Hb results available?"
		HB_POC_LBORRES="Hb result"
		HB_POC_LAST_LBORRES="Hemoglobin result at last visit"
		HB_POC_CHANGE_LBORRES="Change in Hemoglobin Hb since last visit"
		LIVER_SPCPERF="Was a specimen collected to perform any type of liver function tests?"
		AST_LBPERF="Are AST/SGOT results available? "
		AST_LBORRESU="Specify AST/SGOT measurement unit"
		AST_ul_LBORRES="AST/SGOT test results"
		AST_ukatl_LBORRES="AST/SGOT test results"
		ALT_LBPERF="Are ALT/SGPT results available? "
		ALT_LBORRESU="Specify ALT/SGPT measurement unit"
		ALT_ul_LBORRES="ALT/SGPT test results"
		ALT_ukatl_LBORRES="ALT/SGPT test results"
		ALP_LBPERF="Are A.L.P results available? "
		ALP_LBORRES="A.L.P results"
		TBILIRUBIN_LBPERF="Are T.Bilirubin results available? "
		TBILIRUBIN_LBORRES="T.Bilirubin results"
		DBILIRUBIN_LBPERF="Are D.Bilirubin results available? "
		DBILIRUBIN_LBORRES="D.Bilirubin results"
		TPROTEIN_LBPERF="Are T.Protein results available? "
		TPROTEIN_LBORRES="T.Protein results"
		ALBUMIN_LBPERF="Are Albumin results available? "
		ALBUMIN_LBORRES="Albumin results"
		GAMMAGT_LBPERF="Are Gamma GT results available?"
		GAMMAGT_LBORRES="Gamma GT results"
		RENAL_LBPERF="Was a specimen collected to perform any type of  kidney (renal) function tests?"
		BUN_LBPERF="Are BUN results available? "
		BUN_LBORRESU="Specify BUN measurement unit"
		BUN_mgdl_LBORRES="BUN test results"
		BUN_mmoll_LBORRES="BUN test results"
		CREAT_LBPERF="Are serum creatinine results available? "
		CREAT_LBORRESU="Specify serum creatinine measurement unit"
		CREAT_mgdl_LBORRES="Serum creatinine test results"
		CREAT_umoll_LBORRES="Serum creatinine test results"
		SODIUM_LBPERF="Are sodium results available? "
		SODIUM_LBORRES="Sodium results"
		POTASSIUM_LBPERF="Are potassium results available? "
		POTASSIUM_LBORRES="Potassium results"
		CHLORIDE_LBPERF="Are chloride results available? "
		CHLORIDE_LBORRES="Chloride results"
		PHOSPHORUS_LBPERF="Are phosphorus results available? "
		PHOSPHORUS_LBORRES="Phosphorus results"
		CALCIUM_LBPERF="Are calcium results available? "
		CALCIUM_LBORRES="Calcium results"
		HBA1C_SPCPERF="Was specimen collected to perform Hemoglobin A1C (HbA1c) test?"
		HBA1C_LBPERF="Are Hemoglobin A1C (HbA1c) results available?"
		HBA1C_LBORRES="Hemoglobin A1C (HbA1c) test results"
		BGLUC_SPCPERF="Was specimen collected to perform  blood glucose testing?"
		BGLUC_ORAL_LBORRESU="Specify units used for glucose test results"
		BGLUC_ORAL_LBPERF="Are oral glucose-tolerance test results available?"
		BGLUC_ORAL_1HR_MGDL_LBORRES="Oral glucose-tolerance test results: 1 hour"
		BGLUC_ORAL_1HR_MMOLL_LBORRES="Oral glucose-tolerance test results: 1 hour"
		BGLUC_ORAL_2HR_MGDL_LBORRES="Oral glucose-tolerance test results: 2 hours"
		BGLUC_ORAL_2HR_MMOLL_LBORRES="Oral glucose-tolerance test results: 2 hours"
		BGLUC_RNDM_LBPERF="Are random blood glucose test results available?"
		BGLUC_RNDM_MGDL_LBORRES="Random blood glucose test results"
		BGLUC_RNDM_MMOLL_LBORRES="Random blood glucose test results"
		BGLUC_FAST_LBPERF="Are fasting blood glucose test results available?"
		BGLUC_FAST_MGDL_LBORRES="Fasting blood glucose test results"
		BGLUC_FAST_MMOLL_LBORRES="Fasting blood glucose test results"
		BGLUC_SPFY_LBPERF="Are other blood glucose test results available?"
		BGLUC_SPFY_LBTEST="Specify other blood glucose test"
		BGLUC_SPFY_LBORRES="Other blood glucose test results"
		THYROID_SPCPERF="Were any specimens collected to perform thyroid function tests?"
		THYROID_TSH_LBPERF="Are TSH results available? "
		THYROID_TSH_LBORRES="TSH test results"
		THYROID_FREET4_LBPERF="Are Free T4 results available? "
		THYROID_FREET4_LBORRES="Free T4 test results"
		THYROID_FREET3_LBPERF="Are T3 results available? "
		THYROID_FREET3_LBORRES="T3 results"
		THYROID_OTH_LBPERF="Are other thyroid function test results available? "
		THYROID_OTH_SPFY_LBTEST="Specify other thyroid function test"
		THYROID_OTH_LBORRES="Other thyroid function test results"
		RBC_LBPERF="Is RBC Transketolase activity result available?"
		RBC_LBORRES="RBC Transketolase activity results"
		THIAM_LBPERF="Is Thiamine pyrophosphate (Vitamin B1) result available?"
		THIAM_LBORRESU="Specify units for Thiamine pyrophosphate (Vitamin B1) test result"
		THIAM_ugdl_LBORRES="Thiamine pyrophosphate (Vitamin B1) test results"
		THIAM_nmoll_LBORRES="Thiamine pyrophosphate (Vitamin B1) test results"
		VITB12_LBPERF="Is Vitamin B12 result available?"
		VITB12_LBORRESU="Specify units for Vitamin B12"
		VITB12_ngml_LBORRES="Vitamin B12 result "
		VITB12_pmoll_LBORRES="Vitamin B12 result   "
		FOLATE_LBPERF="Is folate result available?"
		FOLATE_LBMETHOD="What was the folate test done on?"
		FOLATE_LBORRESU="Specify units for Folate"
		FOLATE_PLASMA_NGML_LBORRES="Folate result (Blood plasma)"
		FOLATE_PLASMA_NMOLL_LBORRES="Folate result (Blood plasma)"
		FOLATE_RBC_NGML_LBORRES="Folate result (RBC)"
		FOLATE_RBC_NMOLL_LBORRES="Folate result (RBC)"
		FERRITIN_LBPERF="Is ferritin result available?"
		FERRITIN_LBORRES="Ferritin result"
		BLD_GRP_LBORRES="Blood group"
		RH_FACTOR_LBORRES="RH factor"
		HIV_SPCPERF="Was specimen collected for HIV testing?"
		HIV_LBPERF="Are HIV test results available?"
		HIV_LBORRES="HIV result"
		HIV_VLOAD_SPCPERF="Was specimen collected to perform viral load?"
		HIV_VLOAD_LBPERF="Are viral load results available?"
		HIV_VLOAD_LBORRES="Viral load"
		TB_SCRN_SPCPERF="Was specimen collected for TB screening?"
		TB_SCRN_LBPERF="Are TB screening test results available?"
		TB_SCRN_LBORRES="TB screening test results"
		TB_CNFRM_SPCPERF="Was specimen collected for TB confirmation test?"
		TB_CNFRM_LBPERF="Are TB confirmation test results available?"
		TB_CNFRM_LBTEST="Specify which TB confirmation test was used"
		TB_CNFRM_LBORRES="TB confirmation test results"
		MALARIA_SPCPERF="Was specimen collected to perform malaria test?"
		MALARIA_LBPERF="Are malaria test results available?"
		MALARIA_LBORRES="Malaria test results"
		SYPH_SPCPERF="Was specimen collected for syphilis screening test?"
		SYPH_LBPERF="Are syphilis results avaialable "
		SYPH_LBTEST="Type of syphilis test"
		SYPH_SPFY_LBTEST="Specify other type of syphilis test"
		SYPH_LBORRES="Syphilis screening result"
		HEPB_SPCPERF="Was a specimen collected to perform Hepatitis B test (HBsAG)?"
		HEPB_LBPERF="Are Hepatitis B test results available (HBsAG)?"
		HEPB_LBORRES="Hepatitis B test results"
		HEPC_SPCPERF="Was a specimen collected to perform Hepatitis C (HCV) test?"
		HEPC_LBPERF="Are Hepatitis C (HCV) test results available?"
		HEPC_LBORRES="Hepatitis C test results"
		UA_SPCPERF="Was a specimen collected for any type of urinalysis testing?"
		UA_DIP_LBPERF="Is bacteriuria result available?"
		UA_DIP_LBORRES="UA dipstick test for bacteriuria result"
		UA_PROT_LBPERF="Is protienuria result available?"
		UA_PROT_LBORRES="Protienuria result"
		UA_WBC_LBPERF="Is WBC result available?"
		UA_WBC_LBORRES="WBC result"
		UA_NITRITE_LBPERF="Is nitrite result available?"
		UA_NITRITE_LBORRES="Nitrites result"
		UA_LEUK_LBPERF="Is leukocyte esterase result available?"
		UA_LEUK_LBORRES="Leukocyte esterase result"
/*		UA_QA_BAC_LBPERF="Is qualitative bacteria result available?"*/
		UA_QA_BAC_LBORRES="Bacteria result "
/*		UA_QT_BAC_LBPERF="Is quantitative bacteria result available?"*/
		UA_QT_BAC_LBORRES="Bacteria result (numerical)"
		UA_GLUC_LBPERF="Is glucose result available?"
		UA_GLUC_LBORRES="Glucose result"
		STOOL_SPCPERF="Was stool collected for ova or parasite examination?"
		STOOL_LBPERF="Are results available for the ova/parasite stool examination?"
		STOOL_SPFY_LBORRES="Specify other findings from stool examiniation"
		CBC_LBTEST_1="Indicate available CBC/FBC results: Hemoglobin"
		CBC_LBTEST_2="Indicate available CBC/FBC results: Hematocrit"
		CBC_LBTEST_3="Indicate available CBC/FBC results: White blood cells (WBC)"
		CBC_LBTEST_4="Indicate available CBC/FBC results: Neutrophils"
		CBC_LBTEST_5="Indicate available CBC/FBC results: Lymphocyte"
		CBC_LBTEST_6="Indicate available CBC/FBC results: Erythrocyte count"
		CBC_LBTEST_7="Indicate available CBC/FBC results: Mean cell volume (MCV)"
		CBC_LBTEST_8="Indicate available CBC/FBC results: Mean cell hemoglobin (MCH)"
		CBC_LBTEST_9="Indicate available CBC/FBC results: Mean corpuscular hemoglobin concentration (MCHC)"
		CBC_LBTEST_10="Indicate available CBC/FBC results: Platelets count"
		CBC_LBTEST_11="Indicate available CBC/FBC results: Total leucocyte count (WCC)"
		CBC_LBTEST_12="Indicate available CBC/FBC results: Monocytes"
		CBC_LBTEST_13="Indicate available CBC/FBC results: Eosinophils"
		CBC_NEU_LBTEST_1="Specify type of neutrophil result available: Percentage"
		CBC_NEU_LBTEST_2="Specify type of neutrophil result available: Full cell count"
		CBC_LYMPH_LBTEST_1="Specify type of lymphocyte result avalailable: Percentage"
		CBC_LYMPH_LBTEST_2="Specify type of lymphocyte result avalailable: Full cell count"
		CBC_MONO_LBTEST_1="Specify type of monocyte result available: Percentage"
		CBC_MONO_LBTEST_2="Specify type of monocyte result available: Full cell count"
		CBC_EOS_LBTEST_1="Specify type of Eosinophil result available: Percentage"
		CBC_EOS_LBTEST_2="Specify type of Eosinophil result available: Full cell count"
		LIVER_LBTEST_1="Specify type of liver function tests to be performed: AST/SGOT"
		LIVER_LBTEST_2="Specify type of liver function tests to be performed: ALT/SGPT"
		LIVER_LBTEST_3="Specify type of liver function tests to be performed: ALP"
		LIVER_LBTEST_4="Specify type of liver function tests to be performed: T. Bilirubin"
		LIVER_LBTEST_5="Specify type of liver function tests to be performed: D. Bilirubin"
		LIVER_LBTEST_6="Specify type of liver function tests to be performed: T. Protein"
		LIVER_LBTEST_7="Specify type of liver function tests to be performed: Albumin"
		LIVER_LBTEST_8="Specify type of liver function tests to be performed: Gamma GT"
		RENAL_LBORRES_1="Specify type of kidney function tests to be performed: BUN"
		RENAL_LBORRES_2="Specify type of kidney function tests to be performed: Serum creatinine"
		RENAL_LBORRES_3="Specify type of kidney function tests to be performed: Sodium"
		RENAL_LBORRES_4="Specify type of kidney function tests to be performed: Potassium"
		RENAL_LBORRES_5="Specify type of kidney function tests to be performed: Chloride"
		RENAL_LBORRES_6="Specify type of kidney function tests to be performed: Phosphorus"
		RENAL_LBORRES_7="Specify type of kidney function tests to be performed: Calcium"
		BGLUC_LBTEST_1="Type of blood glucose test(s) to be performed: Oral glucose-tolerance test"
		BGLUC_LBTEST_2="Type of blood glucose test(s) to be performed: Random blood glucose test"
		BGLUC_LBTEST_3="Type of blood glucose test(s) to be performed: Fasting blood glucose test"
		BGLUC_LBTEST_88="Type of blood glucose test(s) to be performed: Other"
		THYROID_LBTEST_1="Specify type of thyroid function test(s) to be performed: TSH"
		THYROID_LBTEST_2="Specify type of thyroid function test(s) to be performed: Free T4"
		THYROID_LBTEST_3="Specify type of thyroid function test(s) to be performed: Free T3"
		THYROID_LBTEST_88="Specify type of thyroid function test(s) to be performed: Other"
		TESTS_OTH_SPCPERF_1="Was a specimen collected to perform any of the following tests: RBC Transketolase activity"
		TESTS_OTH_SPCPERF_2="Was a specimen collected to perform any of the following tests: Thiamine pyrophosphate (Vitamin B1)"
		TESTS_OTH_SPCPERF_3="Was a specimen collected to perform any of the following tests: Vitamin B12"
		TESTS_OTH_SPCPERF_4="Was a specimen collected to perform any of the following tests: Foalte"
		TESTS_OTH_SPCPERF_5="Was a specimen collected to perform any of the following tests: Ferritin"
		TESTS_OTH_SPCPERF_77="Was a specimen collected to perform any of the following tests: NA"
		UA_LBTEST_1="Type of urinalysis test(s) to be performed: Dipstick test for bacteriuria"
		UA_LBTEST_2="Type of urinalysis test(s) to be performed: Proteinuria"
		UA_LBTEST_3="Type of urinalysis test(s) to be performed: WBC"
		UA_LBTEST_4="Type of urinalysis test(s) to be performed: Nitrites"
		UA_LBTEST_5="Type of urinalysis test(s) to be performed: Leukocyte esterase"
		UA_LBTEST_6="Type of urinalysis test(s) to be performed: Bacteria"
		UA_LBTEST_7="Type of urinalysis test(s) to be performed: Glucose"
		STOOL_LBORRES_0="Findings of stool examination: Negative (no ova or parasite)"
		STOOL_LBORRES_1="Findings of stool examination: Hookworm"
		STOOL_LBORRES_2="Findings of stool examination: Ascaris"
		STOOL_LBORRES_3="Findings of stool examination: Amoebiasis"
		STOOL_LBORRES_4="Findings of stool examination: Tapeworm"
		STOOL_LBORRES_5="Findings of stool examination: Giardiasis"
		STOOL_LBORRES_6="Findings of stool examination: Hymenolepiasis"
		STOOL_LBORRES_88="Findings of stool examination: Other"
		COYN="Would you like to record any additional comments about this visit?"
		caseid="Tangerine Case ID"
		participantid="Tangerine Participant ID"
		eventid="Tangerine Event ID"
		eventformid="Tangerine Form ID"
		startUnixtime="Tangerine Noted Unix Time"
		complete="Tangerine Noted Complete"
		siten="Site number for reports";
*Format variables*;
format  HB_POC_SPCPERF HB_POC_LBPERF LIVER_SPCPERF AST_LBPERF ALT_LBPERF ALP_LBPERF TBILIRUBIN_LBPERF DBILIRUBIN_LBPERF TPROTEIN_LBPERF ALBUMIN_LBPERF GAMMAGT_LBPERF RENAL_LBPERF 
		BUN_LBPERF CREAT_LBPERF SODIUM_LBPERF POTASSIUM_LBPERF CHLORIDE_LBPERF PHOSPHORUS_LBPERF CALCIUM_LBPERF HBA1C_SPCPERF HBA1C_LBPERF BGLUC_SPCPERF BGLUC_SPFY_LBPERF 
		THYROID_SPCPERF THYROID_TSH_LBPERF THYROID_FREET4_LBPERF THYROID_FREET3_LBPERF THYROID_OTH_LBPERF RBC_LBPERF THIAM_LBPERF VITB12_LBPERF FOLATE_LBPERF FERRITIN_LBPERF 
		HIV_SPCPERF HIV_LBPERF HIV_VLOAD_SPCPERF HIV_VLOAD_LBPERF TB_SCRN_SPCPERF TB_SCRN_LBPERF TB_CNFRM_SPCPERF TB_CNFRM_LBPERF MALARIA_SPCPERF MALARIA_LBPERF SYPH_SPCPERF 
		SYPH_LBPERF HEPB_SPCPERF HEPB_LBPERF HEPC_SPCPERF HEPC_LBPERF UA_SPCPERF UA_DIP_LBPERF UA_PROT_LBPERF UA_WBC_LBPERF UA_NITRITE_LBPERF UA_LEUK_LBPERF /*UA_QA_BAC_LBPERF 
		UA_QT_BAC_LBPERF*/ UA_GLUC_LBPERF STOOL_LBPERF COYN BGLUC_ORAL_LBORRESU BGLUC_FAST_LBPERF BGLUC_RNDM_LBPERF BGLUC_ORAL_LBPERF complete yn. VISIT_OBSLOC MNH07_VISIT_OBSLOC. 
		CBC_SPCPERF MNH07_RESULTS_AVAIL. CBC_MCHC_LBORRESU MNH07_MCHC_UNIT. BUN_LBORRESU BGLUC_ORAL_LBORRESU MNH07_BUNGLU_UNIT. CREAT_LBORRESU MNH07_CREAT_UNIT. BLD_GRP_LBORRES MNH07_BLDGRP. 
		CREAT_LBORRESU MNH07_CREAT_UNIT. THIAM_LBORRESU MNH07_THIAM_UNIT. VITB12_LBORRESU MNH07_B12_UNIT. FOLATE_LBMETHOD MNH07_FOL_ON. FOLATE_LBORRESU MNH07_FOL_UNIT. 
		HIV_LBORRES TB_SCRN_LBORRES TB_CNFRM_LBORRES MALARIA_LBORRES SYPH_LBORRES HEPB_LBORRES HEPC_LBORRES UA_DIP_LBORRES UA_GLUC_LBORRES MNH07_NEGPOS. ANC_N_VISIT MNH07_ANC_N_VISIT. 
		RH_FACTOR_LBORRES MNH07_RH. TB_CNFRM_LBTEST MNH07_TB. UA_PROT_LBORRES UA_NITRITE_LBORRES UA_LEUK_LBORRES MNH07_UA. VISIT_OBSSTDAT date9. STOOL_SPCPERF MNH07_STOOL.
		CBC_LBTEST_1 CBC_LBTEST_2 CBC_LBTEST_3 CBC_LBTEST_4 CBC_LBTEST_5 CBC_LBTEST_6 CBC_LBTEST_7 CBC_LBTEST_8 CBC_LBTEST_9 CBC_LBTEST_10 CBC_LBTEST_11 CBC_LBTEST_12 CBC_LBTEST_13 CBC_NEU_LBTEST_1 
		CBC_NEU_LBTEST_2 CBC_LYMPH_LBTEST_1 CBC_LYMPH_LBTEST_2 CBC_MONO_LBTEST_1 CBC_MONO_LBTEST_2 CBC_EOS_LBTEST_1 CBC_EOS_LBTEST_2 LIVER_LBTEST_1 LIVER_LBTEST_2 LIVER_LBTEST_3 LIVER_LBTEST_4 
		LIVER_LBTEST_5 LIVER_LBTEST_6 LIVER_LBTEST_7 LIVER_LBTEST_8 RENAL_LBORRES_1 RENAL_LBORRES_2 RENAL_LBORRES_3 RENAL_LBORRES_4 RENAL_LBORRES_5 RENAL_LBORRES_6 RENAL_LBORRES_7 BGLUC_LBTEST_1 
		BGLUC_LBTEST_2 BGLUC_LBTEST_3 BGLUC_LBTEST_88 THYROID_LBTEST_1 THYROID_LBTEST_2 THYROID_LBTEST_3 THYROID_LBTEST_88 TESTS_OTH_SPCPERF_1 TESTS_OTH_SPCPERF_2 TESTS_OTH_SPCPERF_3 
		TESTS_OTH_SPCPERF_4 TESTS_OTH_SPCPERF_5 TESTS_OTH_SPCPERF_77 UA_LBTEST_1 UA_LBTEST_2 UA_LBTEST_3 UA_LBTEST_4 UA_LBTEST_5 UA_LBTEST_6 UA_LBTEST_7 STOOL_LBORRES_0 STOOL_LBORRES_1 
		STOOL_LBORRES_2 STOOL_LBORRES_3 STOOL_LBORRES_4 STOOL_LBORRES_5 STOOL_LBORRES_6 STOOL_LBORRES_88 ckall. AST_LBORRESU ALT_LBORRESU MNH07_ASTALT_UNIT. UA_QA_BAC_LBORRES MNH07_QA.
		SYPH_LBTEST MNH07_SYPH.;
*Drop Tangerine variables that are not useful;
drop 	id ROW_VERSION formId formtitle buildId buildChannel groupId FAC_SPFY_OBSLOC_fac_dcnt FAC_SPFY_OBSLOC_fac_label FAC_SPFY_OBSLOC_fac_level FAC_SPFY_OBSLOC_fac_parent 
		FAC_SPFY_OBSLOC_facility FAC_SPFY_OBSLOC_facility_id FAC_SPFY_OBSLOC_loc_dcnt FAC_SPFY_OBSLOC_loc_label FAC_SPFY_OBSLOC_loc_level FAC_SPFY_OBSLOC_loc_parent 
		FAC_SPFY_OBSLOC_location FAC_SPFY_OBSLOC_location_id FAC_SPFY_OBSLOC_reg_parent FAC_SPFY_OBSLOC_region FAC_SPFY_OBSLOC_region_dcnt FAC_SPFY_OBSLOC_region_id 
		FAC_SPFY_OBSLOC_region_label FAC_SPFY_OBSLOC_region_level VISIT_FAC_OBSLOC_fac_dcnt VISIT_FAC_OBSLOC_fac_label VISIT_FAC_OBSLOC_fac_level VISIT_FAC_OBSLOC_fac_parent 
		VISIT_FAC_OBSLOC_facility VISIT_FAC_OBSLOC_facility_id VISIT_FAC_OBSLOC_loc_dcnt VISIT_FAC_OBSLOC_loc_label VISIT_FAC_OBSLOC_loc_level VISIT_FAC_OBSLOC_loc_parent 
		VISIT_FAC_OBSLOC_location VISIT_FAC_OBSLOC_location_id VISIT_FAC_OBSLOC_reg_label VISIT_FAC_OBSLOC_reg_level VISIT_FAC_OBSLOC_reg_parent VISIT_FAC_OBSLOC_region 
		VISIT_FAC_OBSLOC_region_dcnt VISIT_FAC_OBSLOC_region_id VISIT_FAC_SPFY_OBSLOC VISIT_Loc_other_OHOLOC VISIT_OBSLOC VISIT_OBSLOC_District VISIT_OBSLOC_District_dcnt 
		VISIT_OBSLOC_District_id VISIT_OBSLOC_District_label VISIT_OBSLOC_District_level VISIT_OBSLOC_District_parent VISIT_OBSLOC_Region VISIT_OBSLOC_Region_dcnt 
		VISIT_OBSLOC_Region_id VISIT_OBSLOC_Region_label VISIT_OBSLOC_Region_level VISIT_OBSLOC_Region_parent VISIT_OBSLOC_Type VISIT_OBSLOC_Type_dcnt VISIT_OBSLOC_Type_id 
		VISIT_OBSLOC_Type_label VISIT_OBSLOC_Type_level VISIT_OBSLOC_Type_locType VISIT_OBSLOC_Type_parent VISIT_OBSLOC_Village_or_fac _id ancovConsentVersion deviceId final 
		prismaContentVersion;
*Drop site specific variables: Kenya;
drop    ALT_SGPT1_LBORRES ALT_SGPT2_LBORRES ALT_SGPT_LBORRESU AST_SGOT1_LBORRES AST_SGOT2_LBORRES AST_SGOT_LBORRESU BGLUC_LBDAT BGLUC_LBORRESU BGLUC_LBPERF BGLUC_LBPERF_Results 
		BGLUC_LBTEST BGLUC_fast_mgpdL_LBORRES BGLUC_fast_mmolpL_LBORRES BGLUC_oral1hr_mgpdL_LBORRES BGLUC_oral1hr_mmolpL_LBORRES BGLUC_oral2hrs_mgpdL_LBORRES BGLUC_random_mgpdL_LBORRES 
		BGLUC_random_mmolpL_LBORRES BUN1_LBORRES BUN2_LBORRES CBC_AVAIL_LBPERF_1 CBC_AVAIL_LBPERF_2 CBC_AVAIL_LBPERF_3 CBC_AVAIL_LBPERF_4 CBC_AVAIL_LBPERF_5 CBC_AVAIL_LBPERF_6 
		CBC_AVAIL_LBPERF_7 CBC_AVAIL_LBPERF_8 CBC_AVAIL_LBPERF_9 CBC_AVAIL_LBPERF_10 CBC_AVAIL_LBPERF_11 CBC_AVAIL_LBPERF_12 CBC_AVAIL_LBPERF_13 CBC_LBDAT CBC_LBPERF CMP_LBDAT 
		CMP_LBPERF CMP_LBPERF_Results CMP_LBTEST_1 CMP_LBTEST_2 CMP_LBTEST_3 CMP_LBTEST_4 CMP_SPCPERF CMP_SPFY_LBPERF_1 CMP_SPFY_LBPERF_2 CMP_SPFY_LBPERF_3 CMP_SPFY_LBPERF_4 
		Ferritin_LBDAT Folate_BP_ngpmL_LBORRES Folate_BP_nmolpL_LBORRES Folate_LBDAT Folate_LBTEST Folate_RBC_ngpmL_LBORRES Folate_RBC_nmolpL_LBORRES GLUC_oral2hrs_molpL_LBORRES 
		HIV_LBDAT HIV_LBPERF_Results HIV_vLoad_LBPERF_Results Hb2_LBDATE Hb2_LBORRES Hb2_LBPERF Hb2_LBPERF_Results HbA1c_LBDAT HbA1c_LBPERF_Results Hbchange_LBORRES Hbprev_LBORRES 
		HepB_LBDAT HepB_LBPERF_Results HepC_LBDAT HepC_LBPERF_Results LAB_OBSSTDAT Malaria_LBDAT Malaria_LBPERF_Results RBCTran1_LBORRES RBCTran_LBDAT SPFY_OTHR_OBSLOC STOOL_LBORRES_7 
		STOOL_LBPERF_Results STOOL_OTHR_LBORRES SYPH_LBDAT SYPH_LBPERF_Results TB_confirm_LBDAT TB_confirm_LBORRES TB_confirm_LBPERF TB_confirm_LBPERF_Results TB_confirm_LBTEST 
		TB_screen_LBDAT TB_screen_LBORRES TB_screen_LBPERF TB_screen_LBPERF_Results Tests_Other_LBPERF_1 Tests_Other_LBPERF_2 Tests_Other_LBPERF_3 Tests_Other_LBPERF_4 
		Tests_Other_LBPERF_5 Tests_Other_LBPERF_77 Tests_Other_LBPERF_Results_1 Tests_Other_LBPERF_Results_2 Tests_Other_LBPERF_Results_3 Tests_Other_LBPERF_Results_4 
		Tests_Other_LBPERF_Results_5 Thiaminepyro_LBDAT Thiaminepyro_LBORRESU Thiaminepyro_mgpdL_LBORRES Thiaminepyro_nmolpL_LBORRES Thyroid_FreeT4_LBDAT Thyroid_LBPERF 
		Thyroid_LBTEST_Results_1 Thyroid_LBTEST_Results_2 Thyroid_LBTEST_Results_88 Thyroid_Other_LBDAT Thyroid_Other_LBORRES Thyroid_Other_SPFY_LBTEST Thyroid_TSH_LBDAT 
		UA_LBDAT UA_LBORRES_1 UA_LBORRES_2 UA_LBORRES_3 UA_LBORRES_4 UA_LBORRES_5 UA_LBORRES_6 UA_LBORRES_7 UA_LBPERF UA_LBPERF_Results UA_LBTEST_77 UA_LEUK_QA_LBORRES UA_LEUK_QT_LBPERF 
		UA_bac_2_LBORRES UA_bac_LBORRES UA_glu_LBORRES UA_leu_LBORRES UA_nit_LBORRES VAR119 VAR127 VAR139 VAR140 VAR145 VAR151 VitB12_LBDAT VitB12_ngpmL_LBORRES VitB12_pmolpL_LBORRES 
		creat1_LBORRES creat2_LBORRES;
*Drop site specific variables: Ghana;
drop    BLD_EDTA_SPCPERF BLD_EDTA_SPCREASND BLD_EDTA_SPFY_SPCREASND VAG_N_SPC VAG_SPCPERF VAG_SPCREASND VAG_SPFY_SPCREASND VAR39 VAR40 VAR41 VAR42 VAR43 VISIT_VILLAGE_OBSLOC;
*Drop other unknown variables;
drop    UA_LEUK_QA_LBPERF UA_LEUK_QT_LBORRES lab_intro;
run;

**Add prefix of M07_;
%varprefix(dset=mnh07, prefix=M07_, keepname="caseid" "participantid" "eventid" "eventformid" "siten")

proc freq data=mnh07; 
tables  /*siten caseid participantid eventid eventformid M07_startUnixtime M07_complete M07_SUBJID*/ M07_VISIT_OBSSTDAT M07_ANC_N_VISIT M07_CBC_SPCPERF M07_CBC_LBTEST_1 M07_CBC_LBTEST_2 M07_CBC_LBTEST_3 
		M07_CBC_LBTEST_4 M07_CBC_LBTEST_5 M07_CBC_LBTEST_6 M07_CBC_LBTEST_7 M07_CBC_LBTEST_8 M07_CBC_LBTEST_9 M07_CBC_LBTEST_10 M07_CBC_LBTEST_11 M07_CBC_LBTEST_12 M07_CBC_LBTEST_13 
		M07_HB_POC_SPCPERF M07_HB_POC_LBPERF M07_HB_POC_LBORRES M07_HB_POC_LAST_LBORRES M07_HB_POC_CHANGE_LBORRES M07_LIVER_SPCPERF M07_LIVER_LBTEST_1 M07_LIVER_LBTEST_2 M07_LIVER_LBTEST_3 
		M07_LIVER_LBTEST_4 M07_LIVER_LBTEST_5 M07_LIVER_LBTEST_6 M07_LIVER_LBTEST_7 M07_LIVER_LBTEST_8 M07_AST_LBPERF M07_AST_LBORRESU M07_AST_ul_LBORRES M07_AST_ukatl_LBORRES M07_ALT_LBPERF 
		M07_ALT_LBORRESU M07_ALT_ul_LBORRES M07_ALT_ukatl_LBORRES M07_ALP_LBPERF M07_ALP_LBORRES M07_RENAL_LBPERF M07_RENAL_LBORRES_1 M07_RENAL_LBORRES_2 M07_RENAL_LBORRES_3 M07_RENAL_LBORRES_4 
		M07_RENAL_LBORRES_5 M07_RENAL_LBORRES_6 M07_RENAL_LBORRES_7 M07_BUN_LBPERF M07_BUN_LBORRESU M07_BUN_mgdl_LBORRES M07_BUN_mmoll_LBORRES M07_CREAT_LBPERF M07_CREAT_LBORRESU 
		M07_CREAT_mgdl_LBORRES M07_CREAT_umoll_LBORRES M07_SODIUM_LBPERF M07_SODIUM_LBORRES M07_HBA1C_SPCPERF M07_HBA1C_LBPERF M07_HBA1C_LBORRES M07_BGLUC_SPCPERF M07_BGLUC_LBTEST_1 
		M07_BGLUC_LBTEST_2 M07_BGLUC_LBTEST_3 M07_BGLUC_LBTEST_88 M07_BGLUC_ORAL_LBORRESU M07_BGLUC_ORAL_LBPERF M07_BGLUC_ORAL_1HR_MGDL_LBORRES M07_BGLUC_ORAL_1HR_MMOLL_LBORRES 
		M07_BGLUC_ORAL_2HR_MGDL_LBORRES M07_BGLUC_ORAL_2HR_MMOLL_LBORRES M07_BGLUC_RNDM_LBPERF M07_BGLUC_RNDM_MGDL_LBORRES M07_BGLUC_RNDM_MMOLL_LBORRES M07_THYROID_SPCPERF M07_Thyroid_LBTEST_1 
		M07_Thyroid_LBTEST_2 M07_Thyroid_LBTEST_3 M07_Thyroid_LBTEST_88 M07_THYROID_TSH_LBPERF M07_THYROID_TSH_LBORRES M07_THYROID_FREET4_LBPERF M07_THYROID_FREET4_LBORRES M07_THYROID_FREET3_LBPERF 
		M07_THYROID_FREET3_LBORRES M07_THYROID_OTH_LBPERF M07_THYROID_OTH_SPFY_LBTEST M07_THYROID_OTH_LBORRES M07_TESTS_OTH_SPCPERF_1 M07_TESTS_OTH_SPCPERF_2 M07_TESTS_OTH_SPCPERF_3 
		M07_TESTS_OTH_SPCPERF_4 M07_TESTS_OTH_SPCPERF_5 M07_TESTS_OTH_SPCPERF_77 M07_RBC_LBPERF M07_RBC_LBORRES M07_THIAM_LBPERF M07_THIAM_LBORRESU M07_THIAM_ugdl_LBORRES M07_THIAM_nmoll_LBORRES 
		M07_VITB12_LBPERF M07_VitB12_LBORRESU M07_VITB12_ngml_LBORRES M07_VITB12_pmoll_LBORRES M07_HIV_SPCPERF M07_HIV_LBPERF M07_HIV_LBORRES M07_HIV_VLOAD_SPCPERF M07_HIV_VLOAD_LBPERF 
		M07_HIV_VLOAD_LBORRES M07_TB_SCRN_SPCPERF M07_TB_SCRN_LBPERF M07_TB_SCRN_LBORRES M07_TB_CNFRM_SPCPERF M07_TB_CNFRM_LBPERF M07_MALARIA_SPCPERF M07_MALARIA_LBPERF M07_MALARIA_LBORRES 
		M07_SYPH_SPCPERF M07_HEPB_SPCPERF M07_HEPC_SPCPERF M07_HEPC_LBORRES M07_UA_SPCPERF M07_UA_LBTEST_2 M07_UA_LBTEST_5 M07_UA_LBTEST_6 M07_UA_PROT_LBPERF M07_UA_PROT_LBORRES M07_STOOL_LBPERF 
		M07_STOOL_LBORRES_0 M07_STOOL_LBORRES_2 M07_STOOL_LBORRES_4 M07_STOOL_LBORRES_5 M07_STOOL_LBORRES_6 M07_STOOL_LBORRES_88 M07_TBILIRUBIN_LBPERF M07_TBILIRUBIN_LBORRES M07_DBILIRUBIN_LBORRES 
		M07_TPROTEIN_LBORRES M07_GAMMAGT_LBORRES M07_CHLORIDE_LBORRES M07_PHOSPHORUS_LBORRES M07_CALCIUM_LBPERF M07_CALCIUM_LBORRES M07_BLD_GRP_LBORRES M07_RH_FACTOR_LBORRES M07_UA_NITRITE_LBPERF 
		M07_UA_NITRITE_LBORRES M07_UA_QA_BAC_LBORRES M07_UA_QT_BAC_LBORRES M07_UA_GLUC_LBORRES M07_BGLUC_FAST_MGDL_LBORRES M07_FOLATE_LBMETHOD M07_Folate_LBORRESU M07_FOLATE_PLASMA_NGML_LBORRES 
		M07_FOLATE_RBC_NMOLL_LBORRES M07_CBC_HB_LBORRES M07_CBC_HCT_LBORRES M07_CBC_NEU_LBTEST_1 M07_CBC_NEU_PCT_LBORRES M07_CBC_NEU_FCC_LBORRES M07_CBC_LYMPH_LBTEST_1 M07_CBC_LYMPH_LBTEST_2 
		M07_CBC_Lymph_PCT_LBORRES M07_CBC_MCHC_GDL_LBORRES M07_CBC_PLATE_LBORRES M07_CBC_MONO_LBTEST_2 M07_CBC_Mono_FCC_LBORRES M07_CBC_EOS_LBTEST_1 M07_CBC_EOS_LBTEST_2 M07_CBC_EOS_PCT_LBORRES 
		M07_CBC_EOS_FCC_LBORRES M07_HepB_LBORRES M07_HepC_LBPERF M07_TB_CNFRM_LBTEST M07_TB_CNFRM_LBORRES M07_SYPH_LBPERF M07_SYPH_LBTEST M07_SYPH_SPFY_LBTEST M07_SYPH_LBORRES 
		M07_HEPB_LBPERF M07_UA_LBTEST_1 M07_UA_LBTEST_3 M07_UA_LBTEST_4 M07_UA_LBTEST_7 M07_UA_DIP_LBPERF M07_UA_DIP_LBORRES M07_UA_WBC_LBPERF M07_UA_WBC_LBORRES M07_STOOL_SPCPERF 
		M07_STOOL_LBORRES_1 M07_STOOL_LBORRES_3 M07_STOOL_SPFY_LBORRES M07_COYN M07_DBILIRUBIN_LBPERF M07_TPROTEIN_LBPERF M07_ALBUMIN_LBPERF M07_ALBUMIN_LBORRES M07_GAMMAGT_LBPERF 
		M07_POTASSIUM_LBPERF M07_POTASSIUM_LBORRES M07_CHLORIDE_LBPERF M07_PHOSPHORUS_LBPERF M07_UA_LEUK_LBPERF M07_UA_LEUK_LBORRES M07_UA_GLUC_LBPERF M07_BGLUC_FAST_LBPERF 
		M07_BGLUC_FAST_MMOLL_LBORRES M07_BGLUC_SPFY_LBPERF M07_BGLUC_SPFY_LBTEST M07_BGLUC_SPFY_LBORRES M07_FOLATE_LBPERF M07_FOLATE_PLASMA_NMOLL_LBORRES M07_FOLATE_RBC_NGML_LBORRES 
		M07_FERRITIN_LBPERF M07_FERRITIN_LBORRES M07_CBC_WBC_LBORRES M07_CBC_NEU_LBTEST_2 M07_CBC_Lymph_LBORRES M07_CBC_Eryth_mm_LBORRES M07_CBC_MCV_LBORRES M07_CBC_MCH_LBORRES 
		M07_CBC_MCHC_LBORRESU M07_CBC_MCHC_GL_LBORRES M07_CBC_WCC_LBORRES M07_CBC_MONO_LBTEST_1 M07_CBC_Mono_PCT_LBORRES; 
run;

proc sort data=mnh07 out=mnh.mnh07;  by caseid participantid; run;


**MNH07T: ANC Lab Trailing**;

*Macro to import CSV files forms and merge together split into muliple files*;
%impmerge(sitename=kenya, form=mnh07T, tabname=mnh_baseline_lab_trailing, tabnum=3, othertab1=, othertab2=, format=);
%impmerge(sitename=ghana, form=mnh07T, tabname=mnh_baseline_lab_trailing, tabnum=1, othertab1=mnh_baseline_lab_trailing, othertab2=, format=);

*Set datasets from each site and create site indicator;
data mnh07T_char;
length BGLUC_SPFY_LBTEST $25;
set mnh07T_kenya (in=inken) mnh07T_ghana (in=ingha);
if caseid="**********" then delete;

*Site number for reports*;
if inken then siten=3;
else if ingha then siten=2;

*Rename equivalent Ghana variables to match Kenya name;
rename BGLUC_ORAL_1HR_MMOLL_LBORRES=GLU_ORA_1HR_MMOLL_LBORRES
		BGLUC_ORAL_2HR_MMOLL_LBORRES=GLU_ORA_2HR_MMOLL_LBORRES
		BGLUC_oral1hr_mmolpL_LBORRES=GLU_ora1hr_mmolpL_LBORRES
		BGLUC_oral2hrs_mgpdL_LBORRES=GLU_ora2hrs_mgpdL_LBORRES
		BGLUC_oral2hrs_mmolpL_LBORRES=GLU_ora2hrs_mmolpL_LBORRES;
run;

*Convert to numeric (continuous, check one and date variables - Dates contain text NA, Check one contain NA and SKIPPED)*;
%char2num(inputdsn=mnh07T_char, outputdsn=mnh07T_num, excludevars=);

*Set converted dataset, add labels, add formats, review variables and drop system variables that are not useful;
data mnh07T;
set mnh07T_num;
*Delete empty records - Check if several key questions are all missing;
if cmiss(CBC_LBTSTDAT, CBC_PLATE_LBORRES, HB_POC_LBORRES, AST_ul_LBORRES, CREAT_umoll_LBORRES, BGLUC_ORAL_2HR_MGDL_LBORRES, THYROID_TSH_LBORRES, VITB12_LBTSTDAT, FERRITIN_LBORRES, UA_NITRITE_LBTSTDAT)=10 then delete;
*Label variables - can make this more automated later*;
label	SUBJID="Subject ID"
		CBC_LBTSTDAT="Date of CBC/FBC result"
		CBC_HB_LBORRES="Hemoglobin (Hb) result"
		CBC_HCT_LBORRES="Hematocrit (HCT) result"
		CBC_WBC_LBORRES="WBC result"
		CBC_NEU_PCT_LBORRES="Neutrophils result (%)"
		CBC_NEU_FCC_LBORRES="Neutrophils result (full cell count)"
		CBC_LYMPH_PCT_LBORRES="Lymphocyte result (%)"
		CBC_LYMPH_LBORRES="Lymphocyte result "
		CBC_ERYTH_MM_LBORRES="Erythrocyte count result"
		CBC_MCV_LBORRES="MCV result"
		CBC_MCH_LBORRES="MCH result "
/*		CBC_MCHC_LBORRESU="Specify MCHC measurement unit"*/
		CBC_MCHC_GL_LBORRES="MCHC result "
		CBC_MCHC_GDL_LBORRES="MCHC result "
		CBC_PLATE_LBORRES="Platelets count"
		CBC_WCC_LBORRES="WCC result"
		CBC_MONO_PCT_LBORRES="Monocyte result (%)"
		CBC_MONO_FCC_LBORRES="Monocytes result (full cell count)"
		CBC_EOS_PCT_LBORRES="Eosinophils result (%)"
		CBC_EOS_FCC_LBORRES="Eosinophils result (full cell count)"
/*		HB_POC_LBTSTDAT="Date of point of care Hb result"*/
		HB_POC_LBORRES="Point of care Hb result"
		HB_POC_LAST_LBORRES="Hemoglobin result at last visit"
		HB_POC_CHANGE_LBORRES="Change in hemoglobin Hb since last visit"
		LFT_LBTSTDAT="Date of LFT result"
		AST_LBORRESU="Specify AST/SGOT measurement unit"
		AST_ul_LBORRES="AST/SGOT test results"
		AST_ukatl_LBORRES="AST/SGOT test results"
		ALT_LBORRESU="Specify ALT/SGPT measurement unit"
		ALT_ul_LBORRES="ALT/SGPT test results"
		ALT_ukatl_LBORRES="ALT/SGPT test results"
		ALP_LBORRES="A.L.P results"
		TBILIRUBIN_LBORRES="T. Bilirubin results"
		DBILIRUBIN_LBORRES="D. Bilirubin results"
		TPROTEIN_LBORRES="T. Protein results"
		ALBUMIN_LBORRES="Albumin results"
		GAMMAGT_LBORRES="Gamma GT results"
		RFT_LBTSTDAT="Date of Kidney Function Test Results"
		BUN_LBORRESU="Specify BUN measurement unit"
		BUN_mgdl_LBORRES="BUN test results"
		BUN_mmoll_LBORRES="BUN test results"
		CREAT_LBORRESU="Specify serum creatinine measurement unit"
		CREAT_mgdl_LBORRES="Serum creatinine test results"
		CREAT_umoll_LBORRES="Serum creatinine test results"
		SODIUM_LBORRES="Sodium results"
		POTASSIUM_LBORRES="Potassium results"
		CHLORIDE_LBORRES="Chloride results"
		PHOSPHORUS_LBORRES="Phosphorus results"
		CALCIUM_LBORRES="Calcium results"
		HBA1C_LBTSTDAT="Date of results"
		HBA1C_LBORRES="Hemoglobin A1C (HbA1c) test results"
		BGLUC_ORAL_LBORRESU="Specify units used for glucose test results"
		BGLUC_ORAL_LBTSTDAT="Date of glucose test result"
		BGLUC_ORAL_1HR_MGDL_LBORRES="Oral glucose-tolerance test results: 1 hour"
/*		BGLUC_ORAL_1HR_MMOLL_LBORRES="Oral glucose-tolerance test results: 1 hour"*/
		BGLUC_ORAL_2HR_MGDL_LBORRES="Oral glucose-tolerance test results: 2 hours"
/*		BGLUC_ORAL_2HR_MMOLL_LBORRES="Oral glucose-tolerance test results: 2 hours"*/
		BGLUC_RNDM_LBTSTDAT="Date of random blood glucose result"
		BGLUC_RNDM_MGDL_LBORRES="Random blood glucose test results"
		BGLUC_RNDM_MMOLL_LBORRES="Random blood glucose test results"
		BGLUC_FAST_LBTSTDAT="Date of fasting blood glucose result"
		BGLUC_FAST_MGDL_LBORRES="Fasting blood glucose test results"
		BGLUC_FAST_MMOLL_LBORRES="Fasting blood glucose test results"
		BGLUC_SPFY_LBTSTDAT="Date of other glucose test result"
		BGLUC_SPFY_LBTEST="Specify other glucose test"
		BGLUC_SPFY_LBORRES="Other glucose test results"
		THYROID_LBTSTDAT="Date of TSH result"
		THYROID_TSH_LBORRES="TSH test results"
		THYROID_FREET4_LBTSTDAT="Date of result"
		THYROID_FREET4_LBORRES="Free T4 test results"
/*		THYROID_FREET3_LBTSTDAT="Date of result"*/
/*		THYROID_FREET3_LBORRES="Free T3 test results"*/
		THYROID_OTH_SPFY_LBTEST="Specify other thyroid function test"
		THYROID_OTH_LBTSTDAT="Date of other thyroid function test result"
		THYROID_OTH_LBORRES="Other thyroid function test results"
		RBC_LBTSTDAT="Date of RBC transketolase activity result "
		RBC_LBORRES="RBC Transketolase activity results"
		THIA_LBTSTDAT="Date of Thiamine pyrophosphate (Vitamin B1) test result"
		THIAM_LBORRESU="Specify units for Thiamine pyrophosphate (Vitamin B1) test result"
		THIAM_ugdl_LBORRES="Thiamine pyrophosphate (Vitamin B1) test results"
		THIAM_nmoll_LBORRES="Thiamine pyrophosphate (Vitamin B1) test results"
		VITB12_LBTSTDAT="Date of Vitamin B12 result"
		VITB12_LBORRESU="Specify units for Vitamin B12"
		VITB12_ngml_LBORRES="Vitamin B12 result"
		VITB12_pmoll_LBORRES="Vitamin B12 result"
		FOLATE_LBTSTDAT="Date of folate test result"
		FOLATE_LBMETHOD="What was the folate test done on?"
		FOLATE_LBORRESU="Specify units for Folate"
		FOLATE_PLASMA_NGML_LBORRES="Folate result (Blood plasma)"
		FOLATE_PLASMA_NMOLL_LBORRES="Folate result (Blood plasma)"
		FOLATE_RBC_NGML_LBORRES="Folate result (RBC)"
		FOLATE_RBC_NMOLL_LBORRES="Folate result (RBC)"
		FERRITIN_LBTSTDAT="Date of ferritin result "
		FERRITIN_LBORRES="Ferritin result"
		BLD_GRP_LBTSTDAT="Date of blood group result"
		BLD_GRP_LBORRES="Blood group"
		RH_FACTOR_LBTSTDAT="Date of RH factor result"
		RH_FACTOR_LBORRES="RH factor"
		HIV_LBTSTDAT="Date of HIV result"
		HIV_LBORRES="HIV result"
		HIV_VLOAD_LBTSTDAT="Date of viral load result"
		HIV_VLOAD_LBORRES="Viral load"
		TB_SCRN_LBTSTDAT="Date of TB screening test results"
		TB_SCRN_LBORRES="TB screening test results"
		TB_CNFRM_LBTEST="Type of TB confirmatory test"
		TB_CRNFRM_LBTSTDAT="Date of TB confirmatory test results"
		TB_CNFRM_LBORRES="TB confirmatory test results"
		MALARIA_LBTSTDAT="Date of malaria test results"
		MALARIA_LBORRES="Malaria test results"
		SYPH_LBTEST="Type of syphilis test"
		SYPH_SPFY_LBTEST="Specify other type of syphilis test"
		SYPH_LBTSTDAT="Date of syphilis result"
		SYPH_LBORRES="Syphilis screening result"
		HEPB_LBTSTDAT="Date of Hepatitis B result"
		HEPB_LBORRES="Hepatitis B test results"
		HEPC_LBTSTDAT="Date of Hepatitis C result"
		HEPC_LBORRES="Hepatitis C test results"
		UA_DIP_LBTSTDAT="Date of bacteriuria result"
		UA_DIP_LBORRES="Bacteriuria result"
		UA_PROT_LBTSTDAT="Date of protienuria result"
		UA_PROT_LBORRES="Protienuria result"
		UA_WBC_LBTSTDAT="Date of WBC result"
		UA_WBC_LBORRES="WBC result"
		UA_NITRITE_LBTSTDAT="Date of nitrites result"
		UA_NITRITE_LBORRES="Nitrites result"
		UA_LEUK_LBTSTDAT="Date of leukocyte esterase result"
		UA_LEUK_LBORRES="Leukocyte esterase result"
		UA_QA_BAC_LBTSTDAT="Date of qualitative bacteria result"
		UA_QA_BAC_LBORRES="Qualitative bacteria result "
		UA_QT_BAC_LBTSTDAT="Date of bacteria result"
		UA_QT_BAC_LBORRES="Bacteria result (numerical)"
		UA_GLUC_LBTSTDAT="Date of glucose result"
		UA_GLUC_LBORRES="Glucose result"
		STOOL_LBTSTDAT="Date of stool examiniation result"
		STOOL_SPFY_LBORRES="Specify other findings from stool examiniation"
		CBC_LBTEST_1="Indicate available CBC/FBC results: Hemoglobin"
		CBC_LBTEST_2="Indicate available CBC/FBC results: Hematocrit"
		CBC_LBTEST_3="Indicate available CBC/FBC results: White blood cells (WBC)"
		CBC_LBTEST_4="Indicate available CBC/FBC results: Neutrophils"
		CBC_LBTEST_5="Indicate available CBC/FBC results: Lymphocyte"
		CBC_LBTEST_6="Indicate available CBC/FBC results: Erythrocyte count"
		CBC_LBTEST_7="Indicate available CBC/FBC results: Mean cell volume (MCV)"
		CBC_LBTEST_8="Indicate available CBC/FBC results: Mean cell hemoglobin (MCH)"
		CBC_LBTEST_9="Indicate available CBC/FBC results: Mean corpuscular hemoglobin concentration (MCHC)"
		CBC_LBTEST_10="Indicate available CBC/FBC results: Platelets count"
		CBC_LBTEST_11="Indicate available CBC/FBC results: Total leucocyte count (WCC)"
		CBC_LBTEST_12="Indicate available CBC/FBC results: Monocytes"
		CBC_LBTEST_13="Indicate available CBC/FBC results: Eosinophils"
		CBC_NEU_LBTEST_1="Specify type of neutrophil result available: Percentage"
		CBC_NEU_LBTEST_2="Specify type of neutrophil result available: Full cell count"
		CBC_LYMPH_LBTEST_1="Specify type of lymphocyte result avalailable: Percentage"
		CBC_LYMPH_LBTEST_2="Specify type of lymphocyte result avalailable: Full cell count"
		CBC_MONO_LBTEST_1="Specify type of monocyte result available: Percentage"
		CBC_MONO_LBTEST_2="Specify type of monocyte result available: Full cell count"
		CBC_EOS_LBTEST_1="Specify type of Eosinophil result available: Percentage"
		CBC_EOS_LBTEST_2="Specify type of Eosinophil result available: Full cell count"
		LIVER_LBTEST_1="Specify type of liver function tests to be performed: AST/SGOT"
		LIVER_LBTEST_2="Specify type of liver function tests to be performed: ALT/SGPT"
		LIVER_LBTEST_3="Specify type of liver function tests to be performed: ALP"
		LIVER_LBTEST_4="Specify type of liver function tests to be performed: T. Bilirubin"
		LIVER_LBTEST_5="Specify type of liver function tests to be performed: D. Bilirubin"
		LIVER_LBTEST_6="Specify type of liver function tests to be performed: T. Protein"
		LIVER_LBTEST_7="Specify type of liver function tests to be performed: Albumin"
		LIVER_LBTEST_8="Specify type of liver function tests to be performed: Gamma GT"
		RENAL_LBORRES_1="Specify type of kidney function tests to be performed: BUN"
		RENAL_LBORRES_2="Specify type of kidney function tests to be performed: Serum creatinine"
		RENAL_LBORRES_3="Specify type of kidney function tests to be performed: Sodium"
		RENAL_LBORRES_4="Specify type of kidney function tests to be performed: Potassium"
		RENAL_LBORRES_5="Specify type of kidney function tests to be performed: Chloride"
		RENAL_LBORRES_6="Specify type of kidney function tests to be performed: Phosphorus"
		RENAL_LBORRES_7="Specify type of kidney function tests to be performed: Calcium"
		BGLUC_LBTEST_1="Type of blood glucose test(s) to be performed: Oral glucose-tolerance test"
		BGLUC_LBTEST_2="Type of blood glucose test(s) to be performed: Random blood glucose test"
		BGLUC_LBTEST_3="Type of blood glucose test(s) to be performed: Fasting blood glucose test"
		BGLUC_LBTEST_88="Type of blood glucose test(s) to be performed: Other"
		UA_LBTEST_1="Type of urinalysis test(s) to be performed: Bacteriuria"
		UA_LBTEST_2="Type of urinalysis test(s) to be performed: Proteinuria"
		UA_LBTEST_3="Type of urinalysis test(s) to be performed: WBC"
		UA_LBTEST_4="Type of urinalysis test(s) to be performed: Nitrites"
		UA_LBTEST_5="Type of urinalysis test(s) to be performed: Leukocyte esterase"
		UA_LBTEST_6="Type of urinalysis test(s) to be performed: Qualitative bacteria"
		UA_LBTEST_7="Type of urinalysis test(s) to be performed: Quantitative bacteria"
		UA_LBTEST_8="Type of urinalysis test(s) to be performed: Glucose"
		STOOL_LBORRES_1="Findings of stool examination: Negative (no ova or parasite)"
		STOOL_LBORRES_2="Findings of stool examination: Hookworm"
		STOOL_LBORRES_3="Findings of stool examination: Ascaris"
		STOOL_LBORRES_4="Findings of stool examination: Amoebiasis"
		STOOL_LBORRES_5="Findings of stool examination: Tapeworm"
		STOOL_LBORRES_6="Findings of stool examination: Giardiasis"
		STOOL_LBORRES_7="Findings of stool examination: Hymenolepiasis"
		STOOL_LBORRES_88="Findings of stool examination: Other"
		COYN="Would you like to record any additional comments about this visit?"
		caseid="Tangerine Case ID"
		participantid="Tangerine Participant ID"
		eventid="Tangerine Event ID"
		eventformid="Tangerine Form ID"
		startUnixtime="Tangerine Noted Unix Time"
		complete="Tangerine Noted Complete"
		siten="Site number for reports";
*Format variables*;
format  /*CBC_MCHC_LBORRESU MNH07_MCHC_UNIT.*/ AST_LBORRESU ALT_LBORRESU MNH07_ASTALT_UNIT. BUN_LBORRESU BGLUC_ORAL_LBORRESU MNH07_BUNGLU_UNIT. CREAT_LBORRESU MNH07_CREAT_UNIT.
		THIAM_LBORRESU MNH07_THIAM_UNIT. VITB12_LBORRESU MNH07_B12_UNIT. FOLATE_LBMETHOD MNH07_FOL_ON. FOLATE_LBORRESU MNH07_FOL_UNIT. BLD_GRP_LBORRES MNH07_BLDGRP.
		HIV_LBORRES TB_SCRN_LBORRES TB_CNFRM_LBORRES MALARIA_LBORRES SYPH_LBORRES HEPB_LBORRES HEPC_LBORRES UA_DIP_LBORRES UA_GLUC_LBORRES MNH07_NEGPOS.
		RH_FACTOR_LBORRES MNH07_RH. TB_CNFRM_LBTEST MNH07_TB. SYPH_LBTEST MNH07_SYPH. UA_PROT_LBORRES UA_NITRITE_LBORRES UA_LEUK_LBORRES MNH07_UA. UA_QA_BAC_LBORRES MNH07_QA. COYN complete yn.
		LIVER_LBTEST_1 LIVER_LBTEST_2 LIVER_LBTEST_3 LIVER_LBTEST_4 LIVER_LBTEST_5 LIVER_LBTEST_6 LIVER_LBTEST_7 LIVER_LBTEST_8 RENAL_LBORRES_1 RENAL_LBORRES_2 RENAL_LBORRES_3 RENAL_LBORRES_4 
		RENAL_LBORRES_5 RENAL_LBORRES_6 RENAL_LBORRES_7 BGLUC_LBTEST_1 BGLUC_LBTEST_2 BGLUC_LBTEST_3 BGLUC_LBTEST_88 UA_LBTEST_1 UA_LBTEST_2 UA_LBTEST_3 UA_LBTEST_4 UA_LBTEST_5 UA_LBTEST_6 
		UA_LBTEST_7 UA_LBTEST_8 STOOL_LBORRES_1 STOOL_LBORRES_2 STOOL_LBORRES_3 STOOL_LBORRES_4 STOOL_LBORRES_5 STOOL_LBORRES_6 STOOL_LBORRES_7 STOOL_LBORRES_88 
		CBC_LBTEST_1 CBC_LBTEST_2 CBC_LBTEST_3 CBC_LBTEST_4 CBC_LBTEST_5 CBC_LBTEST_6 CBC_LBTEST_7 CBC_LBTEST_8 CBC_LBTEST_9 CBC_LBTEST_10 CBC_LBTEST_11 CBC_LBTEST_12 CBC_LBTEST_13 
		CBC_NEU_LBTEST_1 CBC_NEU_LBTEST_2 CBC_LYMPH_LBTEST_1 CBC_LYMPH_LBTEST_2 CBC_MONO_LBTEST_1 CBC_MONO_LBTEST_2 CBC_EOS_LBTEST_1 CBC_EOS_LBTEST_2 ckall.
		LFT_LBTSTDAT THYROID_LBTSTDAT RFT_LBTSTDAT HEPB_LBTSTDAT CBC_LBTSTDAT UA_DIP_LBTSTDAT UA_PROT_LBTSTDAT UA_WBC_LBTSTDAT UA_WBC_LBTSTDAT UA_NITRITE_LBTSTDAT UA_LEUK_LBTSTDAT 
		UA_QA_BAC_LBTSTDAT UA_QT_BAC_LBTSTDAT UA_GLUC_LBTSTDAT MALARIA_LBTSTDAT BLD_GRP_LBTSTDAT BGLUC_ORAL_LBTSTDAT BGLUC_RNDM_LBTSTDAT BGLUC_SPFY_LBTSTDAT HBA1C_LBTSTDAT THYROID_OTH_LBTSTDAT 
		RBC_LBTSTDAT VITB12_LBTSTDAT FERRITIN_LBTSTDAT HIV_LBTSTDAT HIV_VLOAD_LBTSTDAT HEPC_LBTSTDAT STOOL_LBTSTDAT SYPH_LBTSTDAT BGLUC_FAST_LBTSTDAT TB_SCRN_LBTSTDAT TB_CRNFRM_LBTSTDAT 
		RH_FACTOR_LBTSTDAT FOLATE_LBTSTDAT date9.;
*Drop Tangerine variables that are not useful;
drop 	ROW_VERSION formId formtitle buildId buildChannel groupId prismaContentVersion deviceId ancovConsentVersion id _Id final;
*Drop Kenya specific variables;
drop    ALBUMIN_LBTSTDAT ALP_LBTSTDAT ALT_LBTSTDAT ALT_SGPT1_LBORRES ALT_SGPT2_LBORRES ALT_SGPT_LBORRESU ANOMALY2_FAORRES ANOMALY2_SPFY_FAORRES ANOMALY4_FAORRES ANOMALY4_SPFY_FAORRES 
		AST_LBTSTDAT AST_SGOT1_LBORRES AST_SGOT2_LBORRES AST_SGOT_LBORRESU BGLUC_LBDAT BGLUC_LBORRESU BGLUC_LBTEST BGLUC_LBTSTDAT BGLUC_fast_mgpdL_LBORRES BGLUC_fast_mmolpL_LBORRES 
		BGLUC_intro BGLUC_oral1hr_mgpdL_LBORRES BGLUC_random_mgpdL_LBORRES BGLUC_random_mmolpL_LBORRES BUN1_LBORRES BUN2_LBORRES BUN_LBTSTDAT CBC_Eosino_PCT_LBORRES 
		CBC_Eosino_full_LBORRES CBC_MCHC_gpL_LBORRES CBC_MCHC_gpdL_LBORRES CBC_MCH_LBORRESU CBC_platelets_LBORRES CHLORIDE_LBTSTDAT CMP_LBDAT CMP_LBTEST_1 CMP_LBTEST_2 CMP_LBTEST_3 
		CMP_LBTEST_4 CMP_LBTSTDAT CMP_SPFY_LBPERF_1 CMP_SPFY_LBPERF_2 CMP_SPFY_LBPERF_3 CMP_SPFY_LBPERF_4 CMP_intro CREAT_LBTSTDAT DBILIRUBIN_LBTSTDAT FHR2_VSORRES FHR2_VSSTAT 
		FHR4_VSORRES FHR4_VSSTAT FOLAT_LBTSTDAT Ferritin_LBDAT Folate_BP_ngpmL_LBORRES Folate_BP_nmolpL_LBORRES Folate_LBDAT Folate_LBTEST Folate_RBC_ngpmL_LBORRES 
		Folate_RBC_nmolpL_LBORRES GAMMAGT_LBTSTDAT GeneralUltrasound_intro2 GeneralUltrasound_intro4 HIV_LBDAT Hb2_LBDATE Hb2_LBORRES HbA1c_LBDAT Hbchange_LBORRES Hbprev_LBORRES 
		Hemocue_intro HepB_LBDAT HepC_LBDAT Hep_tests_intro Malaria_LBDAT Other_tests_intro PHOSPHORUS_LBTSTDAT POTASSIUM_LBTSTDAT PRESENTATION2_FAORRES PRESENTATION4_FAORRES 
		RBCTran1_LBORRES RBCTran_LBDAT SODIUM_LBTSTDAT STOOL_OTHR_LBORRES SYPH_LBDAT TBILIRUBIN_LBTSTDAT TB_confirm_LBDAT TB_confirm_LBORRES TB_confirm_LBTEST TB_screen_LBDAT 
		TB_screen_LBORRES TPROTEIN_LBTSTDAT Thiaminepyro_LBDAT Thiaminepyro_LBORRESU Thiaminepyro_mgpdL_LBORRES Thiaminepyro_nmolpL_LBORRES Thyroid_FreeT4_LBDAT Thyroid_Other_LBDAT 
		Thyroid_Other_LBORRES Thyroid_Other_SPFY_LBTEST Thyroid_TSH_LBDAT Thyroid_intro UA_LBDAT UA_LBORRES_1 UA_LBORRES_2 UA_LBORRES_3 UA_LBORRES_4 UA_LBORRES_5 UA_LBORRES_6 
		UA_LBORRES_7 UA_LEUK_QA_LBORRES UA_LEUK_QA_LBTSTDAT UA_LEUK_QT_LBORRES UA_LEUK_QT_LBTSTDAT UA_bac_2_LBORRES UA_bac_LBORRES UA_glu_LBORRES UA_leu_LBORRES UA_nit_LBORRES 
		UA_tests_intro VAR39 VAR42 VAR120 VAR130 VAR142 VitB12_LBDAT VitB12_ngpmL_LBORRES VitB12_pmolpL_LBORRES bGroup_LBORRES blood_group_tests_intro cbc_intro creat1_LBORRES 
		creat2_LBORRES hba1c_intro hiv_tests_intro malaria_tests_intro notice stool_tests_intro syphilis_tests_intro tb_tests_intro warn GLU_ora1hr_mmolpL_LBORRES 
		GLU_ora2hrs_mgpdL_LBORRES GLU_ora2hrs_mmolpL_LBORRES;
*Drop Ghana specific variables;
drop    UA_QT_PROT_LBORRES UA_QT_PROT_LBTSTDAT;
*Drop other unknown variables;
drop    GLU_ORA_1HR_MMOLL_LBORRES GLU_ORA_2HR_MMOLL_LBORRES HB_LBTSTDAT lab_intro test_intro;
run;

**Add prefix of M07T_;
%varprefix(dset=mnh07T, prefix=M07T_, keepname="caseid" "participantid" "eventid" "eventformid" "siten")

proc freq data=mnh07T; 
tables  /*siten caseid participantid eventid eventformid M07T_SUBJID M07T_startUnixtime M07T_complete*/ M07T_LIVER_LBTEST_1 M07T_LIVER_LBTEST_2 M07T_LIVER_LBTEST_3 M07T_LIVER_LBTEST_4 
		M07T_LIVER_LBTEST_5 M07T_LIVER_LBTEST_6 M07T_LIVER_LBTEST_7 M07T_LIVER_LBTEST_8 M07T_LFT_LBTSTDAT M07T_AST_LBORRESU M07T_AST_ul_LBORRES M07T_AST_ukatl_LBORRES M07T_ALT_LBORRESU 
		M07T_ALT_ul_LBORRES M07T_ALT_ukatl_LBORRES M07T_ALP_LBORRES M07T_TBILIRUBIN_LBORRES M07T_DBILIRUBIN_LBORRES M07T_TPROTEIN_LBORRES M07T_ALBUMIN_LBORRES M07T_GAMMAGT_LBORRES M07T_COYN 
		M07T_POTASSIUM_LBORRES M07T_THYROID_LBTSTDAT M07T_THYROID_TSH_LBORRES M07T_RENAL_LBORRES_1 M07T_RENAL_LBORRES_2 M07T_RENAL_LBORRES_3 M07T_RENAL_LBORRES_4 M07T_RENAL_LBORRES_5 
		M07T_RENAL_LBORRES_6 M07T_RENAL_LBORRES_7 M07T_RFT_LBTSTDAT M07T_BUN_LBORRESU M07T_BUN_mgdl_LBORRES M07T_BUN_mmoll_LBORRES M07T_CREAT_LBORRESU M07T_CREAT_mgdl_LBORRES 
		M07T_CREAT_umoll_LBORRES M07T_SODIUM_LBORRES M07T_CHLORIDE_LBORRES M07T_PHOSPHORUS_LBORRES M07T_CALCIUM_LBORRES M07T_HB_POC_LBORRES M07T_HB_POC_LAST_LBORRES M07T_HB_POC_CHANGE_LBORRES 
		M07T_HEPB_LBTSTDAT M07T_HEPB_LBORRES M07T_CBC_LBTEST_1 M07T_CBC_LBTEST_2 M07T_CBC_LBTEST_3 M07T_CBC_LBTEST_4 M07T_CBC_LBTEST_5 M07T_CBC_LBTEST_6 M07T_CBC_LBTEST_7 M07T_CBC_LBTEST_8 
		M07T_CBC_LBTEST_9 M07T_CBC_LBTEST_10 M07T_CBC_LBTEST_12 M07T_CBC_LBTEST_13 M07T_CBC_LBTSTDAT M07T_CBC_HB_LBORRES M07T_CBC_HCT_LBORRES M07T_CBC_WBC_LBORRES M07T_CBC_NEU_LBTEST_1 
		M07T_CBC_NEU_LBTEST_2 M07T_CBC_NEU_PCT_LBORRES M07T_CBC_NEU_FCC_LBORRES M07T_CBC_LYMPH_LBTEST_1 M07T_CBC_LYMPH_LBTEST_2 M07T_CBC_LYMPH_PCT_LBORRES M07T_CBC_LYMPH_LBORRES 
		M07T_CBC_ERYTH_MM_LBORRES M07T_CBC_MCV_LBORRES M07T_CBC_MCH_LBORRES M07T_CBC_MCHC_GL_LBORRES M07T_CBC_MCHC_GDL_LBORRES M07T_CBC_PLATE_LBORRES M07T_CBC_MONO_LBTEST_1 M07T_CBC_MONO_LBTEST_2 
		M07T_CBC_MONO_PCT_LBORRES M07T_CBC_MONO_FCC_LBORRES M07T_CBC_EOS_LBTEST_1 M07T_CBC_EOS_LBTEST_2 M07T_CBC_EOS_PCT_LBORRES M07T_CBC_EOS_FCC_LBORRES M07T_CBC_LBTEST_11 M07T_CBC_WCC_LBORRES 
		M07T_UA_LBTEST_1 M07T_UA_LBTEST_2 M07T_UA_LBTEST_3 M07T_UA_LBTEST_4 M07T_UA_LBTEST_5 M07T_UA_LBTEST_6 M07T_UA_LBTEST_7 M07T_UA_LBTEST_8 M07T_UA_DIP_LBTSTDAT M07T_UA_DIP_LBORRES 
		M07T_UA_PROT_LBTSTDAT M07T_UA_PROT_LBORRES M07T_UA_WBC_LBTSTDAT M07T_UA_WBC_LBORRES M07T_UA_NITRITE_LBTSTDAT M07T_UA_NITRITE_LBORRES M07T_UA_LEUK_LBTSTDAT M07T_UA_LEUK_LBORRES 
		M07T_UA_QA_BAC_LBTSTDAT M07T_UA_QA_BAC_LBORRES M07T_UA_QT_BAC_LBTSTDAT M07T_UA_QT_BAC_LBORRES M07T_UA_GLUC_LBTSTDAT M07T_UA_GLUC_LBORRES M07T_MALARIA_LBTSTDAT M07T_MALARIA_LBORRES 
		M07T_BLD_GRP_LBTSTDAT M07T_BLD_GRP_LBORRES M07T_BGLUC_LBTEST_1 M07T_BGLUC_LBTEST_2 M07T_BGLUC_LBTEST_3 M07T_BGLUC_LBTEST_88 M07T_BGLUC_ORAL_LBORRESU M07T_BGLUC_ORAL_LBTSTDAT 
		M07T_BGLUC_ORAL_1HR_MGDL_LBORRES M07T_BGLUC_RNDM_LBTSTDAT M07T_BGLUC_RNDM_MGDL_LBORRES M07T_BGLUC_RNDM_MMOLL_LBORRES M07T_BGLUC_FAST_MGDL_LBORRES M07T_BGLUC_FAST_MMOLL_LBORRES 
		M07T_BGLUC_SPFY_LBTEST M07T_BGLUC_SPFY_LBTSTDAT M07T_HBA1C_LBTSTDAT M07T_HBA1C_LBORRES M07T_THYROID_OTH_SPFY_LBTEST M07T_THYROID_OTH_LBTSTDAT M07T_THYROID_OTH_LBORRES M07T_RBC_LBTSTDAT 
		M07T_RBC_LBORRES M07T_THIAM_LBORRESU M07T_THIAM_ugdl_LBORRES M07T_VITB12_LBTSTDAT M07T_VITB12_LBORRESU M07T_VITB12_ngml_LBORRES M07T_VITB12_pmoll_LBORRES M07T_FOLATE_LBMETHOD 
		M07T_FOLATE_PLASMA_NGML_LBORRES M07T_FOLATE_RBC_NMOLL_LBORRES M07T_FERRITIN_LBTSTDAT M07T_RH_FACTOR_LBORRES M07T_HIV_LBTSTDAT M07T_HIV_LBORRES M07T_HIV_VLOAD_LBTSTDAT M07T_TB_SCRN_LBORRES 
		M07T_TB_CNFRM_LBORRES M07T_SYPH_LBTEST M07T_HEPC_LBTSTDAT M07T_HEPC_LBORRES M07T_STOOL_LBTSTDAT M07T_STOOL_LBORRES_1 M07T_STOOL_LBORRES_2 M07T_STOOL_LBORRES_3 M07T_STOOL_LBORRES_4 
		M07T_STOOL_LBORRES_5 M07T_STOOL_LBORRES_6 M07T_STOOL_LBORRES_88 M07T_STOOL_SPFY_LBORRES M07T_Folate_LBORRESU M07T_HIV_vLoad_LBORRES M07T_SYPH_LBTSTDAT M07T_BGLUC_ORAL_2HR_MGDL_LBORRES 
		M07T_BGLUC_FAST_LBTSTDAT M07T_BGLUC_SPFY_LBORRES M07T_THYROID_FREET4_LBTSTDAT M07T_THYROID_FREET4_LBORRES M07T_THIA_LBTSTDAT M07T_THIAM_nmoll_LBORRES M07T_FOLATE_PLASMA_NMOLL_LBORRES 
		M07T_FOLATE_RBC_NGML_LBORRES M07T_FERRITIN_LBORRES M07T_TB_SCRN_LBTSTDAT M07T_TB_CNFRM_LBTEST M07T_TB_CRNFRM_LBTSTDAT M07T_SYPH_SPFY_LBTEST M07T_SYPH_LBORRES M07T_STOOL_LBORRES_7 
		M07T_RH_FACTOR_LBTSTDAT M07T_FOLATE_LBTSTDAT;
run;

proc sort data=mnh07T out=mnh.mnh07T; by caseid participantid; run;


**MNH08: ANC Diagnostics**;
%impmerge(sitename=kenya, form=mnh08, tabname=mnh_diagnostics, tabnum=1, othertab1=, othertab2=, format=);
%impmerge(sitename=ghana, form=mnh08, tabname=mnh_diagnostics, tabnum=1, othertab1=mnh_diagnostics, othertab2=, format=);

data mnh08_char;
length FHR_OTHR_PEMETHOD $14.;
set mnh08_kenya(in=inken) mnh08_ghana (in=ingha);
if caseid="**********" then delete;
*Site number for reports*;
if inken then siten=3;
else if ingha then siten=2;

*Rename truncated vars;
rename  FAC_SPFY_OBSLOC_region_descendan = FAC_SPFY_OBSLOC_region_dcnt
		FAC_SPFY_OBSLOC_location_descend = FAC_SPFY_OBSLOC_loc_dcnt
		FAC_SPFY_OBSLOC_facility_descend = FAC_SPFY_OBSLOC_fac_dcnt
		VISIT_OBSLOC_Region_descendantsC = VISIT_OBSLOC_Region_dcnt
		VISIT_OBSLOC_District_descendant = VISIT_OBSLOC_Dis_dcnt
		VISIT_OBSLOC_Type_descendantsCou = VISIT_OBSLOC_Type_dcnt
		FAC_SPFY_OBSLOC_region_parent=FAC_SPFY_OBSLOC_reg_parent
		FAC_SPFY_OBSLOC_location_parent=FAC_SPFY_OBSLOC_loc_parent
		FAC_SPFY_OBSLOC_location_label=FAC_SPFY_OBSLOC_loc_label
		FAC_SPFY_OBSLOC_location_level=FAC_SPFY_OBSLOC_loc_level
		FAC_SPFY_OBSLOC_facility_parent=FAC_SPFY_OBSLOC_fac_parent
		FAC_SPFY_OBSLOC_facility_label=FAC_SPFY_OBSLOC_fac_label
		FAC_SPFY_OBSLOC_facility_level=FAC_SPFY_OBSLOC_fac_level
		VISIT_OBSLOC_Type_locationType=VISIT_OBSLOC_Type_locType
		VISIT_OBSLOC_Village_or_Facility=VISIT_OBSLOC_Village_or_Fac;
run;

%char2num(inputdsn=mnh08_char, outputdsn=mnh08_num, excludevars=);

*Set converted dataset, add labels, add formats, review variables and drop system variables that are not useful;
data mnh08;
set mnh08_num;
*Delete empty records - Check if several key questions are all missing;
if cmiss(DIAGNOSTIC_VSDAT, VISIT_OBSLOC, ANC_VISIT_N, BP1_VSSTAT, MHR_VSSTAT, RR_VSSTAT, TEMP_VSSTAT, PULSEOX_VSSTAT, FHR_VSSTAT, FHR_PEMETHOD)=10 then delete;
*Label variables - can make this more automated later*;
label	SUBJID="Subject ID"
		DIAGNOSTIC_VSDAT="Date of Diagnostic Testing"
		VISIT_OBSLOC="Location of Visit"
		SPFY_OTHR_OBSLOC="Specify other location"
		ANC_N_VISIT="Indicate visit when the diagnostic measurements were collected"
		ANC_VISIT_N="Indicate visit when the diagnostic measurements were collected"
		BP1_VSSTAT="Is BP measurement available?"
		BP1_SYS_VSORRES="Systolic blood pressure (1st measurement)"
		BP1_DIA_VSORRES="Diastolic blood pressure (1st measurement)"
		BP2_VSSTAT="Is 2nd BP measurement available?"
		BP2_SYS_VSORRES="Systolic blood pressure (2nd measurement)"
		BP2_DIA_VSORRES="Diastolic blood pressure (2nd measurement"
		BP3_VSSTAT="Is 3rd BP measurement available?"
		BP3_SYS_VSORRES="Systolic blood pressure (3rd measurement)"
		BP3_DIA_VSORRES="Diastolic blood pressure (3rd measurement)"
		BPAVG_SYS_VSORRES="Average systolic BP"
		BPAVG_DIA_VSORRES="Average diastolic BP"
		MHR_VSSTAT="Was maternal heart rate measured during this study visit?"
		MHR_VSORRES="Maternal heart rate"
		RR_VSSTAT="Was respiratory rate measured during this study visit?"
		RR_VSORRES="Respiratory rate"
		TEMP_VSSTAT="Was temperature measured during this study visit?"
		TEMP_VSORRES="Temperature"
		PULSEOX_VSSTAT="Was oxygen saturation measured during this study visit?"
		PULSEOX_VSORRES="O2 saturation"
		SPHB_LBPERF="Was non-invasive total hemoglobin (SpHb) measured during this study visit?"
		SPHB_LBORRES="SpHb result"
		FHR_VSSTAT="Was fetal heart rate measured during this study visit?"
		FHR_PEMETHOD="How was fetal heart rate measured?"
		FHR_OTHR_PEMETHOD="Specify fetal heart rate measurement method"
		FHR_VSORRES="Fetal heart rate"
		COYN="Would you like to record any additional comments about this visit?"
		caseid="Tangerine Case ID"
		participantid="Tangerine Participant ID"
		eventid="Tangerine Event ID"
		eventformid="Tangerine Form ID"
		startUnixtime="Tangerine Noted Unix Time"
		complete="Tangerine Noted Complete"
		siten="Site number for reports";
*Format variables*;
format  VISIT_OBSLOC MNH08_LOC. ANC_VISIT_N ANC_N_VISIT MNH08_ANC_VISIT_N. BP1_VSSTAT BP2_VSSTAT BP3_VSSTAT MHR_VSSTAT RR_VSSTAT TEMP_VSSTAT PULSEOX_VSSTAT SPHB_LBPERF FHR_VSSTAT COYN complete yn. 
		FHR_PEMETHOD MNH08_FHRMETHOD. DIAGNOSTIC_VSDAT date9.;
*Drop Tangerine variables that are not useful;
drop 	ROW_VERSION formId formtitle buildId buildChannel groupId prismaContentVersion deviceId ancovConsentVersion FAC_SPFY_OBSLOC_fac_dcnt FAC_SPFY_OBSLOC_fac_label FAC_SPFY_OBSLOC_fac_level 
		FAC_SPFY_OBSLOC_fac_parent FAC_SPFY_OBSLOC_facility FAC_SPFY_OBSLOC_facility_id FAC_SPFY_OBSLOC_loc_dcnt FAC_SPFY_OBSLOC_loc_label FAC_SPFY_OBSLOC_loc_level FAC_SPFY_OBSLOC_loc_parent 
		FAC_SPFY_OBSLOC_location FAC_SPFY_OBSLOC_location_id FAC_SPFY_OBSLOC_reg_parent FAC_SPFY_OBSLOC_region FAC_SPFY_OBSLOC_region_dcnt FAC_SPFY_OBSLOC_region_id FAC_SPFY_OBSLOC_region_label 
		FAC_SPFY_OBSLOC_region_level VISIT_Loc_other_OHOLOC VISIT_OBSLOC VISIT_OBSLOC_Dis_dcnt VISIT_OBSLOC_District VISIT_OBSLOC_District_id VISIT_OBSLOC_District_label VISIT_OBSLOC_District_level 
		VISIT_OBSLOC_District_parent VISIT_OBSLOC_Region VISIT_OBSLOC_Region_dcnt VISIT_OBSLOC_Region_id VISIT_OBSLOC_Region_label VISIT_OBSLOC_Region_level VISIT_OBSLOC_Region_parent 
		VISIT_OBSLOC_Type VISIT_OBSLOC_Type_dcnt VISIT_OBSLOC_Type_id VISIT_OBSLOC_Type_label VISIT_OBSLOC_Type_level VISIT_OBSLOC_Type_locType VISIT_OBSLOC_Type_parent VISIT_OBSLOC_Village_or_Fac 
		VISIT_VILLAGE_OBSLOC _id id final;
*Drop Ghana specific variable;
drop    VAR39 VAR40 VAR41 VAR42 VAR43;
*Drop other unknown variables;
drop    BP_AVG BP_Dir diag_intro;
run;

**Add prefix of M08_;
%varprefix(dset=mnh08, prefix=M08_, keepname="caseid" "participantid" "eventid" "eventformid" "siten")

proc freq data=mnh08; 
tables  /*siten caseid participantid eventid eventformid M08_startUnixtime M08_complete M08_SUBJID*/ M08_DIAGNOSTIC_VSDAT M08_ANC_N_VISIT M08_SPFY_OTHR_OBSLOC M08_ANC_VISIT_N M08_BP1_VSSTAT M08_BP1_SYS_VSORRES 
		M08_BP1_DIA_VSORRES M08_BP2_VSSTAT M08_BP2_SYS_VSORRES M08_BP2_DIA_VSORRES M08_BP3_VSSTAT M08_BP3_SYS_VSORRES M08_BP3_DIA_VSORRES M08_BPAVG_SYS_VSORRES M08_BPAVG_DIA_VSORRES 
		M08_MHR_VSSTAT M08_MHR_VSORRES M08_RR_VSSTAT M08_RR_VSORRES M08_TEMP_VSSTAT M08_TEMP_VSORRES M08_PULSEOX_VSSTAT M08_PULSEOX_VSORRES M08_SPHB_LBPERF M08_SPHB_LBORRES M08_FHR_VSSTAT 
		M08_FHR_PEMETHOD M08_FHR_OTHR_PEMETHOD M08_FHR_VSORRES M08_COYN;
run;

proc sort data=mnh08 out=mnh.mnh08; by caseid participantid; run;


**MNH09: Maternal IPC Diagnostics**;
%impmerge(sitename=kenya, form=mnh09, tabname=mnh_maternal_exam_intra, tabnum=1, othertab1=, othertab2=, format=);
%impmerge(sitename=ghana, form=mnh09, tabname=mnh_maternal_exam_intra, tabnum=1, othertab1=mnh_maternal_exam_intra, othertab2=, format=);
data mnh09_char;
set mnh09_kenya(in=inken) mnh09_ghana (in=ingha);
if caseid="**********" then delete;
*Site number for reports*;
if inken then siten=3;
else if ingha then siten=2;

*Rename truncated vars;
rename  DIAG_FAC_OBSLOC_region_descendan = DIAG_FAC_OBSLOC_region_dcnt
		DIAG_FAC_OBSLOC_location_descend = DIAG_FAC_OBSLOC_loc_dcnt
		DIAG_FAC_OBSLOC_facility_descend = DIAG_FAC_OBSLOC_fac_dcnt
		Fac_Spec_region_descendantsCount = Fac_Spec_region_dcnt
		Fac_Spec_location_descendantsCou = Fac_Spec_location_dcnt
		Fac_Spec_facility_descendantsCou = Fac_Spec_facility_dcnt
		DIAG_OBSLOC_Region_descendantsCo = DIAG_OBSLOC_Region_dcnt
		DIAG_OBSLOC_District_descendants = DIAG_OBSLOC_District_dcnt
		DIAG_OBSLOC_Type_descendantsCoun = DIAG_OBSLOC_Type_dcnt
		DIAG_FAC_OBSLOC_region_parent=DIAG_FAC_OBSLOC_reg_parent
		DIAG_FAC_OBSLOC_location_parent=DIAG_FAC_OBSLOC_loc_parent
		DIAG_FAC_OBSLOC_location_label=DIAG_FAC_OBSLOC_loc_label
		DIAG_FAC_OBSLOC_location_level=DIAG_FAC_OBSLOC_loc_level
		DIAG_FAC_OBSLOC_facility_parent=DIAG_FAC_OBSLOC_fac_parent
		DIAG_FAC_OBSLOC_facility_label=DIAG_FAC_OBSLOC_fac_label
		DIAG_FAC_OBSLOC_facility_level=DIAG_FAC_OBSLOC_fac_level
		VISIT_FAC_OBSLOC_location_label=VISIT_FAC_OBSLOC_loc_label
		VISIT_FAC_OBSLOC_region_label=VISIT_FAC_OBSLOC_reg_label
		VISIT_FAC_OBSLOC_region_parent=VISIT_FAC_OBSLOC_reg_parent
		VISIT_FAC_OBSLOC_region_level=VISIT_FAC_OBSLOC_reg_level
		DIAG_OBSLOC_Type_locationType=DIAG_OBSLOC_Type_locType
		DIAG_OBSLOC_Village_or_Facility=DIAG_OBSLOC_Vill_or_Fac
		DIAG_OBSLOC_Village_or_Facility_=DIAG_OBSLOC_Village_or_Fac;


run;
%char2num(inputdsn=mnh09_char, outputdsn=mnh09_num, excludevars=);
**Add prefix of M09_;
%varprefix(dset=mnh09_num, prefix=M09_, keepname="caseid" "participantid" "eventid" "eventformid" "siten")

proc contents data=mnh09_num;run;
proc freq data=mnh09_num; tables _char_;run;
proc sort data=mnh09_num out=mnh.mnh09; by caseid participantid; run;


**MNH10: Maternal IPC Labs**;
%impmerge(sitename=kenya, form=mnh10, tabname=mnh10_maternal_lab, tabnum=1, othertab1=, othertab2=, format=);
%impmerge(sitename=ghana, form=mnh10, tabname=mnh10_maternal_lab, tabnum=2, othertab1=mnh10_maternal_lab, othertab2=, format=);
data mnh10_char;
set mnh10_kenya(in=inken) mnh10_ghana (in=ingha);
if caseid="**********" then delete;
*Site number for reports*;
if inken then siten=3;
else if ingha then siten=2;

*Rename truncated vars;
rename  VISIT_FAC_OBSLOC_region_descenda = VISIT_FAC_OBSLOC_region_dcnt
		VISIT_FAC_OBSLOC_location_descen = VISIT_FAC_OBSLOC_loc_dcnt
		VISIT_FAC_OBSLOC_facility_descen = VISIT_FAC_OBSLOC_fac_dcnt
		VISIT_OBSLOC_Region_descendantsC = VISIT_OBSLOC_Region_dcnt
		VISIT_OBSLOC_District_descendant = VISIT_OBSLOC_District_dcnt
		VISIT_OBSLOC_Type_descendantsCou = VISIT_OBSLOC_Type_dcnt
		VISIT_FAC_OBSLOC_region_parent=VISIT_FAC_OBSLOC_reg_parent
		VISIT_FAC_OBSLOC_region_label=VISIT_FAC_OBSLOC_reg_label
		VISIT_FAC_OBSLOC_region_level=VISIT_FAC_OBSLOC_reg_level
		VISIT_FAC_OBSLOC_location_parent=VISIT_FAC_OBSLOC_loc_parent
		VISIT_FAC_OBSLOC_location_label=VISIT_FAC_OBSLOC_loc_label
		VISIT_FAC_OBSLOC_location_level=VISIT_FAC_OBSLOC_loc_level
		VISIT_FAC_OBSLOC_facility_parent=VISIT_FAC_OBSLOC_fac_parent
		VISIT_FAC_OBSLOC_facility_label=VISIT_FAC_OBSLOC_fac_label
		VISIT_FAC_OBSLOC_facility_level=VISIT_FAC_OBSLOC_fac_level
		VISIT_OBSLOC_Type_locationType=VISIT_OBSLOC_Type_locType
		VISIT_OBSLOC_Village_or_Facility=VISIT_OBSLOC_Vil_or_Fac;
run;
%char2num(inputdsn=mnh10_char, outputdsn=mnh10_num, excludevars=);

**Add prefix of M10_;
%varprefix(dset=mnh10_num, prefix=M10_, keepname="caseid" "participantid" "eventid" "eventformid" "siten")

proc contents data=mnh10_num;run;
proc freq data=mnh10_num; tables _char_;run;
proc sort data=mnh10_num out=mnh.mnh10; by caseid participantid; run;


**MNH10T: Maternal IPC Labs Trailing**;
%impmerge(sitename=kenya, form=mnh10T, tabname=mnh_maternal_lab_diag_intra, tabnum=1, othertab1=, othertab2=, format=);
%impmerge(sitename=ghana, form=mnh10T, tabname=mnh_maternal_lab_diag_intra, tabnum=1, othertab1=mnh_maternal_lab_diag_intra, othertab2=, format=);
data mnh10T_char;
set mnh10T_kenya(in=inken) mnh10T_ghana (in=ingha);
if caseid="**********" then delete;
*Site number for reports*;
if inken then siten=3;
else if ingha then siten=2;
rename
		BGLUC_ORAL_1HR_MMOLL_LBORRES=GLU_ORA_1HR_MMOLL_LBORRES
		BGLUC_ORAL_2HR_MMOLL_LBORRES=GLU_ORA_2HR_MMOLL_LBORRES;
run;
%char2num(inputdsn=mnh10T_char, outputdsn=mnh10T_num, excludevars=);
**Add prefix of M10_;
%varprefix(dset=mnh10T_num, prefix=M10T_, keepname="caseid" "participantid" "eventid" "eventformid" "siten")
proc contents data=mnh10T_num;run;
proc freq data=mnh10T_num; tables _char_;run;
proc sort data=mnh10T_num out=mnh.mnh10T; by caseid participantid; run;


**MNH11: Maternal Labor and Delivery outcome**;

*Macro to import CSV files forms and merge together split into muliple files*;
%impmerge(sitename=kenya, form=mnh11, tabname=mnh_maternal_ld_outcome_intra, tabnum=5, othertab1=, othertab2=, format=);
%impmerge(sitename=ghana, form=mnh11, tabname=mnh_maternal_ld_outcome_intra, tabnum=4, othertab1=mnh_maternal_ld_outcome_intra, othertab2=, format=);
*Set datasets from each site and create site indicator;
data mnh11_char_temp;
length formTitle $35. MEMBRANE_RUPT_MHSTTIM INF_1_DSSTTIM $12. LD_MEDS_OTHR_CMTRT $52.
ADMIT_MEDS_OTHR_CMTRT $60
INF_1_ATT_SPFY_FAORRES $43
INFECT_SPFY_CETERM $19
ADMIT_ABX_SPFY_CMINDC $49
INF_1_VAG_SPFY_PRROUTE$13
PPH_CMTRT $21
LD_ABX_SPFY_CMTRT $50
POST_DEL_INF_CETERM $24 ;
set mnh11_kenya (in=inken) mnh11_ghana (in=ingha);
if caseid="**********" then delete;
*Site number for reports*;
if inken then siten=3;
else if ingha then siten=2;

*Manually delete incorrect value*;
if INF_1_DELIVERY_PRROUTE="Jootrh" then INF_1_DELIVERY_PRROUTE=""; 
if INF_1_DSSTDAT="root" then INF_1_DSSTDAT="";

*Rename truncated vars;
rename  MAT_LD_FAC_OHOLOC_region_descend = MAT_LD_FAC_OHOLOC_region_dcnt
		MAT_LD_FAC_OHOLOC_facility_desce = MAT_LD_FAC_OHOLOC_fac_dcnt
		MAT_LD_FAC_OHOLOC_location_desce = MAT_LD_FAC_OHOLOC_loc_dcnt
		Fac_Spec_location_descendantsCou = Fac_Spec_location_dcnt
		Fac_Spec_facility_descendantsCou = Fac_Spec_facility_dcnt
		Fac_Spec_region_descendantsCount = Fac_Spec_region_dcnt
		MAT_LD_OBSLOC_Region_descendants = MAT_LD_OBSLOC_Region_dcnt
		MAT_LD_OBSLOC_District_descendan = MAT_LD_OBSLOC_District_dcnt
		MAT_LD_OBSLOC_Type_descendantsCo = MAT_LD_OBSLOC_Type_dcnt;
run;

*Updating PPH_ESTIMATE_FAORRES values to remove the unit to later convert variable to numeric;
data mnh11_char;
set mnh11_char_temp;
if PPH_ESTIMATE_FAORRES="50mls" then PPH_ESTIMATE_FAORRES="50";
else if PPH_ESTIMATE_FAORRES="150mls" then PPH_ESTIMATE_FAORRES="150";
else if PPH_ESTIMATE_FAORRES="200mls" then PPH_ESTIMATE_FAORRES="200";
run;

*Convert to numeric*;
%char2num(inputdsn=mnh11_char, outputdsn=mnh11_num, excludevars=);

proc contents data=mnh11_num order=varnum; run;
proc freq data=mnh11_num; tables _char_; run;

data mnh11_num_temp;
set mnh11_num;
temp = input(INF_1_DSSTDAT,yymmdd10.);
run; proc contents data=mnh11_num_temp;run;
proc freq data=mnh11_num_temp; tables INF_1_DSSTDAT temp;run;

*MAT_LD_OHOSTTIM LABOR_MHSTTIM MEMBRANE_RUPT_MHSTTIM INF_1_DSSTTIM not converting to time;
*INF_2_DSSTTIM might have converted time?;
*POST_DEL_CHORIO_CEOCCUR has duplicate values for number 4. Need to determine which is right.
 Frequency has a var with _5, so I'm guessing the second 4 should be 5.;
*MAT_LD_OHLOC DD has levels 1, 2, and 88. Frequency has 1, 2, 3.;
*MALARIA_FAMETHOD has levels 1, 2. Frequency has 0, 1.;

/*ods EXCEL file="/rtpnfil03/rtpnfil03_vol5/ANCPNC_Collective/Data Monitoring and Analysis/Datasets/Documentation/Contents/mnh11contents.xlsx";
proc contents data=mnh11_num order=varnum; run;
ods EXCEL close;*/

*Set datasets from each site and create site indicator;
data mnh11;
set mnh11_num;
label 	SITEN="Site number for reports"
		complete="Tangerine form completion variable?"
		id="Tangerine assigned ID"
		startunixtime="Tangerine noted Unix time"
		SUBJID="Subject ID"
	/*	LD_ABX_CMTRT_dose1=""
		LD_ABX_CMTRT_dose2=""
		LD_ABX_CMTRT_dose3=""
		LD_ABX_CMTRT_dose4=""
		LD_ABX_CMTRT_dose5=""
		LD_ABX_CMTRT_dose6=""
		LD_ABX_CMTRT_dose7=""
		LD_ABX_CMTRT_dose8=""
		visits=""*/
		f_fatigue_CESTDAT="Fatigue onset date missing day"
		f_Headache_CESTDAT="Headache onset date missing day"
		f_myalgia_CESTDAT="Myalgia onset date missing day"
		f_anosmia_CESTDAT="Aonsmia onset date missing day"
		f_COVID_LBDAT="COVID-19 test date missing day"
		f_LABOR_MHSTDAT="Labor onset date missing day"
		f_TRANSFER_OHOENDAT="Discharge from delivery facility date missing day"
		f_ageusia_CESTDAT="Ageusia onset date missing day"
		PTB_SRCE_1="PTB Data Source: Maternal recall"
		PTB_SRCE_2="PTB Data Source: Facility-based or participant-held record"
		PTB_SRCE_3="PTB Data Source: Study assessment"
		PI_HTN_SRCE_1="PI HTN Data Source: Maternal recall"
		PI_HTN_SRCE_2="PI HTN Data Source: Facility-based or participant-held record"
		PI_HTN_SRCE_3="PI HTN Data Source: Study assessment"
		TB_SRCE_1="TB Data Source: Maternal recall"
		TB_SRCE_2="TB Data Source: Facility-based or participant-held record"
		TB_SRCE_3="TB Data Source: Study assessment"
		HEPB_SRCE_1="Hepatitis B Data Source: Maternal recall"
		HEPB_SRCE_2="Hepatitis B Data Source: Facility-based or participant-held record"
		HEPB_SRCE_3="Hepatitis B Data Source: Study assessment"
		SYPH_SRCE_1="Syphilis Data Source: Maternal recall"
		SYPH_SRCE_2="Syphilis Data Source: Facility-based or participant-held record"
		SYPH_SRCE_3="Syphilis Data Source: Study assessment"
		STI_SRCE_1="STI Data Source: Maternal recall"
		STI_SRCE_2="STI Data Source: Facility-based or participant-held record"
		STI_SRCE_3="STI Data Source: Study assessment"
		PTB_STEROID_CMOCCUR_1="Mother received steriod for fetal lung maturation: Dexamethasone"
		PTB_STEROID_CMOCCUR_2="Mother received steriod for fetal lung maturation: Betamethasone"
		PTB_STEROID_CMOCCUR_88="Mother received steriod for fetal lung maturation: Other"
		PTB_STEROID_CMOCCUR_77="Mother received steriod for fetal lung maturation: No steroid treatment"
		PTB_STEROID_CMOCCUR_99="Mother received steriod for fetal lung maturation: Don't know"
		PTB_TOCO_CMOCCUR_1="Mother received medication to delay delivery: Magnesium Sulfate"
		PTB_TOCO_CMOCCUR_2="Mother received medication to delay delivery: Nifedipine"
		PTB_TOCO_CMOCCUR_3="Mother received medication to delay delivery: Terbutaline"
		PTB_TOCO_CMOCCUR_88="Mother received medication to delay delivery: Other"
		PTB_TOCO_CMOCCUR_77="Mother received medication to delay delivery: No medication received to delay delivery"
		PTB_TOCO_CMOCCUR_99="Mother received medication to delay delivery: Don't know"
		PI_HTN_MHOCCUR_1="Mother diagnosed with type of gestational/pregnancy induced hypertension: Gestational hypertension"
		PI_HTN_MHOCCUR_2="Mother diagnosed with type of gestational/pregnancy induced hypertension: Preeclampsia "
		PI_HTN_MHOCCUR_3="Mother diagnosed with type of gestational/pregnancy induced hypertension: Eclampsia "
		PI_HTN_MHOCCUR_4="Mother diagnosed with type of gestational/pregnancy induced hypertension: HELLP"
		PI_HTN_MHOCCUR_5="Mother diagnosed with type of gestational/pregnancy induced hypertension: PIH Unspecified"
		PI_HTN_MHOCCUR_77="Mother diagnosed with type of gestational/pregnancy induced hypertension: No PIH diagnosis"
		PI_HTN_MHOCCUR_99="Mother diagnosed with type of gestational/pregnancy induced hypertension: Don't know"
		PI_HTN_PROCCUR_1="Mother received treatment for PIH: Bedrest at home"
		PI_HTN_PROCCUR_2="Mother received treatment for PIH: Bedrest at facility "
		PI_HTN_PROCCUR_3="Mother received treatment for PIH: Magnesium sulfate "
		PI_HTN_PROCCUR_4="Mother received treatment for PIH: Hydralazine"
		PI_HTN_PROCCUR_5="Mother received treatment for PIH: Nifedipine"
		PI_HTN_PROCCUR_6="Mother received treatment for PIH: Labetalol"
		PI_HTN_PROCCUR_7="Mother received treatment for PIH: Methyldopa"
		PI_HTN_PROCCUR_88="Mother received treatment for PIH: Other treatment"
		PI_HTN_PROCCUR_77="Mother received treatment for PIH: No treatment received"
		PI_HTN_PROCCUR_99="Mother received treatment for PIH: Don't know"
		ANTI_PHOS_SRCE_1="Antiphospholipid Syndrome Data Source: Maternal recall"
		ANTI_PHOS_SRCE_2="Antiphospholipid Syndrome Data Source: Facility-based or participant-held record"
		ANTI_PHOS_SRCE_3="Antiphospholipid Syndrome Data Source: Study assessment"
		GEST_DIAB_SRCE_1="Gestational Diabetes Data Source: Maternal recall"
		GEST_DIAB_SRCE_2="Gestational Diabetes Data Source: Facility-based or participant-held record"
		GEST_DIAB_SRCE_3="Gestational Diabetes Data Source: Study assessment"
		ANEMIA_SRCE_1="PIH Data Source: Maternal recall"
		ANEMIA_SRCE_2="PIH Data Source: Facility-based or participant-held record"
		ANEMIA_SRCE_3="PIH Data Source: Study assessment"
		MALARIA_SRCE_1="PIH Data Source: Maternal recall"
		MALARIA_SRCE_2="PIH Data Source: Facility-based or participant-held record"
		MALARIA_SRCE_3="PIH Data Source: Study assessment"
		HIV_SRCE_1="HIV Data Source: Maternal recall"
		HIV_SRCE_2="HIV Data Source: Facility based or participant held record"
		HIV_SRCE_3="HIV Data Source: Study assessment"
		HIV_CMTRT_1="HIV Treatment Regimen: Abacavir (ABC, Zigen)"
		HIV_CMTRT_2="HIV Treatment Regimen: Didanosine (DDI, Videx)"
		HIV_CMTRT_3="HIV Treatment Regimen: Lamivudine (3TC, Epivir)"
		HIV_CMTRT_4="HIV Treatment Regimen: Stavudine (d4T, Zerit)"
		HIV_CMTRT_5="HIV Treatment Regimen: Zidovudine (ZDV, AZT, Retrovir)"
		HIV_CMTRT_6="HIV Treatment Regimen: Tenofovir (TNF, TDF)"
		HIV_CMTRT_7="HIV Treatment Regimen: Efavirenz (EFV, Sustiva, Stocrin)"
		HIV_CMTRT_8="HIV Treatment Regimen: Etravirine"
		HIV_CMTRT_9="HIV Treatment Regimen: Nevirapine (NVP, Viramune)"
		HIV_CMTRT_10="HIV Treatment Regimen: Rilpivirine"
		HIV_CMTRT_11="HIV Treatment Regimen: Lopinavir/ritonavir (LPV/rit, Kaletra)"
		HIV_CMTRT_12="HIV Treatment Regimen: Nelfinavir (NFV, Viracept)"
		HIV_CMTRT_13="HIV Treatment Regimen: Ritonavir (RTV, Norvir)"
		HIV_CMTRT_14="HIV Treatment Regimen: Atazanavir"
		HIV_CMTRT_15="HIV Treatment Regimen: Darunavir"
		HIV_CMTRT_16="HIV Treatment Regimen: Fosamprenavir"
		HIV_CMTRT_17="HIV Treatment Regimen: Indinavir"
		HIV_CMTRT_18="HIV Treatment Regimen: Saquinavir"
		HIV_CMTRT_19="HIV Treatment Regimen: Tipranavir"
		HIV_CMTRT_20="HIV Treatment Regimen: Enfuvirtide"
		HIV_CMTRT_21="HIV Treatment Regimen: Maraviroc"
		HIV_CMTRT_22="HIV Treatment Regimen: Dolutegravir"
		HIV_CMTRT_23="HIV Treatment Regimen: Elvitegravir"
		HIV_CMTRT_24="HIV Treatment Regimen: Raltegravir"
		HIV_CMTRT_25="HIV Treatment Regimen: Cobicistat"
		HIV_CMTRT_88="HIV Treatment Regimen: Other"
		HIV_CMTRT_99="HIV Treatment Regimen: Don't know"
		STI_MHOCCUR_1="Mother diagnosed with STI: Gonorrhea"
		STI_MHOCCUR_2="Mother diagnosed with STI: Chlamydia"
		STI_MHOCCUR_3="Mother diagnosed with STI: Genital ulcer"
		STI_MHOCCUR_4="Mother diagnosed with STI: Chancroid"
		STI_MHOCCUR_5="Mother diagnosed with STI: Herpes"
		STI_MHOCCUR_88="Mother diagnosed with STI: Other"
		STI_MHOCCUR_77="Mother diagnosed with STI: No other STI diagnosis"
		STI_MHOCCUR_99="Mother diagnosed with STI: Don't know"
		CHEST_IMAGE_PROCCUR_1="Mother had chest imaging with findings suggestive of COVID-19: Chest radiography"
		CHEST_IMAGE_PROCCUR_2="Mother had chest imaging with findings suggestive of COVID-19: Chest CT"
		CHEST_IMAGE_PROCCUR_3="Mother had chest imaging with findings suggestive of COVID-19: Lung ultrasound"
		CHEST_IMAGE_PROCCUR_77="Mother had chest imaging with findings suggestive of COVID-19: No chest imaging suggestive of COVID-19"
		CHEST_IMAGE_PROCCUR_99="Mother had chest imaging with findings suggestive of COVID-19: Don't know"
		COVID_SRCE_1="COVID-19 Data Source: Maternal recall"
		COVID_SRCE_2="COVID-19 Data Source: Facility-based or participant-held record"
		COVID_SRCE_3="COVID-19 Data Source: Study assessment"
		INFECT_CEOCCUR_1="Mother had signs/symptoms of infection: Chills"
		INFECT_CEOCCUR_2="Mother had signs/symptoms of infection: Rash"
		INFECT_CEOCCUR_3="Mother had signs/symptoms of infection: Conjunctivitis"
		INFECT_CEOCCUR_4="Mother had signs/symptoms of infection: Joint aches"
		INFECT_CEOCCUR_5="Mother had signs/symptoms of infection: Seizures"
		INFECT_CEOCCUR_88="Mother had signs/symptoms of infection: Other"
		INFECT_CEOCCUR_77="Mother had signs/symptoms of infection: No signs of infection noted"
		INFECT_CEOCCUR_99="Mother had signs/symptoms of infection: Don't know"
		INFECT_OTH_MHOCCUR_1="Mother diagnosed with other type of infection: Group B Strep"
		INFECT_OTH_MHOCCUR_2="Mother diagnosed with other type of infection: Pneumonia"
		INFECT_OTH_MHOCCUR_3="Mother diagnosed with other type of infection: Pyelonephritis"
		INFECT_OTH_MHOCCUR_4="Mother diagnosed with other type of infection: Rubella"
		INFECT_OTH_MHOCCUR_5="Mother diagnosed with other type of infection: Urinary Tract Infection"
		INFECT_OTH_MHOCCUR_88="Mother diagnosed with other type of infection: Other"
		INFECT_OTH_MHOCCUR_77="Mother diagnosed with other type of infection: No infections diagnosed"
		INFECT_OTH_MHOCCUR_99="Mother diagnosed with other type of infection: Don't know"
		INFECT_OTH_SRCE_1="Other infection Data Source: Maternal recall"
		INFECT_OTH_SRCE_2="Other infection Data Source: Facility-based or participant-held record"
		INFECT_OTH_SRCE_3="Other infection Data Source: Study assessment"
		ORG_FAIL_MHOCCUR_1="Mother experienced type of organ failure:  Cardiomyopathy/heart failure"
		ORG_FAIL_MHOCCUR_2=" Mother experienced type of organ failure: Respiratory failure"
		ORG_FAIL_MHOCCUR_3=" Mother experienced type of organ failure: Acute kidney/renal failure"
		ORG_FAIL_MHOCCUR_4=" Mother experienced type of organ failure: No diagnosis or sign of organ failure"
		ORG_FAIL_MHOCCUR_77="Mother experienced type of organ failure: No diagnosis or sign of organ failure"
		ORG_FAIL_MHOCCUR_88="Mother experienced type of organ failure: Other"
		ORG_FAIL_MHOCCUR_99=" Mother experienced type of organ failure: Don't know"
		ORG_FAIL_SRCE_1="Organ failure Data Source: Maternal recall"
		ORG_FAIL_SRCE_2="Organ failure Data Source: Facility-based or participant-held record"
		ORG_FAIL_SRCE_3="Organ failure Data Source: Study assessment"
		ADMIT_ABX_CMTRT_1="Antibiotic at time of admission: Penicillin, Ampicillin, or Amoxicillin"
		ADMIT_ABX_CMTRT_2="Antibiotic at time of admission: Gentamycin"
		ADMIT_ABX_CMTRT_3="Antibiotic at time of admission: Cephalosporin (Cefazolin, Ceftriaxone)"
		ADMIT_ABX_CMTRT_4="Antibiotic at time of admission: Metronidazole/Flagyl"
		ADMIT_ABX_CMTRT_5="Antibiotic at time of admission: Clindamycin"
		ADMIT_ABX_CMTRT_6="Antibiotic at time of admission: Erythromycin"
		ADMIT_ABX_CMTRT_7="Antibiotic at time of admission: Azithromycin"
		ADMIT_ABX_CMTRT_88="Antibiotic at time of admission: Other"
		ADMIT_ABX_CMTRT_99="Antibiotic at time of admission: Don't know"
		INDUCED_PRTRT_1="Type of induction: Artificial rupture of membranes"
		INDUCED_PRTRT_2="Type of induction: Oxytocin"
		INDUCED_PRTRT_3="Type of induction: Misoprostol"
		INDUCED_PRTRT_4="Type of induction: Foley"
		INDUCED_PRTRT_88="Type of induction: Other"
		INDUCED_PRTRT_99="Type of induction: Don't know"
		AMNIOTIC_SPFY_FAORRES_1="Membrane rupture fluid character: Bloody"
		AMNIOTIC_SPFY_FAORRES_2="Membrane rupture fluid character: Stained with meconium (green color)"
		AMNIOTIC_SPFY_FAORRES_3="Membrane rupture fluid character: Purulent"
		INF_1_CES_PRINDC_1="Indication for Cesarean delivery for infant 1: Post-term"
		INF_1_CES_PRINDC_2="Indication for Cesarean delivery for infant 1: Previous Cesarean"
		INF_1_CES_PRINDC_3="Indication for Cesarean delivery for infant 1: Failure to progress/arrested labor"
		INF_1_CES_PRINDC_4="Indication for Cesarean delivery for infant 1: Failed induction"
		INF_1_CES_PRINDC_5="Indication for Cesarean delivery for infant 1: Failed vacuum or forceps delivery"
		INF_1_CES_PRINDC_6="Indication for Cesarean delivery for infant 1: Abruption/bleeding"
		INF_1_CES_PRINDC_7="Indication for Cesarean delivery for infant 1: Non-reassuring fetal heartrate"
		INF_1_CES_PRINDC_8="Indication for Cesarean delivery for infant 1: Cord prolapse"
		INF_1_CES_PRINDC_9="Indication for Cesarean delivery for infant 1: Breech presentation"
		INF_1_CES_PRINDC_10="Indication for Cesarean delivery for infant 1: Shoulder Dystocia"
		INF_1_CES_PRINDC_11="Indication for Cesarean delivery for infant 1: Macrosomia/Cephalopelvic disproportion"
		INF_1_CES_PRINDC_12="Indication for Cesarean delivery for infant 1: Preeclampsia/eclampsia"
		INF_1_CES_PRINDC_13="Indication for Cesarean delivery for infant 1: Fetal anomaly"
		INF_1_CES_PRINDC_14="Indication for Cesarean delivery for infant 1: Herpes"
		INF_1_CES_PRINDC_15="Indication for Cesarean delivery for infant 1: PMTCT"
		INF_1_CES_PRINDC_16="Indication for Cesarean delivery for infant 1: Elective"
		INF_1_CES_PRINDC_88="Indication for Cesarean delivery for infant 1: Other"
		INF_1_CES_PRINDC_99="Indication for Cesarean delivery for infant 1: Don't know"
		INF_2_CES_PRINDC_1="Indication for Cesarean delivery for infant 2: Post-term"
		INF_2_CES_PRINDC_2="Indication for Cesarean delivery for infant 2: Previous Cesarean"
		INF_2_CES_PRINDC_3="Indication for Cesarean delivery for infant 2: Failure to progress/arrested labor"
		INF_2_CES_PRINDC_4="Indication for Cesarean delivery for infant 2: Failed induction"
		INF_2_CES_PRINDC_5="Indication for Cesarean delivery for infant 2: Failed vacuum or forceps delivery"
		INF_2_CES_PRINDC_6="Indication for Cesarean delivery for infant 2: Abruption/bleeding"
		INF_2_CES_PRINDC_7="Indication for Cesarean delivery for infant 2: Non-reassuring fetal heartrate"
		INF_2_CES_PRINDC_8="Indication for Cesarean delivery for infant 2: Cord prolapse"
		INF_2_CES_PRINDC_9="Indication for Cesarean delivery for infant 2: Breech presentation"
		INF_2_CES_PRINDC_10="Indication for Cesarean delivery for infant 2: Shoulder Dystocia"
		INF_2_CES_PRINDC_11="Indication for Cesarean delivery for infant 2: Macrosomia/Cephalopelvic disproportion"
		INF_2_CES_PRINDC_12="Indication for Cesarean delivery for infant 2: Preeclampsia/eclampsia"
		INF_2_CES_PRINDC_13="Indication for Cesarean delivery for infant 2: Fetal anomaly"
		INF_2_CES_PRINDC_14="Indication for Cesarean delivery for infant 2: Herpes"
		INF_2_CES_PRINDC_15="Indication for Cesarean delivery for infant 2: PMTCT"
		INF_2_CES_PRINDC_16="Indication for Cesarean delivery for infant 2: Elective"
		INF_2_CES_PRINDC_88="Indication for Cesarean delivery for infant 2: Other"
		INF_2_CES_PRINDC_99="Indication for Cesarean delivery for infant 2: Don't know"
/*		INF_3_CES_PRINDC_1="Indication for Cesarean delivery for infant 3: Post-term"
		INF_3_CES_PRINDC_2="Indication for Cesarean delivery for infant 3: Previous Cesarean"
		INF_3_CES_PRINDC_3="Indication for Cesarean delivery for infant 3: Failure to progress/arrested labor"
		INF_3_CES_PRINDC_4="Indication for Cesarean delivery for infant 3: Failed induction"
		INF_3_CES_PRINDC_5="Indication for Cesarean delivery for infant 3: Failed vacuum or forceps delivery"
		INF_3_CES_PRINDC_6="Indication for Cesarean delivery for infant 3: Abruption/bleeding"
		INF_3_CES_PRINDC_7="Indication for Cesarean delivery for infant 3: Non-reassuring fetal heartrate"
		INF_3_CES_PRINDC_8="Indication for Cesarean delivery for infant 3: Cord prolapse"
		INF_3_CES_PRINDC_9="Indication for Cesarean delivery for infant 3: Breech presentation"
		INF_3_CES_PRINDC_10="Indication for Cesarean delivery for infant 3: Shoulder Dystocia"
		INF_3_CES_PRINDC_11="Indication for Cesarean delivery for infant 3: Macrosomia/Cephalopelvic disproportion"
		INF_3_CES_PRINDC_12="Indication for Cesarean delivery for infant 3: Preeclampsia/eclampsia"
		INF_3_CES_PRINDC_13="Indication for Cesarean delivery for infant 3: Fetal anomaly"
		INF_3_CES_PRINDC_14="Indication for Cesarean delivery for infant 3: Herpes"
		INF_3_CES_PRINDC_15="Indication for Cesarean delivery for infant 3: PMTCT"
		INF_3_CES_PRINDC_16="Indication for Cesarean delivery for infant 3: Elective"
		INF_3_CES_PRINDC_88="Indication for Cesarean delivery for infant 3: Other"
		INF_3_CES_PRINDC_99="Indication for Cesarean delivery for infant 3: Don't know"
		INF_4_CES_PRINDC_1="Indication for Cesarean delivery for infant 4: Post-term"
		INF_4_CES_PRINDC_2="Indication for Cesarean delivery for infant 4: Previous Cesarean"
		INF_4_CES_PRINDC_3="Indication for Cesarean delivery for infant 4: Failure to progress/arrested labor"
		INF_4_CES_PRINDC_4="Indication for Cesarean delivery for infant 4: Failed induction"
		INF_4_CES_PRINDC_5="Indication for Cesarean delivery for infant 4: Failed vacuum or forceps delivery"
		INF_4_CES_PRINDC_6="Indication for Cesarean delivery for infant 4: Abruption/bleeding"
		INF_4_CES_PRINDC_7="Indication for Cesarean delivery for infant 4: Non-reassuring fetal heartrate"
		INF_4_CES_PRINDC_8="Indication for Cesarean delivery for infant 4: Cord prolapse"
		INF_4_CES_PRINDC_9="Indication for Cesarean delivery for infant 4: Breech presentation"
		INF_4_CES_PRINDC_10="Indication for Cesarean delivery for infant 4: Shoulder Dystocia"
		INF_4_CES_PRINDC_11="Indication for Cesarean delivery for infant 4: Macrosomia/Cephalopelvic disproportion"
		INF_4_CES_PRINDC_12="Indication for Cesarean delivery for infant 4: Preeclampsia/eclampsia"
		INF_4_CES_PRINDC_13="Indication for Cesarean delivery for infant 4: Fetal anomaly"
		INF_4_CES_PRINDC_14="Indication for Cesarean delivery for infant 4: Herpes"
		INF_4_CES_PRINDC_15="Indication for Cesarean delivery for infant 4: PMTCT"
		INF_4_CES_PRINDC_16="Indication for Cesarean delivery for infant 4: Elective"
		INF_4_CES_PRINDC_88="Indication for Cesarean delivery for infant 4: Other"
		INF_4_CES_PRINDC_99="Indication for Cesarean delivery for infant 4: Don't know"*/
		PI_HTN_POST_CMOCCUR_1="Medication provided to treat PIH: Magnesium Sulfate"
		PI_HTN_POST_CMOCCUR_2="Medication provided to treat PIH: Hydralazine"
		PI_HTN_POST_CMOCCUR_3="Medication provided to treat PIH: Nifedipine"
		PI_HTN_POST_CMOCCUR_4="Medication provided to treat PIH: Labetalol"
		PI_HTN_POST_CMOCCUR_5="Medication provided to treat PIH: Methyldopa"
		PI_HTN_POST_CMOCCUR_77="Medication provided to treat PIH: No medications given to treat PIH"
		PI_HTN_POST_CMOCCUR_88="Medication provided to treat PIH: Other"
		PI_HTN_POST_CMOCCUR_99="Medication provided to treat PIH: Don't know"
		FETAL_DISTRESS_FAORRES_1="Reason for fetal distress: Meconium stained liquor/amniotic fluid"
		FETAL_DISTRESS_FAORRES_2="Reason for fetal distress: Abnormal fetal heart rate"
		FETAL_DISTRESS_FAORRES_3="Reason for fetal distress: Abnormal cardiotocograph/non-stress test"
		FETAL_DISTRESS_FAORRES_4="Reason for fetal distress: Abnormal ultrasound"
		FETAL_DISTRESS_FAORRES_88="Reason for fetal distress: Other"
		FETAL_DISTRESS_FAORRES_99="Reason for fetal distress: Don't know"
		APH_FAORRES_1="Complications that contributed to APH: Placental abruption"
		APH_FAORRES_2="Complications that contributed to APH: Placenta previa"
		APH_FAORRES_88="Complications that contributed to APH: Other"
		APH_FAORRES_99="Complications that contributed to APH: Don't know"
		PPH_FAORRES_1="Complications that contributed to PPH: Uterine atony"
		PPH_FAORRES_2="Complications that contributed to PPH: Retained placenta"
		PPH_FAORRES_3="Complications that contributed to PPH: Uterine rupture"
		PPH_FAORRES_4="Complications that contributed to PPH: Cervical/vaginal laceration"
		PPH_FAORRES_88="Complications that contributed to PPH: Other"
		PPH_FAORRES_99="Complications that contributed to PPH: Don't know"
		PPH_CMOCCUR_1="Medication provided to treat PPH: Oxytocin"
		PPH_CMOCCUR_2="Medication provided to treat PPH: misoprostol"
		PPH_CMOCCUR_3="Medication provided to treat PPH: Tranexaminic acid"
		PPH_CMOCCUR_4="Medication provided to treat PPH: Carbetocin"
		PPH_CMOCCUR_5="Medication provided to treat PPH: Methylergonovine"
		PPH_CMOCCUR_6="Medication provided to treat PPH: Carboprost (PGF2-alpha)"
		PPH_CMOCCUR_88="Medication provided to treat PPH: Other"
		PPH_CMOCCUR_77="Medication provided to treat PPH: No medications given to treat PPH"
		PPH_CMOCCUR_99="Medication provided to treat PPH: Don't know"
		POST_DEL_SS_CEOCCUR_1="Mother had signs of complication during/after delivery: Fast heartbeat ( >=120 bpm if measured)"
		POST_DEL_SS_CEOCCUR_2="Mother had signs of complication during/after delivery: Respiratory distress or difficulty breathing (RR>24 breaths per minute if measured)"
		POST_DEL_SS_CEOCCUR_3="Mother had signs of complication during/after delivery: Feeling faint or dizzy"
		POST_DEL_SS_CEOCCUR_4="Mother had signs of complication during/after delivery: Altered mental status or confusion"
		POST_DEL_SS_CEOCCUR_5="Mother had signs of complication during/after delivery: Severe headaches"
		POST_DEL_SS_CEOCCUR_6="Mother had signs of complication during/after delivery: Seizures"
		POST_DEL_SS_CEOCCUR_7="Mother had signs of complication during/after delivery: Jaundice (yellow skin or eyes)"
		POST_DEL_SS_CEOCCUR_8="Mother had signs of complication during/after delivery: Decreased urination or difficulty emptying bladder"
		POST_DEL_SS_CEOCCUR_9="Mother had signs of complication during/after delivery: Epigastic pain"
		POST_DEL_SS_CEOCCUR_10="Mother had signs of complication during/after delivery: Severe uterine or vaginal pain"
		POST_DEL_SS_CEOCCUR_11="Mother had signs of complication during/after delivery: Vomiting"
		POST_DEL_SS_CEOCCUR_12="Mother had signs of complication during/after delivery: Diarrhea/loose stools"
		POST_DEL_SS_CEOCCUR_88="Mother had signs of complication during/after delivery: Other"
		POST_DEL_SS_CEOCCUR_77="Mother had signs of complication during/after delivery: No signs/symptoms noted"
		POST_DEL_SS_CEOCCUR_99="Mother had signs of complication during/after delivery: Don't know"
		POST_DEL_CHORIO_CEOCCUR_1="Mother had signs of chorioamniotis before delivery: Temperature >38C (and no other explanation)"
		POST_DEL_CHORIO_CEOCCUR_2="Mother had signs of chorioamniotis before delivery: Maternal heartrate >100 BPM"
		POST_DEL_CHORIO_CEOCCUR_3="Mother had signs of chorioamniotis before delivery: Purulent/foul smelling discharge from uterus after delivery"
		POST_DEL_CHORIO_CEOCCUR_4="Mother had signs of chorioamniotis before delivery: Tender uterine fundus"
		POST_DEL_CHORIO_CEOCCUR_77="Mother had signs of chorioamniotis before delivery: No signs of chorioamniotis noted"
		POST_DEL_CHORIO_CEOCCUR_99="Mother had signs of chorioamniotis before delivery: Don't know"
		POST_DEL_ENDOMET_CEOCCUR_1="Mother had signs of endometritis after delivery: Temperature >38C (and no other explanation)"
		POST_DEL_ENDOMET_CEOCCUR_2="Mother had signs of endometritis after delivery: Maternal heartrate >100 BPM"
		POST_DEL_ENDOMET_CEOCCUR_3="Mother had signs of endometritis after delivery: Purulent/foul smelling discharge from uterus after delivery"
		POST_DEL_ENDOMET_CEOCCUR_4="Mother had signs of endometritis after delivery: Tender uterine fundus"
		POST_DEL_ENDOMET_CEOCCUR_77="Mother had signs of endometritis after delivery: No signs of endometritis noted"
		POST_DEL_ENDOMET_CEOCCUR_99="Mother had signs of endometritis after delivery: Don't know"
		POST_DEL_INF_CEOCCUR_1="Mother diagnosed with infection during/after delivery: Perineal wound infection"
		POST_DEL_INF_CEOCCUR_2="Mother diagnosed with infection during/after delivery: Cesarean wound infection"
		POST_DEL_INF_CEOCCUR_3="Mother diagnosed with infection during/after delivery: Abdominal or pelvic abscess/infection"
		POST_DEL_INF_CEOCCUR_4="Mother diagnosed with infection during/after delivery: Pneumonia or lung infection"
		POST_DEL_INF_CEOCCUR_5="Mother diagnosed with infection during/after delivery: Pylenoprhitis or kidney infection"
		POST_DEL_INF_CEOCCUR_6="Mother diagnosed with infection during/after delivery: Urinary tract infection"
		POST_DEL_INF_CEOCCUR_7="Mother diagnosed with infection during/after delivery: Mastitis or breast abscess/infection"
		POST_DEL_INF_CEOCCUR_8="Mother diagnosed with infection during/after delivery: Septic pelvis thrombophlebitis"
		POST_DEL_INF_CEOCCUR_9="Mother diagnosed with infection during/after delivery: Maternal Sepsis/Septic Shock"
		POST_DEL_INF_CEOCCUR_88="Mother diagnosed with infection during/after delivery: Other"
		POST_DEL_INF_CEOCCUR_77="Mother diagnosed with infection during/after delivery: No infection noted"
		POST_DEL_INF_CEOCCUR_99="Mother diagnosed with infection during/after delivery: Don't know"
		LD_ABX_CMTRT_1="Antibiotics given: Penicillin, Ampicillin, or Amoxicillin"
		LD_ABX_CMTRT_2="Antibiotics given: Gentamycin"
		LD_ABX_CMTRT_3="Antibiotics given: Cephalosporin (Cefazolin, Ceftriaxone)"
		LD_ABX_CMTRT_4="Antibiotics given: Metronidazole/Flagyl"
		LD_ABX_CMTRT_5="Antibiotics given: Clindamycin"
		LD_ABX_CMTRT_6="Antibiotics given: Erythromycin"
		LD_ABX_CMTRT_7="Antibiotics given: Azithromycin"
		LD_ABX_CMTRT_88="Antibiotics given: Other"
		MAT_LD_OHOSTDAT="Date of admission for delivery"
		MAT_LD_OHOSTTIM="Time of admission for delivery"
		MAT_LD_OHOLOC="Delivery location"
	/*	MAT_LD_FAC_OHOLOC="Specify name of facility"*/
	/*	MAT_LD_GPS_OHOLOC="Record GPS coordinates"*/
		MAT_LD_FAC_SPFY_OHOLOC="Specify location"
		ANC_TOT_VISTS="Total number of ANC visits during this pregnancy"
		PTB_MHOCCUR="Preterm labor/risk of preterm birth?"
		PTB_MHSTDAT="Date of Diagnosis"
		PTB_STEROID_SPFY_CMTRT="Specify other steroid"
		PTB_STEROID_CMDOSFRQ="Specify number of doses"
		PTB_OTH_CMTRT="Other medication received"
		PI_HTN_PRTRT="Other PIH treatment received"
		ANTI_PHOS_MHOCCUR="Was mother diagnosed with antiphospholid antibodies?"
		GEST_DIAB_MHOCCUR="Was mother diagnosed with gestational diabetes?"
		ANEMIA_MHOCCUR="Was mother diagnosed with anemia?"
		HB_LBPERF="Is hemoglobin at time of anemia diagnosis available?"
		HB_LBORRES="Record hemoglobin"
		MALARIA_MHOCCUR="Was mother diagnosed with malaria?"
		MALARIA_FAMETHOD="How was malaria diagnosed?"
		HIV_MHOCCUR="Was mother diagnosed with HIV?"
		HIV_MHSTDAT="Date of HIV Diagnosis"
		HIV_CMOCCUR="Was HIV treatment started?"
		HIV_SPFY_CMTRT="Other HIV treatment received"
		TB_MHOCCUR="Was mother diagnosed with TB?"
		HEPB_MHOCCUR="Was mother diagnosed with Hepatitis B (HBV)?"
		SYPH_MHOCCUR="Was mother diagnosed with syphilis?"
		SYPH_CMTRT="Did mother receive treatment for syphilis infection?"
		STI_SPFY_MHTERM="Specify other STI"
		FEVER_CEOCCUR="Has the mother had a fever (>=37.5 C)?"
		FEVER_CESTDAT="Date of fever onset"
		MAX_TEMP_PEMETH="Is temperature >=37.5 documented in participant-held or facility-based clinical record?"
		MAX_TEMP_VSORRES="Record highest known temperature >=37.5 C"
		Cough_CEOCCUR="Has the mother had a cough?"
		Cough_CESTDAT="Cough date of onset"
		Shortbreath_CEOCCUR="Has the mother had shortness of breath/difficulty breathing?"
		Shortbreath_CESTDAT="Shortness of breath date of onset"
		sorethroat_CEOCCUR="Has the mother had a sore throat?"
		sorethroat_cestdat_CESTDAT="Sorethroat date of onset"
		runnynose_CEOCCUR="Has the mother had a runny nose or inflammation of the nasal membranes?"
		runnynose_cestdat_CESTDAT="Runny nose date of onset"
		fatigue_CEOCCUR="Has the mother experienced weakness or fatigue?"
		fatigue_CESTDAT="Fatigue date of onset"
		Headache_CEOCCUR="Has the mother had headaches?"
		Headache_CESTDAT="Headache date of onset"
		confusion_CEOCCUR="Has the mother experienced confusion or an altered mental status?"
		confusion_CESTDAT="Confusion date of onset"
		myalgia_CEOCCUR="Has the mother had myalgia (muscle ache)?"
		myalgia_CESTDAT="Myalgia date of onset"
		Diarrhoea_CEOCCUR="Has the mother had diarrhea?"
		Diarrhoea_CESTDAT="Diarrhoea date of onset"
		Nauseavomit_CEOCCUR="Has the mother had nausea or vomiting?"
		Nauseavomit_CESTDAT="Nausea/vomiting date of onset"
		anorexia_CEOCCUR="Has the mother experienced a loss of appetite?"
		anorexia_CESTDAT="Anorexia date of onset"
		anosmia_CEOCCUR="Has the mother experience a loss of smell (anosmia)"
		anosmia_CESTDAT="Anosmia date of onset"
		ageusia_CEOCCUR="Has the mother experience a loss of taste (ageusia)"
		ageusia_CESTDAT="Ageusia date of onset"
		SARI_CEOCCUR="Was mother diagnosed with severe acute respiratory disease?"
		SARI_CESTDAT="Date of Diagnosis"
		COVID_CONTACT_YN="Did mother have contact with a probable or confirmed COVID-19 case?"
		COVID_CONTACT_DAT="Date of most recent contact"
		CHEST_IMAGE_PRSTDAT="Date of chest imaging"
		COVID_LBPERF="Was mother tested for COVID-19?"
		COVID_LBDAT="Date of COVID test"
		COVID_LBORRES="Covid test result"
		INFECT_SPFY_CETERM="Specify other symptoms"
		INFECT_CESTDAT="Date of onset of first symptom"
		INFECT_OTH_MHTERM="Specify other infection(s)"
		ORG_FAIL_MHTERM="Specify other type of organ failure"
		OTH_ISSUE_MHOCCUR="Did the mother have any other medical issues at time of admission for labor and delivery?"
		OTH_ISSUE_MHTERM="Specify issue"
		ADMIT_ABX_CMOCCUR="Was mother taking antibiotics at the time of admission?"
		ADMIT_ABX_SPFY_CMTRT="Specify other antibiotic"
		ADMIT_ABX_CMINDC="Specify indication for antibiotic"
		ADMIT_ABX_SPFY_CMINDC="Specify other indication"
		ADMIT_MEDS_OTHR_CMOCCUR="Was the mother taking any other medications at the time of admission for delivery?"
		ADMIT_MEDS_OTHR_CMTRT="Specify medication"
		LABOR_MHSTDAT="Date of labor onset"
		LABOR_MHSTTIM="Time of labor onset"
		INDUCED_PROCCUR="Was labor induced?"
		INDUCED_SPFY_PRTRT="Specify other type of induction"
		INDUCED_PRINDC="Specify primary reason for induction"
		INDUCED_SPFY_PRINDC="Specify other reason for induction"
		MEMBRANE_RUPT_MHSTDAT="Date of membrane rupture"
		MEMBRANE_RUPT_MHSTTIM="Time of membrane rupture"
		MEMBRANE_RUPT_SPONT_FAORRES="Was membrane rupture spontaneous?"
		AMNIOTIC_CLEAR_FAORRES="Was amniotic fluid clear?"
		AMNIOTIC_ODOR_FAORRES="Was fluid malodorous?"
		MULTI_BIRTH_FAORRES="Was this a multiple birth?"
		INFANTS_FAORRES="Specify number of infants"
		INF_1_DSSTDAT="Date of delivery"
		INF_1_DSSTTIM="Time of delivery"
		INF_1_ATT_FAORRES="Who was the primary birth attendant?"
		INF_1_ATT_SPFY_FAORRES="Specify other type of birth attendant"
		INF_1_PRESENT_FAORRES="Fetal presentation"
		INF_1_PRESENT_SPFY_FAORRES="Specify other fetal presentation"
		INF_1_DELIVERY_PRROUTE="Delivery method"
		INF_1_VAG_PRROUTE="Type of vaginal delivery"
		INF_1_VAG_SPFY_PRROUTE="Specify other type of vaginal delivery"
		INF_1_EPIS_PROCCUR="Was an episiotomy performed?"
		INF_1_CES_FAORRES="Was Cesarean delivery emergent or planned?"
		INF_1_CES_SPFY_PRINDC="Specify other indication for Cesarean delivery"
		INF_1_CES_INCISION_FAORRES="Specify incision type"
		INF_1_DSTERM="Birth outcome"
		INF_2_DSSTDAT="Date of delivery"
		INF_2_DSSTTIM="Time of delivery"
		INF_2_ATT_FAORRES="Who was the primary birth attendant?"
		INF_2_ATT_SPFY_FAORRES="Specify other type of birth attendant"
		INF_2_PRESENT_FAORRES="Fetal presentation"
		INF_2_PRESENT_SPFY_FAORRES="Specify other fetal presentation"
		INF_2_DELIVERY_PRROUTE="Delivery method"
		INF_2_VAG_PRROUTE="Type of vaginal delivery"
		INF_2_VAG_SPFY_PRROUTE="Specify other type of vaginal delivery"
		INF_2_EPIS_PROCCUR="Was an episiotomy performed?"
		INF_2_CES_FAORRES="Was Cesarean delivery emergent or planned?"
		INF_2_CES_SPFY_PRINDC="Specify other indication for Cesarean delivery"
		INF_2_CES_INCISION_FAORRES="Specify incision type"
		INF_2_DSTERM="Birth outcome"
/*		INF_3_DSSTDAT="Date of delivery"
		INF_3_DSSTTIM="Time of delivery"
		INF_3_ATT_FAORRES="Who was the primary birth attendant?"
		INF_3_ATT_SPFY_FAORRES="Specify other type of birth attendant"
		INF_3_PRESENT_FAORRES="Fetal presentation"
		INF_3_PRESENT_SPFY_FAORRES="Specify other fetal presentation"
		INF_3_DELIVERY_PRROUTE="Delivery method"
		INF_3_VAG_PRROUTE="Type of vaginal delivery"
		INF_3_VAG_SPFY_PRROUTE="Specify other type of vaginal delivery"
		INF_3_EPIS_PROCCUR="Was an episiotomy performed?"
		INF_3_CES_FAORRES="Was Cesarean delivery emergent or planned?"
		INF_3_CES_SPFY_PRINDC="Specify other indication for Cesarean delivery"
		INF_3_CES_INCISION_FAORRES="Specify incision type"
		INF_3_DSTERM="Birth outcome"
		INF_4_DSSTDAT="Date of delivery"
		INF_4_DSSTTIM="Time of delivery"
		INF_4_ATT_FAORRES="Who was the primary birth attendant?"
		INF_4_ATT_SPFY_FAORRES="Specify other type of birth attendant"
		INF_4_PRESENT_FAORRES="Fetal presentation"
		INF_4_PRESENT_SPFY_FAORRES="Specify other fetal presentation"
		INF_4_DELIVERY_PRROUTE="Delivery method"
		INF_4_VAG_PRROUTE="Type of vaginal delivery"
		INF_4_VAG_SPFY_PRROUTE="Specify other type of vaginal delivery"
		INF_4_EPIS_PROCCUR="Was an episiotomy performed?"
		INF_4_CES_FAORRES="Was Cesarean delivery emergent or planned?"
		INF_4_CES_SPFY_PRINDC="Specify other indication for Cesarean delivery"
		INF_4_CES_INCISION_FAORRES="Specify incision type"
		INF_4_DSTERM="Birth outcome"*/
		PI_HTN_POST_MHOCCUR="Did mother develop pregnancy-induced hypertension (includes preeclampsia and eclampsia) after admission for labor and delivery?"
		PI_HTN_POST_SPFY_CMOCCUR="Specify other medication provided to treat PIH"
		FETAL_DISTRESS_CEOCCUR="Was fetal distress diagnosed during labor or delivery?"
		FETAL_DISTRESS_SPFY_FAORRES="Specify other reason for fetal distress"
		OBSTRUCTED_LABOR_CEOCCUR="Did mother experience obstructed or prolonged labor?"
		RUPT_UTERUS_CEOCCUR="Did mother experience a ruptured uterus (repaired/hysterectomy)?"
		APH_CEOCCUR="Did mother experience antepartum hemorrhage (APH)?"
		APH_SPFY_FAORRES="Specify other complication(s) that contributed to APH"
		PPH_CEOCCUR="Did mother experience postpartum hemorrhage (PPH)?"
		PPH_SPFY_FAORRES="Specify other complication(s) that contributed to PPH"
		PPH_CMTRT="Specify  other medications were given to prevent/treat PPH"
		PPH_ESTIMATE_FASTAT="Is estimated blood loss available?"
		PPH_ESTIMATE_FAORRES="Estimated blood loss"
		PPH_TRNSFSN_PROCCUR="Did mother have a transfusion?"
		ABNL_TEMP_CEOCCUR="Did mother have an abnormal temperature during or after delivery (>=37.5c or <36.0c)?"
		MAX_TEMP_VSSTAT="Is temperature >=37.5C documented?"
		MAX_TEMP_VSORRES="Provide highest temperature >=37.5C"
		LOW_TEMP_VSSTAT="Is temperature <36.0C documented?"
		LOW_TEMP_VSORRES="Provide lowest temperature <36.0C"
		POST_DEL_SS_CETERM="Specify other sign of complication"
		POST_DEL_INF_CETERM="Specify other infection(s) diagnosed during or after delivery"
		LD_ABX_CMOCCUR="Were antibiotics given during or after delivery?"
		LD_ABX_SPFY_CMTRT="Specify other antibiotic given"
	/*	LD_ABX_CMDOSFRQ="How many doses were given?" */
	/*	LD_ABX_SPFY_CMSTDAT="Date of first dose" */
		LD_MEDS_OTHR_CMOCCUR="Were any other medications given during or after delivery?"
		LD_MEDS_OTHR_CMTRT="Specify other medications given during or after delivery"
		MAT_DSTERM="Mothers status after delivery"
		TRANSFER_OHOLOC="Where was mother transferred for higher-level care?"
		TRANSFER_OHOENDAT="Date of discharge from delivery facility"
		DEST_DISCHARGE_OHOLOC="Planned destination after discharge"
		DEST_DISCHARGE_SPFY_OHOLOC="Specify name of referral facility"
	/*	MAT_DEATH_DTHDAT="Date of death"
		MAT_DEATH_DSSTTIM="Time of death"
		MAT_DEATH_DDORRES="Primary cause of death" */
		COYN="Would you like to record any additional comments about this visit?"
	/*	COVAL="Record comments" */
	/*	FORMCOMPLID="Record indentifier of person completing this form as appropriate for your site (e.g. Name initials ID or code)" */
		LD_ABX_SPFY_CMSTDAT1="Date of first dose"
		LD_ABX_SPFY_CMSTDAT2="Date of second dose"
		LD_ABX_SPFY_CMSTDAT3="Date of third dose"		
		LD_ABX_SPFY_CMSTDAT4="Date of fourth dose"
		LD_ABX_SPFY_CMSTDAT5="Date of fifth dose"
		LD_ABX_SPFY_CMSTDAT6="Date of sixth dose"		
		LD_ABX_SPFY_CMSTDAT7="Date of seventh dose"
		LD_ABX_SPFY_CMSTDAT8="Date of eighth dose";

*rename characters >32;
rename	MAT_LD_OBSLOC_District_parent=MAT_LD_OBSLOC_District_pa
		MAT_LD_OBSLOC_Type_locationType=MAT_LD_OBSLOC_Type_locType
		MAT_LD_OBSLOC_Village_or_Facilit=MAT_LD_OBSLOC_Village_or_Fac;

*Format - add additional variables later;
format 	HB_LBPERF MULTI_BIRTH_FAORRES PPH_ESTIMATE_FASTAT COYN complete yn.
		f_fatigue_CESTDAT  f_Headache_CESTDAT  f_myalgia_CESTDAT  f_anosmia_CESTDAT f_COVID_LBDAT  
		f_LABOR_MHSTDAT  f_TRANSFER_OHOENDAT  f_ageusia_CESTDAT ynna.
		PTB_MHOCCUR ANTI_PHOS_MHOCCUR GEST_DIAB_MHOCCUR ANEMIA_MHOCCUR MALARIA_MHOCCUR HIV_MHOCCUR 
		HIV_CMOCCUR TB_MHOCCUR HEPB_MHOCCUR SYPH_MHOCCUR Cough_CEOCCUR Shortbreath_CEOCCUR sorethroat_CEOCCUR 
		runnynose_CEOCCUR fatigue_CEOCCUR Headache_CEOCCUR confusion_CEOCCUR myalgia_CEOCCUR Diarrhoea_CEOCCUR 
		Nauseavomit_CEOCCUR anorexia_CEOCCUR anosmia_CEOCCUR ageusia_CEOCCUR SARI_CEOCCUR COVID_CONTACT_YN 
		COVID_LBPERF OTH_ISSUE_MHOCCUR ADMIT_ABX_CMOCCUR ADMIT_MEDS_OTHR_CMOCCUR INDUCED_PROCCUR 
		MEMBRANE_RUPT_SPONT_FAORRES AMNIOTIC_CLEAR_FAORRES AMNIOTIC_ODOR_FAORRES INF_1_EPIS_PROCCUR 
		INF_2_EPIS_PROCCUR /*INF_3_EPIS_PROCCUR INF_4_EPIS_PROCCUR*/ PI_HTN_POST_MHOCCUR FETAL_DISTRESS_CEOCCUR 
		OBSTRUCTED_LABOR_CEOCCUR RUPT_UTERUS_CEOCCUR APH_CEOCCUR PPH_CEOCCUR PPH_TRNSFSN_PROCCUR 
		ABNL_TEMP_CEOCCUR MAX_TEMP_VSSTAT LOW_TEMP_VSSTAT LD_ABX_CMOCCUR LD_MEDS_OTHR_CMOCCUR yndk.
		FEVER_CEOCCUR MAX_TEMP_PEMETH ynuk.
		PTB_SRCE_1 PTB_SRCE_2 PTB_SRCE_3 PTB_STEROID_CMOCCUR_1 PTB_STEROID_CMOCCUR_2 PTB_STEROID_CMOCCUR_88
		PTB_STEROID_CMOCCUR_77	PTB_STEROID_CMOCCUR_99	PTB_TOCO_CMOCCUR_1 PTB_TOCO_CMOCCUR_2
		PTB_TOCO_CMOCCUR_3	PTB_TOCO_CMOCCUR_88	PTB_TOCO_CMOCCUR_77	PTB_TOCO_CMOCCUR_99	PI_HTN_MHOCCUR_1
		PI_HTN_MHOCCUR_2 PI_HTN_MHOCCUR_3	PI_HTN_MHOCCUR_4	PI_HTN_MHOCCUR_5	PI_HTN_MHOCCUR_77
		PI_HTN_MHOCCUR_99	PI_HTN_PROCCUR_1	PI_HTN_PROCCUR_2	PI_HTN_PROCCUR_3
		PI_HTN_PROCCUR_4	PI_HTN_PROCCUR_5	PI_HTN_PROCCUR_6	PI_HTN_PROCCUR_7	PI_HTN_PROCCUR_88		PI_HTN_PROCCUR_77
		PI_HTN_PROCCUR_99		ANTI_PHOS_SRCE_1		ANTI_PHOS_SRCE_2		ANTI_PHOS_SRCE_3		GEST_DIAB_SRCE_1		GEST_DIAB_SRCE_2
		GEST_DIAB_SRCE_3		ANEMIA_SRCE_1		ANEMIA_SRCE_2		ANEMIA_SRCE_3		MALARIA_SRCE_1		MALARIA_SRCE_2		MALARIA_SRCE_3
		HIV_SRCE_1		HIV_SRCE_2		HIV_SRCE_3		HIV_CMTRT_1		HIV_CMTRT_2		HIV_CMTRT_3		HIV_CMTRT_4		HIV_CMTRT_5		HIV_CMTRT_6
		HIV_CMTRT_7		HIV_CMTRT_8		HIV_CMTRT_9		HIV_CMTRT_10		HIV_CMTRT_11		HIV_CMTRT_12		HIV_CMTRT_13		HIV_CMTRT_14
		HIV_CMTRT_15		HIV_CMTRT_16		HIV_CMTRT_17		HIV_CMTRT_18		HIV_CMTRT_19		HIV_CMTRT_20		HIV_CMTRT_21
		HIV_CMTRT_22		HIV_CMTRT_23		HIV_CMTRT_24		HIV_CMTRT_25		HIV_CMTRT_88		HIV_CMTRT_99		STI_MHOCCUR_1
		STI_MHOCCUR_2		STI_MHOCCUR_3		STI_MHOCCUR_4		STI_MHOCCUR_5		STI_MHOCCUR_88		STI_MHOCCUR_77		STI_MHOCCUR_99
		CHEST_IMAGE_PROCCUR_1		CHEST_IMAGE_PROCCUR_2		CHEST_IMAGE_PROCCUR_3		CHEST_IMAGE_PROCCUR_77		CHEST_IMAGE_PROCCUR_99		COVID_SRCE_1
		COVID_SRCE_2		COVID_SRCE_3		INFECT_CEOCCUR_1		INFECT_CEOCCUR_2		INFECT_CEOCCUR_3		INFECT_CEOCCUR_4		INFECT_CEOCCUR_5		INFECT_CEOCCUR_88
		INFECT_CEOCCUR_77		INFECT_CEOCCUR_99		INFECT_OTH_MHOCCUR_1		INFECT_OTH_MHOCCUR_2		INFECT_OTH_MHOCCUR_3		INFECT_OTH_MHOCCUR_4		INFECT_OTH_MHOCCUR_5
		INFECT_OTH_MHOCCUR_88		INFECT_OTH_MHOCCUR_77		INFECT_OTH_MHOCCUR_99		INFECT_OTH_SRCE_1		INFECT_OTH_SRCE_2		INFECT_OTH_SRCE_3		ORG_FAIL_MHOCCUR_1
		ORG_FAIL_MHOCCUR_2		ORG_FAIL_MHOCCUR_3		ORG_FAIL_MHOCCUR_4		ORG_FAIL_MHOCCUR_77		ORG_FAIL_MHOCCUR_88		ORG_FAIL_MHOCCUR_99		ORG_FAIL_SRCE_1
		ORG_FAIL_SRCE_2		ORG_FAIL_SRCE_3		ADMIT_ABX_CMTRT_1		ADMIT_ABX_CMTRT_2		ADMIT_ABX_CMTRT_3		ADMIT_ABX_CMTRT_4		ADMIT_ABX_CMTRT_5
		ADMIT_ABX_CMTRT_6		ADMIT_ABX_CMTRT_7		ADMIT_ABX_CMTRT_88		ADMIT_ABX_CMTRT_99		INDUCED_PRTRT_1		INDUCED_PRTRT_2		INDUCED_PRTRT_3		INDUCED_PRTRT_4	
		INDUCED_PRTRT_88		INDUCED_PRTRT_99		AMNIOTIC_SPFY_FAORRES_1		AMNIOTIC_SPFY_FAORRES_2		AMNIOTIC_SPFY_FAORRES_3		INF_1_CES_PRINDC_1		INF_1_CES_PRINDC_2	
	/*	INF_1_CES_PRINDC_3		INF_1_CES_PRINDC_4		INF_1_CES_PRINDC_5		INF_1_CES_PRINDC_6		INF_1_CES_PRINDC_7		INF_1_CES_PRINDC_8		INF_1_CES_PRINDC_9		INF_1_CES_PRINDC_10	
		INF_1_CES_PRINDC_11		INF_1_CES_PRINDC_12		INF_1_CES_PRINDC_13		INF_1_CES_PRINDC_14		INF_1_CES_PRINDC_15		INF_1_CES_PRINDC_16		INF_1_CES_PRINDC_88		INF_1_CES_PRINDC_99	
		INF_2_CES_PRINDC_1		INF_2_CES_PRINDC_2		INF_2_CES_PRINDC_3		INF_2_CES_PRINDC_4		INF_2_CES_PRINDC_5		INF_2_CES_PRINDC_6		INF_2_CES_PRINDC_7		INF_2_CES_PRINDC_8	
		INF_2_CES_PRINDC_9		INF_2_CES_PRINDC_10		INF_2_CES_PRINDC_11		INF_2_CES_PRINDC_12		INF_2_CES_PRINDC_13		INF_2_CES_PRINDC_14		INF_2_CES_PRINDC_15		INF_2_CES_PRINDC_16	
		INF_2_CES_PRINDC_88		INF_2_CES_PRINDC_99		INF_3_CES_PRINDC_1		INF_3_CES_PRINDC_2		INF_3_CES_PRINDC_3		INF_3_CES_PRINDC_4		INF_3_CES_PRINDC_5		INF_3_CES_PRINDC_6	
		INF_3_CES_PRINDC_7		INF_3_CES_PRINDC_8		INF_3_CES_PRINDC_9		INF_3_CES_PRINDC_10		INF_3_CES_PRINDC_11		INF_3_CES_PRINDC_12		INF_3_CES_PRINDC_13		INF_3_CES_PRINDC_14	
		INF_3_CES_PRINDC_15		INF_3_CES_PRINDC_16		INF_3_CES_PRINDC_88		INF_3_CES_PRINDC_99		INF_4_CES_PRINDC_1		INF_4_CES_PRINDC_2		INF_4_CES_PRINDC_3		INF_4_CES_PRINDC_4		INF_4_CES_PRINDC_5
		INF_4_CES_PRINDC_6		INF_4_CES_PRINDC_7		INF_4_CES_PRINDC_8		INF_4_CES_PRINDC_9		INF_4_CES_PRINDC_10		INF_4_CES_PRINDC_11		INF_4_CES_PRINDC_12		INF_4_CES_PRINDC_13		INF_4_CES_PRINDC_14	
		INF_4_CES_PRINDC_15		INF_4_CES_PRINDC_16		INF_4_CES_PRINDC_88		INF_4_CES_PRINDC_99	*/ 	PI_HTN_POST_CMOCCUR_1		PI_HTN_POST_CMOCCUR_2		PI_HTN_POST_CMOCCUR_3		PI_HTN_POST_CMOCCUR_4	
		PI_HTN_POST_CMOCCUR_5		PI_HTN_POST_CMOCCUR_77		PI_HTN_POST_CMOCCUR_88		PI_HTN_POST_CMOCCUR_99		FETAL_DISTRESS_FAORRES_1		FETAL_DISTRESS_FAORRES_2		FETAL_DISTRESS_FAORRES_3	
		FETAL_DISTRESS_FAORRES_4		FETAL_DISTRESS_FAORRES_88		FETAL_DISTRESS_FAORRES_99		APH_FAORRES_1		APH_FAORRES_2		APH_FAORRES_88		APH_FAORRES_99		PPH_FAORRES_1		PPH_FAORRES_2	
		PPH_FAORRES_3		PPH_FAORRES_4		PPH_FAORRES_88		PPH_FAORRES_99		PPH_CMOCCUR_1		PPH_CMOCCUR_2		PPH_CMOCCUR_3		PPH_CMOCCUR_4		PPH_CMOCCUR_5		PPH_CMOCCUR_6		PPH_CMOCCUR_88	
		PPH_CMOCCUR_77		PPH_CMOCCUR_99		POST_DEL_SS_CEOCCUR_1		POST_DEL_SS_CEOCCUR_2		POST_DEL_SS_CEOCCUR_3		POST_DEL_SS_CEOCCUR_4		POST_DEL_SS_CEOCCUR_5		POST_DEL_SS_CEOCCUR_6		POST_DEL_SS_CEOCCUR_7	
		POST_DEL_SS_CEOCCUR_8		POST_DEL_SS_CEOCCUR_9		POST_DEL_SS_CEOCCUR_10		POST_DEL_SS_CEOCCUR_11		POST_DEL_SS_CEOCCUR_12		POST_DEL_SS_CEOCCUR_88		POST_DEL_SS_CEOCCUR_77		POST_DEL_SS_CEOCCUR_99	
		POST_DEL_CHORIO_CEOCCUR_1		POST_DEL_CHORIO_CEOCCUR_2		POST_DEL_CHORIO_CEOCCUR_3		POST_DEL_CHORIO_CEOCCUR_4		POST_DEL_CHORIO_CEOCCUR_77		POST_DEL_CHORIO_CEOCCUR_99		POST_DEL_ENDOMET_CEOCCUR_1	
		POST_DEL_ENDOMET_CEOCCUR_2		POST_DEL_ENDOMET_CEOCCUR_3		POST_DEL_ENDOMET_CEOCCUR_4		POST_DEL_ENDOMET_CEOCCUR_77		POST_DEL_ENDOMET_CEOCCUR_99		POST_DEL_INF_CEOCCUR_1		POST_DEL_INF_CEOCCUR_2	
		POST_DEL_INF_CEOCCUR_3		POST_DEL_INF_CEOCCUR_4		POST_DEL_INF_CEOCCUR_5		POST_DEL_INF_CEOCCUR_6		POST_DEL_INF_CEOCCUR_7		POST_DEL_INF_CEOCCUR_8		POST_DEL_INF_CEOCCUR_9	
		POST_DEL_INF_CEOCCUR_88		POST_DEL_INF_CEOCCUR_77	POST_DEL_INF_CEOCCUR_99	LD_ABX_CMTRT_1		LD_ABX_CMTRT_2		LD_ABX_CMTRT_3		LD_ABX_CMTRT_4		LD_ABX_CMTRT_5		LD_ABX_CMTRT_6		LD_ABX_CMTRT_7	
		LD_ABX_CMTRT_88 PI_HTN_SRCE_1 PI_HTN_SRCE_2 PI_HTN_SRCE_3 TB_SRCE_1 TB_SRCE_2 TB_SRCE_3 HEPB_SRCE_1 HEPB_SRCE_2 HEPB_SRCE_3 SYPH_SRCE_1 SYPH_SRCE_2 SYPH_SRCE_3 STI_SRCE_1 STI_SRCE_2 STI_SRCE_3 
		INF_1_CES_PRINDC_3  INF_1_CES_PRINDC_5  INF_1_CES_PRINDC_7 INF_1_CES_PRINDC_8  INF_1_CES_PRINDC_13 
		INF_1_CES_PRINDC_16  INF_2_CES_PRINDC_2  INF_2_CES_PRINDC_6  INF_2_CES_PRINDC_7  INF_2_CES_PRINDC_10  INF_2_CES_PRINDC_12  INF_2_CES_PRINDC_13 INF_2_CES_PRINDC_99  INF_1_CES_PRINDC_4  INF_1_CES_PRINDC_6 
		INF_1_CES_PRINDC_9  INF_1_CES_PRINDC_10  INF_1_CES_PRINDC_12  INF_1_CES_PRINDC_14 INF_1_CES_PRINDC_15  INF_1_CES_PRINDC_88 
		INF_1_CES_PRINDC_99   INF_2_CES_PRINDC_1  INF_2_CES_PRINDC_3 INF_2_CES_PRINDC_4  INF_2_CES_PRINDC_5  INF_2_CES_PRINDC_8  INF_2_CES_PRINDC_9 
		INF_2_CES_PRINDC_11  INF_2_CES_PRINDC_14 INF_2_CES_PRINDC_15  INF_2_CES_PRINDC_16  INF_2_CES_PRINDC_88 ckall.
		MAT_LD_OHOLOC	MNH11_MAT_LD_OHOLOC.
		PTB_STEROID_CMDOSFRQ	MNH11_PTB_STEROID_CMDOSFRQ.
		MALARIA_FAMETHOD	MNH11_MALARIA_FAMETHOD.
		COVID_LBORRES	MNH11_COVID_LBORRES.
		ADMIT_ABX_CMINDC	MNH11_ADMIT_ABX_CMINDC.
		INDUCED_PRINDC	MNH11_INDUCED_PRINDC.
		INF_1_ATT_FAORRES INF_2_ATT_FAORRES /*INF_3_ATT_FAORRES  INF_4_ATT_FAORRES*/	MNH11_INF_ATT_FAORRES.
		INF_1_PRESENT_FAORRES INF_2_PRESENT_FAORRES /*INF_3_PRESENT_FAORRES INF_4_PRESENT_FAORRES*/ 	MNH11_INF_PRESENT_FAORRES.
		INF_1_DELIVERY_PRROUTE INF_2_DELIVERY_PRROUTE /*INF_3_DELIVERY_PRROUTE INF_4_DELIVERY_PRROUTE*/	MNH11_INF_DELIVERY_PRROUTE. 
		INF_1_VAG_PRROUTE INF_2_VAG_PRROUTE /*INF_3_VAG_PRROUTE INF_4_VAG_PRROUTE*/	MNH11_INF_VAG_PRROUTE. 
		INF_1_CES_FAORRES INF_2_CES_FAORRES /*INF_3_CES_FAORRES INF_4_CES_FAORRES*/	MNH11_INF_CES_FAORRES. 
		INF_1_CES_INCISION_FAORRES INF_2_CES_INCISION_FAORRES /*INF_3_CES_INCISION_FAORRES INF_4_CES_INCISION_FAORRES*/	MNH11_INF_CES_INCISION_FAORRES. 
		INF_1_DSTERM INF_2_DSTERM /*INF_3_DSTERM INF_4_DSTERM*/	MNH11_INF_DSTERM. 
		MAT_DSTERM	MNH11_MAT_DSTERM.
		TRANSFER_OHOLOC	MNH11_TRANSFER_OHOLOC.
		DEST_DISCHARGE_OHOLOC	MNH11_DEST_DISCHARGE_OHOLOC.
		HIV_MHSTDAT  FEVER_CESTDAT  Cough_CESTDAT  sorethroat_cestdat_CESTDAT
		runnynose_cestdat_CESTDAT  fatigue_CESTDAT Headache_CESTDAT  confusion_CESTDAT 
		myalgia_CESTDAT  Diarrhoea_CESTDAT  Nauseavomit_CESTDAT  anosmia_CESTDAT SARI_CESTDAT 
		Shortbreath_CESTDAT  anorexia_CESTDAT  COVID_CONTACT_DAT CHEST_IMAGE_PRSTDAT  COVID_LBDAT  
		INFECT_CESTDAT  LABOR_MHSTDAT  TRANSFER_OHOENDAT  ageusia_CESTDAT  PTB_MHSTDAT 
		LD_ABX_SPFY_CMSTDAT1  LD_ABX_SPFY_CMSTDAT2  LD_ABX_SPFY_CMSTDAT3  LD_ABX_SPFY_CMSTDAT4
		LD_ABX_SPFY_CMSTDAT5 LD_ABX_SPFY_CMSTDAT6  LD_ABX_SPFY_CMSTDAT7  LD_ABX_SPFY_CMSTDAT8  date9.;
		*Drop unnecessary tangerine vars;
drop	ROW_VERSION formId  formtitle  _id buildId buildChannel deviceId groupId form_box1 text1 time_1  
		time_2 time_3 time_4 form_intro form_box time_5 Fac_Spec_facility
		Fac_Spec_facility_dcnt Fac_Spec_facility_id Fac_Spec_facility_label Fac_Spec_facility_level
		Fac_Spec_facility_parent Fac_Spec_location Fac_Spec_location_dcnt Fac_Spec_location_id
		Fac_Spec_location_label Fac_Spec_location_level Fac_Spec_location_parent Fac_Spec_region
		Fac_Spec_region_dcnt Fac_Spec_region_id Fac_Spec_region_label Fac_Spec_region_level
		Fac_Spec_region_parent;
		*Drop Kenya specific vars;
drop	Abx Abx_spec_1 Abx_spec_2 Abx_spec_3 Abx_spec_4 Abx_spec_5 Abx_spec_6 Abx_spec_7 Abx_spec_8
		Abx_spec_date1 Abx_spec_date2 Abx_spec_date3 Abx_spec_date4 Abx_spec_date5 Abx_spec_date6
		Abx_spec_date7 Abx_spec_date8 Abx_spec_dose1 Abx_spec_dose2 Abx_spec_dose3 Abx_spec_dose4
		Abx_spec_dose5 Abx_spec_dose6 Abx_spec_dose7 Abx_spec_dose8 Abx_spec_other ancovConsentVersion
		APH_com_1 APH_com_2 APH_com_3 APH_com_99 APH_com_spec APH_diagnose Chorio Chorio_sign_1
		Chorio_sign_2 Chorio_sign_3 Chorio_sign_4 Chorio_sign_5 Com_PIH Com_PTB del_DoA del_ToA
		DISCHARGE_OHOOCCUR Endo Endo_sign_1 Endo_sign_2 Endo_sign_3 Endo_sign_4  Fet_distress Fet_distress_spec_1 Fet_distress_spec_2 Fet_distress_spec_3
		Fet_distress_spec_4 Fet_distress_spec_5 Fet_distress_spec_99 HBV_diag HIV_diag Hx_aburine Hx_anemia
		Hx_infection_1 Hx_infection_10 Hx_infection_11 Hx_infection_2 Hx_infection_3 Hx_infection_4 
		Hx_infection_5 Hx_infection_6 Hx_infection_7 Hx_infection_77 Hx_infection_8 Hx_infection_9 
		Hx_issue_other Hx_med Infection_1 Infection_10 Infection_2 Infection_3 Infection_4 Infection_5 
		Infection_6 Infection_7 Infection_77 Infection_8 Infection_9 Infection_spec Int_date Int_Loc 
		Loc_home_accuracy Loc_home_latitude Loc_home_longitude Loc_other Malaria_diag Med_other 
		Med_other_spec PIH_med_1 PIH_med_2 PIH_med_3 PIH_med_4 PIH_med_5 PIH_med_6 PIH_med_99 PIH_med_spec 
		PPH_com_1 PPH_com_2 PPH_com_3 PPH_com_4 PPH_com_5 PPH_com_99 PPH_com_spec PPH_diagnose PPH_EBL 
		PPH_Med_1 PPH_Med_2 PPH_Med_3 PPH_Med_4 PPH_Med_5 PPH_Med_6 PPH_Med_7 PPH_Med_99 PPH_med_spec 
		PPH_transfusion preg_LHb prismaContentVersion PTB_steroid PTB_steroid_dose PTB_steroid_spec 
		PTB_Toc PTB_Toc_spec q1 q10 q11 q12 q13 q14 q15 q16_1 q16_2 q16_3 q17 q18 q19 q2 q20 q21 q22 q23 
		q24 q3 q34 q35 q36_1 q36_10 q36_11 q36_12 q36_13 q36_14 q36_2 q36_3 q36_4 q36_5 q36_6 q36_7 q36_77 
		q36_8 q36_9 q4 q5 q6 q7 q8 q9 TB_diag Temp Temp_high Temp_low;
		*Should we keep these vars or drop? I'm leaning towards dropping because they're similar to other variables we have been dropping.
		The MAT_LD_FAC_OHOLOC var is actually in the data dictionary though, so I'm not sure we should. Dropping for now:;
drop	MAT_LD_FAC_OHOLOC_region MAT_LD_FAC_OHOLOC_region_parent MAT_LD_FAC_OHOLOC_region_label MAT_LD_FAC_OHOLOC_region_id
		MAT_LD_FAC_OHOLOC_region_level MAT_LD_FAC_OHOLOC_region_dcnt MAT_LD_FAC_OHOLOC_location
		MAT_LD_FAC_OHOLOC_location_paren MAT_LD_FAC_OHOLOC_location_label MAT_LD_FAC_OHOLOC_location_id
		MAT_LD_FAC_OHOLOC_location_level MAT_LD_FAC_OHOLOC_loc_dcnt MAT_LD_FAC_OHOLOC_facility
		MAT_LD_FAC_OHOLOC_facility_paren MAT_LD_FAC_OHOLOC_facility_label MAT_LD_FAC_OHOLOC_facility_id
		MAT_LD_FAC_OHOLOC_facility_level MAT_LD_FAC_OHOLOC_fac_dcnt MAT_LD_OBSLOC_District_dcnt MAT_LD_OBSLOC_Type_dcnt
		Fac_Spec_location_dcnt Fac_Spec_facility_dcnt Fac_Spec_region_dcnt MAT_LD_OBSLOC_Region_dcnt;
		*More variables I'm not sure if we should drop or not. They're technically not in the data dictionary,
		but it seems like they represent multiple doses of antibiotics given, and the base LD_ABX_CMTRT is 
		in the DD. Dropping for now but might add back in:;
drop	LD_ABX_CMTRT_dose1 LD_ABX_CMTRT_dose2 LD_ABX_CMTRT_dose3
		LD_ABX_CMTRT_dose4 LD_ABX_CMTRT_dose5 LD_ABX_CMTRT_dose6
		LD_ABX_CMTRT_dose7 LD_ABX_CMTRT_dose8;
run;

/*ods EXCEL file="/rtpnfil03/rtpnfil03_vol5/ANCPNC_Collective/Data Monitoring and Analysis/Datasets/Documentation/Contents/mnh11contents.xlsx";
proc contents data=mnh11 order=varnum; run;
ods EXCEL close;*/


**Add prefix of M11_;
%varprefix(dset=mnh11, prefix=M11_, keepname="caseid" "participantid" "eventid" "eventformid" "siten")




proc freq data=mnh11;
*DD variables;
tables M11_ABNL_TEMP_CEOCCUR M11_ADMIT_ABX_CMINDC M11_ADMIT_ABX_CMOCCUR M11_ADMIT_ABX_CMTRT_1 M11_ADMIT_ABX_CMTRT_2
		M11_ADMIT_ABX_CMTRT_3 M11_ADMIT_ABX_CMTRT_4 M11_ADMIT_ABX_CMTRT_5 M11_ADMIT_ABX_CMTRT_6 M11_ADMIT_ABX_CMTRT_7
		M11_ADMIT_ABX_CMTRT_88 M11_ADMIT_ABX_CMTRT_99 M11_ADMIT_ABX_SPFY_CMINDC M11_ADMIT_ABX_SPFY_CMTRT
		M11_ADMIT_MEDS_OTHR_CMOCCUR M11_ADMIT_MEDS_OTHR_CMTRT M11_ageusia_CEOCCUR M11_ageusia_CESTDAT M11_AMNIOTIC_CLEAR_FAORRES
		M11_AMNIOTIC_ODOR_FAORRES M11_AMNIOTIC_SPFY_FAORRES_1 M11_AMNIOTIC_SPFY_FAORRES_2 M11_AMNIOTIC_SPFY_FAORRES_3
		M11_ANC_TOT_VISTS M11_ANEMIA_MHOCCUR M11_ANEMIA_SRCE_1 M11_ANEMIA_SRCE_2 M11_ANEMIA_SRCE_3 M11_anorexia_CEOCCUR
		M11_anorexia_CESTDAT M11_anosmia_CEOCCUR M11_anosmia_CESTDAT M11_ANTI_PHOS_MHOCCUR M11_ANTI_PHOS_SRCE_1 M11_ANTI_PHOS_SRCE_2
		M11_ANTI_PHOS_SRCE_3 M11_APH_CEOCCUR M11_APH_FAORRES_1 M11_APH_FAORRES_2 M11_APH_FAORRES_88 M11_APH_FAORRES_99
		M11_APH_SPFY_FAORRES M11_CHEST_IMAGE_PROCCUR_1 M11_CHEST_IMAGE_PROCCUR_2 M11_CHEST_IMAGE_PROCCUR_3 M11_CHEST_IMAGE_PROCCUR_77
		M11_CHEST_IMAGE_PROCCUR_99 M11_CHEST_IMAGE_PRSTDAT M11_confusion_CEOCCUR M11_confusion_CESTDAT M11_Cough_CEOCCUR
		M11_Cough_CESTDAT M11_COVID_CONTACT_DAT M11_COVID_CONTACT_YN M11_COVID_LBDAT M11_COVID_LBORRES M11_COVID_LBPERF M11_COVID_SRCE_1
		M11_COVID_SRCE_2 M11_COVID_SRCE_3 M11_COYN M11_DEST_DISCHARGE_OHOLOC M11_DEST_DISCHARGE_SPFY_OHOLOC M11_Diarrhoea_CEOCCUR
		M11_Diarrhoea_CESTDAT M11_fatigue_CEOCCUR M11_fatigue_CESTDAT M11_FETAL_DISTRESS_CEOCCUR M11_FETAL_DISTRESS_FAORRES_1 M11_FETAL_DISTRESS_FAORRES_2 
		M11_FETAL_DISTRESS_FAORRES_3 M11_FETAL_DISTRESS_FAORRES_4 M11_FETAL_DISTRESS_FAORRES_88 M11_FETAL_DISTRESS_FAORRES_99
		M11_FETAL_DISTRESS_SPFY_FAORRES M11_FEVER_CEOCCUR M11_FEVER_CESTDAT M11_GEST_DIAB_MHOCCUR M11_GEST_DIAB_SRCE_1 
		M11_GEST_DIAB_SRCE_2 M11_GEST_DIAB_SRCE_3 M11_HB_LBORRES M11_HB_LBPERF M11_Headache_CEOCCUR M11_Headache_CESTDAT M11_HEPB_MHOCCUR 
		M11_HEPB_SRCE_1 M11_HEPB_SRCE_2 M11_HEPB_SRCE_3 M11_HIV_CMOCCUR M11_HIV_CMTRT_1 M11_HIV_CMTRT_10 M11_HIV_CMTRT_11 M11_HIV_CMTRT_12 
		M11_HIV_CMTRT_13 M11_HIV_CMTRT_14 M11_HIV_CMTRT_15 M11_HIV_CMTRT_16 M11_HIV_CMTRT_17 M11_HIV_CMTRT_18 M11_HIV_CMTRT_19 M11_HIV_CMTRT_2
		M11_HIV_CMTRT_20 M11_HIV_CMTRT_21 M11_HIV_CMTRT_22 M11_HIV_CMTRT_23 M11_HIV_CMTRT_24 M11_HIV_CMTRT_25 M11_HIV_CMTRT_3 M11_HIV_CMTRT_4
		M11_HIV_CMTRT_5 M11_HIV_CMTRT_6 M11_HIV_CMTRT_7 M11_HIV_CMTRT_8 M11_HIV_CMTRT_88 M11_HIV_CMTRT_9 M11_HIV_CMTRT_99 M11_HIV_MHOCCUR 
		M11_HIV_MHSTDAT M11_HIV_SPFY_CMTRT M11_HIV_SRCE_1 M11_HIV_SRCE_2 M11_HIV_SRCE_3 M11_INDUCED_PRINDC M11_INDUCED_PROCCUR 
		M11_INDUCED_PRTRT_1 M11_INDUCED_PRTRT_2 M11_INDUCED_PRTRT_3 M11_INDUCED_PRTRT_4 M11_INDUCED_PRTRT_88 M11_INDUCED_PRTRT_99 
		M11_INDUCED_SPFY_PRINDC M11_INDUCED_SPFY_PRTRT M11_INF_1_ATT_FAORRES M11_INF_1_ATT_SPFY_FAORRES M11_INF_1_CES_FAORRES 
		M11_INF_1_CES_INCISION_FAORRES M11_INF_1_CES_PRINDC_1 M11_INF_1_CES_PRINDC_10 M11_INF_1_CES_PRINDC_11 
		M11_INF_1_CES_PRINDC_12 M11_INF_1_CES_PRINDC_13 M11_INF_1_CES_PRINDC_14 M11_INF_1_CES_PRINDC_15 
		M11_INF_1_CES_PRINDC_16 M11_INF_1_CES_PRINDC_2 M11_INF_1_CES_PRINDC_3 M11_INF_1_CES_PRINDC_4 M11_INF_1_CES_PRINDC_5 
		M11_INF_1_CES_PRINDC_6 M11_INF_1_CES_PRINDC_7 M11_INF_1_CES_PRINDC_8 M11_INF_1_CES_PRINDC_88 M11_INF_1_CES_PRINDC_9 
		M11_INF_1_CES_PRINDC_99 M11_INF_1_CES_SPFY_PRINDC M11_INF_1_DELIVERY_PRROUTE M11_INF_1_DSSTDAT M11_INF_1_DSSTTIM 
		M11_INF_1_DSTERM M11_INF_1_EPIS_PROCCUR M11_INF_1_PRESENT_FAORRES M11_INF_1_PRESENT_SPFY_FAORRES M11_INF_1_VAG_PRROUTE 
		M11_INF_1_VAG_SPFY_PRROUTE M11_INF_2_ATT_FAORRES M11_INF_2_ATT_SPFY_FAORRES M11_INF_2_CES_FAORRES 
		M11_INF_2_CES_INCISION_FAORRES M11_INF_2_CES_PRINDC_1 M11_INF_2_CES_PRINDC_10 M11_INF_2_CES_PRINDC_11
		M11_INF_2_CES_PRINDC_12 M11_INF_2_CES_PRINDC_13 M11_INF_2_CES_PRINDC_14 M11_INF_2_CES_PRINDC_15 M11_INF_2_CES_PRINDC_16
		M11_INF_2_CES_PRINDC_2 M11_INF_2_CES_PRINDC_3 M11_INF_2_CES_PRINDC_4 M11_INF_2_CES_PRINDC_5 M11_INF_2_CES_PRINDC_6 
		M11_INF_2_CES_PRINDC_7 M11_INF_2_CES_PRINDC_8 M11_INF_2_CES_PRINDC_88 M11_INF_2_CES_PRINDC_9 M11_INF_2_CES_PRINDC_99 
		M11_INF_2_CES_SPFY_PRINDC M11_INF_2_DELIVERY_PRROUTE M11_INF_2_DSSTDAT M11_INF_2_DSSTTIM M11_INF_2_DSTERM 
		M11_INF_2_EPIS_PROCCUR M11_INF_2_PRESENT_FAORRES M11_INF_2_PRESENT_SPFY_FAORRES M11_INF_2_VAG_PRROUTE 
		M11_INF_2_VAG_SPFY_PRROUTE M11_INFANTS_FAORRES M11_INFECT_CEOCCUR_1 M11_INFECT_CEOCCUR_2 M11_INFECT_CEOCCUR_3 
		M11_INFECT_CEOCCUR_4 M11_INFECT_CEOCCUR_5 M11_INFECT_CEOCCUR_77 M11_INFECT_CEOCCUR_88 M11_INFECT_CEOCCUR_99 
		M11_INFECT_CESTDAT M11_INFECT_OTH_MHOCCUR_1 M11_INFECT_OTH_MHOCCUR_2 M11_INFECT_OTH_MHOCCUR_3 M11_INFECT_OTH_MHOCCUR_4
		M11_INFECT_OTH_MHOCCUR_5 M11_INFECT_OTH_MHOCCUR_77 M11_INFECT_OTH_MHOCCUR_88 M11_INFECT_OTH_MHOCCUR_99 
		M11_INFECT_OTH_MHTERM M11_INFECT_OTH_SRCE_1 M11_INFECT_OTH_SRCE_2 M11_INFECT_OTH_SRCE_3 M11_INFECT_SPFY_CETERM 
		M11_LABOR_MHSTDAT M11_LABOR_MHSTTIM M11_LD_ABX_CMOCCUR M11_LD_ABX_CMTRT_1 M11_LD_ABX_CMTRT_2 M11_LD_ABX_CMTRT_3 M11_LD_ABX_CMTRT_4 
		M11_LD_ABX_CMTRT_5 M11_LD_ABX_CMTRT_6 M11_LD_ABX_CMTRT_7 M11_LD_ABX_CMTRT_88 M11_LD_ABX_SPFY_CMSTDAT1 M11_LD_ABX_SPFY_CMSTDAT2
		M11_LD_ABX_SPFY_CMSTDAT3 M11_LD_ABX_SPFY_CMSTDAT4 M11_LD_ABX_SPFY_CMSTDAT5 M11_LD_ABX_SPFY_CMSTDAT6 
		M11_LD_ABX_SPFY_CMSTDAT7 M11_LD_ABX_SPFY_CMSTDAT8 M11_LD_ABX_SPFY_CMTRT M11_LD_MEDS_OTHR_CMOCCUR M11_LD_MEDS_OTHR_CMTRT 
		M11_LOW_TEMP_VSORRES M11_LOW_TEMP_VSSTAT M11_MALARIA_FAMETHOD M11_MALARIA_MHOCCUR M11_MALARIA_SRCE_1 M11_MALARIA_SRCE_2 
		M11_MALARIA_SRCE_3 M11_MAT_DSTERM M11_MAT_LD_FAC_SPFY_OHOLOC M11_MAT_LD_OHOLOC M11_MAT_LD_OHOSTDAT M11_MAT_LD_OHOSTTIM 
		M11_MAX_TEMP_PEMETH M11_MAX_TEMP_VSORRES M11_MAX_TEMP_VSSTAT M11_MEMBRANE_RUPT_MHSTDAT M11_MEMBRANE_RUPT_MHSTTIM 
		M11_MEMBRANE_RUPT_SPONT_FAORRES M11_MULTI_BIRTH_FAORRES M11_myalgia_CEOCCUR M11_myalgia_CESTDAT M11_Nauseavomit_CEOCCUR
		M11_Nauseavomit_CESTDAT M11_OBSTRUCTED_LABOR_CEOCCUR M11_ORG_FAIL_MHOCCUR_1 M11_ORG_FAIL_MHOCCUR_2 M11_ORG_FAIL_MHOCCUR_3
		M11_ORG_FAIL_MHOCCUR_4 M11_ORG_FAIL_MHOCCUR_77 M11_ORG_FAIL_MHOCCUR_88 M11_ORG_FAIL_MHOCCUR_99 M11_ORG_FAIL_MHTERM 
		M11_ORG_FAIL_SRCE_1 M11_ORG_FAIL_SRCE_2 M11_ORG_FAIL_SRCE_3 M11_OTH_ISSUE_MHOCCUR M11_OTH_ISSUE_MHTERM M11_PI_HTN_MHOCCUR_1
		M11_PI_HTN_MHOCCUR_2 M11_PI_HTN_MHOCCUR_3 M11_PI_HTN_MHOCCUR_4 M11_PI_HTN_MHOCCUR_5 M11_PI_HTN_MHOCCUR_77 M11_PI_HTN_MHOCCUR_99
		M11_PI_HTN_POST_CMOCCUR_1 M11_PI_HTN_POST_CMOCCUR_2 M11_PI_HTN_POST_CMOCCUR_3 M11_PI_HTN_POST_CMOCCUR_4 
		M11_PI_HTN_POST_CMOCCUR_5 M11_PI_HTN_POST_CMOCCUR_77 M11_PI_HTN_POST_CMOCCUR_88 M11_PI_HTN_POST_CMOCCUR_99
		M11_PI_HTN_POST_MHOCCUR M11_PI_HTN_POST_SPFY_CMOCCUR M11_PI_HTN_PROCCUR_1 M11_PI_HTN_PROCCUR_2 M11_PI_HTN_PROCCUR_3
		M11_PI_HTN_PROCCUR_4 M11_PI_HTN_PROCCUR_5 M11_PI_HTN_PROCCUR_6 M11_PI_HTN_PROCCUR_7 M11_PI_HTN_PROCCUR_77 M11_PI_HTN_PROCCUR_88
		M11_PI_HTN_PROCCUR_99 M11_PI_HTN_PRTRT M11_PI_HTN_SRCE_1 M11_PI_HTN_SRCE_2 M11_PI_HTN_SRCE_3 M11_POST_DEL_CHORIO_CEOCCUR_1 
		M11_POST_DEL_CHORIO_CEOCCUR_2 M11_POST_DEL_CHORIO_CEOCCUR_3 M11_POST_DEL_CHORIO_CEOCCUR_4 
		M11_POST_DEL_CHORIO_CEOCCUR_77 M11_POST_DEL_CHORIO_CEOCCUR_99 M11_POST_DEL_ENDOMET_CEOCCUR_1 
		M11_POST_DEL_ENDOMET_CEOCCUR_2 M11_POST_DEL_ENDOMET_CEOCCUR_3 M11_POST_DEL_ENDOMET_CEOCCUR_4 
		M11_POST_DEL_ENDOMET_CEOCCUR_77 M11_POST_DEL_ENDOMET_CEOCCUR_99 M11_POST_DEL_INF_CEOCCUR_1 M11_POST_DEL_INF_CEOCCUR_2
		M11_POST_DEL_INF_CEOCCUR_3 M11_POST_DEL_INF_CEOCCUR_4 M11_POST_DEL_INF_CEOCCUR_5 M11_POST_DEL_INF_CEOCCUR_6 
		M11_POST_DEL_INF_CEOCCUR_7 M11_POST_DEL_INF_CEOCCUR_77 M11_POST_DEL_INF_CEOCCUR_8 M11_POST_DEL_INF_CEOCCUR_88 
		M11_POST_DEL_INF_CEOCCUR_9 M11_POST_DEL_INF_CEOCCUR_99 M11_POST_DEL_INF_CETERM M11_POST_DEL_SS_CEOCCUR_1 
		M11_POST_DEL_SS_CEOCCUR_10 M11_POST_DEL_SS_CEOCCUR_11 M11_POST_DEL_SS_CEOCCUR_12 M11_POST_DEL_SS_CEOCCUR_2
		M11_POST_DEL_SS_CEOCCUR_3 M11_POST_DEL_SS_CEOCCUR_4 M11_POST_DEL_SS_CEOCCUR_5 M11_POST_DEL_SS_CEOCCUR_6 
		M11_POST_DEL_SS_CEOCCUR_7 M11_POST_DEL_SS_CEOCCUR_77 M11_POST_DEL_SS_CEOCCUR_8 M11_POST_DEL_SS_CEOCCUR_88
		M11_POST_DEL_SS_CEOCCUR_9 M11_POST_DEL_SS_CEOCCUR_99 M11_POST_DEL_SS_CETERM M11_PPH_CEOCCUR M11_PPH_CMOCCUR_1
		M11_PPH_CMOCCUR_2 M11_PPH_CMOCCUR_3 M11_PPH_CMOCCUR_4 M11_PPH_CMOCCUR_5 M11_PPH_CMOCCUR_6 M11_PPH_CMOCCUR_77 M11_PPH_CMOCCUR_88 
		M11_PPH_CMOCCUR_99 M11_PPH_CMTRT M11_PPH_ESTIMATE_FAORRES M11_PPH_ESTIMATE_FASTAT M11_PPH_FAORRES_1 M11_PPH_FAORRES_2 
		M11_PPH_FAORRES_3 M11_PPH_FAORRES_4 M11_PPH_FAORRES_88 M11_PPH_FAORRES_99 M11_PPH_SPFY_FAORRES M11_PPH_TRNSFSN_PROCCUR
		M11_PTB_MHOCCUR M11_PTB_MHSTDAT M11_PTB_OTH_CMTRT M11_PTB_SRCE_1 M11_PTB_SRCE_2 M11_PTB_SRCE_3 M11_PTB_STEROID_CMDOSFRQ 
		M11_PTB_STEROID_CMOCCUR_1 M11_PTB_STEROID_CMOCCUR_2 M11_PTB_STEROID_CMOCCUR_77 M11_PTB_STEROID_CMOCCUR_88 
		M11_PTB_STEROID_CMOCCUR_99 M11_PTB_STEROID_SPFY_CMTRT M11_PTB_TOCO_CMOCCUR_1 M11_PTB_TOCO_CMOCCUR_2 M11_PTB_TOCO_CMOCCUR_3
		M11_PTB_TOCO_CMOCCUR_77 M11_PTB_TOCO_CMOCCUR_88 M11_PTB_TOCO_CMOCCUR_99 M11_runnynose_CEOCCUR 
		M11_runnynose_cestdat_CESTDAT M11_RUPT_UTERUS_CEOCCUR M11_SARI_CEOCCUR M11_SARI_CESTDAT M11_Shortbreath_CEOCCUR
		M11_Shortbreath_CESTDAT SITEN M11_sorethroat_CEOCCUR M11_sorethroat_cestdat_CESTDAT 
		M11_STI_MHOCCUR_1 M11_STI_MHOCCUR_2 M11_STI_MHOCCUR_3 M11_STI_MHOCCUR_4 M11_STI_MHOCCUR_5 M11_STI_MHOCCUR_77 M11_STI_MHOCCUR_88
		M11_STI_MHOCCUR_99 M11_STI_SPFY_MHTERM M11_STI_SRCE_1 M11_STI_SRCE_2 M11_STI_SRCE_3 M11_SYPH_CMTRT M11_SYPH_MHOCCUR 
		M11_SYPH_SRCE_1 M11_SYPH_SRCE_2 M11_SYPH_SRCE_3 M11_TB_MHOCCUR M11_TB_SRCE_1 M11_TB_SRCE_2 M11_TB_SRCE_3 M11_TRANSFER_OHOENDAT 
		M11_TRANSFER_OHOLOC  ;
*char2num macro flag vars;
*tables  f_ageusia_CESTDAT f_anosmia_CESTDAT f_COVID_LBDAT f_fatigue_CESTDAT
		f_Headache_CESTDAT f_LABOR_MHSTDAT f_myalgia_CESTDAT f_TRANSFER_OHOENDAT;
*known ids;
*tables	id subjid startUnixtime complete;
*Need to determine how to define these;
*tables 	POST_DEL_CHORIO_CEOCCUR_5 visits;
/* *Dropped tangerine unnecessary variables;
tables	
ROW_VERSION formId  formtitle  _id buildId buildChannel deviceId groupId form_box1 text1 time_1  
time_2 time_3 time_4 form_intro form_box time_5 Fac_Spec_facility
Fac_Spec_facility_descendantsCou Fac_Spec_facility_id Fac_Spec_facility_label Fac_Spec_facility_level
Fac_Spec_facility_parent Fac_Spec_location Fac_Spec_location_descendantsCou Fac_Spec_location_id
Fac_Spec_location_label Fac_Spec_location_level Fac_Spec_location_parent Fac_Spec_region
Fac_Spec_region_descendantsCount Fac_Spec_region_id Fac_Spec_region_label Fac_Spec_region_level
Fac_Spec_region_parent;*/
/* *Dropped Kenya specific variables;
tables
Abx Abx_spec_1 Abx_spec_2 Abx_spec_3 Abx_spec_4 Abx_spec_5 Abx_spec_6 Abx_spec_7 Abx_spec_8
Abx_spec_date1 Abx_spec_date2 Abx_spec_date3 Abx_spec_date4 Abx_spec_date5 Abx_spec_date6
Abx_spec_date7 Abx_spec_date8 Abx_spec_dose1 Abx_spec_dose2 Abx_spec_dose3 Abx_spec_dose4
Abx_spec_dose5 Abx_spec_dose6 Abx_spec_dose7 Abx_spec_dose8 Abx_spec_other ancovConsentVersion
APH_com_1 APH_com_2 APH_com_3 APH_com_99 APH_com_spec APH_diagnose Chorio Chorio_sign_1
Chorio_sign_2 Chorio_sign_3 Chorio_sign_4 Chorio_sign_5 Com_PIH Com_PTB del_DoA del_ToA
DISCHARGE_OHOOCCUR Endo Endo_sign_1 Endo_sign_2 Endo_sign_3 Endo_sign_4  Fet_distress Fet_distress_spec_1 Fet_distress_spec_2 Fet_distress_spec_3
Fet_distress_spec_4 Fet_distress_spec_5 Fet_distress_spec_99 HBV_diag HIV_diag Hx_aburine Hx_anemia
Hx_infection_1 Hx_infection_10 Hx_infection_11 Hx_infection_2 Hx_infection_3 Hx_infection_4 
Hx_infection_5 Hx_infection_6 Hx_infection_7 Hx_infection_77 Hx_infection_8 Hx_infection_9 
Hx_issue_other Hx_med Infection_1 Infection_10 Infection_2 Infection_3 Infection_4 Infection_5 
Infection_6 Infection_7 Infection_77 Infection_8 Infection_9 Infection_spec Int_date Int_Loc 
Loc_home_accuracy Loc_home_latitude Loc_home_longitude Loc_other Malaria_diag Med_other 
Med_other_spec PIH_med_1 PIH_med_2 PIH_med_3 PIH_med_4 PIH_med_5 PIH_med_6 PIH_med_99 PIH_med_spec 
PPH_com_1 PPH_com_2 PPH_com_3 PPH_com_4 PPH_com_5 PPH_com_99 PPH_com_spec PPH_diagnose PPH_EBL 
PPH_Med_1 PPH_Med_2 PPH_Med_3 PPH_Med_4 PPH_Med_5 PPH_Med_6 PPH_Med_7 PPH_Med_99 PPH_med_spec 
PPH_transfusion preg_LHb prismaContentVersion PTB_steroid PTB_steroid_dose PTB_steroid_spec 
PTB_Toc PTB_Toc_spec q1 q10 q11 q12 q13 q14 q15 q16_1 q16_2 q16_3 q17 q18 q19 q2 q20 q21 q22 q23 
q24 q3 q34 q35 q36_1 q36_10 q36_11 q36_12 q36_13 q36_14 q36_2 q36_3 q36_4 q36_5 q36_6 q36_7 q36_77 
q36_8 q36_9 q4 q5 q6 q7 q8 q9 TB_diag Temp Temp_high Temp_low; */
/* *Variables dropped that might be added back in;
Tables
MAT_LD_FAC_OHOLOC_region MAT_LD_FAC_OHOLOC_region_parent MAT_LD_FAC_OHOLOC_region_label MAT_LD_FAC_OHOLOC_region_id
MAT_LD_FAC_OHOLOC_region_level MAT_LD_FAC_OHOLOC_region_descend MAT_LD_FAC_OHOLOC_location
MAT_LD_FAC_OHOLOC_location_paren MAT_LD_FAC_OHOLOC_location_label MAT_LD_FAC_OHOLOC_location_id
MAT_LD_FAC_OHOLOC_location_level MAT_LD_FAC_OHOLOC_location_desce MAT_LD_FAC_OHOLOC_facility
MAT_LD_FAC_OHOLOC_facility_paren MAT_LD_FAC_OHOLOC_facility_label MAT_LD_FAC_OHOLOC_facility_id
MAT_LD_FAC_OHOLOC_facility_level MAT_LD_FAC_OHOLOC_facility_desce
LD_ABX_CMTRT_dose1 LD_ABX_CMTRT_dose2 LD_ABX_CMTRT_dose3
LD_ABX_CMTRT_dose4 LD_ABX_CMTRT_dose5 LD_ABX_CMTRT_dose6
LD_ABX_CMTRT_dose7 LD_ABX_CMTRT_dose8;*/
run;
proc contents data=mnh11;run;
*Output MN11 datasets;
proc sort data=mnh11 out=mnh.mnh11; by caseid participantid; run;


**MNH12: Neonatal Birth Outcome**;

*Import csv files from Synapes for each site - currently only data from Kenya, may be more than one table per form*;
%impmerge(sitename=kenya, form=mnh12, tabname=mnh_neonatal_birth_outcome_intra, tabnum=2, othertab1=, othertab2=, format=);
%impmerge(sitename=ghana, form=mnh12, tabname=mnh_neonatal_birth_outcome_intra, tabnum=2, othertab1=mnh_neonatal_birth_outcome_intra, othertab2=, format=);

*Set datasets from each site and create site indicator;
data mnh12_char;
length
		DEL_TIE_FAORRES  $28
		DEL_CUT_SPFY_FAORRES $23
		INF_SX_OTHR_CETERM $13
		ABX_SPFY_CMTRT $50
		FAC_24HR_OHOLOC $31
		DTHTIM $12;
set mnh12_kenya (in=inken) mnh12_ghana (in=ingha);
if caseid="**********" then delete;
*Site number for reports*;
if inken then siten=3;
else if ingha then siten=2;

*Rename variables > 32 characters;
rename	VISIT_FAC_OBSLOC_region_descenda = VISIT_FAC_OBSLOC_region_dcnt
		VISIT_FAC_OBSLOC_location_descen  = VISIT_FAC_OBSLOC_loc_dcnt
		VISIT_FAC_OBSLOC_facility_descen  = VISIT_FAC_OBSLOC_fac_dcnt
		INF_FAC_OHOLOC_region_descendant  = INF_FAC_OHOLOC_region_dcnt
		INF_FAC_OHOLOC_location_descenda  = INF_FAC_OHOLOC_location_dcnt
		INF_FAC_OHOLOC_facility_descenda = INF_FAC_OHOLOC_facility_dcnt
		VISIT_OBSLOC_Region_descendantsC = VISIT_OBSLOC_Region_dcnt
		VISIT_OBSLOC_District_descendant  = VISIT_OBSLOC_District_dcnt
		VISIT_OBSLOC_Type_descendantsCou  = VISIT_OBSLOC_Type_dcnt
		INF_OHOLOC_Region_descendantsCou  = INF_OHOLOC_Region_dcnt
		INF_OHOLOC_District_descendantsC = INF_OHOLOC_District_dcnt
		INF_OHOLOC_Type_descendantsCount = INF_OHOLOC_Type_dcnt
		INF_OHOLOC_Village_or_Facility_d  = INF_OHOLOC_Vil_or_Fac_dcnt
		VISIT_FAC_OBSLOC_region_parent=VISIT_FAC_OBSLOC_reg_parent
		VISIT_FAC_OBSLOC_region_label=VISIT_FAC_OBSLOC_reg_label
		VISIT_FAC_OBSLOC_region_level=VISIT_FAC_OBSLOC_reg_level
		VISIT_FAC_OBSLOC_location_parent=VISIT_FAC_OBSLOC_loc_parent
		VISIT_FAC_OBSLOC_location_label=VISIT_FAC_OBSLOC_loc_label
		VISIT_FAC_OBSLOC_location_level=VISIT_FAC_OBSLOC_loc_level
		VISIT_FAC_OBSLOC_facility_parent=VISIT_FAC_OBSLOC_fac_parent
		VISIT_FAC_OBSLOC_facility_label=VISIT_FAC_OBSLOC_fac_label
		VISIT_FAC_OBSLOC_facility_level=VISIT_FAC_OBSLOC_fac_level
		INF_FAC_OHOLOC_location_parent=INF_FAC_OHOLOC_loc_parent
		INF_FAC_OHOLOC_location_label=INF_FAC_OHOLOC_loc_label
		INF_FAC_OHOLOC_location_level=INF_FAC_OHOLOC_loc_level
		INF_FAC_OHOLOC_facility_parent=INF_FAC_OHOLOC_fac_parent
		INF_FAC_OHOLOC_facility_label=INF_FAC_OHOLOC_fac_label
		INF_FAC_OHOLOC_facility_level=INF_FAC_OHOLOC_fac_level
		VISIT_OBSLOC_Type_locationType=VISIT_OBSLOC_Type_locType
		VISIT_OBSLOC_Village_or_Facility=VISIT_OBSLOC_Village_or_Fac
		INF_OHOLOC_Village_or_Facility=INF_OHOLOC_Village_or_Fac
		INF_OHOLOC_Village_or_Facility_p=INF_OHOLOC_Village_or_Fac_p
		INF_OHOLOC_Village_or_Facility_l=INF_OHOLOC_Village_or_Fac_l
		INF_OHOLOC_Village_or_Facility_i=INF_OHOLOC_Village_or_Fac_i;
run;

*Convert to numeric (continuous, check one and date variables - Dates contain text NA, Check one contain NA and SKIPPED)*;
%char2num(inputdsn=mnh12_char, outputdsn=mnh12_num, excludevars=LENGTH_FAORRES DTHTIM);
proc contents data=mnh12_num order=varnum; run;
proc freq data=mnh12_num; tables _char_; run;

/*
*Set datasets from each site and create site indicator;
data mnh12;
set mnh12_num (in=inken);
label  SUBJID="SUBJID"
		VISIT_OBSSTDAT="Interview Date"
		VISIT_OBSLOC="Interview Location"
		VISIT_FAC_OBSLOC="Specify name of facility"
		VISIT_GPS_OBSLOC="Record GPS coordinates"
		VISIT_FAC_SPFY_OBSLOC="Specify location"
		INF_DSTERM="Birth Outcome"
		INF_OHOLOC="Where did the birth take place?"
		INF_FAC_OHOLOC="Specify name of facility"
		INF_FAC_SPFY_OHOLOC="Specify location"
		SEX="Sex of infant"
		INF_PROCCUR="Did infant require any of the following types of breathing assistance after delivery?"
		APGAR_1MIN_PROCCUR="Is 1-minute Apgar score available? "
		APGAR_1MIN_FAORRES="Record 1-minute Apgar score"
		APGAR_5M_PROCCUR="Is 5-minute Apgar score available? "
		APGAR_5M_FAORRES="Record 5-minute Apgar score"
		BW_FAPERF="Was infant's weight measured at birth?"
		BW_FAORRES="Record birthweight"
		BW_EST_FAORRES="Estimate birthweight"
		LENGTH_FAPERF="Was infant's length measured at birth?"
		LENGTH_FAORRES="Record length at birth"
		HC_FAPERF="Was infant's head circumference measured at birth?"
		HC_FAORRES="Record head circumference"
		CON_MALFORM_MHOCCUR="Did infant have any congenital anomaly/malformation?"
		CON_MALFORM_MHTERM="Specify anomaly/malformation"
		CON_MALFORM_SPFY_MHTERM="Specify other anomaly/malformation"
		DEL_COMP_MHOCCUR="Did the infant experience any of the following complications during delivery?"
		DEL_COMP_SPFY_MHOCCUR="Specify other delivery complication"
		DEL_CLAMP_FAORRES="How long after birth was cord clamping?"
		DEL_TIE_FAORRES="What was used to tie the cord?"
		DEL_CUT_FAORRES="What was used to cut the cord?"
		DEL_CUT_SPFY_FAORRES="Specify other material used to cut the cord"
		DEL_CLEAN_PROCCUR="Was chlorohexidine used to clean the cord?"
		CORD_PROD_PROCCUR="Were any other medicinal or local products applied to the cord?"
		CORD_PROD_SPFY_PRTRT="Specify product(s) applied to the cord"
		DEL_DRY_PROCCUR="Was infant dried within 30 seconds of birth?"
		DEL_BATHE_FAORRES="How long after birth was infant bathed?"
		BABY_ROOM_FAORRES="While you were in the facility, did your baby staty in your room with you day and night, without separation lasting more than one hour?"
		BF_PROCCUR="Did infant breastfeed after delivery?"
		BF_DELAY_FAORRES="How long after delivery was the infant breastfed?"
		FEED_ASSIST_PROCCUR="Did the infant require any of the following types of feeding assistance?"
		FEED_ASSIST_SPFY_PRTRT="Specify other type of feeding assistance provided"
		FOODLIQ_PROCCUR="Did the infant receive any other food or liquids?"
		FOODLIQ_PRTRT="What other food or liquid did the infant receive?"
		FOODLIQ_SPFY_PRTRT="Specify other  food or liquid received"
		FEVER_CEOCCUR="Fever (>= 38.0C) or feeling hot to the touch"
		FEVER_VSPERF="Was at least one temperature >= 38.0C recorded?"
		MAX_TEMP_VSORRES="Provide highest temperature >= 38.0C"
		HYPO_CEOCCUR="Hypothermia (< 35.5 C) or feeling cold to the touch"
		HYPO_VSPERF="Was at least one temperature <35.5 C recorded?"
		HYPO_VSORRES="Provide lowest temperature < 35.5 C"
		BREATH_CEOCCUR="Fast breathing/difficulty breathing"
		RR_VSTEST="Was respiratory rate documented?"
		RR_VSORRES="Record respiratory rate"
		CHEST_CEOCCUR="Severe chest in-drawing "
		APNEA_CEOCCUR="Apnea (pauses and interuptions in breathing) or bradypnea"
		GRUNT_CEOCCUR="Grunting/nasal flaring or retractions"
		JAUND_CEOCCUR="Severe jaundice"
		CONV_CEOCCUR="Convulsions"
		NO_MOV_CEOCCUR="No movement at all or only with stimulation"
		POOR_FEED_CEOCCUR="Feeding poorly or not feeding at all "
		SEV_VOMIT_CEOCCUR="Severe vomiting/vomiting everything"
		UMB_RED_CEOCCUR="Umbilical redness and swelling to the abdomen/skin"
		UMB_PUS_CEOCCUR="Umbilicus draining pus"
		PUST_BULL_CEOCCUR="More than 10 skin pustules or bullae"
		SWOLL_EYE_CEOCCUR="Eyes swollen and draining pus"
		BULG_FONT_CEOCCUR="Bulging fontanelle"
		ACT_CRY_CEOCCUR="Irritablity or unexplained/sudden crying for more than 3 hours"
		INF_SX_OTHR_CEOCCUR="Did infant have any other signs of infection?"
		INF_SX_OTHR_CETERM="Specify other signs of infection"
		BAC_INF_MHOCCUR="Proven or possible serious bacterial infecion?"
		PNE_INF_MHOCCUR="Pneumonia or lung infection?"
		MENING_MHOCCUR="Meningitis?"
		OMPH_MHOCCUR="Omphalitis?"
		UTI_MHOCCUR="Urinary tract infection?"
		KIDNEY_INF_MHOCCUR="Pyelonephritis or kidney infection?"
		SKIN_INF_MHOCCUR="Skin infection?"
		EYE_INF_MHOCCUR="Eye infection?"
		COVID_MHOCCUR="COVID-19 infection?"
		SEPSIS_MHOCCUR="Neonatal sepsis?"
		KMC_PROCCUR="Did infant receive kangaroo mother care (continuous skin-skin contact with mother or caregiver for 1-2 hours per day)?"
		KMC_FAORRES="When did skin-to-skin begin?"
		TX_DEL_DISCH_PROCCUR="Did the infant receive any of the following treatments or interventions from time of delivery until discharge?"
		TX_DEL_24HR_PROCCUR="Did the infant receive any of the following treatments or interventions within 24 hours of birth?"
		PHOTO_PROCCUR="Phototherapy"
		INCUBATOR_PROCCUR="Incubator for thermoregulation"
		EYE_CARE_PROCCUR="Medicinal eye care"
		VIT_K_PROCCUR="Vitamin K"
		BLD_PROD_PROCCUR="Blood product/transfusion"
		ABX_CMOCCUR="Antibiotics"
		ABX_CMTRT="Specify type of antibiotic"
		ABX_SPFY_CMTRT="Specify antibiotic"
		ABX_CMINDC="Specify indication for antibiotic"
		ABX_SPFY_CMINDC="Specify other indication for antibiotic use"
		HTN_CMOCCUR="Medication(s) to augment blood pressure or support the heart"
		HTN_CMTRT="Specify medication"
		ANTI_CONV_CMOCCUR="Anti-epilectic medication(s) "
		ANTI_CONV_CMTRT="Specify medication"
		SURG_PROCCUR="Surgical procedure"
		SURG_PRINDC="Specify indication for surgical procedure"
		SURG_PRTRT="Specify surgical procedure"
		TX_OTHR_DEL_DISCH_PROCCUR="Did the infant receive any other treatments, medications, or interventions from time of delivery until discharge?"
		TX_OTHR_DEL_24HR_PROCCUR="Did the infant receive any other treatments, medications, or interventions within 24 hours of birth?"
		TX_OTHR_PRTRT="Specify other treatment, medication, or intervention"
		LACTATE_LBPERF="Is lactacte result available?"
		LACTATE_LBORRES="Lactate result"
		BILIRUBIN_LBPERF="Is bilirubin result available?"
		BILIRUBIN_LBTEST="Specify type of bilirubin result available"
		BILIRUBIN_LBORRESU="Indicate bilirubin measurement unit type"
		TBILIRUBIN_UMOLL_LBORRES="Total bilirubin result"
		TBILIRUBIN_MGDL_LBORRES="Total bilirubin result"
		DBILIRUBIN_UMOLLLBORRES="Direct (conjugated) bilirubin result"
		DBILIRUBIN_MGDL_LBORRES="Direct (conjugated) bilirubin result"
		IBILIRUBIN_UMOLL_LBORRES="Indirect (unconjugated) bilirubin result"
		IBILIRUBIN_MGDL_LBORRES="Indirect (unconjugated) bilirubin result"
		BGLUC_LBPERF="Is blood glucose result available?"
		BGLUC_LBORRESU="Indicate blood glucose unit type"
		BGLUC_MMOLL_LBORRES="Blood glucose result"
		BGLUC_MGDL_LBORRES="Blood glucose result"
		STATUS_VISIT_DSTERM="Neonatal status at the time of form completion?"
		ADMIT_VISIT_OHOLOC="Where was infant transferred for higher-level care?"
		ADMIT_VISIT_OHOENDAT="Date of discharge or transfer from delivery unit/facility"
		DISCHG_PLAN_VISIT_OHOLOC="Planned destination after discharge or transfer from delivery facility?"
		REF_FAC_VISIT_OHOLOC="Specify name of referral facility"
		STATUS_24HR_DSTERM="Neonatal status at 24 hours after birth?"
		FAC_24HR_OHOLOC="Specify facility where infant was taken for care"
		DTHDAT="Date of death"
		DTHTIM="Time of death"
		DDORRES="Primary cause of death"
		SPFY_DDORRES="Specify other cause of death"
		COYN="Would you like to record any additional comments about this visit?"
		COVAL="Record comments"
		FORMCOMPLID="Record indentifier of person completing this form, as appropriate for your site (e.g., Name, initials, ID, or code)";
if inken then siten=3;
else if ingha then siten=2;
Format  CON_MALFORM_MHOCCUR LACTATE_LBPERF BILIRUBIN_LBPERF BGLUC_LBPERF COYN yn.
		APGAR_5M_PROCCUR BW_FAPERF LENGTH_FAPERF HC_FAPERF DEL_CLEAN_PROCCUR CORD_PROD_PROCCUR 
		DEL_DRY_PROCCUR BF_PROCCUR FOODLIQ_PROCCUR FEVER_CEOCCUR FEVER_VSPERF HYPO_CEOCCUR HYPO_VSPERF 
		BREATH_CEOCCUR RR_VSTEST CHEST_CEOCCUR APNEA_CEOCCUR GRUNT_CEOCCUR JAUND_CEOCCUR CONV_CEOCCUR 
		NO_MOV_CEOCCUR POOR_FEED_CEOCCUR SEV_VOMIT_CEOCCUR UMB_RED_CEOCCUR UMB_PUS_CEOCCUR PUST_BULL_CEOCCUR 
		SWOLL_EYE_CEOCCUR BULG_FONT_CEOCCUR ACT_CRY_CEOCCUR INF_SX_OTHR_CEOCCUR BAC_INF_MHOCCUR PNE_INF_MHOCCUR 
		MENING_MHOCCUR OMPH_MHOCCUR UTI_MHOCCUR KIDNEY_INF_MHOCCUR SKIN_INF_MHOCCUR EYE_INF_MHOCCUR 
		COVID_MHOCCUR SEPSIS_MHOCCUR KMC_PROCCUR PHOTO_PROCCUR INCUBATOR_PROCCUR EYE_CARE_PROCCUR VIT_K_PROCCUR 
		BLD_PROD_PROCCUR ABX_CMOCCUR HTN_CMOCCUR ANTI_CONV_CMOCCUR SURG_PROCCUR TX_OTHR_DEL_DISCH_PROCCUR 
		TX_OTHR_DEL_24HR_PROCCUR yndk. 
		APGAR_1MIN_PROCCUR BABY_ROOM_FAORRES ynna. ;

drop    ROW_VERSION formId formtitle _id buildId buildChannel deviceId groupId 
		Intro_Fac Intro_Oth Fac_Intro2 Oth_Intro2 postdel_tx2 form_box;
run;*/

**Add prefix of M12_;
%varprefix(dset=mnh12_num, prefix=M12_, keepname="caseid" "participantid" "eventid" "eventformid" "siten")




/*ods EXCEL file="/rtpnfil03/rtpnfil03_vol5/ANCPNC_Collective/Data Monitoring and Analysis/Datasets/Documentation/Contents/mnh12contents.xlsx";
proc contents data=mnh12 order=varnum; run;
ods EXCEL close;*/

/*
Vars in DD but not dataset:
VISIT_FAC_OBSLOC  VISIT_GPS_OBSLOC  INF_FAC_OHOLOC  INF_PROCCUR  CON_MALFORM_MHTERM  DEL_COMP_MHOCCUR  DEL_COMP_SPFY_MHOCCUR  FEED_ASSIST_PROCCUR  FOODLIQ_PRTRT  TX_DEL_24HR_PROCCUR  ABX_CMTRT  BILIRUBIN_LBTEST  DTHDAT  DTHTIM  DDORRES  SPFY_DDORRES  FORMCOMPLID */ 

/*
proc freq data=mnh12;
*vars not in DD but in dataset;
tables
ROW_ID ROW_VERSION ID caseId participantId eventId eventFormId caseEventId startDatetime _id formId formTitle startUnixtime buildId buildChannel deviceId groupId complete final Int_Loc_OHOLOC VISIT_FAC_OBSLOC_region VISIT_FAC_OBSLOC_region_parent VISIT_FAC_OBSLOC_region_label VISIT_FAC_OBSLOC_region_id VISIT_FAC_OBSLOC_region_level VISIT_FAC_OBSLOC_region_descenda VISIT_FAC_OBSLOC_location VISIT_FAC_OBSLOC_location_parent VISIT_FAC_OBSLOC_location_label VISIT_FAC_OBSLOC_location_id VISIT_FAC_OBSLOC_location_level VISIT_FAC_OBSLOC_location_descen VISIT_FAC_OBSLOC_facility VISIT_FAC_OBSLOC_facility_parent VISIT_FAC_OBSLOC_facility_label VISIT_FAC_OBSLOC_facility_id VISIT_FAC_OBSLOC_facility_level VISIT_FAC_OBSLOC_facility_descen VISIT_GPS_OBSLOC_latitude VISIT_GPS_OBSLOC_longitude VISIT_GPS_OBSLOC_accuracy INF_FAC_OHOLOC_region INF_FAC_OHOLOC_region_parent INF_FAC_OHOLOC_region_label INF_FAC_OHOLOC_region_id INF_FAC_OHOLOC_region_level INF_FAC_OHOLOC_region_descendant INF_FAC_OHOLOC_location INF_FAC_OHOLOC_location_parent INF_FAC_OHOLOC_location_label INF_FAC_OHOLOC_location_id INF_FAC_OHOLOC_location_level INF_FAC_OHOLOC_location_descenda INF_FAC_OHOLOC_facility INF_FAC_OHOLOC_facility_parent INF_FAC_OHOLOC_facility_label INF_FAC_OHOLOC_facility_id INF_FAC_OHOLOC_facility_level INF_FAC_OHOLOC_facility_descenda INF_PROCCUR_1 INF_PROCCUR_2 INF_PROCCUR_3 INF_PROCCUR_4 INF_PROCCUR_5 INF_PROCCUR_6 INF_PROCCUR_77 INF_PROCCUR_99 CON_MALFORM_MHTERM_1 CON_MALFORM_MHTERM_2 CON_MALFORM_MHTERM_3 CON_MALFORM_MHTERM_4 CON_MALFORM_MHTERM_5 CON_MALFORM_MHTERM_6 CON_MALFORM_MHTERM_7 CON_MALFORM_MHTERM_8 CON_MALFORM_MHTERM_9 CON_MALFORM_MHTERM_10 CON_MALFORM_MHTERM_11 CON_MALFORM_MHTERM_12 CON_MALFORM_MHTERM_13 CON_MALFORM_MHTERM_88 DEL_COMP_MHOCCUR_1 DEL_COMP_MHOCCUR_2 DEL_COMP_MHOCCUR_3 DEL_COMP_MHOCCUR_4 DEL_COMP_MHOCCUR_5 DEL_COMP_MHOCCUR_6 DEL_COMP_MHOCCUR_77 DEL_COMP_MHOCCUR_88 DEL_COMP_MHOCCUR_99 Del_comp_oth FEED_ASSIST_PROCCUR_1 FEED_ASSIST_PROCCUR_2 FEED_ASSIST_PROCCUR_88 FEED_ASSIST_PROCCUR_77 FOODLIQ_PRTRT_1 FOODLIQ_PRTRT_2 FOODLIQ_PRTRT_3 FOODLIQ_PRTRT_4 FOODLIQ_PRTRT_88 Intro_Fac Intro_Oth Fac_Intro2 Oth_Intro2 postdel_tx2 ABX_CMTRT_1 ABX_CMTRT_2 ABX_CMTRT_3 ABX_CMTRT_4 ABX_CMTRT_5 ABX_CMTRT_6 ABX_CMTRT_7 ABX_CMTRT_88 BILIRUBIN_LBTEST_1 BILIRUBIN_LBTEST_2 BILIRUBIN_LBTEST_3 form_box; 
*vars in DD and dataset;
tables
SUBJID VISIT_OBSSTDAT VISIT_FAC_SPFY_OBSLOC INF_DSTERM INF_OHOLOC INF_FAC_SPFY_OHOLOC SEX APGAR_1MIN_PROCCUR APGAR_1MIN_FAORRES APGAR_5M_PROCCUR APGAR_5M_FAORRES BW_FAPERF BW_FAORRES BW_EST_FAORRES LENGTH_FAPERF LENGTH_FAORRES HC_FAPERF HC_FAORRES CON_MALFORM_MHOCCUR CON_MALFORM_SPFY_MHTERM DEL_CLAMP_FAORRES DEL_TIE_FAORRES DEL_CUT_FAORRES DEL_CUT_SPFY_FAORRES DEL_CLEAN_PROCCUR CORD_PROD_PROCCUR CORD_PROD_SPFY_PRTRT DEL_DRY_PROCCUR DEL_BATHE_FAORRES BF_PROCCUR BF_DELAY_FAORRES FEED_ASSIST_SPFY_PRTRT FOODLIQ_PROCCUR FOODLIQ_SPFY_PRTRT FEVER_CEOCCUR FEVER_VSPERF MAX_TEMP_VSORRES HYPO_CEOCCUR HYPO_VSPERF HYPO_VSORRES BREATH_CEOCCUR RR_VSTEST RR_VSORRES CHEST_CEOCCUR APNEA_CEOCCUR GRUNT_CEOCCUR JAUND_CEOCCUR CONV_CEOCCUR NO_MOV_CEOCCUR POOR_FEED_CEOCCUR SEV_VOMIT_CEOCCUR UMB_RED_CEOCCUR UMB_PUS_CEOCCUR PUST_BULL_CEOCCUR SWOLL_EYE_CEOCCUR BULG_FONT_CEOCCUR ACT_CRY_CEOCCUR INF_SX_OTHR_CEOCCUR INF_SX_OTHR_CETERM BAC_INF_MHOCCUR PNE_INF_MHOCCUR MENING_MHOCCUR OMPH_MHOCCUR UTI_MHOCCUR KIDNEY_INF_MHOCCUR SKIN_INF_MHOCCUR EYE_INF_MHOCCUR COVID_MHOCCUR SEPSIS_MHOCCUR KMC_PROCCUR KMC_FAORRES TX_DEL_DISCH_PROCCUR PHOTO_PROCCUR INCUBATOR_PROCCUR EYE_CARE_PROCCUR VIT_K_PROCCUR BLD_PROD_PROCCUR ABX_CMOCCUR ABX_SPFY_CMTRT ABX_CMINDC ABX_SPFY_CMINDC HTN_CMOCCUR HTN_CMTRT ANTI_CONV_CMOCCUR ANTI_CONV_CMTRT SURG_PROCCUR SURG_PRINDC SURG_PRTRT TX_OTHR_DEL_DISCH_PROCCUR TX_OTHR_DEL_24HR_PROCCUR TX_OTHR_PRTRT LACTATE_LBPERF LACTATE_LBORRES BILIRUBIN_LBPERF BILIRUBIN_LBORRESU TBILIRUBIN_UMOLL_LBORRES TBILIRUBIN_MGDL_LBORRES DBILIRUBIN_UMOLLLBORRES DBILIRUBIN_MGDL_LBORRES IBILIRUBIN_UMOLL_LBORRES IBILIRUBIN_MGDL_LBORRES BGLUC_LBPERF BGLUC_LBORRESU BGLUC_MMOLL_LBORRES BGLUC_MGDL_LBORRES STATUS_VISIT_DSTERM ADMIT_VISIT_OHOLOC ADMIT_VISIT_OHOENDAT DISCHG_PLAN_VISIT_OHOLOC REF_FAC_VISIT_OHOLOC STATUS_24HR_DSTERM FAC_24HR_OHOLOC COYN COVAL VISIT_OBSLOC BABY_ROOM_FAORRES; 
run;
*/

*Output MN12 datasets;
proc sort data=mnh12_num out=mnh.mnh12; by caseid participantid; run;


**MNH13: Maternal PNC Clinical Status**;

*Import csv files from Synapes for each site - currently only data from Kenya, may be more than one table per form*;
%impmerge(sitename=kenya, form=mnh13, tabname=mnh_maternal_clinical_status, tabnum=3, othertab1=, othertab2=, format=);
%impmerge(sitename=ghana, form=mnh13, tabname=mnh_maternal_clinical_status, tabnum=3, othertab1=mnh_maternal_clinical_status, othertab2=, format=);

*Rename Ghana variables that were imported in as "VarXX";
data mnh13_ghana_renamed;
set mnh13_ghana;
rename
var39=VISIT_OBSLOC_Vil_or_Fac_pa
var40=VISIT_OBSLOC_Vil_or_Fac_la
var41=VISIT_OBSLOC_Vil_or_Fac_id
var42=VISIT_OBSLOC_Vil_or_Fac_le
var43=VISIT_OBSLOC_Vil_or_Fac_dC;
run;


*Set datasets from each site and create site indicator;
data mnh13_char;
length OTHR_NUTR_CMTRT  $11
CARE_OHOREAS  $50
CARE_FAC_SPFY_OHOLOC $28
MAT_DEATH_DSSTTIM $12
ADMIT_ABX_SPFY_CMTRT  $31
ADMIT_ABX_SPFY_CMINDC  $32
ADMIT_MEDS_OTHR_CMTRT $60
HOSP_OHOLOC $28;
set mnh13_kenya (in=inken) mnh13_ghana_renamed (in=ingha);
if caseid="**********" then delete;
*Site number for reports*;
if inken then siten=3;
else if ingha then siten=2;

*Rename variables > 32 characters;
rename	VISIT_FAC_OBSLOC_region_descenda = VISIT_FAC_OBSLOC_region_dcnt
		VISIT_FAC_OBSLOC_location_descen  = VISIT_FAC_OBSLOC_loc_dcnt
		VISIT_FAC_OBSLOC_facility_descen  = VISIT_FAC_OBSLOC_fac_dcnt
		Fac_Spec_location_descendantsCou  = Fac_Spec_location_dcnt
		Fac_Spec_facility_descendantsCou  = Fac_Spec_facility_dcnt
		Fac_Spec_region_descendantsCount = Fac_Spec_region_dcnt
		VISIT_OBSLOC_Region_descendantsC = VISIT_OBSLOC_Region_dcnt
		VISIT_OBSLOC_District_descendant  = VISIT_OBSLOC_District_dcnt
		VISIT_OBSLOC_Type_descendantsCou  = VISIT_OBSLOC_Type_dcnt
		VISIT_FAC_OBSLOC_region_parent=VISIT_FAC_OBSLOC_reg_parent
		VISIT_FAC_OBSLOC_region_label=VISIT_FAC_OBSLOC_reg_label
		VISIT_FAC_OBSLOC_region_level=VISIT_FAC_OBSLOC_reg_level
		VISIT_FAC_OBSLOC_location_parent=VISIT_FAC_OBSLOC_loc_parent
		VISIT_FAC_OBSLOC_location_label=VISIT_FAC_OBSLOC_loc_label
		VISIT_FAC_OBSLOC_location_level=VISIT_FAC_OBSLOC_loc_level
		VISIT_FAC_OBSLOC_facility_parent=VISIT_FAC_OBSLOC_fac_parent
		VISIT_FAC_OBSLOC_facility_label=VISIT_FAC_OBSLOC_fac_label
		VISIT_FAC_OBSLOC_facility_level=VISIT_FAC_OBSLOC_fac_level
		VISIT_OBSLOC_Type_locationType=VISIT_OBSLOC_Type_locType
		VISIT_OBSLOC_Village_or_Facility=VISIT_OBSLOC_Village_or_Fac;

		
run;

*Convert to numeric (continuous, check one and date variables - Dates contain text NA, Check one contain NA and SKIPPED)*;
%char2num(inputdsn=mnh13_char, outputdsn=mnh13_num, excludevars=);
proc contents data=mnh13_num order=varnum; run;
proc freq data=mnh13_num; tables _char_; run;

/*ods EXCEL file="/rtpnfil03/rtpnfil03_vol5/ANCPNC_Collective/Data Monitoring and Analysis/Datasets/Documentation/Contents/mnh13contents.xlsx";
proc contents data=mnh13_num order=varnum; run;
ods EXCEL close;*/
*Set datasets from each site and create site indicator;
data mnh13;
set mnh13_num (in=inken);
label   SUBJID="SUBJID"
		VISIT_OBSSTDAT="Interview date"
		VISIT_OBSLOC="Interview location"
		/*VISIT_FAC_OBSLOC="Specify name of facility"*/
		/*VISIT_GPS_OBSLOC="Record GPS coordinates"*/
		VISIT_FAC_SPFY_OBSLOC="Specify location"
		PNC_N_VISIT="Timing of visit"
		PATIENT_DSDECOD="Maternal status at the time of visit"
		TEMP_VSSTAT="Was temperature measured during this study visit?"
		TEMP_VSORRES="Temperature"
		PULSEOX_VSSTAT="Was oxygen saturation measured during this study visit?"
		PULSEOX_VSORRES="O2 saturation"
		POC_HB_VSSTAT="Was point-of-care hemoglobin measured during this study visit?"
		POC_HB_VSORRES="Hb result"
		RR_VSSTAT="Was respiratory rate measured during this study visit?"
		RR_VSORRES="Respiratory rate"
		MHR_VSSTAT="Was maternal heart rate measured during this study visit?"
		MHR_VSORRES="Maternal heart rate"
		BP1_VSSTAT="Is BP measurement available?"
		BP1_SYS_VSORRES="Systolic blood pressure (1st measurement)"
		BP1_DIA_VSORRES="Diastolic blood pressure (1st measurement)"
		BP2_VSSTAT="Is 2nd BP measurement available?"
		BP2_SYS_VSORRES="Systolic blood pressure (2nd measurement)"
		BP2_DIA_VSORRES="Diastolic blood pressure (2nd measurement"
		BP3_VSSTAT="Is 3rd BP measurement available?"
		BP3_SYS_VSORRES="Systolic blood pressure (3rd measurement)"
		BP3_DIA_VSORRES="Diastolic blood pressure (3rd measurement)"
		BPAVG_SYS_VSORRES="Average systolic BP"
		BPAVG_DIA_VSORRES="Average diastolic BP"
		FEVER_CEOCCUR=" Fever (Temperature >=37.5 C if measured)?"
		FEVER_CESTDAT="Date of fever onset"
		MAX_TEMP_PEMETH="Is temperature >=37.5 documented?"
		MAX_TEMP_VSORRES="Record highest known temperature >=37.5 C"
		FEVER_CEONGO="Is mother still experiencing fever?"
		HYPO_CEOCCUR="Hypothermia (<36.0 C if measured)?"
		HYPO_CESTDAT="Hypothermia date of onset"
		LOW_TEMP_VSSTAT="Is temperature <36.0C documented?"
		LOW_TEMP_VSORRES="Provide lowest temperature <36.0C"
		HYPO_CEONGO="Is mother still experiencing hypothermia?"
		CHILLS_CEOCCUR="Chills?"
		CHILLS_CESTDAT="Chills date of onset"
		CHILLS_CEONGO="Is mother still experiencing chills?"
		FAST_HR_CEOCCUR="Fast heartbeat (Heartrate >=120 bpm if measured)?"
		FAST_HR_CESTDAT="Fast heartbeat date of onset"
		FAST_HR_CEONGO="Is mother still experiencing fast heartbeat?"
		Shortbreath_CEOCCUR="Respiratory distress, shortness of breath, or difficulty breathing (Respiratory rate >24 breaths/min if measured)?"
		Shortbreath_CESTDAT="Respiratory distress date of onset"
		SHORTBREATH_CEONGO="Is mother still experiencing respiratory distress, shortness of breath, or difficulty breathing?"
		FAINT_CEOCCUR="Feeling faint or dizzy?"
		FAINT_CESTDAT="Feeling faint or dizzy date of onset"
		FAINT_CEONGO="Is mother still feeling faint or dizzy?"
		confusion_CEOCCUR="Confusion or an altered mental status?"
		confusion_CESTDAT="Confusion date of onset"
		CONFUSION_CEONGO="Is mother still experiencing confusion or altered mental status/consciousness?"
		SEIZURE_CEOCCUR="Seizures?"
		SEIZURE_CESTDAT="Seizure date of onset"
		SEIZURE_CEONGO="Is mother still experiencing seizures?"
		Headache_CEOCCUR="Severe headaches?"
		Headache_CESTDAT="Severe headache date of onset"
		HEADACHE_CEONGO="Is mother still experiencing severe headaches?"
		BLUR_VISION_CEOCCUR="Blurred vision?"
		BLUR_VISION_CESTDAT="Blurred vision date of onset"
		BLUR_VISION_CEOONGO="Is mother still experiencing blurred vision?"
		JAUNDICE_CEOCCUR="Jaundice (yellow skin or eyes)?"
		JAUNDICE_CESTDAT="Jaundic date of onset"
		JAUNDICE_CEONGO="Is mother still experiencing jaundice?"
		CESARIAN_PAIN_CEOCCUR="Pain, redness, swelling, heat, or purulent drainage around a Cesarean incision or perineal laceration?"
		CESARIAN_PAIN_CESTDAT="Pain, redness, swelling, heat, or purulent drainage around a Cesarean incision or perineal laceration date of onset"
		CESARIAN_PAIN_CEONGO="Is mother still experiencing pain, redness, swelling, heat, or purulent drainage from incision or laceration?"
		BRST_PAIN_CEOCCUR="Pain, redness, swelling, heat, or purulent drainage from breast?"
		BRST_PAIN_CESTDAT="Pain, redness, swelling, heat, or purulent drainage from breast date of onset"
		BRST_PAIN_CEONGO="Is mother still experiencing pain, redness, swelling, heat, or purulent drainage from breast?"
		UTER_PAIN_CEOCCUR="Severe uterine or vaginal pain?"
		UTER_PAIN_CESTDAT="Severe uterine or vaginal pain date of onset"
		UTER_PAIN_CEONGO="Is mother still experiencing severe uterine or vaginal pain?"
		VAG_ODOR_CEOCCUR="Foul-smelling vaginal discharge?"
		VAG_ODOR_CESTDAT="Foul-smelling vaginal discharge date of onset"
		VAG_ODOR_CEONGO="Is mother still experiencing foul-smelling vaginal discharge?"
		VAG_BLEED_CEOCCUR="Vaginal bleeding?"
		VAG_BLEED_CESTDAT="Vaginal bleeding date of onset"
		VAG_BLEED_CEONGO="Is mother still experiencing vaginal bleeding?"
		EPIGASTR_CEOCCUR="Epigastric or right upper quadrant pain?"
		EPIGASTR_CESTDAT="Epigastric or right upper quadrant pain date of onset"
		EPIGASTR_CEONGO="Is mother still experiencing epigastric or right upper quadrant pain?"
		LEG_SWELL_CEOCCUR="Swelling and tenderness in leg or calf?"
		LEG_SWELL_CESTDAT="Leg swelling date of onset"
		LEG_SWELL_CEONGO="Is mother still experiencing swelling and tenderness in leg or calf?"
		LWR_LIMB_WK_CEOCCUR="Weakness and paresthesia in the lower limbs?"
		LWR_LIMB_WK_CESTDAT="Weakness and paresthesia in lower limbs date of onset"
		LWR_LIMB_WK_CEONGO="Is mother still experiencing weakness and paresthesia in the lower limbs?"
		URINE_PAIN_CEOCCUR="Pain during urination?"
		URINE_PAIN_CESTDAT="Urine pain date of onset"
		URINE_PAIN_CEONGO="Is mother still experiencing pain during urination?"
		URINE_REDUCED_CEOCCUR="Difficulty emptying bladder or reduced urinary output?"
		URINE_REDUCED_CESTDAT="Reduced urinary output date of onset"
		URINE_REDUCED_CEONGO="Is mother still experiencing difficulty emptying bladder or reduced urinary output?"
		URINE_FREQ_CEOCCUR="Urinary urgency or increased urinary frequency?"
		URINE_FREQ_CESTDAT="Urinary urgency date of onset"
		URINE_FREQ_CEONGO="Is mother still experiencing urinary urgency or increased urinary frequency?"
		URINE_LEAK_CEOCCUR="Constant leakage of urine?"
		URINE_LEAK_CESTDAT="Urine leak date of onset"
		URINE_LEAK_CEONGO="Is mother still experiencing constant leakage of urine?"
		STOOL_LEAK_CEOCCUR="Constant leakage of stools?"
		STOOL_LEAK_CESTDAT="Stool leak date of onset"
		STOOL_LEAK_CEONGO="Is mother still experiencing constant leakage of stools?"
		DIARRHOEA_CEOCCUR="Diarrhea or loose/watery stools?"
		DIARRHOEA_CESTDAT="Diarrhea date of onset"
		DIARRHOEA_CEONGO="Is mother still experiencing diarrhea or loose/watery stools?"
		NAUSEA_CEOCCUR="Nausea or vomiting?"
		NAUSEA_CESTDAT="Nausea or vomiting date of onset"
		NAUSEA_CEONGO="Is mother still experiencing nausea or vomiting?"
		ANOREXIA_CEOCCUR="Loss of appetite?"
		ANOREXIA_CESTDAT="Anorexia date of onset"
		ANOREXIA_CEONGO="Is mother still experiencing loss of appetite?"
		ANOSMIA_CEOCCUR="Loss of smell (anosmia)"
		ANOSMIA_CESTDAT="Anosmia date of onset"
		ANOSMIA_CEONGO="Is mother still experiencing loss of smell?"
		AGEUSIA_CEOCCUR="Loss of taste (ageusia)"
		AGEUSIA_CESTDAT="Ageusia date of onset"
		AGEUSIA_CEONGO="Is mother still experiencing loss of taste?"
		COUGH_CEOCCUR="Cough?"
		COUGH_CESTDAT="Cough date of onset"
		COUGH_CEONGO="Is mother still experiencing cough?"
		SORETHROAT_CEOCCUR="Sore throat?"
		SORETHROAT_CESTDAT="Sore throat date of onset"
		SORETHROAT_CEONGO="Is mother still experiencing sore throat?"
		RUNNYNOSE_CEOCCUR="Runny nose or inflammation of the nasal membranes?"
		RUNNYNOSE_CESTDAT="Runny nose date of onset"
		RUNNYNOSE_CEONGO="Is mother still experiencing runny nose or inflammation of nasal membrane?"
		NOSEBLEED_CEOCCUR="Nosebleed?"
		NOSEBLEED_CESTDAT="Nosebleed date of onset"
		NOSEBLEED_CEONGO="Is mother still experiencing nosebleeds?"
		MYALGIA_CEOCCUR="Myalgia (muscle ache)?"
		MYALGIA_CESTDAT="Myalgia date of onset"
		MYALGIA_CEONGO="Is mother still experiencing myalgia?"
		ACHE_JOINTS_CEOCCUR="Joint aches/pain?"
		ACHE_JOINTS_CESTDAT="Joint ache/pain date of onset"
		ACHE_JOINTS_CEONGO="Is mother still experiencing joint aches/pain?"
		FATIGUE_CEOCCUR="Weakness or fatigue?"
		FATIGUE_CESTDAT="Weakness or fatigue date of onset"
		FATIGUE_CEONGO="Is mother still experiencing weakness or fatigue?"
		RASH_CEOCCUR="Rash?"
		RASH_CESTDAT="Rash date of onset"
		RASH_CEONGO="Is mother still experiencing rash?"
		CONJUNCT_CEOCCUR="Conjunctivitis?"
		CONJUNCT_CESTDAT="Conjunctivitis date of onset"
		CONJUNCT_CEONGO="Is mother still experiencing conjunctivitis?"
		OTHR_INFECT_CEOCCUR="Did mother have any other signs/symptoms of infection?"
		OTHR_INFECT_SPFY_CETERM="Specify other symptoms"
		OTHR_INFECT_CESTDAT="Other infection date of onset"
		OTHR_INFECT_CEONGO="Is mother still experiencing other sign(s)/symptom(s)?"
		/*POST_DEL_INF_MHOCCUR="Was the mother diagnosed with any of the following infections?"*/
		POST_DEL_INF_MHSTDAT="Date of diagnosis"
		/*POST_DEL_INF_SRCE="Data source"*/
		SARI_CEOCCUR="Was mother diagnosed with severe acute respiratory disease (SARI)?"
		SARI_CESTDAT="Date of SARI diagnosis"
		COVID_LBPERF="Was mother diagnosed with COVID-19?"
		COVID_LBDAT="Date of diagnosis"
		COVID_FAMETHOD="How was COVID-19 diagnosed?"
		/*COVID_SRCE="Data source for COVID-19 diagnosis"*/
		/*CHEST_IMAGE_PROCCUR="Did the mother have any of the following type of chest imaging with findings suggestive of COVID-19?"*/
		CHEST_IMAGE_PRSTDAT="Date of chest imaging"
		COVID_CONTACT_YN="Did mother have contact with a probable or confirmed COVID-19 case?"
		COVID_CONTACT_DAT="Date of most recent contact"
		MALARIA_MHOCCUR="Was mother diagnosed with malaria?"
		MALARIA_MHSTDAT="Date of malaria diagnosis"
		MALARIA_FAMETHOD="How was malaria diagnosed?"
		/*MALARIA_SRCE="Data source"*/
		HIV_MHOCCUR="Was mother diagnosed with HIV?"
		HIV_MHSTDAT="Date of HIV Diagnosis"
		HIV_CMOCCUR="Was HIV treatment started?"
		/*HIV_CMTRT="HIV treatment regimen"*/
		HIV_SPFY_CMTRT="Other HIV treatment received"
		/*HIV_SRCE="Data source"*/
		/*BIRTH_COMPL_MHTERM="Was the mother diagnosed with any of the following birth complications?"*/
		BIRTH_COMPL_SPFY_MHTERM="Specify other birth complication(s)"
		/*BIRTH_COMPL_SRCE="Data source"*/
		/*ORG_FAIL_MHOCCUR="Did the mother experience any type of organ failure?"*/
		ORG_FAIL_MHTERM="Specify other type of organ failure"
		/*ORG_FAIL_SRCE="Data source"*/
		PULM_EDEMA_MHOCCUR="Was mother diagnosed with pulmonary edema?"
		PULM_EDEMA_MHSTDAT="Date of diagnosis"
		/*PULM_EDEMA_SRCE="Data source"*/
		STROKE_MHOCCUR="Was mother diagnosed with stroke?"
		STROKE_MHSTDAT="Date of diagnosis"
		/*STROKE_SRCE="Data source"*/
		OTHR_ISSUE_MHOCCUR="Was mother diagnosed with any other medical issue or illness?"
		OTHR_ISSUE_MHTERM="Specify issue"
		OTHR_ISSUE_MHSTDAT="Date of diagnosis"
		/*OTHR_ISSUE_SRCE="Data source"*/
		ADMIT_ABX_CMOCCUR="Has mother taken antibiotics since the last study visit?"
		/*ADMIT_ABX_CMTRT="Specify type of antibiotic"*/
		ADMIT_ABX_SPFY_CMTRT="Specify other antibiotic  "
		ADMIT_ABX_CMINDC="Specify indication for antibiotic"
		ADMIT_ABX_SPFY_CMINDC="Specify other indication "
		ADMIT_ABX_CMSTDAT="Date of first dose"
		/*ADMIT_ABX_SRCE="Data source"*/
		FOLIC_ACID_CMOCCUR="Folic acid?"
		IRON_CMOCCUR="Iron?"
		IFA_CMOCCOR="Iron-folic acid (IFA)"
		CALCIUM_CMOCCUR="Calcium?"
		VITAMIN_CMOCCUR="Vitamin A?"
		ZINC_CMOCCUR="Zinc?"
		MICRONUTRIENT_CMOCCUR="Multiple micronutrient (MM) supplements?"
		OTHR_NUTR_CMOCCUR="Other nutritional supplements?"
		OTHR_NUTR_CMTRT="Specify other nutrtional supplements"
		ORAL_REHYD_CMOCCUR="Oral rehydration solution "
		ANTHELMINTHIC_CMOCCUR="Anthelminthic treatment?"
		PREP_CMOCCUR="PrEP for HIV prevention?"
		ANTIPYRETIC_CMOCCUR="Has the mother taken any type of antypyretic in the last two weeks? "
		/*ANTIPYRETIC_CMTRT="Specify type of antipyretic"*/
		ANTIPYRETIC_SPFY_CMTRT="Specify other type of antipyretic"
		ANTICONV_CMOCCUR="Has the mother taken anticonvulsants in the last two weeks? "
		ANTICONV_CMTRT="Specify type of anticonvulsant"
		ADMIT_MEDS_OTHR_CMOCCUR="Has the mother taking any other medications, supplements, or treatments in the last two weeks?"
		ADMIT_MEDD_OTHR_CMINDC="Specify reason"
		ADMIT_MEDS_OTHR_CMTRT="Specify medication"
		CARE_OHOYN="Did the mother receive care from a health provider for an unexpected medical issue since the last study visit? Do not include visits for routine postnatal care."
		CARE_OHOREAS="Specify reason for unplanned care"
		CARE_OHOLOC="Specify where mother received unplanned care"
		CARE_FAC_SPFY_OHOLOC="Specify facility where mother received unplanned care"
		CARE_HOME_SPFY_OHOLOC="Specify who provided unplanned care at participant's home"
		CARE_OTHR_SPFY_OHOLOC="Specify other location where mother received unplanned care"
		HOSP_LAST_VISIT_OHOOCCUR="Was the mother hospitalized for this illness or medical issue? "
		HOSP_OHOLOC="Specify location where mother was hospitalized"
		METHOD_FP_FAORRES="Since the last study visit, did the mother choose a postpartum family planning method?"
		METHOD_FP_SPFY_FAORRES="Specify family planning method "
		METHOD_FP_SPFY2_FAORRES="Specify other family planning method"
		FP_NOMETHOD_FAORRES="Specify the main reason that the mother did not select a family planning method"
		FP_NOMETHOD_FAORRES="Specify other reason why no family planning method selected"
		FP_LEAVE_FAORRES="During this visit, did the mother leave with her family planning method of choice?"
		MATERNAL_DSDECOD="What was mother's end-of-visit status?"
		REFERRAL_PROCCUR="Was mother referred for care?"
		REFERRAL_OHOLOC="Specify where mother was referred"
		REFERRAL_NOTACCEPT_REAS="Specify reason that referral was not accepted"
		REFFERRAL_REASND="Specify reason why no referral was made"
		MAT_DEATH_DTHDAT="Date of death"
		MAT_DEATH_DSSTTIM="Time of death"
		MAT_DDORRES="Primary cause of death"
		BIRTH_COMP_DDORRES="Specify birth complication"
		BIRTH_COMP_SPFY_DDORRES="Specify other birth complication "
		INFECTION_DDORRES="Specify type of infection"
		INFECTION_SPFY_DDORRES="Specify other infection"
		OTHR_DDORRES="Other primary cause of death?"
		OTHR_SPFY_DDORRES="Specify other cause of death"
		COYN="Would you like to record any additional comments about this visit?"
		/*COVAL="Record comments"*/
		/*FORMCOMPLID="Record indentifier of person completing this form, as appropriate for your site (e.g., Name, initials, ID, or code)"*/
		POST_DEL_INF_MHOCCUR_1="Mother diagnosed with: Endomitritis"
		POST_DEL_INF_MHOCCUR_2="Mother diagnosed with: Perineal wound infection "
		POST_DEL_INF_MHOCCUR_3="Mother diagnosed with: Cesarean wound infection "
		POST_DEL_INF_MHOCCUR_4="Mother diagnosed with: Abdominal or pelvic abscess/infection "
		POST_DEL_INF_MHOCCUR_5="Mother diagnosed with: Pneumonia or lung infection "
		POST_DEL_INF_MHOCCUR_6="Mother diagnosed with: Meningitis"
		POST_DEL_INF_MHOCCUR_7="Mother diagnosed with: Mastitis or breast abscess/infection"
		POST_DEL_INF_MHOCCUR_8="Mother diagnosed with: Pyelonephritis or kidney infection "
		POST_DEL_INF_MHOCCUR_9="Mother diagnosed with: Urinary tract infection "
		POST_DEL_INF_MHOCCUR_10="Mother diagnosed with: Septic pelvic thrombophlebitis "
		POST_DEL_INF_MHOCCUR_11="Mother diagnosed with: Maternal Sepsis/Septic Shock"
		POST_DEL_INF_MHOCCUR_77="Mother diagnosed with: None of these infections diagnosed "
		POST_DEL_INF_MHOCCUR_99="Mother diagnosed with: Don't know"
		POST_DEL_INF_SRCE_1="Diagnosis of Illness or Infection Data Source: Participant recall"
		POST_DEL_INF_SRCE_2="Diagnosis of Illness or Infection Data Source: Facility-based or participant-held record "
		POST_DEL_INF_SRCE_3="Diagnosis of Illness or Infection Data Source: Study assessment"
		COVID_SRCE_1="Data source for Covid-19 infection: Participant recall"
		COVID_SRCE_2="Data source for Covid-19 infection: Facility-based or participant-held record "
		COVID_SRCE_3="Data source for Covid-19 infection: Study assessment"
		CHEST_IMAGE_PROCCUR_1="Mother had chest imaging with findings suggestive of COVID-19: Chest radiography "
		CHEST_IMAGE_PROCCUR_2="Mother had chest imaging with findings suggestive of COVID-19:Chest CT "
		CHEST_IMAGE_PROCCUR_3="Mother had chest imaging with findings suggestive of COVID-19:Lung ultrasound "
		CHEST_IMAGE_PROCCUR_77="Mother had chest imaging with findings suggestive of COVID-19:no chest imaging suggestive of COVID-19 "
		CHEST_IMAGE_PROCCUR_99="Mother had chest imaging with findings suggestive of COVID-19:Don't know"
		MALARIA_SRCE_1="Malaria infection data source: Participant recall"
		MALARIA_SRCE_2="Malaria infection data source: Facility-based or participant-held record "
		MALARIA_SRCE_3="Malaria infection data source: Study assessment"
		HIV_CMTRT_1="HIV treatment regimen: Abacavir (ABC, Zigen)"
		HIV_CMTRT_2="HIV treatment regimen: Didanosine (DDI, Videx) "
		HIV_CMTRT_3="HIV treatment regimen: Lamivudine (3TC, Epivir) "
		HIV_CMTRT_4="HIV treatment regimen: Stavudine (d4T, Zerit) "
		HIV_CMTRT_5="HIV treatment regimen: Zidovudine (ZDV, AZT, Retrovir) "
		HIV_CMTRT_6="HIV treatment regimen: Tenofovir (TNF, TDF) "
		HIV_CMTRT_7="HIV treatment regimen: Efavirenz (EFV, Sustiva, Stocrin) "
		HIV_CMTRT_8="HIV treatment regimen: Etravirine "
		HIV_CMTRT_9="HIV treatment regimen: Nevirapine (NVP, Viramune) "
		HIV_CMTRT_10="HIV treatment regimen: Rilpivirine "
		HIV_CMTRT_11="HIV treatment regimen: Lopinavir/ritonavir (LPV/rit, Kaletra) "
		HIV_CMTRT_12="HIV treatment regimen: Nelfinavir (NFV, Viracept) "
		HIV_CMTRT_13="HIV treatment regimen: Ritonavir (RTV, Norvir) "
		HIV_CMTRT_14="HIV treatment regimen: Atazanavir"
		HIV_CMTRT_15="HIV treatment regimen: Darunavir "
		HIV_CMTRT_16="HIV treatment regimen: Fosamprenavir"
		HIV_CMTRT_17="HIV treatment regimen: Indinavir "
		HIV_CMTRT_18="HIV treatment regimen: Saquinavir "
		HIV_CMTRT_19="HIV treatment regimen: Tipranavir "
		HIV_CMTRT_20="HIV treatment regimen: Enfuvirtide "
		HIV_CMTRT_21="HIV treatment regimen: Maraviroc "
		HIV_CMTRT_22="HIV treatment regimen: Dolutegravir "
		HIV_CMTRT_23="HIV treatment regimen: Elvitegravir "
		HIV_CMTRT_24="HIV treatment regimen: Raltegravir "
		HIV_CMTRT_25="HIV treatment regimen: Cobicistat "
		HIV_CMTRT_88="HIV treatment regimen: Other"
		HIV_CMTRT_99="HIV treatment regimen: Don't know"
		HIV_SRCE_1="HIV infection data source: Participant recall"
		HIV_SRCE_2="HIV infection data source: Facility-based or participant-held record "
		HIV_SRCE_3="HIV infection data source: Study assessment"
		BIRTH_COMPL_MHTERM_1="Mother diagnosed with birth complication: Postpartum hemorrhage "
		BIRTH_COMPL_MHTERM_2="Mother diagnosed with birth complication: Postpartum eclampsia"
		BIRTH_COMPL_MHTERM_3="Mother diagnosed with birth complication: Uterine rupture "
		BIRTH_COMPL_MHTERM_4="Mother diagnosed with birth complication: Retained placenta "
		BIRTH_COMPL_MHTERM_5="Mother diagnosed with birth complication: Maternal coagulopathy "
		BIRTH_COMPL_MHTERM_6="Mother diagnosed with birth complication: Hypovolemic shock"
		BIRTH_COMPL_MHTERM_7="Mother diagnosed with birth complication: Pulmonary embolism  "
		BIRTH_COMPL_MHTERM_88="Mother diagnosed with birth complication: other "
		BIRTH_COMPL_MHTERM_77="Mother diagnosed with birth complication: Not applicable/no diagnosis"
		BIRTH_COMPL_MHTERM_99="Mother diagnosed with birth complication: Don't know"
		BIRTH_COMPL_SRCE_1="Birth complication source: Participant recall"
		BIRTH_COMPL_SRCE_2="Birth complication source: Facility-based or participant-held record "
		BIRTH_COMPL_SRCE_3="Birth complication source: Study assessment"
		ORG_FAIL_MHOCCUR_1="Mother experienced organ failure: Cardiomyopathy/heart failure"
		ORG_FAIL_MHOCCUR_2="Mother experienced organ failure: Respiratory failure "
		ORG_FAIL_MHOCCUR_3="Mother experienced organ failure: Acute kidney/renal failure "
		ORG_FAIL_MHOCCUR_4="Mother experienced organ failure: Acute liver failure "
		ORG_FAIL_MHOCCUR_88="Mother experienced organ failure: other "
		ORG_FAIL_MHOCCUR_77="Mother experienced organ failure: No diagnosis or sign of organ failure "
		ORG_FAIL_MHOCCUR_99="Mother experienced organ failure: Don't know"
		ORG_FAIL_SRCE_1="Organ failure data source: Participant recall"
		ORG_FAIL_SRCE_2="Organ failure data source: Facility-based or participant-held record "
		ORG_FAIL_SRCE_3="Organ failure data source: Study assessment"
		PULM_EDEMA_SRCE_1="Pulm edema data source: Participant recall"
		PULM_EDEMA_SRCE_2="Pulm edema data source: Facility-based or participant-held record "
		PULM_EDEMA_SRCE_3="Pulm edema data source: Study assessment"
		STROKE_SRCE_1="Stroke data source: Participant recall"
		STROKE_SRCE_2="Stroke data source: Facility-based or participant-held record "
		STROKE_SRCE_3="Stroke data source: Study assessment"
		OTHR_ISSUE_SRCE_1="Other issue data source: Participant recall"
		OTHR_ISSUE_SRCE_2="Other issue data source: Facility-based or participant-held record "
		OTHR_ISSUE_SRCE_3="Other issue data source: Study assessment"
		ADMIT_ABX_CMTRT_1="Type of antibiotic: Penicillin, Ampicillin, or Amoxicillin "
		ADMIT_ABX_CMTRT_2="Type of antibiotic: Gentamycin "
		ADMIT_ABX_CMTRT_3="Type of antibiotic: Cephalosporin (Cefazolin, Ceftriaxone) "
		ADMIT_ABX_CMTRT_4="Type of antibiotic: Metronidazole/Flagyl "
		ADMIT_ABX_CMTRT_5="Type of antibiotic: Clindamycin "
		ADMIT_ABX_CMTRT_6="Type of antibiotic: Erythromycin "
		ADMIT_ABX_CMTRT_7="Type of antibiotic: Azithromycin "
		ADMIT_ABX_CMTRT_88="Type of antibiotic: Other "
		ADMIT_ABX_CMTRT_99="Type of antibiotic: Don't know"
		ADMIT_ABX_SRCE_1="Antibiotic data source: Participant recall"
		ADMIT_ABX_SRCE_2="Antibiotic data source: Facility-based or participant-held record "
		ADMIT_ABX_SRCE_3="Antibiotic data source: Study assessment"
		ANTIPYRETIC_CMTRT_1="Type of antipyretic: Aspirin "
		ANTIPYRETIC_CMTRT_2="Type of antipyretic: Paracetamol/ Panadol/Acetaminophen "
		ANTIPYRETIC_CMTRT_3="Type of antipyretic: Ibuprofen "
		ANTIPYRETIC_CMTRT_88="Type of antipyretic: Other "
		ANTIPYRETIC_CMTRT_99="Type of antipyretic: Don't know"
		caseid="Tangerine Case ID"
		participantid="Tangerine Participant ID"
		eventid="Tangerine Event ID"
		eventformid="Tangerine Form ID"
		startUnixtime="Tangerine Noted Unix Time"
		complete="Tangerine Noted Complete"
		siten="Site number for reports"
		;
		format 
		TEMP_VSSTAT PULSEOX_VSSTAT POC_HB_VSSTAT RR_VSSTAT MHR_VSSTAT BP1_VSSTAT BP2_VSSTAT BP3_VSSTAT
		CARE_OHOYN HOSP_LAST_VISIT_OHOOCCUR COYN yn.
		FP_LEAVE_FAORRES CESARIAN_PAIN_CEOCCUR ynna.
		FEVER_CEOCCUR MAX_TEMP_PEMETH HYPO_CEOCCUR LOW_TEMP_VSSTAT CHILLS_CEOCCUR FAST_HR_CEOCCUR 
		Shortbreath_CEOCCUR FAINT_CEOCCUR confusion_CEOCCUR SEIZURE_CEOCCUR Headache_CEOCCUR BLUR_VISION_CEOCCUR 
		JAUNDICE_CEOCCUR BRST_PAIN_CEOCCUR UTER_PAIN_CEOCCUR VAG_ODOR_CEOCCUR VAG_BLEED_CEOCCUR EPIGASTR_CEOCCUR
		LEG_SWELL_CEOCCUR LWR_LIMB_WK_CEOCCUR URINE_PAIN_CEOCCUR URINE_REDUCED_CEOCCUR URINE_FREQ_CEOCCUR 
		URINE_LEAK_CEOCCUR STOOL_LEAK_CEOCCUR DIARRHOEA_CEOCCUR NAUSEA_CEOCCUR ANOREXIA_CEOCCUR ANOSMIA_CEOCCUR 
		AGEUSIA_CEOCCUR COUGH_CEOCCUR SORETHROAT_CEOCCUR RUNNYNOSE_CEOCCUR NOSEBLEED_CEOCCUR MYALGIA_CEOCCUR 
		ACHE_JOINTS_CEOCCUR FATIGUE_CEOCCUR RASH_CEOCCUR CONJUNCT_CEOCCUR OTHR_INFECT_CEOCCUR SARI_CEOCCUR 
		COVID_LBPERF COVID_CONTACT_YN MALARIA_MHOCCUR HIV_MHOCCUR HIV_CMOCCUR PULM_EDEMA_MHOCCUR STROKE_MHOCCUR 
		ADMIT_ABX_CMOCCUR FOLIC_ACID_CMOCCUR IRON_CMOCCUR IFA_CMOCCOR CALCIUM_CMOCCUR VITAMIN_CMOCCUR ZINC_CMOCCUR 
		MICRONUTRIENT_CMOCCUR OTHR_NUTR_CMOCCUR ORAL_REHYD_CMOCCUR ANTHELMINTHIC_CMOCCUR PREP_CMOCCUR ANTIPYRETIC_CMOCCUR 
		ANTICONV_CMOCCUR ADMIT_MEDS_OTHR_CMOCCUR METHOD_FP_FAORRES yndk.
		PATIENT_DSDECOD MNH13_PATIENT_DSDECOD.
		MAT_DDORRES MNH13_MAT_DDORRES.
		MALARIA_FAMETHOD MNH13_MALARIA_FAMETHOD.
		METHOD_FP_SPFY_FAORRES MNH13_METHOD_FP_SPFY_FAORRES.
		INFECTION_DDORRES MNH13_INFECTION_DDORRES.
		VISIT_OBSLOC CARE_OHOLOC MNH13_VISIT_OBSLOC.
		MATERNAL_DSDECOD MNH13_MATERNAL_DSDECOD.
		COVID_FAMETHOD MNH13_COVID_FAMETHOD.
		FP_NOMETHOD_FAORRES MNH13_FP_NOMETHOD_FAORRES.
		PNC_N_VISIT MNH13_PNC_N_VISIT.
		BIRTH_COMP_DDORRES MNH13_BIRTH_COMP_DDORRES.
		OTHR_DDORRES MNH13_OTHR_DDORRES.
		ADMIT_ABX_CMINDC MNH13_ADMIT_ABX_CMINDC.
		FEVER_CEONGO HYPO_CEONGO CHILLS_CEONGO FAST_HR_CEONGO SHORTBREATH_CEONGO FAINT_CEONGO 
		CONFUSION_CEONGO SEIZURE_CEONGO HEADACHE_CEONGO BLUR_VISION_CEOONGO JAUNDICE_CEONGO 
		CESARIAN_PAIN_CEONGO BRST_PAIN_CEONGO UTER_PAIN_CEONGO VAG_ODOR_CEONGO VAG_BLEED_CEONGO 
		EPIGASTR_CEONGO LEG_SWELL_CEONGO LWR_LIMB_WK_CEONGO URINE_PAIN_CEONGO URINE_REDUCED_CEONGO 
		URINE_FREQ_CEONGO URINE_LEAK_CEONGO STOOL_LEAK_CEONGO DIARRHOEA_CEONGO NAUSEA_CEONGO 
		ANOREXIA_CEONGO ANOSMIA_CEONGO AGEUSIA_CEONGO COUGH_CEONGO SORETHROAT_CEONGO RUNNYNOSE_CEONGO 
		NOSEBLEED_CEONGO MYALGIA_CEONGO ACHE_JOINTS_CEONGO FATIGUE_CEONGO RASH_CEONGO CONJUNCT_CEONGO 
		OTHR_INFECT_CEONGO MNH13_Confirmation.
		REFERRAL_PROCCUR MNH13_REFERRAL_PROCCUR.
		POST_DEL_INF_MHOCCUR_1 POST_DEL_INF_MHOCCUR_2 POST_DEL_INF_MHOCCUR_3 POST_DEL_INF_MHOCCUR_4 
		POST_DEL_INF_MHOCCUR_5 POST_DEL_INF_MHOCCUR_6 POST_DEL_INF_MHOCCUR_7 POST_DEL_INF_MHOCCUR_8 		
		POST_DEL_INF_MHOCCUR_9 POST_DEL_INF_MHOCCUR_10 POST_DEL_INF_MHOCCUR_11 POST_DEL_INF_MHOCCUR_77 	
		POST_DEL_INF_MHOCCUR_99 POST_DEL_INF_SRCE_1	POST_DEL_INF_SRCE_2 POST_DEL_INF_SRCE_3 COVID_SRCE_1 
		COVID_SRCE_2 COVID_SRCE_3 CHEST_IMAGE_PROCCUR_1 CHEST_IMAGE_PROCCUR_2 CHEST_IMAGE_PROCCUR_3 
		CHEST_IMAGE_PROCCUR_77 CHEST_IMAGE_PROCCUR_99 MALARIA_SRCE_1 MALARIA_SRCE_2 MALARIA_SRCE_3 HIV_CMTRT_1 
		HIV_CMTRT_2 HIV_CMTRT_3 HIV_CMTRT_4 HIV_CMTRT_5 HIV_CMTRT_6 HIV_CMTRT_7 HIV_CMTRT_8 HIV_CMTRT_9 HIV_CMTRT_10
		HIV_CMTRT_11 HIV_CMTRT_12 HIV_CMTRT_13 HIV_CMTRT_14 HIV_CMTRT_15 HIV_CMTRT_16 HIV_CMTRT_17 HIV_CMTRT_18
		HIV_CMTRT_19 HIV_CMTRT_20 HIV_CMTRT_21 HIV_CMTRT_22 HIV_CMTRT_23 HIV_CMTRT_24 HIV_CMTRT_25 HIV_CMTRT_88
		HIV_CMTRT_99 HIV_SRCE_1 HIV_SRCE_2 HIV_SRCE_3 BIRTH_COMPL_MHTERM_1 BIRTH_COMPL_MHTERM_2
		BIRTH_COMPL_MHTERM_3 BIRTH_COMPL_MHTERM_4 BIRTH_COMPL_MHTERM_5 BIRTH_COMPL_MHTERM_6 BIRTH_COMPL_MHTERM_7
		BIRTH_COMPL_MHTERM_77 BIRTH_COMPL_MHTERM_88 BIRTH_COMPL_MHTERM_99 BIRTH_COMPL_SRCE_1 BIRTH_COMPL_SRCE_2 
		BIRTH_COMPL_SRCE_3 ORG_FAIL_MHOCCUR_1 ORG_FAIL_MHOCCUR_2 ORG_FAIL_MHOCCUR_3 ORG_FAIL_MHOCCUR_4 
		ORG_FAIL_MHOCCUR_77 ORG_FAIL_MHOCCUR_88 ORG_FAIL_MHOCCUR_99 ORG_FAIL_SRCE_1 ORG_FAIL_SRCE_2 
		ORG_FAIL_SRCE_3 PULM_EDEMA_SRCE_1 PULM_EDEMA_SRCE_2 PULM_EDEMA_SRCE_3 STROKE_SRCE_1 STROKE_SRCE_2 
		STROKE_SRCE_3 OTHR_ISSUE_SRCE_1 OTHR_ISSUE_SRCE_2 OTHR_ISSUE_SRCE_3 ADMIT_ABX_CMTRT_1 ADMIT_ABX_CMTRT_2 
		ADMIT_ABX_CMTRT_3 ADMIT_ABX_CMTRT_4 ADMIT_ABX_CMTRT_5 ADMIT_ABX_CMTRT_6 ADMIT_ABX_CMTRT_7 ADMIT_ABX_CMTRT_88
		ADMIT_ABX_CMTRT_99 ADMIT_ABX_SRCE_1 ADMIT_ABX_SRCE_2 ADMIT_ABX_SRCE_3 ANTIPYRETIC_CMTRT_1 ANTIPYRETIC_CMTRT_2
		ANTIPYRETIC_CMTRT_3 ANTIPYRETIC_CMTRT_88 ANTIPYRETIC_CMTRT_99 ckall.
		VISIT_OBSSTDAT FEVER_CESTDAT HYPO_CESTDAT CHILLS_CESTDAT FAST_HR_CESTDAT Shortbreath_CESTDAT 
		FAINT_CESTDAT confusion_CESTDAT SEIZURE_CESTDAT Headache_CESTDAT BLUR_VISION_CESTDAT 
		JAUNDICE_CESTDAT CESARIAN_PAIN_CESTDAT BRST_PAIN_CESTDAT UTER_PAIN_CESTDAT VAG_ODOR_CESTDAT 
		VAG_BLEED_CESTDAT EPIGASTR_CESTDAT LEG_SWELL_CESTDAT LWR_LIMB_WK_CESTDAT URINE_PAIN_CESTDAT 
		URINE_REDUCED_CESTDAT URINE_FREQ_CESTDAT URINE_LEAK_CESTDAT STOOL_LEAK_CESTDAT DIARRHOEA_CESTDAT
		NAUSEA_CESTDAT ANOREXIA_CESTDAT ANOSMIA_CESTDAT AGEUSIA_CESTDAT COUGH_CESTDAT 
		SORETHROAT_CESTDAT RUNNYNOSE_CESTDAT NOSEBLEED_CESTDAT MYALGIA_CESTDAT ACHE_JOINTS_CESTDAT
		FATIGUE_CESTDAT RASH_CESTDAT CONJUNCT_CESTDAT OTHR_INFECT_CESTDAT POST_DEL_INF_MHSTDAT
		SARI_CESTDAT COVID_LBDAT CHEST_IMAGE_PRSTDAT COVID_CONTACT_DAT MALARIA_MHSTDAT HIV_MHSTDAT
		PULM_EDEMA_MHSTDAT STROKE_MHSTDAT OTHR_ISSUE_MHSTDAT ADMIT_ABX_CMSTDAT MAT_DEATH_DTHDAT date9.; 
*Site number for reports*;
drop	ROW_VERSION formId  formtitle  _id buildId buildChannel deviceId groupId Loc_home_latitude
		Loc_home_longitude Loc_home_accuracy Fac_Spec_region Fac_Spec_region_parent Fac_Spec_region_label 
		Fac_Spec_region_id Fac_Spec_region_level Fac_Spec_region_dcnt Fac_Spec_location 
		Fac_Spec_location_parent Fac_Spec_location_label Fac_Spec_location_id Fac_Spec_location_level 
		Fac_Spec_location_dcnt Fac_Spec_facility Fac_Spec_facility_parent 
		Fac_Spec_facility_label Fac_Spec_facility_id Fac_Spec_facility_level Fac_Spec_facility_dcnt
		VISIT_FAC_OBSLOC_region  VISIT_FAC_OBSLOC_region_id  VISIT_FAC_OBSLOC_region_dcnt 
		VISIT_FAC_OBSLOC_location  VISIT_FAC_OBSLOC_location_id  VISIT_FAC_OBSLOC_loc_dcnt 
		VISIT_FAC_OBSLOC_facility  VISIT_FAC_OBSLOC_facility_id  VISIT_FAC_OBSLOC_fac_dcnt 
		VISIT_OBSLOC_Region_dcnt VISIT_OBSLOC_District_dcnt VISIT_OBSLOC_Type_dcnt
		VISIT_FAC_OBSLOC_reg_parent VISIT_FAC_OBSLOC_reg_label VISIT_FAC_OBSLOC_reg_level VISIT_FAC_OBSLOC_loc_parent 
		VISIT_FAC_OBSLOC_loc_label VISIT_FAC_OBSLOC_loc_level VISIT_FAC_OBSLOC_fac_parent VISIT_FAC_OBSLOC_fac_label 
		VISIT_FAC_OBSLOC_fac_level BP_Dir BP_AVG fever_ id diagnBox1 diagnBox2 medsother2 FP_NOMETHOD_SPFY_FAORRES 
		ancovConsentVersion COVID_DOSE1_CMSTDAT_YN COVID_DOSE1_CMSTDAT COVID_DOSE2_LSTVISIT_CMOCCUR COVID_DOSE2_CMTRT 
		COVID_DOSE2_SPFY_CMTRT COVID_DOSE2_CMSTDAT ANTIPYRETIC_CMINDC Int_Loc Loc_other del_DoA del_ToA Vis_time 
		Temp_avail Meth_spec RR_rec BP_Dia1   medsother prismaContentVersion COVID_DOSE1_LSTVISIT_CMOCCUR 
		COVID_DOSE1_NO_SPFY COVID_DOSE1_CMTRT COVID_DOSE1_SPFY_CMTRT COVID_DOSE1_SOURCE COVID_DOSE2_NO_SPFY 
		COVID_DOSE2_CMSTDAT_YN COVID_DOSE2_SOURCE Int_date Vis_status Mat_stat Temp_num Temp_meth HR_avail 
		HR_rec RR_avail BP_avail BP_Syst1 BP_rec time_8 reminder VISIT_OBSLOC_Region VISIT_OBSLOC_Region_parent 
		VISIT_OBSLOC_Region_label VISIT_OBSLOC_Region_id VISIT_OBSLOC_Region_level VISIT_OBSLOC_District 
		VISIT_OBSLOC_District_parent VISIT_OBSLOC_District_label VISIT_OBSLOC_District_id VISIT_OBSLOC_District_level
		VISIT_OBSLOC_Type VISIT_OBSLOC_Type_parent VISIT_OBSLOC_Type_label VISIT_OBSLOC_Type_id VISIT_OBSLOC_Type_level
		VISIT_OBSLOC_Type_locType VISIT_OBSLOC_Village_or_Fac INTV_DSDECOD INTV_DSSTERM MOTHER_ADDRESS_CHANGE_YN
		MOTHER_VILLAGE_SCORRES MOTHER_CONTACT_CHANGE_YN f_COVID_DOSE1_CMSTDAT VISIT_VILLAGE_OBSLOC VISIT_Loc_other_OHOLOC
		VISIT_OBSLOC_Vil_or_Fac_pa VISIT_OBSLOC_Vil_or_Fac_la VISIT_OBSLOC_Vil_or_Fac_id VISIT_OBSLOC_Vil_or_Fac_le
		VISIT_OBSLOC_Vil_or_Fac_dC intro final;
run;

**Add prefix of M13_;
%varprefix(dset=mnh13, prefix=M13_, keepname="caseid" "participantid" "eventid" "eventformid" "siten");

/*ods EXCEL file="/rtpnfil03/rtpnfil03_vol5/ANCPNC_Collective/Data Monitoring and Analysis/Datasets/Documentation/Contents/mnh13contents.xlsx";
proc contents data=mnh13 order=varnum; run;
ods EXCEL close;*/


proc freq data=mnh13;
*Vars in dataset but and in DD, or useful tangerine variable; 
tables  M13_OTHR_NUTR_CMTRT M13_CARE_OHOREAS M13_CARE_FAC_SPFY_OHOLOC M13_MAT_DEATH_DSSTTIM 
		M13_ADMIT_ABX_SPFY_CMTRT M13_ADMIT_ABX_SPFY_CMINDC M13_ADMIT_MEDS_OTHR_CMTRT M13_HOSP_OHOLOC 
		caseid participantid eventid eventformid M13_startUnixtime M13_complete 
		M13_VISIT_OBSSTDAT M13_VISIT_OBSLOC M13_VISIT_FAC_SPFY_OBSLOC M13_PNC_N_VISIT M13_PATIENT_DSDECOD 
		M13_TEMP_VSSTAT M13_TEMP_VSORRES M13_PULSEOX_VSSTAT M13_PULSEOX_VSORRES M13_POC_HB_VSSTAT 
		M13_POC_HB_VSORRES M13_RR_VSSTAT M13_RR_VSORRES M13_MHR_VSSTAT M13_MHR_VSORRES M13_BP1_VSSTAT 
		M13_BP1_SYS_VSORRES M13_BP1_DIA_VSORRES M13_BP2_VSSTAT M13_BP2_SYS_VSORRES M13_BP2_DIA_VSORRES 
		M13_BP3_VSSTAT M13_BP3_SYS_VSORRES M13_BP3_DIA_VSORRES M13_BPAVG_SYS_VSORRES M13_BPAVG_DIA_VSORRES 
		M13_FEVER_CEOCCUR M13_FEVER_CESTDAT M13_MAX_TEMP_PEMETH M13_MAX_TEMP_VSORRES M13_FEVER_CEONGO 
		M13_HYPO_CEOCCUR M13_HYPO_CESTDAT M13_LOW_TEMP_VSSTAT M13_LOW_TEMP_VSORRES M13_HYPO_CEONGO 
		M13_CHILLS_CEOCCUR M13_CHILLS_CESTDAT M13_CHILLS_CEONGO M13_FAST_HR_CEOCCUR M13_FAST_HR_CESTDAT 
		M13_FAST_HR_CEONGO M13_Shortbreath_CEOCCUR M13_Shortbreath_CESTDAT M13_SHORTBREATH_CEONGO 
		M13_FAINT_CEOCCUR M13_FAINT_CESTDAT M13_FAINT_CEONGO M13_confusion_CEOCCUR M13_confusion_CESTDAT 
		M13_CONFUSION_CEONGO M13_SEIZURE_CEOCCUR M13_SEIZURE_CESTDAT M13_SEIZURE_CEONGO M13_Headache_CEOCCUR 
		M13_Headache_CESTDAT M13_HEADACHE_CEONGO M13_BLUR_VISION_CEOCCUR M13_BLUR_VISION_CESTDAT 
		M13_BLUR_VISION_CEOONGO M13_JAUNDICE_CEOCCUR M13_JAUNDICE_CESTDAT M13_JAUNDICE_CEONGO 
		M13_CESARIAN_PAIN_CEOCCUR M13_CESARIAN_PAIN_CESTDAT M13_CESARIAN_PAIN_CEONGO M13_BRST_PAIN_CEOCCUR 
		M13_BRST_PAIN_CESTDAT M13_BRST_PAIN_CEONGO M13_UTER_PAIN_CEOCCUR M13_UTER_PAIN_CESTDAT M13_UTER_PAIN_CEONGO
		M13_VAG_ODOR_CEOCCUR M13_VAG_ODOR_CESTDAT M13_VAG_ODOR_CEONGO M13_VAG_BLEED_CEOCCUR 
		M13_VAG_BLEED_CESTDAT M13_VAG_BLEED_CEONGO M13_EPIGASTR_CEOCCUR M13_EPIGASTR_CESTDAT 
		M13_EPIGASTR_CEONGO M13_LEG_SWELL_CEOCCUR M13_LEG_SWELL_CESTDAT M13_LEG_SWELL_CEONGO 
		M13_LWR_LIMB_WK_CEOCCUR M13_LWR_LIMB_WK_CESTDAT M13_LWR_LIMB_WK_CEONGO M13_URINE_PAIN_CEOCCUR 
		M13_URINE_PAIN_CESTDAT M13_URINE_PAIN_CEONGO M13_URINE_REDUCED_CEOCCUR M13_URINE_REDUCED_CESTDAT 
		M13_URINE_REDUCED_CEONGO M13_URINE_FREQ_CEOCCUR M13_URINE_FREQ_CESTDAT M13_URINE_FREQ_CEONGO 
		M13_URINE_LEAK_CEOCCUR M13_URINE_LEAK_CESTDAT M13_URINE_LEAK_CEONGO M13_STOOL_LEAK_CEOCCUR 
		M13_STOOL_LEAK_CESTDAT M13_STOOL_LEAK_CEONGO M13_DIARRHOEA_CEOCCUR M13_DIARRHOEA_CESTDAT 
		M13_DIARRHOEA_CEONGO M13_NAUSEA_CEOCCUR M13_NAUSEA_CESTDAT M13_NAUSEA_CEONGO M13_ANOREXIA_CEOCCUR 
		M13_ANOREXIA_CESTDAT M13_ANOREXIA_CEONGO M13_ANOSMIA_CEOCCUR M13_ANOSMIA_CESTDAT M13_ANOSMIA_CEONGO 
		M13_AGEUSIA_CEOCCUR M13_AGEUSIA_CESTDAT M13_AGEUSIA_CEONGO M13_COUGH_CEOCCUR M13_COUGH_CESTDAT 
		M13_SORETHROAT_CEOCCUR M13_SORETHROAT_CEONGO M13_RUNNYNOSE_CEOCCUR M13_RUNNYNOSE_CEONGO M13_NOSEBLEED_CEOCCUR 
		M13_NOSEBLEED_CEONGO M13_ACHE_JOINTS_CEOCCUR M13_ACHE_JOINTS_CESTDAT M13_FATIGUE_CEOCCUR 
		M13_FATIGUE_CESTDAT M13_FATIGUE_CEONGO M13_RASH_CESTDAT M13_RASH_CEONGO M13_CONJUNCT_CEOCCUR 
		M13_CONJUNCT_CESTDAT M13_OTHR_INFECT_CEOCCUR M13_OTHR_INFECT_CESTDAT M13_POST_DEL_INF_MHOCCUR_1
		M13_POST_DEL_INF_MHOCCUR_2 M13_POST_DEL_INF_MHOCCUR_4 M13_POST_DEL_INF_MHOCCUR_5 M13_POST_DEL_INF_MHOCCUR_8
		M13_POST_DEL_INF_MHOCCUR_10 M13_POST_DEL_INF_MHOCCUR_11 M13_POST_DEL_INF_MHOCCUR_77 M13_POST_DEL_INF_MHOCCUR_99
		M13_POST_DEL_INF_SRCE_1 M13_SARI_CESTDAT M13_COVID_SRCE_1 M13_COVID_SRCE_3 M13_COVID_LBPERF 
		M13_COVID_LBDAT M13_CHEST_IMAGE_PROCCUR_3 M13_CHEST_IMAGE_PROCCUR_99 M13_CHEST_IMAGE_PRSTDAT 
		M13_COVID_CONTACT_YN M13_MALARIA_MHOCCUR M13_MALARIA_SRCE_3 M13_HIV_MHOCCUR M13_HIV_MHSTDAT 
		M13_HIV_CMOCCUR M13_HIV_CMTRT_2 M13_HIV_CMTRT_3 M13_HIV_CMTRT_4 M13_HIV_CMTRT_5 M13_HIV_CMTRT_6 
		M13_HIV_CMTRT_7 M13_HIV_CMTRT_10 M13_HIV_CMTRT_13 M13_HIV_CMTRT_15 M13_HIV_CMTRT_17 M13_HIV_CMTRT_18 
		M13_HIV_CMTRT_20 M13_HIV_CMTRT_22 M13_HIV_CMTRT_99 M13_HIV_SPFY_CMTRT M13_HIV_SRCE_1 M13_HIV_SRCE_2 
		M13_BIRTH_COMPL_MHTERM_1 M13_BIRTH_COMPL_MHTERM_3 M13_BIRTH_COMPL_MHTERM_4 M13_BIRTH_COMPL_MHTERM_7 
		M13_BIRTH_COMPL_SRCE_1 M13_BIRTH_COMPL_SRCE_2 M13_ORG_FAIL_MHOCCUR_1 M13_ORG_FAIL_MHOCCUR_2 
		M13_ORG_FAIL_MHOCCUR_4 M13_ORG_FAIL_MHOCCUR_99 M13_ORG_FAIL_MHTERM M13_ORG_FAIL_SRCE_2 M13_PULM_EDEMA_SRCE_1
		M13_PULM_EDEMA_SRCE_2 M13_PULM_EDEMA_SRCE_3 M13_STROKE_MHOCCUR M13_STROKE_MHSTDAT 
		M13_OTHR_ISSUE_MHTERM M13_OTHR_ISSUE_SRCE_1 M13_OTHR_ISSUE_SRCE_2 M13_ADMIT_ABX_CMTRT_1 
		M13_ADMIT_ABX_CMTRT_2 M13_ADMIT_ABX_CMTRT_4 M13_ADMIT_ABX_CMTRT_5 M13_ADMIT_ABX_CMTRT_7 
		M13_ADMIT_ABX_CMINDC M13_ADMIT_ABX_CMSTDAT M13_FOLIC_ACID_CMOCCUR M13_IRON_CMOCCUR M13_CALCIUM_CMOCCUR 
		M13_VITAMIN_CMOCCUR M13_ZINC_CMOCCUR M13_OTHR_NUTR_CMOCCUR M13_PREP_CMOCCUR M13_ANTIPYRETIC_CMOCCUR 
		M13_ANTIPYRETIC_CMTRT_3 M13_ANTIPYRETIC_CMTRT_99 M13_ANTIPYRETIC_SPFY_CMTRT M13_ADMIT_MEDS_OTHR_CMOCCUR 
		M13_ADMIT_MEDD_OTHR_CMINDC M13_CARE_OHOLOC M13_CARE_OTHR_SPFY_OHOLOC M13_METHOD_FP_FAORRES M13_FP_NOMETHOD_FAORRES
		M13_FP_LEAVE_FAORRES M13_MATERNAL_DSDECOD M13_REFERRAL_OHOLOC M13_REFERRAL_NOTACCEPT_REAS 
		M13_SUBJID M13_MAT_DDORRES M13_INFECTION_DDORRES M13_INFECTION_SPFY_DDORRES M13_OTHR_DDORRES
		M13_OTHR_SPFY_DDORRES M13_COUGH_CEONGO M13_SORETHROAT_CESTDAT M13_RUNNYNOSE_CESTDAT M13_NOSEBLEED_CESTDAT 
		M13_MYALGIA_CEOCCUR M13_MYALGIA_CESTDAT M13_MYALGIA_CEONGO M13_ACHE_JOINTS_CEONGO M13_RASH_CEOCCUR 
		M13_CONJUNCT_CEONGO M13_OTHR_INFECT_SPFY_CETERM M13_OTHR_INFECT_CEONGO M13_POST_DEL_INF_MHOCCUR_3 
		M13_POST_DEL_INF_MHOCCUR_6 M13_POST_DEL_INF_MHOCCUR_7 M13_POST_DEL_INF_MHOCCUR_9 
		M13_POST_DEL_INF_MHSTDAT M13_POST_DEL_INF_SRCE_2 M13_POST_DEL_INF_SRCE_3 M13_SARI_CEOCCUR M13_COVID_SRCE_2
		M13_COVID_FAMETHOD M13_CHEST_IMAGE_PROCCUR_1 M13_CHEST_IMAGE_PROCCUR_2 M13_CHEST_IMAGE_PROCCUR_77 
		M13_COVID_CONTACT_DAT M13_MALARIA_MHSTDAT M13_MALARIA_FAMETHOD M13_MALARIA_SRCE_1 M13_MALARIA_SRCE_2 
		M13_HIV_CMTRT_1 M13_HIV_CMTRT_8 M13_HIV_CMTRT_9 M13_HIV_CMTRT_11 M13_HIV_CMTRT_12 M13_HIV_CMTRT_14
		M13_HIV_CMTRT_16 M13_HIV_CMTRT_19 M13_HIV_CMTRT_21 M13_HIV_CMTRT_23 M13_HIV_CMTRT_24 M13_HIV_CMTRT_25
		M13_HIV_CMTRT_88 M13_HIV_SRCE_3 M13_BIRTH_COMPL_MHTERM_2 M13_BIRTH_COMPL_MHTERM_5 M13_BIRTH_COMPL_MHTERM_6
		M13_BIRTH_COMPL_MHTERM_88 M13_BIRTH_COMPL_MHTERM_77 M13_BIRTH_COMPL_MHTERM_99 M13_BIRTH_COMPL_SPFY_MHTERM 
		M13_BIRTH_COMPL_SRCE_3 M13_ORG_FAIL_MHOCCUR_3 M13_ORG_FAIL_MHOCCUR_88 M13_ORG_FAIL_MHOCCUR_77 M13_ORG_FAIL_SRCE_1
		M13_ORG_FAIL_SRCE_3 M13_PULM_EDEMA_MHOCCUR M13_PULM_EDEMA_MHSTDAT M13_STROKE_SRCE_1 M13_STROKE_SRCE_2 
		M13_STROKE_SRCE_3 M13_OTHR_ISSUE_MHOCCUR M13_OTHR_ISSUE_MHSTDAT M13_OTHR_ISSUE_SRCE_3 M13_ADMIT_ABX_CMOCCUR 
		M13_ADMIT_ABX_CMTRT_3 M13_ADMIT_ABX_CMTRT_6 M13_ADMIT_ABX_CMTRT_88 M13_ADMIT_ABX_CMTRT_99
		M13_ADMIT_ABX_SRCE_1 M13_ADMIT_ABX_SRCE_2 M13_ADMIT_ABX_SRCE_3 M13_IFA_CMOCCOR M13_MICRONUTRIENT_CMOCCUR
		M13_ORAL_REHYD_CMOCCUR M13_ANTHELMINTHIC_CMOCCUR M13_ANTIPYRETIC_CMTRT_1 M13_ANTIPYRETIC_CMTRT_2 
		M13_ANTIPYRETIC_CMTRT_88 M13_ANTICONV_CMOCCUR M13_ANTICONV_CMTRT M13_CARE_OHOYN M13_CARE_HOME_SPFY_OHOLOC 
		M13_HOSP_LAST_VISIT_OHOOCCUR M13_METHOD_FP_SPFY_FAORRES M13_METHOD_FP_SPFY2_FAORRES M13_REFERRAL_PROCCUR 
		M13_REFFERRAL_REASND M13_COYN M13_MAT_DEATH_DTHDAT M13_BIRTH_COMP_DDORRES M13_BIRTH_COMP_SPFY_DDORRES siten / list missing;
*Vars NOT in DD and were dropped;
/*tables 
		M13_ROW_VERSION M13_formId M13_formtitle M13__id M13_buildId M13_buildChannel M13_deviceId M13_groupId M13_Loc_home_latitude
		M13_Loc_home_longitude M13_Loc_home_accuracy M13_Fac_Spec_region M13_Fac_Spec_region_parent M13_Fac_Spec_region_label 
		M13_Fac_Spec_region_id M13_Fac_Spec_region_level M13_Fac_Spec_region_dcnt M13_Fac_Spec_location 
		M13_Fac_Spec_location_parent M13_Fac_Spec_location_label M13_Fac_Spec_location_id M13_Fac_Spec_location_level 
		M13_Fac_Spec_location_dcnt M13_Fac_Spec_facility M13_Fac_Spec_facility_parent 
		M13_Fac_Spec_facility_label M13_Fac_Spec_facility_id M13_Fac_Spec_facility_level M13_Fac_Spec_facility_dcnt
		M13_VISIT_FAC_OBSLOC_region M13_VISIT_FAC_OBSLOC_region_id M13_VISIT_FAC_OBSLOC_region_dcnt 
		M13_VISIT_FAC_OBSLOC_location M13_VISIT_FAC_OBSLOC_location_id M13_VISIT_FAC_OBSLOC_loc_dcnt 
		M13_VISIT_FAC_OBSLOC_facility M13_VISIT_FAC_OBSLOC_facility_id M13_VISIT_FAC_OBSLOC_fac_dcnt 
		M13_VISIT_OBSLOC_Region_dcnt M13_VISIT_OBSLOC_District_dcnt M13_VISIT_OBSLOC_Type_dcnt
		M13_VISIT_FAC_OBSLOC_reg_parent M13_VISIT_FAC_OBSLOC_reg_label M13_VISIT_FAC_OBSLOC_reg_level M13_VISIT_FAC_OBSLOC_loc_parent 
		M13_VISIT_FAC_OBSLOC_loc_label M13_VISIT_FAC_OBSLOC_loc_level M13_VISIT_FAC_OBSLOC_fac_parent M13_VISIT_FAC_OBSLOC_fac_label 
		M13_VISIT_FAC_OBSLOC_fac_level M13_BP_Dir M13_BP_AVG M13_fever_ M13_id M13_diagnBox1 M13_diagnBox2 M13_medsother2 M13_FP_NOMETHOD_SPFY_FAORRES 
		M13_ancovConsentVersion M13_COVID_DOSE1_CMSTDAT_YN M13_COVID_DOSE1_CMSTDAT M13_COVID_DOSE2_LSTVISIT_CMOCCUR M13_COVID_DOSE2_CMTRT 
		M13_COVID_DOSE2_SPFY_CMTRT M13_COVID_DOSE2_CMSTDAT M13_ANTIPYRETIC_CMINDC M13_Int_Loc M13_Loc_other M13_del_DoA M13_del_ToA M13_Vis_time 
		M13_Temp_avail M13_Meth_spec M13_RR_rec M13_BP_Dia1  M13_medsother M13_prismaContentVersion M13_COVID_DOSE1_LSTVISIT_CMOCCUR 
		M13_COVID_DOSE1_NO_SPFY M13_COVID_DOSE1_CMTRT M13_COVID_DOSE1_SPFY_CMTRT M13_COVID_DOSE1_SOURCE M13_COVID_DOSE2_NO_SPFY 
		M13_COVID_DOSE2_CMSTDAT_YN M13_COVID_DOSE2_SOURCE M13_Int_date M13_Vis_status M13_Mat_stat M13_Temp_num M13_Temp_meth M13_HR_avail 
		M13_HR_rec M13_RR_avail M13_BP_avail M13_BP_Syst1 M13_BP_rec M13_time_8 M13_reminder M13_VISIT_OBSLOC_Region M13_VISIT_OBSLOC_Region_parent 
		M13_VISIT_OBSLOC_Region_label M13_VISIT_OBSLOC_Region_id M13_VISIT_OBSLOC_Region_level M13_VISIT_OBSLOC_District 
		M13_VISIT_OBSLOC_District_parent M13_VISIT_OBSLOC_District_label M13_VISIT_OBSLOC_District_id M13_VISIT_OBSLOC_District_level
		M13_VISIT_OBSLOC_Type M13_VISIT_OBSLOC_Type_parent M13_VISIT_OBSLOC_Type_label M13_VISIT_OBSLOC_Type_id M13_VISIT_OBSLOC_Type_level
		M13_VISIT_OBSLOC_Type_locType M13_VISIT_OBSLOC_Village_or_Fac M13_INTV_DSDECOD M13_INTV_DSSTERM M13_MOTHER_ADDRESS_CHANGE_YN
		M13_MOTHER_VILLAGE_SCORRES M13_MOTHER_CONTACT_CHANGE_YN M13_f_COVID_DOSE1_CMSTDAT M13_VISIT_VILLAGE_OBSLOC M13_VISIT_Loc_other_OHOLOC
		M13_VISIT_OBSLOC_Vil_or_Fac_pa M13_VISIT_OBSLOC_Vil_or_Fac_la M13_VISIT_OBSLOC_Vil_or_Fac_id M13_VISIT_OBSLOC_Vil_or_Fac_le
		M13_VISIT_OBSLOC_Vil_or_Fac_dC M13_intro M13_final / list missing; */
run;

*Output MN13 datasets;
proc sort data=mnh13 out=mnh.mnh13; by caseid participantid; run;


**MNH14: Maternal PNC Labs**;

*Macro to import CSV files forms and merge together split into muliple files*;
%impmerge(sitename=kenya, form=mnh14, tabname=mnh_maternal_lab_pnc, tabnum=1, othertab1=, othertab2=, format=);
%impmerge(sitename=ghana, form=mnh14, tabname=mnh_maternal_lab_pnc, tabnum=1, othertab1=mnh_maternal_lab_pnc, othertab2=, format=);

*Set datasets from each site and create site indicator;
data mnh14_char;
set mnh14_kenya (in=inken) mnh14_ghana (in=ingha);
if caseid="**********" then delete;
label 
		SUBJID="SUBJID"
		VISIT_OBSSTDAT="Date of specimen collection"
		VISIT_OBSLOC="Location of specimen collection"
		/*VISIT_FAC_OBSLOC="Specify name of facility"
		VISIT_GPS_OBSLOC="Record GPS Coordinates"*/
		VISIT_FAC_SPFY_OBSLOC="Specify other location"
		ANC_N_VISIT="Indicate PNC visit when specimens were collected"
		HB_POC_SPCPERF="Was a specimen collected for hemoglobin (Hb) testing?"
		HB_POC_LBPERF="Are Hb results available?"
		HB_POC_LBORRES="Hb result"
		/*TESTS_OTH_SPCPERF="Was a specimen collected to perform any of the following tests?"*/
		RBC_LBPERF="Is RBC Transketolase activity result available?"
		RBC_LBORRES="RBC Transketolase activity results"
		THIAM_LBPERF="Is Thiamine pyrophosphate (Vitamin B1) result available?"
		THIAM_LBORRESU="Specify units for Thiamine pyrophosphate (Vitamin B1) test result"
		THIAM_ugdl_LBORRES="Thiamine pyrophosphate (Vitamin B1) test results"
		THIAM_nmoll_LBORRES="Thiamine pyrophosphate (Vitamin B1) test results"
		VITB12_LBPERF="Is Vitamin B12 result available?"
		VITB12_LBORRESU="Specify units for Vitamin B12"
		VITB12_ngml_LBORRES="Vitamin B12 result "
		VITB12_pmoll_LBORRES="Vitamin B12 result   "
		/*FOLATE_LBPERF="Is folate result available?"
		FOLATE_LBMETHOD="What was the folate test done on?"
		FOLATE_LBORRESU="Specify units for Folate"
		FOLATE_PLASMA_NGML_LBORRES="Folate result (Blood plasma)"
		FOLATE_PLASMA_NMOLL_LBORRES="Folate result (Blood plasma)"
		FOLATE_RBC_NGML_LBORRES="Folate result (RBC)"
		FOLATE_RBC_NMOLL_LBORRES="Folate result (RBC)"
		FERRITIN_LBPERF="Is ferritin result available?"
		FERRITIN_LBORRES="Ferritin result"*/
		HIV_SPCPERF="Was specimen collected for HIV testing?"
		HIV_LBPERF="Are HIV test results available?"
		HIV_LBORRES="HIV result"
		HIV_VLOAD_SPCPERF="Was specimen collected to perform viral load?"
		HIV_VLOAD_LBPERF="Are viral load results available?"
		HIV_VLOAD_LBORRES="Viral load"
		TB_SCRN_SPCPERF="Was specimen collected for TB screening?"
		TB_SCRN_LBPERF="Are TB screening test results available?"
		TB_SCRN_LBORRES="TB screening test results"
		TB_CNFRM_SPCPERF="Was specimen collected for TB confirmation test?"
		TB_CNFRM_LBPERF="Are TB confirmation test results available?"
		TB_CNFRM_LBTEST="Specify which TB confirmation test was used"
		TB_CNFRM_LBORRES="TB confirmation test results"
		MALARIA_SPCPERF="Was specimen collected to perform malaria test?"
		MALARIA_LBPERF="Are malaria test results available?"
		MALARIA_LBORRES="Malaria test results"
		SYPH_SPCPERF="Was specimen collected for syphilis screening test?"
		SYPH_LBPERF="Are syphilis results avaialable "
		SYPH_LBTEST="Type of syphilis test"
		SYPH_SPFY_LBTEST="Specify other type of syphilis test"
		SYPH_LBORRES="Syphilis screening result"
		HEPB_SPCPERF="Was a specimen collected to perform Hepatitis B test (HBsAG)?"
		HEPB_LBPERF="Are Hepatitis B test results available (HBsAG)?"
		HEPB_LBORRES="Hepatitis B test results"
		HEPC_SPCPERF="Was a specimen collected to perform Hepatitis C (HCV) test?"
		HEPC_LBPERF="Are Hepatitis C (HCV) test results available?"
		HEPC_LBORRES="Hepatitis C test results"
		UA_SPCPERF="Was a specimen collected for any type of urinalysis testing?"
		/*UA_LBTEST="Type of urinalysis test(s) to be performed?"*/
		UA_DIP_LBPERF="Is bacteriuria result available?"
		UA_DIP_LBORRES="Dipstick test for bacteriuria result"
		UA_PROT_LBPERF="Is protienuria result available?"
		UA_PROT_LBORRES="Protienuria result"
		UA_WBC_LBPERF="Is WBC result available?"
		UA_WBC_LBORRES="WBC result"
		UA_NITRITE_LBPERF="Is nitrite result available?"
		UA_NITRITE_LBORRES="Nitrites result"
		UA_LEUK_LBPERF="Is leukocyte esterase result available?"
		UA_LEUK_LBORRES="Leukocyte esterase result"
		/*UA_QA_BAC_LBPERF="Is qualitative bacteria result available?"*/
		UA_QA_BAC_LBORRES="Bacteria result "
		UA_QT_BAC_LBPERF="Is quantitative bacteria result available?"
		UA_QT_BAC_LBORRES="Bacteria result (numerical)"
		UA_GLUC_LBPERF="Is glucose result available?"
		UA_GLUC_LBORRES="Glucose result"
		UA_KET_LBPERF="Is ketone result available?"
		UA_KET_LBORRES="Ketones result"
		STOOL_SPCPERF="Was stool collected for ova or parasite examination?"
		STOOL_LBPERF="Are results available for the ova/parasite stool examination?"
		/*STOOL_LBORRES="Findings of stool examination"*/
		STOOL_SPFY_LBORRES="Specify other findings from stool examiniation"
		COYN="Would you like to record any additional comments about this visit?"
		/*COVAL="Record comments"*/
		/*FORMCOMPLID="Record indentifier of person completing this form, as appropriate for your site (e.g., Name, initials, ID, or code)"*/
		;
rename  anc_n_visit=pnc_n_visit
		VISIT_FAC_OBSLOC_region_parent=VISIT_FAC_OBSLOC_reg_parent
		VISIT_FAC_OBSLOC_region_label=VISIT_FAC_OBSLOC_reg_label
		VISIT_FAC_OBSLOC_region_level=VISIT_FAC_OBSLOC_reg_level
		VISIT_OBSLOC_Type_locationType=VISIT_OBSLOC_Type_locType
		VISIT_OBSLOC_Village_or_Facility=VISIT_OBSLOC_Village_or_Fac;
*Site number for reports*;
if inken then siten=3;
else if ingha then siten=2;
drop 
		VISIT_FAC_OBSLOC_region_descenda VISIT_FAC_OBSLOC_location_parent VISIT_FAC_OBSLOC_location_label
		VISIT_FAC_OBSLOC_location_level VISIT_FAC_OBSLOC_location_descen VISIT_FAC_OBSLOC_facility_parent
		VISIT_FAC_OBSLOC_facility_label VISIT_FAC_OBSLOC_facility_level VISIT_FAC_OBSLOC_facility_descen
		VISIT_OBSLOC_Region_descendantsC VISIT_OBSLOC_District_descendant VISIT_OBSLOC_Type_descendantsCou;
run;

*Convert to numeric (continuous, check one and date variables - Dates contain text NA, Check one contain NA and SKIPPED)*;
%char2num(inputdsn=mnh14_char, outputdsn=mnh14_num, excludevars=);

**Add prefix of M14_;
%varprefix(dset=mnh14_num, prefix=M14_, keepname="caseid" "participantid" "eventid" "eventformid" "siten")

proc contents data=mnh14_num order=varnum; run;
proc freq data=mnh14_num; tables _char_; run;
proc sort data=mnh14_num out=mnh.mnh14; by caseid participantid; run;


*MNH14T: Maternal Lab PNC Trailing*;

*Macro to import CSV files forms and merge together split into muliple files*;
%impmerge(sitename=kenya, form=mnh14T, tabname=mnh14_maternal_lab_pnc_trailing, tabnum=1, othertab1=, othertab2=, format=);
*Set datasets from each site and create site indicator;
data mnh14T_char;
set mnh14T_kenya (in=inken);
if caseid="**********" then delete;
*Site number for reports*;
if inken then siten=3;
/*else if ingha then siten=2;*/
run;
*Convert to numeric (continuous, check one and date variables - Dates contain text NA, Check one contain NA and SKIPPED)*;
%char2num(inputdsn=mnh14T_char, outputdsn=mnh14T_num, excludevars=);

**Add prefix of M14_;
%varprefix(dset=mnh14T_num, prefix=M14T_, keepname="caseid" "participantid" "eventid" "eventformid" "siten")

proc contents data=mnh14T_num order=varnum; run;
proc freq data=mnh14T_num; tables _char_; run;
proc sort data=mnh14T_num out=mnh.mnh14T; by caseid participantid; run;



**MNH15: Neonatal PNC Clinical Status**;

*Macro to import CSV files forms and merge together split into muliple files*;
%impmerge(sitename=kenya, form=mnh15, tabname=mnh_neonatal_clinical_status_pnc, tabnum=2, othertab1=, othertab2=, format=);
%impmerge(sitename=ghana, form=mnh15, tabname=mnh_neonatal_clinical_status_pnc, tabnum=2, othertab1=mnh_neonatal_clinical_status_pnc, othertab2=, format=);

*Rename Ghana variables that were imported in as "VarXX";
data mnh15_ghana_renamed;
set mnh15_ghana;
rename
		var39=VISIT_OBSLOC_Vil_or_Fac_pa
		var40=VISIT_OBSLOC_Vil_or_Fac_la
		var41=VISIT_OBSLOC_Vil_or_Fac_id
		var42=VISIT_OBSLOC_Vil_or_Fac_le
		var43=VISIT_OBSLOC_Vil_or_Fac_dC;
run;

*Set datasets from each site and create site indicator;
data mnh15_char;
length INFANT_FOODS_SPFY_FAORRES $35.
ANTIPYR_SPFY_CMTRT $16
ADMIT_FAC_SPFY_OBSLOC $25;
set mnh15_kenya (in=inken) mnh15_ghana_renamed (in=ingha);
if caseid="**********" then delete;
*Site number for reports*;
if inken then siten=3;
else if ingha then siten=2;
*Rename variables > 32 characters;
rename	VISIT_FAC_OBSLOC_region_descenda = VISIT_FAC_OBSLOC_region_dcnt
		VISIT_FAC_OBSLOC_location_descen  = VISIT_FAC_OBSLOC_loc_dcnt
		VISIT_FAC_OBSLOC_facility_descen  = VISIT_FAC_OBSLOC_fac_dcnt
		VISIT_OBSLOC_Region_descendantsC  = VISIT_OBSLOC_Region_dcnt
		VISIT_OBSLOC_District_descendant  = VISIT_OBSLOC_District_dcnt
		VISIT_OBSLOC_Type_descendantsCou = VISIT_OBSLOC_Type_dcnt
		VISIT_FAC_OBSLOC_region_parent=VISIT_FAC_OBSLOC_reg_parent
		VISIT_FAC_OBSLOC_region_label=VISIT_FAC_OBSLOC_reg_label
		VISIT_FAC_OBSLOC_region_level=VISIT_FAC_OBSLOC_reg_level
		VISIT_FAC_OBSLOC_location_parent=VISIT_FAC_OBSLOC_loc_parent
		VISIT_FAC_OBSLOC_location_label=VISIT_FAC_OBSLOC_loc_label
		VISIT_FAC_OBSLOC_location_level=VISIT_FAC_OBSLOC_loc_level
		VISIT_FAC_OBSLOC_facility_parent=VISIT_FAC_OBSLOC_fac_parent
		VISIT_FAC_OBSLOC_facility_label=VISIT_FAC_OBSLOC_fac_label
		VISIT_FAC_OBSLOC_facility_level=VISIT_FAC_OBSLOC_fac_level
		NOT_BRSTFEED_EXCL_SPFY_FAORRES=NOT_BRSTFD_EXCL_SPFY_FAORRES
		VISIT_OBSLOC_Type_locationType=VISIT_OBSLOC_Type_locType
		VISIT_OBSLOC_Village_or_Facility=VISIT_OBSLOC_Village_or_Fac;
run;


*Convert to numeric (continuous, check one and date variables - Dates contain text NA, Check one contain NA and SKIPPED)*;
%char2num(inputdsn=mnh15_char, outputdsn=mnh15_num, excludevars=infant_dthtim);
proc contents data=mnh15_num order=varnum; run;
proc freq data=mnh15_num; tables _char_; run;


*Set datasets from each site and create site indicator;
data mnh15;
set mnh15_num ;
label
		VISIT_OBSSTDAT="Interview Date"
		VISIT_OBSLOC="Interview Location"
		/*VISIT_FAC_OBSLOC="Specify name of facility"*/
		/*VISIT_GPS_OBSLOC="Record GPS coordinates"*/
		VISIT_FAC_SPFY_OBSLOC="Specify location"
		PNC_N_VISIT="Timing of visit"
		MULT_BIRTH_RPORRES="Is this a multiple birth?"
		BIRTH_ORDER_RPORRES="Specify infant's birth order"
		NEONATAL_ST_DSTERM="Neonatal status at the time of visit"
		MAX_TEMP_VSSTAT="Was temperature recorded?"
		MAX_TEMP_VSORRES="Record  temperature"
		MAX_TEMP_PEMETHOD="Method for taking temperature"
		MAX_TEMP_SPFY_PEMETHOD="Specify other method"
		HR_VSSTAT="Was heart rate recorded?"
		HR_VSORRES="Record heart rate"
		RR_VSSTAT="Was respiratory rate recorded?"
		RR_VSORRES="Record respiratory rate"
		PULSEOX_VSSTAT="Was pulse oximetry (O2 saturation) recorded?"
		PULSEOX_VSORRES="Record O2 saturation"
		WEIGHT_PEPERF="Was weight recorded?"
		WEIGHT_PERES="Record weight"
		LENGTH_PEPERF="Was length recorded?"
		LENGTH_PERES="Record length"
		HEAD_CIRC_PEPERF="Was head circumference measured?"
		HEAD_CIRC_PERES="Head circumference"
		MUAC_PEPERF="Was Mid-Upper Arm Circumference measured?"
		MUAC_PERES="Record MUAC"
		BRSTFEED_EXCL_FAORRES="Is the infant exclusively breastfed? "
		/*NOT_BRSTFEED_EXCL_FAORRES="Reasons infant is not exclusively breastfed"*/
		NOT_BRSTFD_EXCL_SPFY_FAORRES="Specify other reason"
		/*INFANT_FOODS_FAORRES="Specify all foods and liquids the infant has received "*/
		INFANT_FOODS_SPFY_FAORRES="Specify other food"
		INFANT_SPFY_CETERM="Specify other signs/symptoms"
		INFANT_CESTDAT="How many days ago did these symptoms begin? Provide best estimate."
		/*INFANT_MHTERM="Was infant diagnosed with any of the following illnesses/conditions since the last visit? "*/
		INFANT_SPFY_MHTERM="Specify other illnesses"
		ORAL_ANTIBX_CMOCCUR="Has the infant taken oral antibiotics since the last study visit (including this visit)? "
		/*ORAL_ANTIBX_CMTRT="Specify type of oral antibiotic"*/
		ORAL_ANTIBX_SPFY_CMTRT="Specify other oral antibiotic"
		ORAL_ANTIBX_CMINDC="Specify indication"
		ORAL_ANTIBX_CMSTDAT="Date of first dose"
		/*ORAL_ANTIBX_SRCE="Data source for oral antibiotic information "*/
		IV_IM_ANTIBX_CMOCCUR="Has infant taken IV/IM antibiotics since the last study visit (including this visit)? "
		/*IV_IM_ANTIBX_CMTRT="Specify type of IV/IM antibiotic "*/
		IV_IM_ANTIBX_SPFY_CMTRT="Specify other antibiotic"
		IV_IM_ANTIBX_CMINDC="Specify indication"
		IV_IM_ANTIBX_SPFY_CMINDC="Specify other indication"
		IV_IM_ANTIBX_CMSTDAT="Date of first dose"
		/*IV_IM_ANTIBX_SRCE="Data source for IV/IM antibiotic information "*/
		FOLIC_CMOCCUR="Folic acid"
		IRON_CMOCCUR="Iron"
		IFA_CMOCCUR="Iron-folic acid (IFA)"
		VITA_CMOCCUR="Vitamin A"
		ZINC_CMOCCUR="Zinc"
		MMN_CMOCCUR="Multiple micronutrient (MMN) supplements"
		OTHR_NUTR_SUPP_CMOCCUR="Other nutritional supplements"
		OTHR_NUTR_SUPP_CMTRT="Specify other nutritional supplements"
		ORAL_REHYD_CMOCCUR="Oral rehydration solution"
		ANTHEL_CMOCCUR="Anthelminthic treatment"
		ANTIPYR_CMOCCUR="Has the infant taken any type of antipyretic in the last two weeks? "
		ANTIPYR_CMINDC="Specify reason "
		/*ANTIPYR_CMTRT="Specify antipyretic "*/
		ANTIPYR_SPFY_CMTRT="Specify other antipyretic"
		ANTICONV_CMOCCUR="Has the infant taken anticonvulsants (anti-epileptics) in the last two weeks? "
		ANTICONV_SPFY_CMTRT="Specify type of anticonvulsant"
		OTHR_MEDS_CMOCCUR="Has the infant taken any other medications, supplements, or treatments in the last two weeks?"
		OTHR_MEDS_CMINDC="Specify reason"
		OTHR_MEDS_SPFY_CMTRT="Specify medication, supplement, or treatment"
		CARE_OHOYN="Did the infant receive care or treament for an unexpected medical issue since the last study visit? Do not include routine postnatal care such as vaccinations or growth monitoring."
		CARE_OHOREAS="Specify reason for care"
		CARE_OBSLOC="Where did the infant receive care?"
		CARE_FAC_SPFY_OBSLOC="Specify name of facility"
		CARE_WHO_OHOTERM="Specify who provided care/treatment"
		CARE_OHOTERM="Specify where care was received or who provided treatment"
		ADMIT_OHOYN="Was the infant hospitalized for this medical issue?"
		ADMIT_FAC_SPFY_OBSLOC="Specify facility"
		NEONATAL_EN_DSTERM="What was the infant's status at the end of visit?"
		INFANT_REFERRAL_OHOOCCUR="Was the infant referred for care?"
		INFANT_REFERRAL_OBSLOC="Specify where infant was referred"
		INFANT_REFERRAL_OHOREAS="Specify reason"
		INFANT_DTHDAT="Date of death"
		INFANT_DTHTIM="Time of death"
		INFANT_DDORRES="Primary cause of death"
		INFANT_SPFY_DDORRES="Specify reason"
		COYN="Would you like to record any additional comments about this visit?"
		/*COVAL="Record comments"*/
		/*FORMCOMPLID="Record indentifier of person completing this form, as appropriate for your site (e.g., Name, initials, ID, or code)"*/
		NOT_BRSTFEED_EXCL_FAORRES_1="Reasons infant is not exclusively breastfed: Maternal illness"
		NOT_BRSTFEED_EXCL_FAORRES_2="Reasons infant is not exclusively breastfed: Maternal death or absence"
		NOT_BRSTFEED_EXCL_FAORRES_3="Reasons infant is not exclusively breastfed: Infant's illness"
		NOT_BRSTFEED_EXCL_FAORRES_4="Reasons infant is not exclusively breastfed: Congenital malformation (cleft lip/palate)"
		NOT_BRSTFEED_EXCL_FAORRES_5="Reasons infant is not exclusively breastfed: PMTCT"
		NOT_BRSTFEED_EXCL_FAORRES_6="Reasons infant is not exclusively breastfed: Breast/nipple problem"
		NOT_BRSTFEED_EXCL_FAORRES_7="Reasons infant is not exclusively breastfed: Interference from family or health provider"
		NOT_BRSTFEED_EXCL_FAORRES_8="Reasons infant is not exclusively breastfed: Maternal preference"
		NOT_BRSTFEED_EXCL_FAORRES_9="Reasons infant is not exclusively breastfed: Infant greater than 6 months"
		NOT_BRSTFEED_EXCL_FAORRES_88="Reasons infant is not exclusively breastfed: Other"
		INFANT_FOODS_FAORRES_1="Specify all foods and liquids the infant has received: Breastmilk"
		INFANT_FOODS_FAORRES_2="Specify all foods and liquids the infant has received: Formula" 
		INFANT_FOODS_FAORRES_3="Specify all foods and liquids the infant has received: Cow's milk" 
		INFANT_FOODS_FAORRES_4="Specify all foods and liquids the infant has received: Water"
		INFANT_FOODS_FAORRES_5="Specify all foods and liquids the infant has received: Gruel/porridge"
		INFANT_FOODS_FAORRES_88="Specify all foods and liquids the infant has received: Other"
		INFANT_CETERM_1="Infant currently has signs/symptoms of infection: Fever (>= 38.0C if measured)"
		INFANT_CETERM_2="Infant currently has signs/symptoms of infection: Hypothermia (< 35.5 C if measured)"
		INFANT_CETERM_3="Infant currently has signs/symptoms of infection: Fast breathing (respiratory rate >= 60 bpm if measured)"
		INFANT_CETERM_4="Infant currently has signs/symptoms of infection: Severe chest in-drawing"
		INFANT_CETERM_5="Infant currently has signs/symptoms of infection: Grunting or nasal flaring/retractions"
		INFANT_CETERM_6="Infant currently has signs/symptoms of infection: Apnea (pauses and interruptions in breathing) or bradypnea"
		INFANT_CETERM_7="Infant currently has signs/symptoms of infection: Severe jaundice"
		INFANT_CETERM_8="Infant currently has signs/symptoms of infection: Convulsions"
		INFANT_CETERM_9="Infant currently has signs/symptoms of infection: No movement at all or only with stimulation"
		INFANT_CETERM_10="Infant currently has signs/symptoms of infection: Feeding poorly or not feeding at all"
		INFANT_CETERM_11="Infant currently has signs/symptoms of infection: Severe vomiting/vomiting everything"
		INFANT_CETERM_12="Infant currently has signs/symptoms of infection: Umbilical redness and swelling to the abdomen/skin" 
		INFANT_CETERM_13="Infant currently has signs/symptoms of infection: Umbilicus draining pus"
		INFANT_CETERM_14="Infant currently has signs/symptoms of infection: More than 10 skin pustules or bullae" 
		INFANT_CETERM_15="Infant currently has signs/symptoms of infection: Eyes swollen and draining pus"
		INFANT_CETERM_16="Infant currently has signs/symptoms of infection: Bulging fontanelle"
		INFANT_CETERM_17="Infant currently has signs/symptoms of infection: Diarrhea with severe dehydration" 
		INFANT_CETERM_18="Infant currently has signs/symptoms of infection: Dehydration" 
		INFANT_CETERM_88="Infant currently has signs/symptoms of infection: Other"
		INFANT_CETERM_77="Infant currently has signs/symptoms of infection: No signs of infection" 
		INFANT_CETERM_99="Infant currently has signs/symptoms of infection: Don't know"
		INFANT_MHTERM_1=" Infant diagnosed with illnesses/conditions since the last visit: Proven/possible serious bacterial infection" 
		INFANT_MHTERM_2=" Infant diagnosed with illnesses/conditions since the last visit: Pneumonia/lung infection"
		INFANT_MHTERM_3=" Infant diagnosed with illnesses/conditions since the last visit: Meningitis"
		INFANT_MHTERM_4=" Infant diagnosed with illnesses/conditions since the last visit: Pyelonephritis or kidney infection" 
		INFANT_MHTERM_5=" Infant diagnosed with illnesses/conditions since the last visit: Urinary tract infection" 
		INFANT_MHTERM_6=" Infant diagnosed with illnesses/conditions since the last visit: Omphalitis" 
		INFANT_MHTERM_7=" Infant diagnosed with illnesses/conditions since the last visit: Skin infection" 
		INFANT_MHTERM_8=" Infant diagnosed with illnesses/conditions since the last visit: Eye infection" 
		INFANT_MHTERM_9=" Infant diagnosed with illnesses/conditions since the last visit: COVID-19 infection"  
		INFANT_MHTERM_10=" Infant diagnosed with illnesses/conditions since the last visit: Neonatal sepsis" 
		INFANT_MHTERM_11=" Infant diagnosed with illnesses/conditions since the last visit: Malaria" 
		INFANT_MHTERM_12=" Infant diagnosed with illnesses/conditions since the last visit: Measles"  
		INFANT_MHTERM_13=" Infant diagnosed with illnesses/conditions since the last visit: Severe diarrhea"  
		INFANT_MHTERM_14=" Infant diagnosed with illnesses/conditions since the last visit: Dehydration" 
		INFANT_MHTERM_88=" Infant diagnosed with illnesses/conditions since the last visit: Other" 
		INFANT_MHTERM_77=" Infant diagnosed with illnesses/conditions since the last visit: No diagnoses since last visit"
		INFANT_MHTERM_99=" Infant diagnosed with illnesses/conditions since the last visit: Don't know"
		ORAL_ANTIBX_CMTRT_1="Type of oral antibiotic: Amoxicillin"
		ORAL_ANTIBX_CMTRT_2="Type of oral antibiotic: Augmentin (Amoxicillin-Clavulanate)" 
		ORAL_ANTIBX_CMTRT_3="Type of oral antibiotic: Cotrimoxazole" 
		ORAL_ANTIBX_CMTRT_4="Type of oral antibiotic: Ampicillin"
		ORAL_ANTIBX_CMTRT_5="Type of oral antibiotic: Benzylpenicillin (penicillin G)" 
		ORAL_ANTIBX_CMTRT_6="Type of oral antibiotic: Gentamicin" 
		ORAL_ANTIBX_CMTRT_7="Type of oral antibiotic: Metronidazole (Flagyl)" 
		ORAL_ANTIBX_CMTRT_8="Type of oral antibiotic: Cloxacillin" 
		ORAL_ANTIBX_CMTRT_9="Type of oral antibiotic: Azithromycin" 
		ORAL_ANTIBX_CMTRT_10="Type of oral antibiotic: Erythromycin" 
		ORAL_ANTIBX_CMTRT_11="Type of oral antibiotic: Cephalosporin (Cefazolin)" 
		ORAL_ANTIBX_CMTRT_88="Type of oral antibiotic: Other" 
		ORAL_ANTIBX_CMTRT_99="Type of oral antibiotic: Don't know"
		ORAL_ANTIBX_SRCE_1="Oral antibiotic data collection source: Maternal recall"
		ORAL_ANTIBX_SRCE_2="Oral antibiotic data collection source: Facility-based or participant-held record"
		ORAL_ANTIBX_SRCE_3="Oral antibiotic data collection source: Study assesment"
		IV_IM_ANTIBX_CMTRT_1="Specify type of IV/IM antibiotic: Ampicillin"
		IV_IM_ANTIBX_CMTRT_2="Specify type of IV/IM antibiotic: Ceftazidime" 
		IV_IM_ANTIBX_CMTRT_3="Specify type of IV/IM antibiotic: Vancomycin" 
		IV_IM_ANTIBX_CMTRT_4="Specify type of IV/IM antibiotic: Metronidazole (Flagyl)" 
		IV_IM_ANTIBX_CMTRT_5="Specify type of IV/IM antibiotic: Crystalline Penicillin" 
		IV_IM_ANTIBX_CMTRT_6="Specify type of IV/IM antibiotic: Chloramphenicol (CAF) IV" 
		IV_IM_ANTIBX_CMTRT_7="Specify type of IV/IM antibiotic: Cloxacillin IV" 
		IV_IM_ANTIBX_CMTRT_88="Specify type of IV/IM antibiotic: Other" 
		IV_IM_ANTIBX_CMTRT_99="Specify type of IV/IM antibiotic: Don't know"
		IV_IM_ANTIBX_SRCE_1="IV/IM antibiotic data collection source: Maternal recall" 
		IV_IM_ANTIBX_SRCE_2="IV/IM antibiotic data collection source: Facility-based or participant-held record" 
		IV_IM_ANTIBX_SRCE_3="IV/IM antibiotic data collection source: Study assesment"
		ANTIPYR_CMTRT_1="Specify antipyretic: Aspirin" 
		ANTIPYR_CMTRT_2="Specify antipyretic: Paracetamol/ Panadol/Acetaminophen" 
		ANTIPYR_CMTRT_3="Specify antipyretic: Ibuprofen" 
		ANTIPYR_CMTRT_88="Specify antipyretic: Other"
		caseid="Tangerine Case ID"
		participantid="Tangerine Participant ID"
		eventid="Tangerine Event ID"
		eventformid="Tangerine Form ID"
		startUnixtime="Tangerine Noted Unix Start Time"
		complete="Tangerine Noted Completion"
		SUBJID="Subject ID"
		siten="Site number for reports";
format
		MULT_BIRTH_RPORRES MUAC_PEPERF COYN yn. 
		MAX_TEMP_VSSTAT HR_VSSTAT RR_VSSTAT PULSEOX_VSSTAT WEIGHT_PEPERF LENGTH_PEPERF 
		HEAD_CIRC_PEPERF BRSTFEED_EXCL_FAORRES ORAL_ANTIBX_CMOCCUR IV_IM_ANTIBX_CMOCCUR FOLIC_CMOCCUR 
		IRON_CMOCCUR IFA_CMOCCUR VITA_CMOCCUR ZINC_CMOCCUR MMN_CMOCCUR OTHR_NUTR_SUPP_CMOCCUR 
		ORAL_REHYD_CMOCCUR ANTHEL_CMOCCUR ANTIPYR_CMOCCUR ANTICONV_CMOCCUR OTHR_MEDS_CMOCCUR 
		CARE_OHOYN ADMIT_OHOYN yndk.
		NOT_BRSTFEED_EXCL_FAORRES_1 NOT_BRSTFEED_EXCL_FAORRES_2 NOT_BRSTFEED_EXCL_FAORRES_3 
		NOT_BRSTFEED_EXCL_FAORRES_4 NOT_BRSTFEED_EXCL_FAORRES_5 NOT_BRSTFEED_EXCL_FAORRES_6 
		NOT_BRSTFEED_EXCL_FAORRES_7 NOT_BRSTFEED_EXCL_FAORRES_8 NOT_BRSTFEED_EXCL_FAORRES_9 
		NOT_BRSTFEED_EXCL_FAORRES_88 INFANT_FOODS_FAORRES_1 INFANT_FOODS_FAORRES_2 INFANT_FOODS_FAORRES_3 
		INFANT_FOODS_FAORRES_4 INFANT_FOODS_FAORRES_5 INFANT_FOODS_FAORRES_88 INFANT_CETERM_1 INFANT_CETERM_2 
		INFANT_CETERM_3 INFANT_CETERM_4 INFANT_CETERM_5 INFANT_CETERM_6 INFANT_CETERM_7 INFANT_CETERM_8 
		INFANT_CETERM_9 INFANT_CETERM_10 INFANT_CETERM_11 INFANT_CETERM_12 INFANT_CETERM_13 INFANT_CETERM_14
		INFANT_CETERM_15 INFANT_CETERM_16 INFANT_CETERM_17 INFANT_CETERM_18 INFANT_CETERM_88 INFANT_CETERM_77
		INFANT_CETERM_99 INFANT_MHTERM_1 INFANT_MHTERM_2 INFANT_MHTERM_3 INFANT_MHTERM_4 INFANT_MHTERM_5 
		INFANT_MHTERM_6 INFANT_MHTERM_7 INFANT_MHTERM_8 INFANT_MHTERM_9   INFANT_MHTERM_10 INFANT_MHTERM_11 
		INFANT_MHTERM_12 INFANT_MHTERM_13 INFANT_MHTERM_14 INFANT_MHTERM_88 INFANT_MHTERM_77 INFANT_MHTERM_99 
		ORAL_ANTIBX_CMTRT_1 ORAL_ANTIBX_CMTRT_2 ORAL_ANTIBX_CMTRT_3 ORAL_ANTIBX_CMTRT_4 ORAL_ANTIBX_CMTRT_5
		ORAL_ANTIBX_CMTRT_6 ORAL_ANTIBX_CMTRT_7 ORAL_ANTIBX_CMTRT_8 ORAL_ANTIBX_CMTRT_9 ORAL_ANTIBX_CMTRT_10 
		ORAL_ANTIBX_CMTRT_11 ORAL_ANTIBX_CMTRT_88 ORAL_ANTIBX_CMTRT_99 ORAL_ANTIBX_SRCE_1 ORAL_ANTIBX_SRCE_2 
		ORAL_ANTIBX_SRCE_3 IV_IM_ANTIBX_CMTRT_1 IV_IM_ANTIBX_CMTRT_2 IV_IM_ANTIBX_CMTRT_3 IV_IM_ANTIBX_CMTRT_4 
		IV_IM_ANTIBX_CMTRT_5 IV_IM_ANTIBX_CMTRT_6 IV_IM_ANTIBX_CMTRT_7 IV_IM_ANTIBX_CMTRT_88 IV_IM_ANTIBX_CMTRT_99 
		IV_IM_ANTIBX_SRCE_1 IV_IM_ANTIBX_SRCE_2 IV_IM_ANTIBX_SRCE_3 ANTIPYR_CMTRT_1 ANTIPYR_CMTRT_2 ANTIPYR_CMTRT_3
		ANTIPYR_CMTRT_88 ckall. 
		NEONATAL_ST_DSTERM MNH15_NEONATAL_ST_DSTERM.
		INFANT_DDORRES MNH15_INFANT_DDORRES.
		VISIT_OBSLOC CARE_OBSLOC MNH15_VISIT_OBSLOC.
		BIRTH_ORDER_RPORRES MNH15_BIRTH_ORDER_RPORRES.
		MAX_TEMP_PEMETHOD MNH15_MAX_TEMP_PEMETHOD.
		NEONATAL_EN_DSTERM MNH15_NEONATAL_EN_DSTERM.
		PNC_N_VISIT MNH15_PNC_N_VISIT.
		ORAL_ANTIBX_CMINDC IV_IM_ANTIBX_CMINDC MNH15_SPEC_INDICATION.
		INFANT_REFERRAL_OHOOCCUR MNH15_INFANT_REFERRAL_OHOOCCUR. 
		VISIT_OBSSTDAT ORAL_ANTIBX_CMSTDAT IV_IM_ANTIBX_CMSTDAT INFANT_DTHDAT date9.; 
drop
		ROW_VERSION formId  formtitle  _id buildId buildChannel deviceId groupId introw id reminder
		ancovConsentVersion prismaContentVersion NEXT_VISDAT INFANT_DDORRES_1 INFANT_DDORRES_2 INFANT_DDORRES_3
		INFANT_DDORRES_4 INFANT_DDORRES_5 INFANT_DDORRES_6 INFANT_DDORRES_7 INFANT_DDORRES_8 
		INFANT_DDORRES_88 INFANT_DDORRES_99 VISIT_VILLAGE_OBSLOC VISIT_Loc_other_OHOLOC INTV_DSDECOD 
		INTV_DSSTERM VISIT_OBSLOC_Region VISIT_OBSLOC_Region_parent VISIT_OBSLOC_Region_label 
		VISIT_OBSLOC_Region_id VISIT_OBSLOC_Region_level VISIT_OBSLOC_District VISIT_OBSLOC_District_parent
		VISIT_OBSLOC_District_label VISIT_OBSLOC_District_id VISIT_OBSLOC_District_level VISIT_OBSLOC_Type 
		VISIT_OBSLOC_Type_parent VISIT_OBSLOC_Type_label VISIT_OBSLOC_Type_id VISIT_OBSLOC_Type_level 
		VISIT_OBSLOC_Vil_or_Fac_pa VISIT_OBSLOC_Vil_or_Fac_la VISIT_OBSLOC_Vil_or_Fac_id 
		VISIT_OBSLOC_Vil_or_Fac_le VISIT_OBSLOC_Vil_or_Fac_dC 
		VISIT_FAC_OBSLOC_region VISIT_FAC_OBSLOC_region_id VISIT_FAC_OBSLOC_location VISIT_FAC_OBSLOC_location_id  
		VISIT_FAC_OBSLOC_facility VISIT_FAC_OBSLOC_facility_id message1 message2 final
		VISIT_FAC_OBSLOC_region_dcnt VISIT_FAC_OBSLOC_loc_dcnt VISIT_FAC_OBSLOC_fac_dcnt VISIT_OBSLOC_Region_dcnt VISIT_OBSLOC_District_dcnt
		VISIT_OBSLOC_Type_dcnt VISIT_FAC_OBSLOC_reg_parent VISIT_FAC_OBSLOC_reg_label VISIT_FAC_OBSLOC_reg_level
		VISIT_FAC_OBSLOC_loc_parent VISIT_FAC_OBSLOC_loc_label VISIT_FAC_OBSLOC_loc_level VISIT_FAC_OBSLOC_fac_parent
		VISIT_FAC_OBSLOC_fac_label VISIT_FAC_OBSLOC_fac_level VISIT_OBSLOC_Type_locType VISIT_OBSLOC_Village_or_Fac; 
run;


/*ods EXCEL file="/rtpnfil03/rtpnfil03_vol5/ANCPNC_Collective/Data Monitoring and Analysis/Datasets/Documentation/Contents/mnh15contents.xlsx";
proc contents data=mnh15 order=varnum; run;
ods EXCEL close;*/


**Add prefix of M15_;
%varprefix(dset=mnh15, prefix=M15_, keepname="caseid" "participantid" "eventid" "eventformid" "siten")

proc freq data=mnh15;
*Vars in dataset and DD or useful Tangerine variables; 
tables
		M15_INFANT_FOODS_SPFY_FAORRES M15_ANTIPYR_SPFY_CMTRT M15_ADMIT_FAC_SPFY_OBSLOC caseid participantid eventid eventformid 
		M15_startUnixtime M15_complete M15_SUBJID M15_VISIT_OBSSTDAT M15_VISIT_OBSLOC M15_VISIT_FAC_SPFY_OBSLOC 
		M15_PNC_N_VISIT M15_MULT_BIRTH_RPORRES M15_BIRTH_ORDER_RPORRES M15_NEONATAL_ST_DSTERM M15_MAX_TEMP_VSSTAT 
		M15_MAX_TEMP_VSORRES M15_MAX_TEMP_PEMETHOD M15_MAX_TEMP_SPFY_PEMETHOD M15_HR_VSSTAT M15_HR_VSORRES 
		M15_RR_VSSTAT M15_RR_VSORRES M15_PULSEOX_VSSTAT M15_PULSEOX_VSORRES M15_WEIGHT_PEPERF M15_WEIGHT_PERES 
		M15_LENGTH_PEPERF M15_LENGTH_PERES M15_HEAD_CIRC_PEPERF M15_HEAD_CIRC_PERES M15_MUAC_PEPERF M15_MUAC_PERES 
		M15_BRSTFEED_EXCL_FAORRES M15_NOT_BRSTFEED_EXCL_FAORRES_1 M15_NOT_BRSTFEED_EXCL_FAORRES_2 M15_NOT_BRSTFEED_EXCL_FAORRES_3 
		M15_NOT_BRSTFEED_EXCL_FAORRES_4 M15_NOT_BRSTFEED_EXCL_FAORRES_5 M15_NOT_BRSTFEED_EXCL_FAORRES_6 
		M15_NOT_BRSTFEED_EXCL_FAORRES_7 M15_NOT_BRSTFEED_EXCL_FAORRES_8 M15_NOT_BRSTFEED_EXCL_FAORRES_9 
		M15_NOT_BRSTFEED_EXCL_FAORRES_88 M15_NOT_BRSTFD_EXCL_SPFY_FAORRES M15_INFANT_FOODS_FAORRES_1 M15_INFANT_FOODS_FAORRES_2
		M15_INFANT_FOODS_FAORRES_3 M15_INFANT_FOODS_FAORRES_4 M15_INFANT_FOODS_FAORRES_5 M15_INFANT_FOODS_FAORRES_88
		M15_INFANT_CETERM_1 M15_INFANT_CETERM_2 M15_INFANT_CETERM_3 M15_INFANT_CETERM_4 M15_INFANT_CETERM_5 M15_INFANT_CETERM_6
		M15_INFANT_CETERM_7 M15_INFANT_CETERM_8 M15_INFANT_CETERM_9 M15_INFANT_CETERM_10 M15_INFANT_CETERM_11 M15_INFANT_CETERM_12
		M15_INFANT_CETERM_13 M15_INFANT_CETERM_14 M15_INFANT_CETERM_15 M15_INFANT_CETERM_16 M15_INFANT_CETERM_17
		M15_INFANT_CETERM_18 M15_INFANT_CETERM_88 M15_INFANT_CETERM_77 M15_INFANT_CETERM_99 M15_INFANT_SPFY_CETERM
		M15_INFANT_CESTDAT M15_INFANT_MHTERM_1 M15_INFANT_MHTERM_2 M15_INFANT_MHTERM_3 M15_INFANT_MHTERM_4 M15_INFANT_MHTERM_5 
		M15_INFANT_MHTERM_6 M15_INFANT_MHTERM_7 M15_INFANT_MHTERM_8 M15_INFANT_MHTERM_9 M15_INFANT_MHTERM_10 
		M15_INFANT_MHTERM_11 M15_INFANT_MHTERM_12 M15_INFANT_MHTERM_13 M15_INFANT_MHTERM_14 M15_INFANT_MHTERM_88
		M15_INFANT_MHTERM_77 M15_INFANT_MHTERM_99 M15_INFANT_SPFY_MHTERM M15_ORAL_ANTIBX_CMOCCUR M15_ORAL_ANTIBX_CMTRT_1 
		M15_ORAL_ANTIBX_CMTRT_2 M15_ORAL_ANTIBX_CMTRT_3 M15_ORAL_ANTIBX_CMTRT_4 M15_ORAL_ANTIBX_CMTRT_5 M15_ORAL_ANTIBX_CMTRT_6
		M15_ORAL_ANTIBX_CMTRT_7 M15_ORAL_ANTIBX_CMTRT_8 M15_ORAL_ANTIBX_CMTRT_9 M15_ORAL_ANTIBX_CMTRT_10 M15_ORAL_ANTIBX_CMTRT_11
		M15_ORAL_ANTIBX_CMTRT_88 M15_ORAL_ANTIBX_CMTRT_99 M15_ORAL_ANTIBX_SPFY_CMTRT M15_ORAL_ANTIBX_CMINDC 
		M15_ORAL_ANTIBX_CMSTDAT M15_ORAL_ANTIBX_SRCE_1 M15_ORAL_ANTIBX_SRCE_2 M15_ORAL_ANTIBX_SRCE_3 M15_IV_IM_ANTIBX_CMOCCUR
		M15_IV_IM_ANTIBX_CMTRT_1 M15_IV_IM_ANTIBX_CMTRT_2 M15_IV_IM_ANTIBX_CMTRT_3 M15_IV_IM_ANTIBX_CMTRT_4
		M15_IV_IM_ANTIBX_CMTRT_5 M15_IV_IM_ANTIBX_CMTRT_6 M15_IV_IM_ANTIBX_CMTRT_7 M15_IV_IM_ANTIBX_CMTRT_88 
		M15_IV_IM_ANTIBX_CMTRT_99 M15_IV_IM_ANTIBX_SPFY_CMTRT M15_IV_IM_ANTIBX_CMINDC M15_IV_IM_ANTIBX_SPFY_CMINDC 
		M15_IV_IM_ANTIBX_CMSTDAT M15_IV_IM_ANTIBX_SRCE_1 M15_IV_IM_ANTIBX_SRCE_2 M15_IV_IM_ANTIBX_SRCE_3 
		M15_FOLIC_CMOCCUR M15_IRON_CMOCCUR M15_IFA_CMOCCUR M15_VITA_CMOCCUR M15_ZINC_CMOCCUR M15_MMN_CMOCCUR 
		M15_OTHR_NUTR_SUPP_CMOCCUR M15_OTHR_NUTR_SUPP_CMTRT M15_ORAL_REHYD_CMOCCUR M15_ANTHEL_CMOCCUR M15_ANTIPYR_CMOCCUR
		M15_ANTIPYR_CMINDC M15_ANTIPYR_CMTRT_1 M15_ANTIPYR_CMTRT_2 M15_ANTIPYR_CMTRT_3 M15_ANTIPYR_CMTRT_88 M15_ANTICONV_CMOCCUR
		M15_ANTICONV_SPFY_CMTRT M15_OTHR_MEDS_CMOCCUR M15_OTHR_MEDS_CMINDC M15_OTHR_MEDS_SPFY_CMTRT M15_CARE_OHOYN 
		M15_CARE_OHOREAS M15_CARE_OBSLOC M15_CARE_FAC_SPFY_OBSLOC M15_CARE_WHO_OHOTERM M15_CARE_OHOTERM M15_ADMIT_OHOYN 
		M15_NEONATAL_EN_DSTERM M15_INFANT_REFERRAL_OHOOCCUR M15_INFANT_REFERRAL_OBSLOC M15_INFANT_REFERRAL_OHOREAS
		M15_COYN M15_INFANT_DTHDAT M15_INFANT_DTHTIM M15_INFANT_DDORRES M15_INFANT_SPFY_DDORRES siten / list missing;
*Vars NOT in DD and dropped;
/*tables 
		M15_ROW_VERSION M15_formId M15_formtitle  M15__id M15_buildId M15_buildChannel M15_deviceId M15_groupId M15_introw M15_id M15_reminder
		M15_ancovConsentVersion M15_prismaContentVersion M15_NEXT_VISDAT M15_INFANT_DDORRES_1 M15_INFANT_DDORRES_2 M15_INFANT_DDORRES_3
		M15_INFANT_DDORRES_4 M15_INFANT_DDORRES_5 M15_INFANT_DDORRES_6 M15_INFANT_DDORRES_7 M15_INFANT_DDORRES_8 
		M15_INFANT_DDORRES_88 M15_INFANT_DDORRES_99 M15_VISIT_VILLAGE_OBSLOC M15_VISIT_Loc_other_OHOLOC M15_INTV_DSDECOD 
		M15_INTV_DSSTERM M15_VISIT_OBSLOC_Region M15_VISIT_OBSLOC_Region_parent M15_VISIT_OBSLOC_Region_label 
		M15_VISIT_OBSLOC_Region_id M15_VISIT_OBSLOC_Region_level M15_VISIT_OBSLOC_District M15_VISIT_OBSLOC_District_parent
		M15_VISIT_OBSLOC_District_label M15_VISIT_OBSLOC_District_id M15_VISIT_OBSLOC_District_level M15_VISIT_OBSLOC_Type 
		M15_VISIT_OBSLOC_Type_parent M15_VISIT_OBSLOC_Type_label M15_VISIT_OBSLOC_Type_id M15_VISIT_OBSLOC_Type_level 
		M15_VISIT_OBSLOC_Vil_or_Fac_pa M15_VISIT_OBSLOC_Vil_or_Fac_la M15_VISIT_OBSLOC_Vil_or_Fac_id 
		M15_VISIT_OBSLOC_Vil_or_Fac_le M15_VISIT_OBSLOC_Vil_or_Fac_dC 
		M15_VISIT_FAC_OBSLOC_region M15_VISIT_FAC_OBSLOC_region_id M15_VISIT_FAC_OBSLOC_location M15_VISIT_FAC_OBSLOC_location_id  
		M15_VISIT_FAC_OBSLOC_facility M15_VISIT_FAC_OBSLOC_facility_id M15_message1 M15_message2 M15_final
		M15_VISIT_FAC_OBSLOC_region_dcnt M15_VISIT_FAC_OBSLOC_loc_dcnt M15_VISIT_FAC_OBSLOC_fac_dcnt M15_VISIT_OBSLOC_Region_dcnt M15_VISIT_OBSLOC_District_dcnt
		M15_VISIT_OBSLOC_Type_dcnt M15_VISIT_FAC_OBSLOC_reg_parent M15_VISIT_FAC_OBSLOC_reg_label M15_VISIT_FAC_OBSLOC_reg_level
		M15_VISIT_FAC_OBSLOC_loc_parent M15_VISIT_FAC_OBSLOC_loc_label M15_VISIT_FAC_OBSLOC_loc_level M15_VISIT_FAC_OBSLOC_fac_parent
		M15_VISIT_FAC_OBSLOC_fac_label M15_VISIT_FAC_OBSLOC_fac_level M15_VISIT_OBSLOC_Type_locType M15_VISIT_OBSLOC_Village_or_Fac / LIST MISSING;*/
RUN;

*Output MN15 datasets;
proc sort data=mnh15 out=mnh.mnh15; by caseid participantid; run;


**MNH16: Neonatal Vaccination Status*;
%impmerge(sitename=kenya, form=mnh16, tabname=mnh_neonatal_vaccination, tabnum=1, othertab1=, othertab2=, format=);
%impmerge(sitename=ghana, form=mnh16, tabname=mnh_neonatal_vaccination, tabnum=1, othertab1=, othertab2=, format=);

data mnh16_char;
length VX_SPFY_2_OBSLOC $41
	   VX_OTHR_CMTRT $13;
set mnh16_kenya(in=inken) mnh16_ghana(in=ingha);
if caseid="**********" then delete;
*Site number for reports*;
if inken then siten=3;
else if ingha then siten=2;
*rename variables longer than 32 characters;
rename   VISIT_OBSLOC_Type_descendantsCou=VISIT_OBSLOC_Type_dCount
		 FAC_OBSLOC_region_descendantsCou=FAC_OBSLOC_reg_dCount
		 FAC_OBSLOC_location_descendantsC=FAC_OBSLOC_loc_dCount
		 FAC_OBSLOC_facility_descendantsC=FAC_OBSLOC_fac_dCount
		 VISIT_OBSLOC_Region_descendantsC=VISIT_OBSLOC_Reg_dC
		 VISIT_OBSLOC_District_descendant=VISIT_OBSLOC_Dis_d
		 VISIT_OBSLOC_Type_locationType=VISIT_OBSLOC_Type_locType
		 VISIT_OBSLOC_Village_or_Facility=VISIT_OBSLOC_Vil_or_Fac;
run;

*Convert to numeric (continuous, check one and date variables - Dates contain text NA, Check one contain NA and SKIPPED)*;
%char2num(inputdsn=mnh16_char, outputdsn=mnh16_num, excludevars=);
proc contents data=mnh16_num; run;
proc freq data=mnh16_num; tables _char_; run;


*Assign labels, formats, and drop variables not in DD;
data mnh16;
set mnh16_num ;
label
		caseid="Tangerine Case ID"
		participantid="Tangerine Participant ID"
		eventid="Tangerine Event ID"
		eventformid="Tangerine Form ID"
		startUnixtime="Tangerine Noted Unix Start Time"
		complete="Tangerine Noted Completion"
		SUBJID="Subject ID"
		siten="Site number for reports"
		OBSSTDAT="Date of visit"
		OBSLOC="Interview Location"
		/*FAC_OBSLOC="Specify name of facility "*/
		/*GPS_OBSLOC="Record GPS coordinates"*/
		FAC_SPFY_OBSLOC="Specify location"
		MULT_BIRTH_FAORRES="Is this a multiple birth?"
		BIRTH_ORDER_FAORRES="Specify infant's birth order"
		OBSTERM="Timing of visit"
		VX_LAST_CMYN="Has your child received any vaccinations since the last study visit, including today's visit? Please include vaccinations received at a health facility or as part of a national immunization campaign day. "
		VX_SPFY_OBSLOC="Specify facility"
		VX_SPFY_2_OBSLOC="Specify other location"
		VX_CARD_FAORRES="Do you have a vaccination card or other documents with you today where information is recorded about your child's vaccinations?"
		BCG_DOC_CMOCCUR="Is there documented evidence that infant has received a BCG vaccination since the last study visit, including today's visit?"
		BCG_DOC_CMSTDAT="Date BCG vaccination received"
		BCG_RCL_CMOCCUR="Ask mother: At or soon after birth, did your child receive a BCG vaccination against tuberculosis, that is, an injection in the arm or shoulder that usually causes a scar?"
		HEPB_DOC_CMOCCUR="Is there documented evidence that infant has received the Hepatitis B vaccine since the last study visit, including today's visit?"
		HEPB_DOC_CMSTDAT="Date Hepatitis B vaccination received"
		HEPB_RCL_CMOCCUR="Ask mother: At or soon after birth, did your child receive a Hepatitis B vaccination, that is, an injection in the thigh to prevent Hepatitis B?"
		HEPB_24H_RCL_CMOCCUR="Ask mother: Did your child receive the Hepatitis B vaccination within 24 hours of birth?"
		PENT_DOC_CMOCCUR="Is there documented evidence that infant has received the DPT-HEP.B-HIB (Pentavalent) vaccine since the last study visit, including today's visit?"
		PENT_1_DOC_1_CMSTDAT="Date DPT-HEP.B-HIB (Pentavalent) 1 received"
		PENT_2_DOC_CMSTDAT="Date DPT-HEP.B-HIB (Pentavalent) 2 received"
		PENT_3_DOC_CMSTDAT="Date DPT-HEP.B-HIB (Pentavalent) 3 received"
		PENT_RCL_CMOCCUR="Ask mother: Since the last study visit (including today) has your child receive the pentavalent vaccination, that is, an injection given in the thigh sometimes at the same time as the polio drops?"
		PENT_RCL_CMDOSFRQ="Ask mother: How many times did your child receive the pentavalent vaccine since the last study visit? "
		OPV_DOC_CMOCCUR="Is there documented evidence that infant has received the oral polio vaccine (OPV) since the last study visit, including today's visit?"
		OPV_0_DOC_CMSTDAT="Date of Oral polio vaccine (OPV) 0"
		OPV_1_DOC_CMSTDAT="Date of Oral polio vaccine (OPV) 1"
		OPV_2_DOC_CMSTDAT="Date of Oral polio vaccine (OPV) 2 "
		OPV_3_DOC_CMSTDAT="Date of Oral polio vaccine (OPV) 3"
		OPV_RCL_CMOCCUR="Ask mother: Since the last study visit (including today), did your child receive oral polio vaccine, that is, about two drops in the mouth to prevent polio?"
		OPV_2WK_RCL_CMOCCUR="Ask mother: Did your child receive the first oral polio vaccine at birth or in the first two weeks after birth?"
		OPV_RCL_CMDOSFRQ="Ask mother: How many times did your child receive the oral polio vaccine since the last study visit?"
		IPV_DOC_CMOCCUR="Is there documented evidence that infant has received the inactivated polio vaccine (IPV) since the last study visit, including today's visit?"
		IPV_1_DOC_CMSTDAT="Date of IPV 1"
		IPV_2_DOC_CMSTDAT="Date of IPV 2"
		IPV_RCL_CMOCCUR="Ask mother: The last time your child received the polio drops, did he/she also get an inactivated polio vaccine (IPV) injection in the arm to protect against polio?"
		PCV_DOC_CMOCCUR="Is there documented evidence that infant has received the pneumoccocal vaccine since the last study visit, including today's visit? This vaccine is sometimes called pneumoccocal conjugate or PCV."
		PCV_1_DOC_CMSTDAT="Date pneumococcal 1 received"
		PCV_2_DOC_CMSTDAT="Date pneumococcal 2 received"
		PCV_3_DOC_CMSTDAT="Date pneumococcal 3 received"
		PCV_RCL_CMOCCUR="Ask mother: Since the last study visit (including today), did your child receive the pneumococcal vaccination, that is, an injection in the thigh to prevent pneumonia?"
		PCV_RCL_CMDOSFRQ="Ask mother: How many times did your child receive the peneumococcal vaccine since the last study visit?"
		ROTO_DOC_CMOCCUR="Is there documented evidence that infant has received the rotavirus vaccine since the last study visit, including today's visit? "
		ROTO_1_DOC_CMSTDAT="Date rotavirus 1 received"
		ROTO_2_DOC_CMSTDAT="Date rotavirus 2 received"
		ROTO_3_DOC_CMSTDAT="Date rotavirus 3 received"
		ROTO_RCL_CMOCCUR="Ask mother: Since the last study visit, did your child  receive a rotavirus vaccination, that is, liquid in the mouth to prevent diarrhea?"
		ROTO_RCL_CMDOSFRQ="Ask mother: How many times did your child receive the rotavirus vaccine since the last study visit?"
		MR_DOC_CMOCCUR="Is there documented evidence that infant has received a measles-containing vaccine since the last study visit, including today's visit? This includes the measles vaccine or the measles and rubella (MR) vaccine."
		MR_DOC_CMSTDAT="Date measles-containing vaccine received"
		MR_RCL_CMDOSFRQ="Ask mother: Has your child ever received a measles vaccination, that is, an injection in the arm to prevent measles?"
		VITA_DOC_CMOCCUR="Is there documented evidence that infant has received Vitamin A supplementation since the last study visit, including today's visit? "
		VITA_1_DOC_CMSTDAT="Date Vitamin A supplementation 1 received"
		VITA_2_DOC_CMSTDAT="Date Vitamin A supplementation 2 received"
		YLW_DOC_CMOCCUR="Is there documented evidence that infant has received a yellow fever vaccine since the last study visit, including today's visit? "
		YLW_DOC_CMSTDAT="Date yellow fever vaccine received"
		RTS_DOC_CMOCCUR="Is there documented evidence that infant has received the RTS,S (malaria) vaccine since the last study visit, including today's visit? "
		RTS_1_DOC_CMSTDAT="Date RTS, S (malaria) dose 1 received"
		RTS_2_DOC_CMSTDAT="Date RTS,S (malaria) dose 2 received"
		JAP_DOC_CMOCCUR="Is there documented evidence that infant has received the Japanese encephalitis vaccine since the last study visit, including today's visit? "
		JAP_DOC_CMSTDAT="Date vaccine received"
		VX_OTHR_CMOCCUR="Is there documented evidence that infant has received any other vaccines since the last study visit, including today's visit? "
		VX_OTHR_CMTRT="Specify type of vaccine received"
		VX_OTHR_CMSTDAT="Date other vaccine received"
		COYN="Would you like to record any additional comments about this visit?"
		/*COVAL="Record comments"*/
		/*FORMCOMPLID="Record indentifier of person completing this form, as appropriate for your site (e.g., Name, initials, ID, or code)"*/
		VX_OBSLOC_1="Location child received vaccination since last study visit: Health facility "
		VX_OBSLOC_2="Location child received vaccination since last study visit: Vaccination/immunization campaign held at a location other than health facility" 
		VX_OBSLOC_88="Location child received vaccination since last study visit: Other"
		PENT_DOC_CMDOSFRQ_1="Indicate pentavalent dose(s) received since last study visit: Pentavalent 1" 
		PENT_DOC_CMDOSFRQ_2="Indicate pentavalent dose(s) received since last study visit: Pentavalent 2"
		PENT_DOC_CMDOSFRQ_3="Indicate pentavalent dose(s) received since last study visit: Pentavalent 3"
		OPV_DOC_CMDOSFRQ_1="Indicate OPV dose(s) received since last study visit: OPV 0 (birth dose)"
		OPV_DOC_CMDOSFRQ_2="Indicate OPV dose(s) received since last study visit: OPV 1" 
		OPV_DOC_CMDOSFRQ_3="Indicate OPV dose(s) received since last study visit: OPV 2" 
		OPV_DOC_CMDOSFRQ_4="Indicate OPV dose(s) received since last study visit: OPV 3"
		IPV_DOC_CMDOSFRQ_1="Indicate IPV dose(s) received since last study visit: IPV 1" 
		IPV_DOC_CMDOSFRQ_2="Indicate IPV dose(s) received since last study visit: IPV 2"
		PCV_DOC_CMDOSFRQ_1="Indicate pneumococcal dose(s) received since last study visit: Pneumococcal 1"
		PCV_DOC_CMDOSFRQ_2="Indicate pneumococcal dose(s) received since last study visit: Pneumococcal 2" 
		PCV_DOC_CMDOSFRQ_3="Indicate pneumococcal dose(s) received since last study visit: Pneumococcal 3"
		ROTO_DOC_CMDOSFRQ_1="Indicate rotavirus dose(s) received since last study visit: Rotavirus 1" 
		ROTO_DOC_CMDOSFRQ_2="Indicate rotavirus dose(s) received since last study visit: Rotavirus 2" 
		ROTO_DOC_CMDOSFRQ_3="Indicate rotavirus dose(s) received since last study visit: Rotavirus 3"
		VITA_DOC_CMDOSFRQ_1="Indicate Vitamin A supplementation dose(s) received since last study visit: Vitamin A dose 1"
		VITA_DOC_CMDOSFRQ_2="Indicate Vitamin A supplementation dose(s) received since last study visit: Vitamin A dose 2" 
		RTS_DOC_CMDOSFRQ_1="Indicate RTS,S (malaria) dose(s) received since last study visit: RTS,S dose 1"
		RTS_DOC_CMDOSFRQ_2="Indicate RTS,S (malaria) dose(s) received since last study visit: RTS,S dose 2";
format
		VX_OBSLOC_1 VX_OBSLOC_2 VX_OBSLOC_88 PENT_DOC_CMDOSFRQ_1 PENT_DOC_CMDOSFRQ_2 
		PENT_DOC_CMDOSFRQ_3 OPV_DOC_CMDOSFRQ_1 OPV_DOC_CMDOSFRQ_2 OPV_DOC_CMDOSFRQ_3 
		OPV_DOC_CMDOSFRQ_4 IPV_DOC_CMDOSFRQ_1 IPV_DOC_CMDOSFRQ_2 PCV_DOC_CMDOSFRQ_1 
		PCV_DOC_CMDOSFRQ_2 PCV_DOC_CMDOSFRQ_3 ROTO_DOC_CMDOSFRQ_1 ROTO_DOC_CMDOSFRQ_2 
		ROTO_DOC_CMDOSFRQ_3 VITA_DOC_CMDOSFRQ_1 VITA_DOC_CMDOSFRQ_2 RTS_DOC_CMDOSFRQ_1 
		RTS_DOC_CMDOSFRQ_2 ckall.
		MULT_BIRTH_FAORRES VX_CARD_FAORRES COYN yn.
		VX_LAST_CMYN BCG_RCL_CMOCCUR HEPB_RCL_CMOCCUR HEPB_24H_RCL_CMOCCUR PENT_RCL_CMOCCUR
		OPV_RCL_CMOCCUR OPV_2WK_RCL_CMOCCUR IPV_RCL_CMOCCUR PCV_RCL_CMOCCUR ROTO_RCL_CMOCCUR 
		MR_RCL_CMDOSFRQ yndk.
		BCG_DOC_CMOCCUR HEPB_DOC_CMOCCUR PENT_DOC_CMOCCUR OPV_DOC_CMOCCUR IPV_DOC_CMOCCUR
		PCV_DOC_CMOCCUR ROTO_DOC_CMOCCUR MR_DOC_CMOCCUR VITA_DOC_CMOCCUR YLW_DOC_CMOCCUR
		RTS_DOC_CMOCCUR JAP_DOC_CMOCCUR VX_OTHR_CMOCCUR ynna.
		OBSLOC MNH16_OBSLOC.
		OBSTERM MNH16_OBSTERM.;
*Drop vars not in DD;
Drop
		ROW_VERSION _id formId formTitle buildId buildChannel deviceId groupId ancovConsentVersion prismaContentVersion
		kenya intro_2 FAC_OBSLOC_region FAC_OBSLOC_region_parent FAC_OBSLOC_region_label FAC_OBSLOC_region_id
		FAC_OBSLOC_region_level FAC_OBSLOC_reg_dCount FAC_OBSLOC_location FAC_OBSLOC_location_parent FAC_OBSLOC_location_label
		FAC_OBSLOC_location_id FAC_OBSLOC_location_level FAC_OBSLOC_loc_dCount FAC_OBSLOC_facility
		FAC_OBSLOC_facility_parent FAC_OBSLOC_facility_label FAC_OBSLOC_facility_id FAC_OBSLOC_facility_level
		FAC_OBSLOC_fac_dCount VX_SPFY_OBSLOC inst bcg_table pent;

run;

/*ods EXCEL file="/rtpnfil03/rtpnfil03_vol5/ANCPNC_Collective/Data Monitoring and Analysis/Datasets/Documentation/Contents/mnh16contents.xlsx";
proc contents data=mnh16 order=varnum; run;
ods EXCEL close;*/

**Add prefix of M16_;
%varprefix(dset=mnh16, prefix=M16_, keepname="caseid" "participantid" "eventid" "eventformid" "siten")

/*
proc freq data=mnh16;
*Vars in dataset and DD or useful Tangerine variables; 
tables
 / list missing;
*Vars NOT in DD and dropped;
/*tables 


		/ LIST MISSING;*/

proc sort data=mnh16_num out=mnh.mnh16; by caseid participantid; run;


**MNH17: ANC Unplanned Care**;
%impmerge(sitename=kenya, form=mnh17, tabname=mnh_maternal_unplanned, tabnum=5, othertab1=, othertab2=, format=);
%impmerge(sitename=ghana, form=mnh17, tabname=mnh_maternal_unplanned, tabnum=3, othertab1=mnh_maternal_unplanned, othertab2=, format=);
data mnh17_char;
length  CARE_FAC_SPFY_OHOLOC $30
		CARE_WORKER_SPFY_OHOLOC $11
		SYMP_OTHR_CETERM $59
		ABX_SPFY_CMTRT $55
		ABX_SPFY_CMINDC $22
		PTB_TOCO_SPFY_CMOCCUR $11
		RX_OTHER_CMTRT $60
		LAB_OTHR_LBORRES $39
		ANTIPYRETIC_SPFY_CMOCCUR $44
		LAB_OTHR_LBTEST $39
		INFECTION_SPFY_MHTERM $16
		ADMIT_REFERRAL $22
		PI_HTN_SPFY_CMOCCUR $24;
set mnh17_kenya(in=inken) mnh17_ghana (in=ingha);
if caseid="**********" then delete;
*Site number for reports*;
if inken then siten=3;
else if ingha then siten=2;

*Rename variables > 32 characters;
rename	FAC_OBSLOC_region_descendantsCou = FAC_OBSLOC_region_dcnt
		FAC_OBSLOC_location_descendantsC  = FAC_OBSLOC_location_dcnt
		FAC_OBSLOC_facility_descendantsC  = FAC_OBSLOC_facility_dcnt
		Fac_Spec_location_descendantsCou  = Fac_Spec_location_dcnt
		Fac_Spec_facility_descendantsCou  = Fac_Spec_facility_dcnt
		Fac_Spec_region_descendantsCount = Fac_Spec_region_dcnt
		VISIT_OBSLOC_Region_descendantsC = VISIT_OBSLOC_Region_dcnt
		VISIT_OBSLOC_District_descendant  = VISIT_OBSLOC_District_dcnt
		VISIT_OBSLOC_Type_descendantsCou  = VISIT_OBSLOC_Type_dcnt
		VISIT_OBSLOC_Village_or_Facility  = VISIT_OBSLOC_Vil_or_Fac_dcnt
		VISIT_OBSLOC_Type_locationType=VISIT_OBSLOC_Type_locType;

run;
%char2num(inputdsn=mnh17_char, outputdsn=mnh17_num, excludevars=);

**Add prefix of M17_;
%varprefix(dset=mnh17_num, prefix=M17_, keepname="caseid" "participantid" "eventid" "eventformid" "siten")

proc contents data=mnh17_num; run;
proc freq data=mnh17_num; tables _char_; run;
proc sort data=mnh17_num out=mnh.mnh17; by caseid participantid; run;


**MNH18: Maternal PNC Unplanned Care**;
%impmerge(sitename=kenya, form=mnh18, tabname=mnh_maternal_unplanned_pnc, tabnum=5, othertab1=, othertab2=, format=);
data mnh18_char;
set mnh18_kenya(in=inken);
if caseid="**********" then delete;
*Site number for reports*;
if inken then siten=3;
/*else if ingha then siten=2;*/

*Rename variables > 32 characters;
rename	VISIT_OBSLOC_facility_descendant = VISIT_OBSLOC_facility_dcnt
		VISIT_OBSLOC_region_descendantsC  = VISIT_OBSLOC_region_dcnt
		VISIT_OBSLOC_location_descendant  = VISIT_OBSLOC_location_dcnt
		Fac_Spec_region_descendantsCount  = Fac_Spec_region_dcnt
		Fac_Spec_location_descendantsCou  = Fac_Spec_location_dcnt
		Fac_Spec_facility_descendantsCou = Fac_Spec_facility_dcnt;
run;
%char2num(inputdsn=mnh18_char, outputdsn=mnh18_num, excludevars=);

**Add prefix of M18_;
%varprefix(dset=mnh18_num, prefix=M18_, keepname="caseid" "participantid" "eventid" "eventformid" "siten")

proc contents data=mnh18_num; run;
proc freq data=mnh18_num; tables _char_; run;
proc sort data=mnh18_num out=mnh.mnh18; by caseid participantid; run;


**MNH19: Neonatal Unplanned Care**;
%impmerge(sitename=kenya, form=mnh19, tabname=mnh_neonatal_unplanned, tabnum=3, othertab1=, othertab2=, format=);
%impmerge(sitename=ghana, form=mnh19, tabname=mnh_neonatal_unplanned, tabnum=2, othertab1=mnh_neonatal_unplanned, othertab2=, format=);
data mnh19_char;
length  INF_SX_OTHR_CETERM $37.
		ORAL_ANTIBX_SPFY_CMINDC $11
		RX_OTHER_CMTRT $31
		TX_OTHR_PRTRT $14
		INFECTION_SPFY_MHTERM $34;
set mnh19_kenya(in=inken) mnh19_ghana (in=ingha);
if caseid="**********" then delete;
*Site number for reports*;
if inken then siten=3;
else if ingha then siten=2;

*Rename variables > 32 characters;
rename	FAC_OBSLOC_region_descendantsCou = FAC_OBSLOC_region_dcnt
		FAC_OBSLOC_location_descendantsC  = FAC_OBSLOC_location_dcnt
		FAC_OBSLOC_facility_descendantsC  = FAC_OBSLOC_facility_dcnt
		Fac_Spec_location_descendantsCou  = Fac_Spec_location_dcnt
		Fac_Spec_facility_descendantsCou  = Fac_Spec_facility_dcnt
		Infant_Facility_region_descendan = Infant_Facility_region_dcnt
		Fac_Spec_region_descendantsCount = Fac_Spec_regio_dcnt
		Infant_Facility_location_descend  = Infant_Facility_loc_dcnt
		Infant_Facility_facility_descend  = Infant_Facility_fac_dcnt
		VISIT_OBSLOC_Region_descendantsC  = VISIT_OBSLOC_Region_dcnt
		VISIT_OBSLOC_District_descendant = VISIT_OBSLOC_District_dcnt
		VISIT_OBSLOC_Type_descendantsCou = VISIT_OBSLOC_Type_dcnt
		VISIT_OBSLOC_Village_or_Facility  = VISIT_OBSLOC_Vil_or_Fac_dcnt
		Infant_Facility_region_parent=Infant_Facility_reg_parent
		Infant_Facility_location_parent=Infant_Facility_loc_parent
		Infant_Facility_location_label=Infant_Facility_loc_label
		Infant_Facility_location_level=Infant_Facility_loc_level
		Infant_Facility_facility_parent=Infant_Facility_fac_parent
		Infant_Facility_facility_label=Infant_Facility_fac_label
		Infant_Facility_facility_level=Infant_Facility_fac_level
		VISIT_OBSLOC_Type_locationType=VISIT_OBSLOC_Type_locType;
run;
%char2num(inputdsn=mnh19_char, outputdsn=mnh19_num, excludevars=);

**Add prefix of M19_;
%varprefix(dset=mnh19_num, prefix=M19_, keepname="caseid" "participantid" "eventid" "eventformid" "siten")

proc contents data=mnh19_num; run;
proc freq data=mnh19_num; tables _char_; run;
proc sort data=mnh19_num out=mnh.mnh19; by caseid participantid; run;


**MNH20: SAE**;

*Import csv files from Synapes for each site - currently only data from Kenya, may be more than one table per form*;
%importcsv(dout=mnh20_kenya, tablename=kenya_mnh_serious_adverse_events_1);
%impmerge(sitename=ghana, form=mnh20, tabname=mnh_serious_adverse_events, tabnum=1, othertab1=mnh_serious_adverse_events, othertab2=, format=);

*Set datasets from each site and create site indicator;
data mnh20_char;
length SPFY_AETERM $15
PI_NAME $21;
set mnh20_kenya (in=inken) mnh20_ghana (in=ingha);
if caseid="**********" then delete;
*Site number for reports*;
if inken then siten=3;
else if ingha then siten=2;
run;

*Convert to numeric (continuous, check one and date variables - Dates contain text NA, Check one contain NA and SKIPPED)*;
%char2num(inputdsn=mnh20_char, outputdsn=mnh20_num, excludevars=);

/*ods EXCEL file="/rtpnfil03/rtpnfil03_vol5/ANCPNC_Collective/Data Monitoring and Analysis/Datasets/Documentation/Contents/mnh20contents.xlsx";
proc contents data=mnh20_num order=varnum; run;
ods EXCEL close;*/

*Set datasets from each site and create site indicator;
data mnh20;
set mnh20_num (in=inken);
label
		SUBJID="Subject ID"
		AESTDAT="Date of event"
		AESTTIM="Time of event "
		AETERM="Description of event"
		SPFY_AETERM="Specify description of adverse event:"
		/*AESEV="Indicate nature of event"*/
		AEREL="Is the event thought to be related to the study?"
		DTL_AETERM="Specify exact nature of event. [Include relevant medical history, signs and symptoms, laboratory test results, medical or autopsy reports (if applicable), and temporal and causal associations with study intervention.]"
		AEOUT="Describe the management and outcome of the SAE"
		FINAL_AEOUT="Specify and describe final diagnosis:"
		AEENDAT="Date event was resolved/discharge"
		AEENTIM="Time event was resolved/discharge"
		COYN="Would you like to record any additional comments about the SAE?"
		/*COVAL="Record comments"*/
		/*AE_STAFF_NAME="Name of study staff completing SAE report"*/
		/*AE_STAFF_ID="ID of study staff completing SAE report"*/
		AE_REPORT_DATE="Date SAE report completed"
		PI_NAME="Name of Principal Investigator (or designee) conducting clinical review"
		/*PI_SIGN="Signature of Principal Investigator (or designee) to confirm clinical review"*/
		PI_REVIEW_DATE="Date of clinical review"
		AESEV_1="Indicate nature of event: Fatal" 
		AESEV_2="Indicate nature of event: Life-threatening"
		AESEV_3="Indicate nature of event: Required hospitalization or prolonged existing hospitalization "
		AESEV_4="Indicate nature of event: Resulted in persistent or significant disability or impairment"
		caseid="Tangerine case ID"
		participantid="Tangerine participant ID"
		eventid="Tangerine event ID"
		eventformid="Tangerine event form ID"
		startUnixtime="Tangerine noted unix start time"
		complete="Tangerine completion variable"
		siten="Site number for report";
format 
		COYN yn.
		AESEV_1 AESEV_2 AESEV_3 AESEV_4 ckall.
		AETERM MNH20_AETERM.
		AEREL MNH20_AEREL.
		AESTDAT AEENDAT AE_REPORT_DATE PI_REVIEW_DATE date9.;
drop
		ROW_VERSION formId  formtitle _id buildId buildChannel deviceId groupId
		ancovConsentVersion prismaContentVersion HCC_Intro SAE_studyrelated1
		SAE_studyrelated2 SAE_notstudyrelated final id; 
run;


/*ods EXCEL file="/rtpnfil03/rtpnfil03_vol5/ANCPNC_Collective/Data Monitoring and Analysis/Datasets/Documentation/Contents/mnh20contents.xlsx";
proc contents data=mnh20 order=varnum; run;
ods EXCEL close;*/

**Add prefix of M20_;
%varprefix(dset=mnh20, prefix=M20_, keepname="caseid" "participantid" "eventid" "eventformid" "siten")

**Check frequencies;
proc contents data=mnh20 order=varnum; run;
proc freq data=mnh20; 
*Variables in DD and tangerine variables kept;
tables 
		M20_SPFY_AETERM M20_PI_NAME caseid participantid eventid eventformid M20_startUnixtime
		M20_complete M20_SUBJID M20_AESTDAT M20_AESTTIM M20_AETERM M20_AESEV_1 M20_AESEV_2 M20_AESEV_3
		M20_AESEV_4 M20_AEREL M20_DTL_AETERM M20_AEOUT M20_FINAL_AEOUT M20_AEENDAT M20_AEENTIM M20_COYN
		M20_AE_REPORT_DATE M20_PI_REVIEW_DATE siten; 
*Dropped variables not in DD;
/*tables 
		M20_ROW_VERSION M20_formId  M20_formtitle M20__id M20_buildId M20_buildChannel M20_deviceId M20_groupId
		M20_ancovConsentVersion M20_prismaContentVersion M20_HCC_Intro M20_SAE_studyrelated1
		M20_SAE_studyrelated2 M20_SAE_notstudyrelated M20_final M20_id;*/
run;


*Output MN20 datasets;
proc sort data=mnh20_num out=mnh.mnh20; by caseid participantid; run;


/**MNH21: Protocol Deviations- Cant find Synapse Table**;
%impmerge(sitename=kenya, form=mnh21, tabname=mnh_neonatal_unplanned, tabnum=3, othertab1=, othertab2=, format=);
data mnh21_char;
set mnh21_kenya(in=inken);
*Site number for reports*;
if inken then siten=3;
else if ingha then siten=2;
run;
%char2num(inputdsn=mnh21_char, outputdsn=mnh21_num, excludevars=);
proc contents data=mnh21_num; run;
proc freq data=mnh21_num; tables _char_; run;
proc sort data=mnh21_num out=mnh.mnh21; by caseid participantid; run;*/


**MNH22: ANC Client Exit Interview**;
%impmerge(sitename=kenya, form=mnh22, tabname=mnh22_exit_anc, tabnum=2, othertab1=, othertab2=, format=);
%impmerge(sitename=ghana, form=mnh22, tabname=mnh22_exit_anc, tabnum=2, othertab1=mnh22_exit_anc, othertab2=, format=);
data mnh22_char;
length formId $36. SIGN_LABOR_SPFY_FAORRES $55.
TRANS_MODE_SPFY_FAORRES  $30
SEEK_FAC_SPFY_FAORRES $11
DEL_NOTFAC_SPFY_OHOREAS $16
DISRESP_FAC_SPFY_FAORRES  $25;
set mnh22_kenya(in=inken) mnh22_ghana (in=ingha);
if caseid="**********" then delete;
*Rename variables that are too long;
rename 	COUNSEL_NEONATAL_CARE_FAORRES_1=COUNSEL_NEO_CARE_FAORRES_1
		COUNSEL_NEONATAL_CARE_FAORRES_2=COUNSEL_NEO_CARE_FAORRES_2
		COUNSEL_NEONATAL_CARE_FAORRES_3=COUNSEL_NEO_CARE_FAORRES_3
		COUNSEL_NEONATAL_CARE_FAORRES_4=COUNSEL_NEO_CARE_FAORRES_4
		COUNSEL_NEONATAL_CARE_FAORRES_5=COUNSEL_NEO_CARE_FAORRES_5
		COUNSEL_NEONATAL_CARE_FAORRES_77=COUNSEL_NEO_CARE_FAORRES_77
		RECALL_SIGNS_MOM_SPFY_FAORRES=RECALL_SIGN_M_SPFY_FAORRES
		COUNSEL_PREG_METHOD_FAORRES_1=CNSL_PREG_METHOD_FAORRES_1
		COUNSEL_PREG_METHOD_FAORRES_2=CNSL_PREG_METHOD_FAORRES_2
		COUNSEL_PREG_METHOD_FAORRES_3=CNSL_PREG_METHOD_FAORRES_3
		COUNSEL_PREG_METHOD_FAORRES_4=CNSL_PREG_METHOD_FAORRES_4
		COUNSEL_PREG_METHOD_FAORRES_5=CNSL_PREG_METHOD_FAORRES_5
		COUNSEL_PREG_METHOD_FAORRES_6=CNSL_PREG_METHOD_FAORRES_6
		COUNSEL_PREG_METHOD_FAORRES_7=CNSL_PREG_METHOD_FAORRES_7
		COUNSEL_PREG_METHOD_FAORRES_8=CNSL_PREG_METHOD_FAORRES_8
		COUNSEL_PREG_METHOD_FAORRES_9=CNSL_PREG_METHOD_FAORRES_9
		COUNSEL_PREG_METHOD_FAORRES_10=CNSL_PREG_METHOD_FAORRES_10
		COUNSEL_PREG_METHOD_FAORRES_11=CNSL_PREG_METHOD_FAORRES_11
		COUNSEL_PREG_METHOD_FAORRES_12=CNSL_PREG_METHOD_FAORRES_12
		COUNSEL_PREG_METHOD_FAORRES_13=CNSL_PREG_METHOD_FAORRES_13
		COUNSEL_PREG_METHOD_FAORRES_77=CNSL_PREG_METHOD_FAORRES_77;

*Site number for reports*;
if inken then siten=3;
else if ingha then siten=2;
run;
%char2num(inputdsn=mnh22_char, outputdsn=mnh22_num, excludevars=);

**Add prefix of M22_;
%varprefix(dset=mnh22_num, prefix=M22_, keepname="caseid" "participantid" "eventid" "eventformid" "siten")

proc contents data=mnh22_num; run;
proc freq data=mnh22_num; tables _char_; run;
proc sort data=mnh22_num out=mnh.mnh22; by caseid participantid; run;


**MNH23: IPC Client Exit Interview**;
%impmerge(sitename=kenya, form=mnh23, tabname=mnh23_exit_ipc, tabnum=2, othertab1=, othertab2=, format=);
%impmerge(sitename=ghana, form=mnh23, tabname=mnh23_exit_ipc, tabnum=2, othertab1=mnh23_exit_ipc, othertab2=, format=);
data mnh23_char;
length TRANS_MODE_SPFY_FAORRES $30.
FAC_SPFY_OHOREAS $43
SEEK_FAC_SPFY_FAORRES $17
DEL_FAC_SPFY_OHOREAS $26
TREAT_DIFF_SPFY_FAC_FAORRES $13
ACTION_BABY_SPFY_FAORRES $17;
set mnh23_kenya(in=inken) mnh23_ghana (in=ingha);
if caseid="**********" then delete;
*Site number for reports*;
if inken then siten=3;
else if ingha then siten=2;
RENAME
		RECALL_SIGNS_BABY_SPFY_FAORRES=RECALL_SIGN_B_SPFY_FAORRES
		RECALL_SIGNS_MOM_SPFY_FAORRES=RECALL_SIGN_M_SPFY_FAORRES;
run;
%char2num(inputdsn=mnh23_char, outputdsn=mnh23_num, excludevars=);

**Add prefix of M23_;
%varprefix(dset=mnh23_num, prefix=M23_, keepname="caseid" "participantid" "eventid" "eventformid" "siten")

proc contents data=mnh23_num; run;
proc freq data=mnh23_num; tables _char_; run;
proc sort data=mnh23_num out=mnh.mnh23; by caseid participantid; run;


**MNH24: PNC Client Exit Interview**;
%impmerge(sitename=kenya, form=mnh24, tabname=mnh24_exit_pnc, tabnum=2, othertab1=, othertab2=, format=);
%impmerge(sitename=ghana, form=mnh24, tabname=mnh24_exit_pnc, tabnum=2, othertab1=mnh24_exit_pnc, othertab2=, format=);
data mnh24_char;
length SETTING_HOME_SPFY_OHOREAS $50
DECIDE_HOME_SPFY_FAORRES $35;
set mnh24_kenya(in=inken) mnh24_ghana (in=ingha);
if caseid="**********" then delete;
*Rename variables that are too long;
rename DISCUSS_ACTION_BABY_SPFY_FAORRES=DISC_ACT_BABY_SPFY_FAORRES
TREAT_DIFF_NOFAC_SPFY_FAORRES=TRT_DIFF_NOFAC_SPFY_FAORRES
RECALL_SIGNS_BABY_SPFY_FAORRES=REC_SIGNS_BABY_SPFY_FAORRES
RECALL_SIGNS_MOM_SPFY_FAORRES=REC_SIGNS_MOM_SPFY_FAORRES
DISCUSS_ACTION_BABY_FAORRES_1=DISC_ACT_BABY_FAORRES_1
DISCUSS_ACTION_BABY_FAORRES_2=DISC_ACT_BABY_FAORRES_2
DISCUSS_ACTION_BABY_FAORRES_3=DISC_ACT_BABY_FAORRES_3
DISCUSS_ACTION_BABY_FAORRES_88=DISC_ACT_BABY_FAORRES_88
DISCUSS_ACTION_BABY_FAORRES_77=DISC_ACT_BABY_FAORRES_77
DISCUSS_ACTION_BABY_FAORRES_99=DISC_ACT_BABY_FAORRES_99;
*Site number for reports*;
if inken then siten=3;
else if ingha then siten=2;
run;
%char2num(inputdsn=mnh24_char, outputdsn=mnh24_num, excludevars=);

**Add prefix of M24_;
%varprefix(dset=mnh24_num, prefix=M24_, keepname="caseid" "participantid" "eventid" "eventformid" "siten")

proc contents data=mnh24_num; run;
proc freq data=mnh24_num; tables _char_; run;
proc sort data=mnh24_num out=mnh.mnh24; by caseid participantid; run;



**MNH25: Final Study Status**;

*Import csv files from Synapes for each site - currently only data from Kenya, may be more than one table per form*;
%importcsv(dout=mnh25_kenya, tablename=kenya_mnh_final_status_1);

*Set datasets from each site and create site indicator;
data mnh25_char;
set mnh25_kenya (in=inken);
if caseid="**********" then delete;
*Site number for reports*;
if inken then siten=3;
/*else if ingha then siten=2;*/

*Rename variables > 32 characters;
rename	CLOSE_FAC_OBSLOC_region_descenda = CLOSE_FAC_OBSLOC_reg_dcnt
		CLOSE_FAC_OBSLOC_location_descen  = CLOSE_FAC_OBSLOC_loc_dcnt
		CLOSE_FAC_OBSLOC_facility_descen  = CLOSE_FAC_OBSLOC_fac_dcnt
		CLOSE_FAC_OBSLOC_region_parent=CLOSE_FAC_OBSLOC_reg_parent
		CLOSE_FAC_OBSLOC_region_label=CLOSE_FAC_OBSLOC_reg_label
		CLOSE_FAC_OBSLOC_region_level=CLOSE_FAC_OBSLOC_reg_level
		CLOSE_FAC_OBSLOC_location_parent=CLOSE_FAC_OBSLOC_loc_parent
		CLOSE_FAC_OBSLOC_location_label=CLOSE_FAC_OBSLOC_loc_label
		CLOSE_FAC_OBSLOC_location_level=CLOSE_FAC_OBSLOC_loc_level
		CLOSE_FAC_OBSLOC_facility_parent=CLOSE_FAC_OBSLOC_fac_parent
		CLOSE_FAC_OBSLOC_facility_label=CLOSE_FAC_OBSLOC_fac_label
		CLOSE_FAC_OBSLOC_facility_level=CLOSE_FAC_OBSLOC_fac_level;

run;

*Convert to numeric (continuous, check one and date variables - Dates contain text NA, Check one contain NA and SKIPPED)*;
%char2num(inputdsn=mnh25_char, outputdsn=mnh25_num, excludevars=);

data mnh25;
set 	mnh25_num;
label
		SUBJID="SUBJID"
		CLOSE_DSSTDAT="Date of Close-Out"
		CLOSE_OBSLOC="Location of Visit"
		/*CLOSE_FAC_OBSLOC="Specify name of facility"*/
		/*CLOSE_GPS_OBSLOC="Record GPS Coordinates"*/
		CLOSE_FAC_SPFY_OBSLOC="Specify other location"
		CLOSE_DSDECOD="Record the primary reason for close-out"
		CLOSE_WDL_DSTERM="Specify reason for withdrawal"
		CLOSE_TERM_DSTERM="Specify reason for termination"
		COYN="Would you like to record any additional comments about this study close out?"
		/*COVAL="Record comments"*/
		/*FORMCOMPLID="Record identifier of person completing form, as appropriate for your site (e.g., Name, initial, ID, or code)."*/
		caseid="Tangerine Case ID"
		participantid="Tangerine participant ID"
		eventid="Tangerine event ID"
		eventformid="Tangerine eventform ID"
		startUnixtime="Tangerine noted unix time"
		complete="Tangerine noted completion"
		siten="Site number for reports";
format
		COYN yn.
		CLOSE_OBSLOC MNH25_CLOSE_OBSLOC.
		CLOSE_DSDECOD MNH25_CLOSE_DSDECOD.
		CLOSE_DSSTDAT date9.;
drop
		final id ancovConsentVersion prismaContentVersion CLOSE_FAC_OBSLOC_region CLOSE_FAC_OBSLOC_reg_parent
		CLOSE_FAC_OBSLOC_reg_label CLOSE_FAC_OBSLOC_region_id CLOSE_FAC_OBSLOC_reg_level
		CLOSE_FAC_OBSLOC_reg_dcnt CLOSE_FAC_OBSLOC_location CLOSE_FAC_OBSLOC_loc_parent 
		CLOSE_FAC_OBSLOC_loc_label CLOSE_FAC_OBSLOC_location_id CLOSE_FAC_OBSLOC_loc_level 
		CLOSE_FAC_OBSLOC_loc_dcnt CLOSE_FAC_OBSLOC_facility CLOSE_FAC_OBSLOC_fac_parent 
		CLOSE_FAC_OBSLOC_fac_label CLOSE_FAC_OBSLOC_facility_id CLOSE_FAC_OBSLOC_fac_level 
		CLOSE_FAC_OBSLOC_fac_dcnt text _id formId formTitle ROW_VERSION buildId buildChannel 
		deviceId groupId;
run;


**Add prefix of M25_;
%varprefix(dset=mnh25, prefix=M25_, keepname="caseid" "participantid" "eventid" "eventformid" "siten")


/*ods EXCEL file="/rtpnfil03/rtpnfil03_vol5/ANCPNC_Collective/Data Monitoring and Analysis/Datasets/Documentation/Contents/mnh25contents.xlsx";
proc contents data=mnh25 order=varnum; run;
ods EXCEL close;*/


**Check frequencies**;
proc contents data=mnh25 order=varnum; run;
proc freq data=mnh25; 
*Kept variables in DD or from Tangerine;
tables 
		caseid participantid eventid eventformid M25_startUnixtime M25_complete 
		M25_SUBJID M25_CLOSE_DSSTDAT M25_CLOSE_OBSLOC M25_CLOSE_FAC_SPFY_OBSLOC 
		M25_CLOSE_DSDECOD M25_CLOSE_WDL_DSTERM M25_CLOSE_TERM_DSTERM M25_COYN siten;
*Dropped variables not in DD;
/*tables
		M25_final M25_id M25_ancovConsentVersion M25_prismaContentVersion M25_CLOSE_FAC_OBSLOC_region M25_CLOSE_FAC_OBSLOC_reg_parent
		M25_CLOSE_FAC_OBSLOC_reg_label M25_CLOSE_FAC_OBSLOC_region_id M25_CLOSE_FAC_OBSLOC_reg_level
		M25_CLOSE_FAC_OBSLOC_reg_dcnt M25_CLOSE_FAC_OBSLOC_location M25_CLOSE_FAC_OBSLOC_loc_parent 
		M25_CLOSE_FAC_OBSLOC_loc_label M25_CLOSE_FAC_OBSLOC_location_id M25_CLOSE_FAC_OBSLOC_loc_level 
		M25_CLOSE_FAC_OBSLOC_loc_dcnt M25_CLOSE_FAC_OBSLOC_facility M25_CLOSE_FAC_OBSLOC_fac_parent 
		M25_CLOSE_FAC_OBSLOC_fac_label M25_CLOSE_FAC_OBSLOC_facility_id M25_CLOSE_FAC_OBSLOC_fac_level 
		M25_CLOSE_FAC_OBSLOC_fac_dcnt M25_text M25__id M25_formId M25_formTitle M25_ROW_VERSION M25_buildId M25_buildChannel 
		M25_deviceId M25_groupId;*/
run;


*Output MN25 datasets;
proc sort data=mnh25_num out=mnh.mnh25; by caseid participantid; run;



**Meta Data Table - Move to seperate program?**;

**Merge Case and Participant by CaseID, Merge Case Event and Event Form by CaseID and CaseEventID, Then merge two datasets by CaseID**;

*Case Instance Table: One row per case with meta variables- id, study_id, screen_id;
%importcsv(dout=kenya_case, tablename=kenya_case_1);
%importcsv(dout=ghana_case, tablename=ghana_case_1);
data _case_;
length village MAT_DEATH_DSSTTIM $50.;
set kenya_case ghana_case; 
if complete="**********" then delete; 
if numinf in ("False" "UNDEFINED") then numinf="";
run;
%char2num(inputdsn=_case_, outputdsn=_case, excludevars=INF_1_DSSTDAT MAT_DEATH_DTHDAT startDatetime);
*Participant Table: One row per participant - id, caseid, study_id;
%importcsv(dout=kenya_participant, tablename=kenya_participant_1);
%importcsv(dout=ghana_participant, tablename=ghana_participant_1);
data _participant_; 
set kenya_participant ghana_participant; 
if caseid="**********" then delete; 
run;
%char2num(inputdsn=_participant_, outputdsn=_participant, excludevars=);
*Case Event Table - id, caseid;
%importcsv(dout=kenya_case_event, tablename=kenya_case-event_1);
%importcsv(dout=ghana_case_event, tablename=ghana_case-event_1);
data _case_event_; 
set kenya_case_event ghana_case_event; 
if caseid="**********" then delete; 
run;
%char2num(inputdsn=_case_event_, outputdsn=_case_event, excludevars=);
*Event Form Table - id, caseid, caseeventid;
%importcsv(dout=kenya_case_form, tablename=kenya_event-form_1);
%importcsv(dout=ghana_case_form, tablename=ghana_event-form_1);
data _case_form_; 
set kenya_case_form ghana_case_form; 
if caseid="**********" then delete; 
run;
%char2num(inputdsn=_case_form_, outputdsn=_case_form, excludevars=);
proc freq data=_case_; 
tables numinf; 
run;

*Merge case (id=caseid) and participant by caseid;
proc sort data=_participant nodupkey dupout=dup_participant out=participant_1 (rename=(id=participantid) 
	keep=id study_id mother_dob mother_age caseRoleId caseId numInf BRTH_ORDER BRTHDAT); by caseid study_id; run;
proc sort data=_case nodupkey dupout=dup_case out=case_1(rename=(id=caseid) keep=id study_id screen_id status subjid Infant_status 
	village cluster numinf reliable ga_accuracy_lmp ga_conception_date ga_conception_date_lmp ESTIMATED_EDD_SCDAT ga_type US_EDD_BRTHDAT 
	US_GA_days_AGE US_GA_weeks_AGE caseDefinitionId substudy); by id; run;
data pids;
retain caseid participantid study_id screen_id subjid;
merge participant_1 (in=ina) case_1 (in=inb); 
by caseid;
if ina & inb then m1stat=1;
 else if ina then m1stat=2;
  else if inb then m1stat=3;
run;
proc freq data=pids;
tables m1stat m1stat*caseroleid / list missing;
run;

*Merge case event (id=caseeventid) with case form by caseeventid;
proc sort data=_case_event nodupkey dupout=dup_case_event out=case_event_1 (rename=(id=caseeventid) 
	keep=id caseId name caseEventDefinitionId startDate estimatedDay scheduledDay occurredOnDay); by caseid id; run;
proc sort data=_case_form nodupkey dupout=dup_case_form out=case_form_1 (rename=(id=eventformid) 
	keep=id caseId participantId caseEventId eventFormDefinitionId formResponseId type title resultType); by caseid caseeventid id; run;
data pevents;
retain caseid caseeventid eventformid;
merge case_event_1 (in=ina) case_form_1 (in=inb);
by caseid caseeventid; 
if ina & inb then m2stat=1;
 else if ina then m2stat=2;
  else if inb then m2stat=3;
run;
proc freq data=pevents;
tables m2stat;
run;

**Merge IDs and Events by ParticipantID and CaseID**;
proc sort data=pids; by participantid caseid; run;
proc sort data=pevents; by participantid caseid; run;
data meta;
retain participantid caseid caseeventid eventformid study_id screen_id subjid;
merge pids pevents; 
by participantid caseid;
eventid=caseeventid;
*Convert Unix Dates -- ADD TO META DATASET AND REMOVE FROM HERE - ADD PREFIX of META?;
tang_lmp = datepart(dhms('01JAN1970'D, 0, 0, (ga_conception_date_lmp/1000)));
tang_conception = datepart(dhms('01JAN1970'D, 0, 0, (ga_conception_date/1000)));
diffconlmp=tang_lmp - tang_conception;
format tang_lmp tang_conception date9.;
run;
proc sort data=meta nodupkey; by caseid participantid caseeventid eventformid; run;

*Check data;
proc freq data=meta;
tables participantid*caseid*caseeventid*eventformid*study_id*screen_id*subjid /list missing;
format participantid caseid caseeventid eventformid study_id screen_id subjid $misansc.;
run;

**Add prefix of META_;
%varprefix(dset=meta, prefix=META_, keepname="caseid" "participantid" "eventid" "eventformid" "caseeventid" "study_id" "screen_id")


**Sort and output dateset with unique identifier of participantid-caseid-caseventid-eventformid**;
proc sort data=meta out=mnh.mnh_meta; by caseid participantid caseeventid eventformid; run;

