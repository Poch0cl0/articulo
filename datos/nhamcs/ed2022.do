infix using eddict2022.dct, using (ed2022) clear

label variable VMONTH "Month of Visit"
label variable VDAYR "Day of Week of Visit"
label variable ARRTIME "Arrival time (military time)"
label variable WAITTIME "Wait time to first provider (Physician/APRN/PA) contact, in minutes"
label variable LOV "Length of visit in minutes"
label variable AGE "Patient age in years"
label variable AGER "Age recode"
label variable AGEDAYS "Age in days for patients less than one year"
label variable RESIDNCE "Patient residence"
label variable SEX "Patient sex"
label variable ETHUN "Unimputed ethnicity"
label variable ETHIM "Imputed ethnicity"
label variable RACEUN "Unimputed race"
label variable RACER "White/Black/Other imputed race"
label variable RACERETH "RACER and ETHNIC combination"
label variable ARREMS "Arrival by ambulance"
label variable AMBTRANSFER "Was the patient transferred from another hospital or urgent care facility?"
label variable NOPAY "No answer to expected source of payment item"
label variable PAYPRIV "Expected source(s) of payment for this visit: Private insurance"
label variable PAYMCARE "Expected source(s) of payment for this visit: Medicare"
label variable PAYMCAID "Expected source(s) of payment for this visit: Medicaid or CHIP or other state-based program"
label variable PAYWKCMP "Expected source(s) of payment for this visit: Workers' compensation"
label variable PAYSELF "Expected source(s) of payment for this visit: Self pay"
label variable PAYNOCHG "Expected source(s) of payment for this visit: No charge/Charity"
label variable PAYOTH "Expected source(s) of payment for this visit: Other"
label variable PAYDK "Expected source(s) of payment for this visit: Unknown"
label variable PAYTYPER "Recoded primary expected source of payment for this visit (based on hierarchy)"
label variable TEMPF "Initial vital signs: Temperature (Fahrenheit)"
label variable PULSE "Initial vital signs: Heart rate per minute"
label variable RESPR "Initial vital signs: Respiratory rate per minute"
label variable BPSYS "Initial vital signs: Blood pressure - Systolic"
label variable BPDIAS "Initial vital signs: Blood pressure - Diastolic"
label variable POPCT "Initial vital signs: Pulse oximetry (percent)"
label variable IMMEDR "Immediacy with which patient should be seen (unimputed)"
label variable PAINSCALE "Pain scale (0-10)"
label variable SEEN72 "Was patient seen in this ED within the last 72 hours?"
label variable RFV1 "Patient's complaint, symptom, or other reason for visit #1 - detailed category"
label variable RFV2 "Patient's complaint, symptom, or other reason for visit #2 - detailed category"
label variable RFV3 "Patient's complaint, symptom, or other reason for visit #3 - detailed category"
label variable RFV4 "Patient's complaint, symptom, or other reason for visit #4 - detailed category"
label variable RFV5 "Patient's complaint, symptom, or other reason for visit #5 - detailed category"
label variable RFV13D "Patient's complaint, symptom, or other reason for visit #1 - broader category"
label variable RFV23D "Patient's complaint, symptom, or other reason for visit #2 - broader category"
label variable RFV33D "Patient's complaint, symptom, or other reason for visit #3 - broader category"
label variable RFV43D "Patient's complaint, symptom, or other reason for visit #4 - broader category"
label variable RFV53D "Patient's complaint, symptom, or other reason for visit #5 - broader category"
label variable EPISODE "Episode of care"
label variable INJURY "Is visit related to an injury/trauma, overdose/poisoning, or adverse effect of medical/surgical treatment? - Recoded from INJPOISAD"
label variable INJPOISAD "Is visit related to an injury/trauma, overdose/poisoning or adverse effect of medical/surgical treatment? "
label variable INJURY72 "Did the injury/trauma, overdose/poisoning, or adverse effect occur within 72 hours prior to the date and time of this visit?"
label variable INTENT15 "Is this injury/trauma or overdose/poisoning intentional or unintentional?"
label variable INJURY_ENC "Type of encounter for injury visits"
label variable CAUSE1 "Cause #1 of injury/trauma, overdose/poisoning, or adverse effect  of medical/surgical treatment"
label variable CAUSE2 "Cause #2 of injury/trauma, overdose/poisoning, or adverse effect  of medical/surgical treatment"
label variable CAUSE3 "Cause #3 of injury/trauma, overdose/poisoning, or adverse effect  of medical/surgical treatment"
label variable DIAG1 "Diagnosis #1"
label variable DIAG2 "Diagnosis #2"
label variable DIAG3 "Diagnosis #3"
label variable DIAG4 "Diagnosis #4"
label variable DIAG5 "Diagnosis #5"
label variable PRDIAG1 "For diagnosis 1, is this probable, questionable, or ruleout?"
label variable PRDIAG2 "For diagnosis 2, is this probable, questionable, or ruleout?"
label variable PRDIAG3 "For diagnosis 3, is this probable, questionable, or ruleout?"
label variable PRDIAG4 "For diagnosis 4, is this probable, questionable, or ruleout?"
label variable PRDIAG5 "For diagnosis 5, is this probable, questionable, or ruleout?"
label variable ETOHAB "Does patient have: Alcohol misuse, abuse, or dependence"
label variable ALZHD "Does patient have: Alzheimer's disease/Dementia"
label variable ASTHMA "Does patient have: Asthma"
label variable CANCER "Does patient have: Cancer"
label variable CEBVD "Does patient have:  Cerebrovascular disease/History of stroke (CVA) or transient ischemic attack (TIA)?"
label variable CKD "Does patient have: Chronic kidney disease (CKD)"
label variable COPD "Does patient have: Chronic obstructive pulmonary disease (COPD)"
label variable CHF "Does patient have: Congestive heart failure (CHF)"
label variable CAD "Does patient have: Coronary artery disease (CAD), ischemic heart disease (IHD) or history of myocardial infarction (MI)"
label variable DEPRN "Does patient have: Depression"
label variable DIABTYP1 "Does patient have: Diabetes mellitus (DM) - Type I"
label variable DIABTYP2 "Does patient have: Diabetes mellitus (DM) - Type II"
label variable DIABTYP0 "Does patient have: Diabetes mellitus (DM) - Type unspecified"
label variable ESRD "Does patient have: End-stage renal disease (ESRD)"
label variable HPE "Does patient have: History of pulmonary embolism (PE), deep vein thrombosis (DVT), or venous thromboembolism (VTE)"
label variable EDHIV "Does patient have: HIV infection/AIDS"
label variable HYPLIPID "Does patient have: Hyperlipidemia"
label variable HTN "Does patient have: Hypertension"
label variable OBESITY "Does patient have: Obesity (BMI >=30)"
label variable OSA "Does patient have: Obstructive sleep apnea (OSA)"
label variable OSTPRSIS "Does patient have: Osteoporosis"
label variable SUBSTAB "Does patient have: Substance abuse or dependence"
label variable NOCHRON "Does patient have: None of the above"
label variable TOTCHRON "Total number of chronic conditions"
label variable DIAGSCRN "Were diagnostic services ordered or provided?"
label variable ABG "Arterial blood gases (ABG)"
label variable BAC "BAC (Blood alcohol concentration)"
label variable BMP "Basic metabolic panel (BMP)"
label variable BNP "BNP (Brain natriuretic peptide)"
label variable BUNCREAT "Creatinine/Renal function panel"
label variable CARDENZ "Cardiac enzymes"
label variable CBC "CBC (Complete blood count)"
label variable CMP "Comprehensive metabolic panel (CMP)"
label variable BLOODCX "Blood culture"
label variable TRTCX "Throat culture"
label variable URINECX "Urine culture"
label variable WOUNDCX "Wound culture"
label variable OTHCX "Other culture"
label variable DDIMER "D-dimer"
label variable ELECTROL "Electrolytes"
label variable GLUCOSE "Glucose, serum"
label variable LACTATE "Lactate"
label variable LFT "Liver enzymes/Hepatic function panel"
label variable PTTINR "Prothrombin time (PT/PTT/INR)"
label variable OTHERBLD "Other blood test"
label variable CARDMON "Cardiac monitor"
label variable EKG "EKG/ECG"
label variable HIVTEST "HIV test"
label variable FLUTEST "Influenza test"
label variable PREGTEST "Pregnancy/HCG test"
label variable TOXSCREN "Toxicology screen"
label variable URINE "Urinalysis (UA) or urine dipstick"
label variable OTHRTEST "Other test/service"
label variable ANYIMAGE "Any imaging"
label variable XRAY "X-ray"
label variable CATSCAN "CT scan"
label variable CTCONTRAST "Was CT Scan ordered/provided with intravenous (IV) contrast?"
label variable CTAB "CT scan - abdomen/pelvis"
label variable CTCHEST "CT scan - chest"
label variable CTHEAD "CT scan- head"
label variable CTOTHER "CT scan - other"
label variable CTUNK "CT scan - body site unknown"
label variable MRI "MRI"
label variable MRICONTRAST "Was MRI ordered/provided with intravenous (IV) contrast (also written as with gadolinium or with gado)?"
label variable ULTRASND "Ultrasound"
label variable OTHIMAGE "Other imaging"
label variable COVIDTEST "Coronavirus (COVID-19) test"
label variable COVIDANTIBODY "Coronavirus (COVID-19) antibody test"
label variable TOTDIAG "Total number of diagnostic services ordered or provided"
label variable PROC "Were procedures provided at this visit?"
label variable BPAP "BiPAP/CPAP"
label variable BLADCATH "Bladder catheter"
label variable CASTSPLINT "Cast, splint or wrap"
label variable CENTLINE "Central line"
label variable CPR "CPR"
label variable ENDOINT "Endotracheal intubation"
label variable INCDRAIN "Incision and drainage (I & D)"
label variable IVFLUIDS "IV fluids"
label variable LUMBAR "Lumbar puncture (LP)"
label variable NEBUTHER "Nebulizer therapy"
label variable PELVIC "Pelvic exam"
label variable SKINADH "Skin adhesives"
label variable SUTURE "Suturing/Staples"
label variable OTHPROC "Other procedure"
label variable TOTPROC "Total number of procedures provided"
label variable MED "Were medications given at this visit or prescribed at ED discharge?"
label variable MED1 "Medication #1"
label variable MED2 "Medication #2"
label variable MED3 "Medication #3"
label variable MED4 "Medication #4"
label variable MED5 "Medication #5"
label variable MED6 "Medication #6"
label variable MED7 "Medication #7"
label variable MED8 "Medication #8"
label variable MED9 "Medication #9"
label variable MED10 "Medication #10"
label variable MED11 "Medication #11"
label variable MED12 "Medication #12"
label variable MED13 "Medication #13"
label variable MED14 "Medication #14"
label variable MED15 "Medication #15"
label variable MED16 "Medication #16"
label variable MED17 "Medication #17"
label variable MED18 "Medication #18"
label variable MED19 "Medication #19"
label variable MED20 "Medication #20"
label variable MED21 "Medication #21"
label variable MED22 "Medication #22"
label variable MED23 "Medication #23"
label variable MED24 "Medication #24"
label variable MED25 "Medication #25"
label variable MED26 "Medication #26"
label variable MED27 "Medication #27"
label variable MED28 "Medication #28"
label variable MED29 "Medication #29"
label variable MED30 "Medication #30"
label variable GPMED1 "Medication #1 given in ED or Rx at discharge"
label variable GPMED2 "Medication #2 given in ED or Rx at discharge"
label variable GPMED3 "Medication #3 given in ED or Rx at discharge"
label variable GPMED4 "Medication #4 given in ED or Rx at discharge"
label variable GPMED5 "Medication #5 given in ED or Rx at discharge"
label variable GPMED6 "Medication #6 given in ED or Rx at discharge"
label variable GPMED7 "Medication #7 given in ED or Rx at discharge"
label variable GPMED8 "Medication #8 given in ED or Rx at discharge"
label variable GPMED9 "Medication #9 given in ED or Rx at discharge"
label variable GPMED10 "Medication #10 given in ED or Rx at discharge"
label variable GPMED11 "Medication #11 given in ED or Rx at discharge"
label variable GPMED12 "Medication #12 given in ED or Rx at discharge"
label variable GPMED13 "Medication #13 given in ED or Rx at discharge"
label variable GPMED14 "Medication #14 given in ED or Rx at discharge"
label variable GPMED15 "Medication #15 given in ED or Rx at discharge"
label variable GPMED16 "Medication #16 given in ED or Rx at discharge"
label variable GPMED17 "Medication #17 given in ED or Rx at discharge"
label variable GPMED18 "Medication #18 given in ED or Rx at discharge"
label variable GPMED19 "Medication #19 given in ED or Rx at discharge"
label variable GPMED20 "Medication #20 given in ED or Rx at discharge"
label variable GPMED21 "Medication #21 given in ED or Rx at discharge"
label variable GPMED22 "Medication #22 given in ED or Rx at discharge"
label variable GPMED23 "Medication #23 given in ED or Rx at discharge"
label variable GPMED24 "Medication #24 given in ED or Rx at discharge"
label variable GPMED25 "Medication #25 given in ED or Rx at discharge"
label variable GPMED26 "Medication #26 given in ED or Rx at discharge"
label variable GPMED27 "Medication #27 given in ED or Rx at discharge"
label variable GPMED28 "Medication #28 given in ED or Rx at discharge"
label variable GPMED29 "Medication #29 given in ED or Rx at discharge"
label variable GPMED30 "Medication #30 given in ED or Rx at discharge"
label variable NUMMED "Number of medications"
label variable NUMGIV "Number of medications given in ED"
label variable NUMDIS "Number of medications prescribed at discharge"
label variable VITALSD "Does the chart contain vital signs taken after triage?"
label variable TEMPDF "Vitals after triage: Temperature in Fahrenheit"
label variable PULSED "Vitals after triage: Heart rate (beats per minute)"
label variable RESPRD "Vitals after triage: Respiratory rate (breaths per minute)"
label variable BPSYSD "Vitals after triage: Systolic blood pressure"
label variable BPDIASD "Vitals after triage: Diastolic blood pressure"
label variable NOPROVID "No answer to provider seen item"
label variable ATTPHYS "ED attending physician seen"
label variable RESINT "ED resident/intern seen"
label variable CONSULT "Consulting physician seen"
label variable RNLPN "RN/PN seen"
label variable NURSEPR "Nurse practitioner seen"
label variable PHYSASST "Physician assistant seen"
label variable EMT "EMT seen"
label variable MHPROV "Other mental health provider seen"
label variable OTHPROV "Other provider seen"
label variable NODISP "No answer to disposition item"
label variable NOFU "No follow-up planned"
label variable RETRNED "Return to ED"
label variable RETREFFU "Return/refer to physician/clinic for FU"
label variable LWBS "Left without being seen (LWBS)"
label variable LBTC "Left before treatment complete (LBTC)"
label variable LEFTAMA "Left AMA (against medical advice)"
label variable DOA "DOA"
label variable DIEDED "Died in ED"
label variable TRANNH "Return/Transfer to nursing home"
label variable TRANPSYC "Transfer to psychiatric hospital"
label variable TRANOTH "Transfer to non-psychiatric hospital"
label variable ADMITHOS "Admit to this hospital"
label variable OBSHOS "Admit to observation unit, then hospitalized"
label variable OBSDIS "Admit to observation unit, then discharged"
label variable OTHDISP "Other disposition"
label variable ADMIT "Admitted to:"
label variable ADMTPHYS "Admitting physician"
label variable LOS "If admitted, length of stay in hospital in days"
label variable HDDIAG1 "Hospital discharge diagnosis #1"
label variable HDDIAG2 "Hospital discharge diagnosis #2"
label variable HDDIAG3 "Hospital discharge diagnosis #3"
label variable HDDIAG4 "Hospital discharge diagnosis #4"
label variable HDDIAG5 "Hospital discharge diagnosis #5"
label variable HDSTAT "Hospital discharge status"
label variable ADISP "Disposition of live discharges"
label variable OBSSTAY "Length of stay in observation unit in minutes"
label variable STAY24 "ED discharge greater than 24 hours"
label variable AGEFL "Was patient age reported, calculated or imputed?"
label variable BDATEFL "Birth date imputed?"
label variable SEXFL "Sex imputed?"
label variable ETHNICFL "Ethnicity imputed?"
label variable RACERFL "RACER imputed?"
label variable HOSPCODE "Hospital number"
label variable PATCODE "Patient code"
label variable EMRED "Does your ED use an electronic health record (EHR) system? Do not including billing systems."
label variable HHSMUE "Does your current system meet meaningful use criteria as defined by the Department of Health and Human Services?"
label variable EHRINSE "Does your ED have plans for installing a new EHR/EMR system within the next 18 months?"
label variable EDPRIM "When patients with identified primary care physicians (PCP) arrive at the ED, how often do you electronically send notifications to the patients' PCP?"
label variable EDINFO "When patients arrive at the ED, are you able to query for patients' healthcare information electronically (e.g., medications, allergies) from outside sources?"
label variable OBSCLIN "Does your ED have an observation or clinical decision unit?"
label variable OBSSEP "Is this observation or clinical decision unit physically separate from the ED?"
label variable OBSPHYSED "What type of providers make decisions for patients in this observation or clinical decision unit? - ED physicians, APRN, PA"
label variable OBSHOSP "What type of providers make decisions for patients in this observation or clinical decision unit? - Hospitalists"
label variable OBSPHYSOT "What type of providers make decisions for patients in this observation or clinical decision unit? - Other physicians, APRN, PA"
label variable OBSPHYSUN "What type of providers make decisions for patients in this observation or clinical decision unit? - Unknown"
label variable BOARD "Are admitted ED patients ever 'boarded' for more than 2 hours in the ED or observation unit while waiting for an inpatient bed?"
label variable BOARDHOS "Does your ED allow some admitted patients to move from the ED to inpatient corridors while awaiting a bed ('boarding') - sometimes called 'full capacity protocol'?"
label variable AMBDIV "Did your ED go on ambulance diversion in 2020?"
label variable TOTHRDIVR "What is the total number of hours that your hospital's ED was on ambulance diversion in 2020?"
label variable REGDIV "Is ambulance diversion actively managed on a regional level versus each hospital adopting diversion if and when it chooses?"
label variable ADMDIV "Does your hospital continue to admit elective or schedule surgery cases when ED is on ambulance diversion?"
label variable INCSHX "In the last two years, did your ED increase the number of standard treatment spaces?"
label variable INCPHYS "In the last two years, did your ED's physical space expand?"
label variable EXPSPACE "Do you have plans to expand your ED's physical space within the next two years?"
label variable BEDREG "Does your ED use bedside registration?"
label variable KIOSELCHK "Does ED use kiosk self check-in?"
label variable CATRIAGE "Does your ED use computer-assisted triage?"
label variable IMBED "Does your ED use immediate bedding?"
label variable ADVTRIAG "Does your ED use advanced triage (triage-based care) protocols?"
label variable PHYSPRACTRIA "Does your ED use physician/practitioner at triage?"
label variable FASTTRAK "Does your ED use separate fast track unit for nonurgent care?"
label variable EDPTOR "Does your ED use separate operating room dedicated to ED patients?"
label variable DASHBORD "Does your ED use electronic dashboard?"
label variable RFID "Does your ED use radio frequency identification (RFID) tracking?"
label variable WIRELESS "Does ED use wireless communication devices by providers?"
label variable ZONENURS "Does your ED use zone nursing?"
label variable POOLNURS "Does your ED use pool nurses?"
label variable SURGDAY "How many days in a week are inpatient elective surgeries scheduled?"
label variable BEDCZAR "Does your hospital have a bed coordinator, sometimes known as a bed czar?"
label variable BEDDATA "How often are hospital bed census data available?"
label variable HLIST "Does your hospital have hospitalists on staff?"
label variable HLISTED "Do the hospitalists on staff at your hospital admit patients from your ED?"
label variable EMEDRES "Does hospital have an Emergency Medicine residency program?"
label variable REGION "Geographic region"
label variable MSA "Metropolitan statistical area status"
label variable DRUGID1 "Drug ID code for medication #1"
label variable PRESCR1 "Prescription status code for medication #1"
label variable CONTSUB1 "Controlled substance status code for medication #1"
label variable COMSTAT1 "Composition status code for medication #1"
label variable RX1CAT1 "For RX1, MULTUM drug category #1 - most detailed level (can be either Level 1,2 or 3)"
label variable RX1CAT2 "For RX1, MULTUM drug category #2 - most detailed level (can be either Level 1,2 or 3)"
label variable RX1CAT3 "For RX1, MULTUM drug category #3 - most detailed level (can be either Level 1,2 or 3)"
label variable RX1CAT4 "For RX1, MULTUM drug category #4 - most detailed level (can be either Level 1,2 or 3)"
label variable RX1V1C1 "For RX1, level 1 of MULTUM drug category #1 (broad level)"
label variable RX1V1C2 "For RX1, level 1 of MULTUM drug category #2 (broad level)"
label variable RX1V1C3 "For RX1, level 1 of MULTUM drug category #3 (broad level)"
label variable RX1V1C4 "For RX1, level 1 of MULTUM drug category #4 (broad level)"
label variable RX1V2C1 "For RX1, level 2 of MULTUM drug category #1 (intermediate level)"
label variable RX1V2C2 "For RX1, level 2 of MULTUM drug category #2 (intermediate level)"
label variable RX1V2C3 "For RX1, level 2 of MULTUM drug category #3 (intermediate level)"
label variable RX1V2C4 "For RX1, level 2 of MULTUM drug category #4 (intermediate level)"
label variable RX1V3C1 "For RX1, level 3 of MULTUM drug category #1 (detailed level)"
label variable RX1V3C2 "For RX1, level 3 of MULTUM drug category #2 (detailed level)"
label variable RX1V3C3 "For RX1, level 3 of MULTUM drug category #3 (detailed level)"
label variable RX1V3C4 "For RX1, level 3 of MULTUM drug category #4 (detailed level)"
label variable DRUGID2 "Drug ID code for medication #2"
label variable PRESCR2 "Prescription status code for medication #2"
label variable CONTSUB2 "Controlled substance status code for medication #2"
label variable COMSTAT2 "Composition status code for medication #2"
label variable RX2CAT1 "For RX2, MULTUM drug category #1 - most detailed level (can be either Level 1,2 or 3)"
label variable RX2CAT2 "For RX2, MULTUM drug category #2 - most detailed level (can be either Level 1,2 or 3)"
label variable RX2CAT3 "For RX2, MULTUM drug category #3 - most detailed level (can be either Level 1,2 or 3)"
label variable RX2CAT4 "For RX2, MULTUM drug category #4 - most detailed level (can be either Level 1,2 or 3)"
label variable RX2V1C1 "For RX2, level 1 of MULTUM drug category #1 (broad level)"
label variable RX2V1C2 "For RX2, level 1 of MULTUM drug category #2 (broad level)"
label variable RX2V1C3 "For RX2, level 1 of MULTUM drug category #3 (broad level)"
label variable RX2V1C4 "For RX2, level 1 of MULTUM drug category #4 (broad level)"
label variable RX2V2C1 "For RX2, level 2 of MULTUM drug category #1 (intermediate level)"
label variable RX2V2C2 "For RX2, level 2 of MULTUM drug category #2 (intermediate level)"
label variable RX2V2C3 "For RX2, level 2 of MULTUM drug category #3 (intermediate level)"
label variable RX2V2C4 "For RX2, level 2 of MULTUM drug category #4 (intermediate level)"
label variable RX2V3C1 "For RX2, level 3 of MULTUM drug category #1 (detailed level)"
label variable RX2V3C2 "For RX2, level 3 of MULTUM drug category #2 (detailed level)"
label variable RX2V3C3 "For RX2, level 3 of MULTUM drug category #3 (detailed level)"
label variable RX2V3C4 "For RX2, level 3 of MULTUM drug category #4 (detailed level)"
label variable DRUGID3 "Drug ID code for medication #3"
label variable PRESCR3 "Prescription status code for medication #3"
label variable CONTSUB3 "Controlled substance status code for medication #3"
label variable COMSTAT3 "Composition status code for medication #3"
label variable RX3CAT1 "For RX3, MULTUM drug category #1 - most detailed level (can be either Level 1,2 or 3)"
label variable RX3CAT2 "For RX3, MULTUM drug category #2 - most detailed level (can be either Level 1,2 or 3)"
label variable RX3CAT3 "For RX3, MULTUM drug category #3 - most detailed level (can be either Level 1,2 or 3)"
label variable RX3CAT4 "For RX3, MULTUM drug category #4 - most detailed level (can be either Level 1,2 or 3)"
label variable RX3V1C1 "For RX3, level 1 of MULTUM drug category #1 (broad level)"
label variable RX3V1C2 "For RX3, level 1 of MULTUM drug category #2 (broad level)"
label variable RX3V1C3 "For RX3, level 1 of MULTUM drug category #3 (broad level)"
label variable RX3V1C4 "For RX3, level 1 of MULTUM drug category #4 (broad level)"
label variable RX3V2C1 "For RX3, level 2 of MULTUM drug category #1 (intermediate level)"
label variable RX3V2C2 "For RX3, level 2 of MULTUM drug category #2 (intermediate level)"
label variable RX3V2C3 "For RX3, level 2 of MULTUM drug category #3 (intermediate level)"
label variable RX3V2C4 "For RX3, level 2 of MULTUM drug category #4 (intermediate level)"
label variable RX3V3C1 "For RX3, level 3 of MULTUM drug category #1 (detailed level)"
label variable RX3V3C2 "For RX3, level 3 of MULTUM drug category #2 (detailed level)"
label variable RX3V3C3 "For RX3, level 3 of MULTUM drug category #3 (detailed level)"
label variable RX3V3C4 "For RX3, level 3 of MULTUM drug category #4 (detailed level)"
label variable DRUGID4 "Drug ID code for medication #4"
label variable PRESCR4 "Prescription status code for medication #4"
label variable CONTSUB4 "Controlled substance status code for medication #4"
label variable COMSTAT4 "Composition status code for medication #4"
label variable RX4CAT1 "For RX4, MULTUM drug category #1 - most detailed level (can be either Level 1,2 or 3)"
label variable RX4CAT2 "For RX4, MULTUM drug category #2 - most detailed level (can be either Level 1,2 or 3)"
label variable RX4CAT3 "For RX4, MULTUM drug category #3 - most detailed level (can be either Level 1,2 or 3)"
label variable RX4CAT4 "For RX4, MULTUM drug category #4 - most detailed level (can be either Level 1,2 or 3)"
label variable RX4V1C1 "For RX4, level 1 of MULTUM drug category #1 (broad level)"
label variable RX4V1C2 "For RX4, level 1 of MULTUM drug category #2 (broad level)"
label variable RX4V1C3 "For RX4, level 1 of MULTUM drug category #3 (broad level)"
label variable RX4V1C4 "For RX4, level 1 of MULTUM drug category #4 (broad level)"
label variable RX4V2C1 "For RX4, level 2 of MULTUM drug category #1 (intermediate level)"
label variable RX4V2C2 "For RX4, level 2 of MULTUM drug category #2 (intermediate level)"
label variable RX4V2C3 "For RX4, level 2 of MULTUM drug category #3 (intermediate level)"
label variable RX4V2C4 "For RX4, level 2 of MULTUM drug category #4 (intermediate level)"
label variable RX4V3C1 "For RX4, level 3 of MULTUM drug category #1 (detailed level)"
label variable RX4V3C2 "For RX4, level 3 of MULTUM drug category #2 (detailed level)"
label variable RX4V3C3 "For RX4, level 3 of MULTUM drug category #3 (detailed level)"
label variable RX4V3C4 "For RX4, level 3 of MULTUM drug category #4 (detailed level)"
label variable DRUGID5 "Drug ID code for medication #5"
label variable PRESCR5 "Prescription status code medication #5"
label variable CONTSUB5 "Controlled substance status code medication #5"
label variable COMSTAT5 "Composition status code medication #5"
label variable RX5CAT1 "For RX5, MULTUM drug category #1 - most detailed level (can be either Level 1,2 or 3)"
label variable RX5CAT2 "For RX5, MULTUM drug category #2 - most detailed level (can be either Level 1,2 or 3)"
label variable RX5CAT3 "For RX5, MULTUM drug category #3 - most detailed level (can be either Level 1,2 or 3)"
label variable RX5CAT4 "For RX5, MULTUM drug category #4 - most detailed level (can be either Level 1,2 or 3)"
label variable RX5V1C1 "For RX5, level 1 of MULTUM drug category #1 (broad level)"
label variable RX5V1C2 "For RX5, level 1 of MULTUM drug category #2 (broad level)"
label variable RX5V1C3 "For RX5, level 1 of MULTUM drug category #3 (broad level)"
label variable RX5V1C4 "For RX5, level 1 of MULTUM drug category #4 (broad level)"
label variable RX5V2C1 "For RX5, level 2 of MULTUM drug category #1 (intermediate level)"
label variable RX5V2C2 "For RX5, level 2 of MULTUM drug category #2 (intermediate level)"
label variable RX5V2C3 "For RX5, level 2 of MULTUM drug category #3 (intermediate level)"
label variable RX5V2C4 "For RX5, level 2 of MULTUM drug category #4 (intermediate level)"
label variable RX5V3C1 "For RX5, level 3 of MULTUM drug category #1 (detailed level)"
label variable RX5V3C2 "For RX5, level 3 of MULTUM drug category #2 (detailed level)"
label variable RX5V3C3 "For RX5, level 3 of MULTUM drug category #3 (detailed level)"
label variable RX5V3C4 "For RX5, level 3 of MULTUM drug category #4 (detailed level)"
label variable DRUGID6 "Drug ID code for medication #6"
label variable PRESCR6 "Prescription status code for medication #6"
label variable CONTSUB6 "Controlled substance status code for medication #6"
label variable COMSTAT6 "Composition status code for medication #6"
label variable RX6CAT1 "For RX6, MULTUM drug category #1 - most detailed level (can be either Level 1,2 or 3)"
label variable RX6CAT2 "For RX6, MULTUM drug category #2 - most detailed level (can be either Level 1,2 or 3)"
label variable RX6CAT3 "For RX6, MULTUM drug category #3 - most detailed level (can be either Level 1,2 or 3)"
label variable RX6CAT4 "For RX6, MULTUM drug category #4 - most detailed level (can be either Level 1,2 or 3)"
label variable RX6V1C1 "For RX6, level 1 of MULTUM drug category #1 (broad level)"
label variable RX6V1C2 "For RX6, level 1 of MULTUM drug category #2 (broad level)"
label variable RX6V1C3 "For RX6, level 1 of MULTUM drug category #3 (broad level)"
label variable RX6V1C4 "For RX6, level 1 of MULTUM drug category #4 (broad level)"
label variable RX6V2C1 "For RX6, level 2 of MULTUM drug category #1 (intermediate level)"
label variable RX6V2C2 "For RX6, level 2 of MULTUM drug category #2 (intermediate level)"
label variable RX6V2C3 "For RX6, level 2 of MULTUM drug category #3 (intermediate level)"
label variable RX6V2C4 "For RX6, level 2 of MULTUM drug category #4 (intermediate level)"
label variable RX6V3C1 "For RX6, level 3 of MULTUM drug category #1 (detailed level)"
label variable RX6V3C2 "For RX6, level 3 of MULTUM drug category #2 (detailed level)"
label variable RX6V3C3 "For RX6, level 3 of MULTUM drug category #3 (detailed level)"
label variable RX6V3C4 "For RX6, level 3 of MULTUM drug category #4 (detailed level)"
label variable DRUGID7 "Drug ID code for medication #7"
label variable PRESCR7 "Prescription status code for medication #7"
label variable CONTSUB7 "Controlled substance status code for medication #7"
label variable COMSTAT7 "Composition status code for medication #7"
label variable RX7CAT1 "For RX7, MULTUM drug category #1 - most detailed level (can be either Level 1,2 or 3)"
label variable RX7CAT2 "For RX7, MULTUM drug category #2 - most detailed level (can be either Level 1,2 or 3)"
label variable RX7CAT3 "For RX7, MULTUM drug category #3 - most detailed level (can be either Level 1,2 or 3)"
label variable RX7CAT4 "For RX7, MULTUM drug category #4 - most detailed level (can be either Level 1,2 or 3)"
label variable RX7V1C1 "For RX7, level 1 of MULTUM drug category #1 (broad level)"
label variable RX7V1C2 "For RX7, level 1 of MULTUM drug category #2 (broad level)"
label variable RX7V1C3 "For RX7, level 1 of MULTUM drug category #3 (broad level)"
label variable RX7V1C4 "For RX7, level 1 of MULTUM drug category #4 (broad level)"
label variable RX7V2C1 "For RX7, level 2 of MULTUM drug category #1 (intermediate level)"
label variable RX7V2C2 "For RX7, level 2 of MULTUM drug category #2 (intermediate level)"
label variable RX7V2C3 "For RX7, level 2 of MULTUM drug category #3 (intermediate level)"
label variable RX7V2C4 "For RX7, level 2 of MULTUM drug category #4 (intermediate level)"
label variable RX7V3C1 "For RX7, level 3 of MULTUM drug category #1 (detailed level)"
label variable RX7V3C2 "For RX7, level 3 of MULTUM drug category #2 (detailed level)"
label variable RX7V3C3 "For RX7, level 3 of MULTUM drug category #3 (detailed level)"
label variable RX7V3C4 "For RX7, level 3 of MULTUM drug category #4 (detailed level)"
label variable DRUGID8 "Drug ID code for medication #8"
label variable PRESCR8 "Prescription status code for medication #8"
label variable CONTSUB8 "Controlled substance status code for medication #8"
label variable COMSTAT8 "Composition status code for medication #8"
label variable RX8CAT1 "For RX8, MULTUM drug category #1 - most detailed level (can be either Level 1,2 or 3)"
label variable RX8CAT2 "For RX8, MULTUM drug category #2 - most detailed level (can be either Level 1,2 or 3)"
label variable RX8CAT3 "For RX8, MULTUM drug category #3 - most detailed level (can be either Level 1,2 or 3)"
label variable RX8CAT4 "For RX8, MULTUM drug category #4 - most detailed level (can be either Level 1,2 or 3)"
label variable RX8V1C1 "For RX8, level 1 of MULTUM drug category #1 (broad level)"
label variable RX8V1C2 "For RX8, level 1 of MULTUM drug category #2 (broad level)"
label variable RX8V1C3 "For RX8, level 1 of MULTUM drug category #3 (broad level)"
label variable RX8V1C4 "For RX8, level 1 of MULTUM drug category #4 (broad level)"
label variable RX8V2C1 "For RX8, level 2 of MULTUM drug category #1 (intermediate level)"
label variable RX8V2C2 "For RX8, level 2 of MULTUM drug category #2 (intermediate level)"
label variable RX8V2C3 "For RX8, level 2 of MULTUM drug category #3 (intermediate level)"
label variable RX8V2C4 "For RX8, level 2 of MULTUM drug category #4 (intermediate level)"
label variable RX8V3C1 "For RX8, level 3 of MULTUM drug category #1 (detailed level)"
label variable RX8V3C2 "For RX8, level 3 of MULTUM drug category #2 (detailed level)"
label variable RX8V3C3 "For RX8, level 3 of MULTUM drug category #3 (detailed level)"
label variable RX8V3C4 "For RX8, level 3 of MULTUM drug category #4 (detailed level)"
label variable DRUGID9 "Drug ID code for medication #9"
label variable PRESCR9 "Prescription status code for medication #9"
label variable CONTSUB9 "Controlled substance status code for medication #9"
label variable COMSTAT9 "Composition status code for medication #9"
label variable RX9CAT1 "For RX9, MULTUM drug category #1 - most detailed level (can be either Level 1,2 or 3)"
label variable RX9CAT2 "For RX9, MULTUM drug category #2 - most detailed level (can be either Level 1,2 or 3)"
label variable RX9CAT3 "For RX9, MULTUM drug category #3 - most detailed level (can be either Level 1,2 or 3)"
label variable RX9CAT4 "For RX9, MULTUM drug category #4 - most detailed level (can be either Level 1,2 or 3)"
label variable RX9V1C1 "For RX9, level 1 of MULTUM drug category #1 (broad level)"
label variable RX9V1C2 "For RX9, level 1 of MULTUM drug category #2 (broad level)"
label variable RX9V1C3 "For RX9, level 1 of MULTUM drug category #3 (broad level)"
label variable RX9V1C4 "For RX9, level 1 of MULTUM drug category #4 (broad level)"
label variable RX9V2C1 "For RX9, level 2 of MULTUM drug category #1 (intermediate level)"
label variable RX9V2C2 "For RX9, level 2 of MULTUM drug category #2 (intermediate level)"
label variable RX9V2C3 "For RX9, level 2 of MULTUM drug category #3 (intermediate level)"
label variable RX9V2C4 "For RX9, level 2 of MULTUM drug category #4 (intermediate level)"
label variable RX9V3C1 "For RX9, level 3 of MULTUM drug category #1 (detailed level)"
label variable RX9V3C2 "For RX9, level 3 of MULTUM drug category #2 (detailed level)"
label variable RX9V3C3 "For RX9, level 3 of MULTUM drug category #3 (detailed level)"
label variable RX9V3C4 "For RX9, level 3 of MULTUM drug category #4 (detailed level)"
label variable DRUGID10 "Drug ID code for medication #10"
label variable PRESCR10 "Prescription status code for medication #10"
label variable CONTSUB10 "Controlled substance status code for medication #10"
label variable COMSTAT10 "Composition status code for medication #10"
label variable RX10CAT1 "For RX10, MULTUM drug category #1 - most detailed level (can be either Level 1,2 or 3)"
label variable RX10CAT2 "For RX10, MULTUM drug category #2 - most detailed level (can be either Level 1,2 or 3)"
label variable RX10CAT3 "For RX10, MULTUM drug category #3 - most detailed level (can be either Level 1,2 or 3)"
label variable RX10CAT4 "For RX10, MULTUM drug category #4 - most detailed level (can be either Level 1,2 or 3)"
label variable RX10V1C1 "For RX10, level 1 of MULTUM drug category #1 (broad level)"
label variable RX10V1C2 "For RX10, level 1 of MULTUM drug category #2 (broad level)"
label variable RX10V1C3 "For RX10, level 1 of MULTUM drug category #3 (broad level)"
label variable RX10V1C4 "For RX10, level 1 of MULTUM drug category #4 (broad level)"
label variable RX10V2C1 "For RX10, level 2 of MULTUM drug category #1 (intermediate level)"
label variable RX10V2C2 "For RX10, level 2 of MULTUM drug category #2 (intermediate level)"
label variable RX10V2C3 "For RX10, level 2 of MULTUM drug category #3 (intermediate level)"
label variable RX10V2C4 "For RX10, level 2 of MULTUM drug category #4 (intermediate level)"
label variable RX10V3C1 "For RX10, level 3 of MULTUM drug category #1 (detailed level)"
label variable RX10V3C2 "For RX10, level 3 of MULTUM drug category #2 (detailed level)"
label variable RX10V3C3 "For RX10, level 3 of MULTUM drug category #3 (detailed level)"
label variable RX10V3C4 "For RX10, level 3 of MULTUM drug category #4 (detailed level)"
label variable DRUGID11 "Drug ID code for medication #11"
label variable PRESCR11 "Prescription status code for medication #11"
label variable CONTSUB11 "Controlled substance status code for medication #11"
label variable COMSTAT11 "Composition status code for medication #11"
label variable RX11CAT1 "For RX11, MULTUM drug category #1 - most detailed level (can be either Level 1,2 or 3)"
label variable RX11CAT2 "For RX11, MULTUM drug category #2 - most detailed level (can be either Level 1,2 or 3)"
label variable RX11CAT3 "For RX11, MULTUM drug category #3 - most detailed level (can be either Level 1,2 or 3)"
label variable RX11CAT4 "For RX11, MULTUM drug category #4 - most detailed level (can be either Level 1,2 or 3)"
label variable RX11V1C1 "For RX11, level 1 of MULTUM drug category #1 (broad level)"
label variable RX11V1C2 "For RX11, level 1 of MULTUM drug category #2 (broad level)"
label variable RX11V1C3 "For RX11, level 1 of MULTUM drug category #3 (broad level)"
label variable RX11V1C4 "For RX11, level 1 of MULTUM drug category #4 (broad level)"
label variable RX11V2C1 "For RX11, level 2 of MULTUM drug category #1 (intermediate level)"
label variable RX11V2C2 "For RX11, level 2 of MULTUM drug category #2 (intermediate level)"
label variable RX11V2C3 "For RX11, level 2 of MULTUM drug category #3 (intermediate level)"
label variable RX11V2C4 "For RX11, level 2 of MULTUM drug category #4 (intermediate level)"
label variable RX11V3C1 "For RX11, level 3 of MULTUM drug category #1 (detailed level)"
label variable RX11V3C2 "For RX11, level 3 of MULTUM drug category #2 (detailed level)"
label variable RX11V3C3 "For RX11, level 3 of MULTUM drug category #3 (detailed level)"
label variable RX11V3C4 "For RX11, level 3 of MULTUM drug category #4 (detailed level)"
label variable DRUGID12 "Drug ID code for medication #12"
label variable PRESCR12 "Prescription status code for medication #12"
label variable CONTSUB12 "Controlled substance status code for medication #12"
label variable COMSTAT12 "Composition status code for medication #12"
label variable RX12CAT1 "For RX12, MULTUM drug category #1 - most detailed level (can be either Level 1,2 or 3)"
label variable RX12CAT2 "For RX12, MULTUM drug category #2 - most detailed level (can be either Level 1,2 or 3)"
label variable RX12CAT3 "For RX12, MULTUM drug category #3 - most detailed level (can be either Level 1,2 or 3)"
label variable RX12CAT4 "For RX12, MULTUM drug category #4 - most detailed level (can be either Level 1,2 or 3)"
label variable RX12V1C1 "For RX12, level 1 of MULTUM drug category #1 (broad level)"
label variable RX12V1C2 "For RX12, level 1 of MULTUM drug category #2 (broad level)"
label variable RX12V1C3 "For RX12, level 1 of MULTUM drug category #3 (broad level)"
label variable RX12V1C4 "For RX12, level 1 of MULTUM drug category #4 (broad level)"
label variable RX12V2C1 "For RX12, level 2 of MULTUM drug category #1 (intermediate level)"
label variable RX12V2C2 "For RX12, level 2 of MULTUM drug category #2 (intermediate level)"
label variable RX12V2C3 "For RX12, level 2 of MULTUM drug category #3 (intermediate level)"
label variable RX12V2C4 "For RX12, level 2 of MULTUM drug category #4 (intermediate level)"
label variable RX12V3C1 "For RX12, level 3 of MULTUM drug category #1 (detailed level)"
label variable RX12V3C2 "For RX12, level 3 of MULTUM drug category #2 (detailed level)"
label variable RX12V3C3 "For RX12, level 3 of MULTUM drug category #3 (detailed level)"
label variable RX12V3C4 "For RX12, level 3 of MULTUM drug category #4 (detailed level)"
label variable DRUGID13 "Drug ID code for medication #13"
label variable PRESCR13 "Prescription status code for medication #13"
label variable CONTSUB13 "Controlled substance status code for medication #13"
label variable COMSTAT13 "Composition status code for medication #13"
label variable RX13CAT1 "For RX13, MULTUM drug category #1 - most detailed level (can be either Level 1,2 or 3)"
label variable RX13CAT2 "For RX13, MULTUM drug category #2 - most detailed level (can be either Level 1,2 or 3)"
label variable RX13CAT3 "For RX13, MULTUM drug category #3 - most detailed level (can be either Level 1,2 or 3)"
label variable RX13CAT4 "For RX13, MULTUM drug category #4 - most detailed level (can be either Level 1,2 or 3)"
label variable RX13V1C1 "For RX13, level 1 of MULTUM drug category #1 (broad level)"
label variable RX13V1C2 "For RX13, level 1 of MULTUM drug category #2 (broad level)"
label variable RX13V1C3 "For RX13, level 1 of MULTUM drug category #3 (broad level)"
label variable RX13V1C4 "For RX13, level 1 of MULTUM drug category #4 (broad level)"
label variable RX13V2C1 "For RX13, level 2 of MULTUM drug category #1 (intermediate level)"
label variable RX13V2C2 "For RX13, level 2 of MULTUM drug category #2 (intermediate level)"
label variable RX13V2C3 "For RX13, level 2 of MULTUM drug category #3 (intermediate level)"
label variable RX13V2C4 "For RX13, level 2 of MULTUM drug category #4 (intermediate level)"
label variable RX13V3C1 "For RX13, level 3 of MULTUM drug category #1 (detailed level)"
label variable RX13V3C2 "For RX13, level 3 of MULTUM drug category #2 (detailed level)"
label variable RX13V3C3 "For RX13, level 3 of MULTUM drug category #3 (detailed level)"
label variable RX13V3C4 "For RX13, level 3 of MULTUM drug category #4 (detailed level)"
label variable DRUGID14 "Drug ID code for medication #14"
label variable PRESCR14 "Prescription status code for medication #14"
label variable CONTSUB14 "Controlled substance status code for medication #14"
label variable COMSTAT14 "Composition status code for medication #14"
label variable RX14CAT1 "For RX14, MULTUM drug category #1 - most detailed level (can be either Level 1,2 or 3)"
label variable RX14CAT2 "For RX14, MULTUM drug category #2 - most detailed level (can be either Level 1,2 or 3)"
label variable RX14CAT3 "For RX14, MULTUM drug category #3 - most detailed level (can be either Level 1,2 or 3)"
label variable RX14CAT4 "For RX14, MULTUM drug category #4 - most detailed level (can be either Level 1,2 or 3)"
label variable RX14V1C1 "For RX14, level 1 of MULTUM drug category #1 (broad level)"
label variable RX14V1C2 "For RX14, level 1 of MULTUM drug category #2 (broad level)"
label variable RX14V1C3 "For RX14, level 1 of MULTUM drug category #3 (broad level)"
label variable RX14V1C4 "For RX14, level 1 of MULTUM drug category #4 (broad level)"
label variable RX14V2C1 "For RX14, level 2 of MULTUM drug category #1 (intermediate level)"
label variable RX14V2C2 "For RX14, level 2 of MULTUM drug category #2 (intermediate level)"
label variable RX14V2C3 "For RX14, level 2 of MULTUM drug category #3 (intermediate level)"
label variable RX14V2C4 "For RX14, level 2 of MULTUM drug category #4 (intermediate level)"
label variable RX14V3C1 "For RX14, level 3 of MULTUM drug category #1 (detailed level)"
label variable RX14V3C2 "For RX14, level 3 of MULTUM drug category #2 (detailed level)"
label variable RX14V3C3 "For RX14, level 3 of MULTUM drug category #3 (detailed level)"
label variable RX14V3C4 "For RX14, level 3 of MULTUM drug category #4 (detailed level)"
label variable DRUGID15 "Drug ID code for medication #15"
label variable PRESCR15 "Prescription status code for medication #15"
label variable CONTSUB15 "Controlled substance status code for medication #15"
label variable COMSTAT15 "Composition status code for medication #15"
label variable RX15CAT1 "For RX15, MULTUM drug category #1 - most detailed level (can be either Level 1,2 or 3)"
label variable RX15CAT2 "For RX15, MULTUM drug category #2 - most detailed level (can be either Level 1,2 or 3)"
label variable RX15CAT3 "For RX15, MULTUM drug category #3 - most detailed level (can be either Level 1,2 or 3)"
label variable RX15CAT4 "For RX15, MULTUM drug category #4 - most detailed level (can be either Level 1,2 or 3)"
label variable RX15V1C1 "For RX15, level 1 of MULTUM drug category #1 (broad level)"
label variable RX15V1C2 "For RX15, level 1 of MULTUM drug category #2 (broad level)"
label variable RX15V1C3 "For RX15, level 1 of MULTUM drug category #3 (broad level)"
label variable RX15V1C4 "For RX15, level 1 of MULTUM drug category #4 (broad level)"
label variable RX15V2C1 "For RX15, level 2 of MULTUM drug category #1 (intermediate level)"
label variable RX15V2C2 "For RX15, level 2 of MULTUM drug category #2 (intermediate level)"
label variable RX15V2C3 "For RX15, level 2 of MULTUM drug category #3 (intermediate level)"
label variable RX15V2C4 "For RX15, level 2 of MULTUM drug category #4 (intermediate level)"
label variable RX15V3C1 "For RX15, level 3 of MULTUM drug category #1 (detailed level)"
label variable RX15V3C2 "For RX15, level 3 of MULTUM drug category #2 (detailed level)"
label variable RX15V3C3 "For RX15, level 3 of MULTUM drug category #3 (detailed level)"
label variable RX15V3C4 "For RX15, level 3 of MULTUM drug category #4 (detailed level)"
label variable DRUGID16 "Drug ID code for medication #16"
label variable PRESCR16 "Prescription status code for medication #16"
label variable CONTSUB16 "Controlled substance status code for medication #16"
label variable COMSTAT16 "Composition status code for medication #16"
label variable RX16CAT1 "For RX16, MULTUM drug category #1 - most detailed level (can be either Level 1,2 or 3)"
label variable RX16CAT2 "For RX16, MULTUM drug category #2 - most detailed level (can be either Level 1,2 or 3)"
label variable RX16CAT3 "For RX16, MULTUM drug category #3 - most detailed level (can be either Level 1,2 or 3)"
label variable RX16CAT4 "For RX16, MULTUM drug category #4 - most detailed level (can be either Level 1,2 or 3)"
label variable RX16V1C1 "For RX16, level 1 of MULTUM drug category #1 (broad level)"
label variable RX16V1C2 "For RX16, level 1 of MULTUM drug category #2 (broad level)"
label variable RX16V1C3 "For RX16, level 1 of MULTUM drug category #3 (broad level)"
label variable RX16V1C4 "For RX16, level 1 of MULTUM drug category #4 (broad level)"
label variable RX16V2C1 "For RX16, level 2 of MULTUM drug category #1 (intermediate level)"
label variable RX16V2C2 "For RX16, level 2 of MULTUM drug category #2 (intermediate level)"
label variable RX16V2C3 "For RX16, level 2 of MULTUM drug category #3 (intermediate level)"
label variable RX16V2C4 "For RX16, level 2 of MULTUM drug category #4 (intermediate level)"
label variable RX16V3C1 "For RX16, level 3 of MULTUM drug category #1 (detailed level)"
label variable RX16V3C2 "For RX16, level 3 of MULTUM drug category #2 (detailed level)"
label variable RX16V3C3 "For RX16, level 3 of MULTUM drug category #3 (detailed level)"
label variable RX16V3C4 "For RX16, level 3 of MULTUM drug category #4 (detailed level)"
label variable DRUGID17 "Drug ID code for medication #17"
label variable PRESCR17 "Prescription status code for medication #17"
label variable CONTSUB17 "Controlled substance status code for medication #17"
label variable COMSTAT17 "Composition status code for medication #17"
label variable RX17CAT1 "For RX17, MULTUM drug category #1 - most detailed level (can be either Level 1,2 or 3)"
label variable RX17CAT2 "For RX17, MULTUM drug category #2 - most detailed level (can be either Level 1,2 or 3)"
label variable RX17CAT3 "For RX17, MULTUM drug category #3 - most detailed level (can be either Level 1,2 or 3)"
label variable RX17CAT4 "For RX17, MULTUM drug category #4 - most detailed level (can be either Level 1,2 or 3)"
label variable RX17V1C1 "For RX17, level 1 of MULTUM drug category #1 (broad level)"
label variable RX17V1C2 "For RX17, level 1 of MULTUM drug category #2 (broad level)"
label variable RX17V1C3 "For RX17, level 1 of MULTUM drug category #3 (broad level)"
label variable RX17V1C4 "For RX17, level 1 of MULTUM drug category #4 (broad level)"
label variable RX17V2C1 "For RX17, level 2 of MULTUM drug category #1 (intermediate level)"
label variable RX17V2C2 "For RX17, level 2 of MULTUM drug category #2 (intermediate level)"
label variable RX17V2C3 "For RX17, level 2 of MULTUM drug category #3 (intermediate level)"
label variable RX17V2C4 "For RX17, level 2 of MULTUM drug category #4 (intermediate level)"
label variable RX17V3C1 "For RX17, level 3 of MULTUM drug category #1 (detailed level)"
label variable RX17V3C2 "For RX17, level 3 of MULTUM drug category #2 (detailed level)"
label variable RX17V3C3 "For RX17, level 3 of MULTUM drug category #3 (detailed level)"
label variable RX17V3C4 "For RX17, level 3 of MULTUM drug category #4 (detailed level)"
label variable DRUGID18 "Drug ID code for medication #18"
label variable PRESCR18 "Prescription status code for medication #18"
label variable CONTSUB18 "Controlled substance status code for medication #18"
label variable COMSTAT18 "Composition status code for medication #18"
label variable RX18CAT1 "For RX18, MULTUM drug category #1 - most detailed level (can be either Level 1,2 or 3)"
label variable RX18CAT2 "For RX18, MULTUM drug category #2 - most detailed level (can be either Level 1,2 or 3)"
label variable RX18CAT3 "For RX18, MULTUM drug category #3 - most detailed level (can be either Level 1,2 or 3)"
label variable RX18CAT4 "For RX18, MULTUM drug category #4 - most detailed level (can be either Level 1,2 or 3)"
label variable RX18V1C1 "For RX18, level 1 of MULTUM drug category #1 (broad level)"
label variable RX18V1C2 "For RX18, level 1 of MULTUM drug category #2 (broad level)"
label variable RX18V1C3 "For RX18, level 1 of MULTUM drug category #3 (broad level)"
label variable RX18V1C4 "For RX18, level 1 of MULTUM drug category #4 (broad level)"
label variable RX18V2C1 "For RX18, level 2 of MULTUM drug category #1 (intermediate level)"
label variable RX18V2C2 "For RX18, level 2 of MULTUM drug category #2 (intermediate level)"
label variable RX18V2C3 "For RX18, level 2 of MULTUM drug category #3 (intermediate level)"
label variable RX18V2C4 "For RX18, level 2 of MULTUM drug category #4 (intermediate level)"
label variable RX18V3C1 "For RX18, level 3 of MULTUM drug category #1 (detailed level)"
label variable RX18V3C2 "For RX18, level 3 of MULTUM drug category #2 (detailed level)"
label variable RX18V3C3 "For RX18, level 3 of MULTUM drug category #3 (detailed level)"
label variable RX18V3C4 "For RX18, level 3 of MULTUM drug category #4 (detailed level)"
label variable DRUGID19 "Drug ID code for medication #19"
label variable PRESCR19 "Prescription status code for medication #19"
label variable CONTSUB19 "Controlled substance status code for medication #19"
label variable COMSTAT19 "Composition status code for medication #19"
label variable RX19CAT1 "For RX19, MULTUM drug category #1 - most detailed level (can be either Level 1,2 or 3)"
label variable RX19CAT2 "For RX19, MULTUM drug category #2 - most detailed level (can be either Level 1,2 or 3)"
label variable RX19CAT3 "For RX19, MULTUM drug category #3 - most detailed level (can be either Level 1,2 or 3)"
label variable RX19CAT4 "For RX19, MULTUM drug category #4 - most detailed level (can be either Level 1,2 or 3)"
label variable RX19V1C1 "For RX19, level 1 of MULTUM drug category #1 (broad level)"
label variable RX19V1C2 "For RX19, level 1 of MULTUM drug category #2 (broad level)"
label variable RX19V1C3 "For RX19, level 1 of MULTUM drug category #3 (broad level)"
label variable RX19V1C4 "For RX19, level 1 of MULTUM drug category #4 (broad level)"
label variable RX19V2C1 "For RX19, level 2 of MULTUM drug category #1 (intermediate level)"
label variable RX19V2C2 "For RX19, level 2 of MULTUM drug category #2 (intermediate level)"
label variable RX19V2C3 "For RX19, level 2 of MULTUM drug category #3 (intermediate level)"
label variable RX19V2C4 "For RX19, level 2 of MULTUM drug category #4 (intermediate level)"
label variable RX19V3C1 "For RX19, level 3 of MULTUM drug category #1 (detailed level)"
label variable RX19V3C2 "For RX19, level 3 of MULTUM drug category #2 (detailed level)"
label variable RX19V3C3 "For RX19, level 3 of MULTUM drug category #3 (detailed level)"
label variable RX19V3C4 "For RX19, level 3 of MULTUM drug category #4 (detailed level)"
label variable DRUGID20 "Drug ID code for medication #20"
label variable PRESCR20 "Prescription status code for medication #20"
label variable CONTSUB20 "Controlled substance status code for medication #20"
label variable COMSTAT20 "Composition status code for medication #20"
label variable RX20CAT1 "For RX20, MULTUM drug category #1 - most detailed level (can be either Level 1,2 or 3)"
label variable RX20CAT2 "For RX20, MULTUM drug category #2 - most detailed level (can be either Level 1,2 or 3)"
label variable RX20CAT3 "For RX20, MULTUM drug category #3 - most detailed level (can be either Level 1,2 or 3)"
label variable RX20CAT4 "For RX20, MULTUM drug category #4 - most detailed level (can be either Level 1,2 or 3)"
label variable RX20V1C1 "For RX20, level 1 of MULTUM drug category #1 (broad level)"
label variable RX20V1C2 "For RX20, level 1 of MULTUM drug category #2 (broad level)"
label variable RX20V1C3 "For RX20, level 1 of MULTUM drug category #3 (broad level)"
label variable RX20V1C4 "For RX20, level 1 of MULTUM drug category #4 (broad level)"
label variable RX20V2C1 "For RX20, level 2 of MULTUM drug category #1 (intermediate level)"
label variable RX20V2C2 "For RX20, level 2 of MULTUM drug category #2 (intermediate level)"
label variable RX20V2C3 "For RX20, level 2 of MULTUM drug category #3 (intermediate level)"
label variable RX20V2C4 "For RX20, level 2 of MULTUM drug category #4 (intermediate level)"
label variable RX20V3C1 "For RX20, level 3 of MULTUM drug category #1 (detailed level)"
label variable RX20V3C2 "For RX20, level 3 of MULTUM drug category #2 (detailed level)"
label variable RX20V3C3 "For RX20, level 3 of MULTUM drug category #3 (detailed level)"
label variable RX20V3C4 "For RX20, level 3 of MULTUM drug category #4 (detailed level)"
label variable DRUGID21 "Drug ID code for medication #21"
label variable PRESCR21 "Prescription status code for medication #21"
label variable CONTSUB21 "Controlled substance status code for medication #21"
label variable COMSTAT21 "Composition status code for medication #21"
label variable RX21CAT1 "For RX21, MULTUM drug category #1 - most detailed level (can be either Level 1,2 or 3)"
label variable RX21CAT2 "For RX21, MULTUM drug category #2 - most detailed level (can be either Level 1,2 or 3)"
label variable RX21CAT3 "For RX21, MULTUM drug category #3 - most detailed level (can be either Level 1,2 or 3)"
label variable RX21CAT4 "For RX21, MULTUM drug category #4 - most detailed level (can be either Level 1,2 or 3)"
label variable RX21V1C1 "For RX21, level 1 of MULTUM drug category #1 (broad level)"
label variable RX21V1C2 "For RX21, level 1 of MULTUM drug category #2 (broad level)"
label variable RX21V1C3 "For RX21, level 1 of MULTUM drug category #3 (broad level)"
label variable RX21V1C4 "For RX21, level 1 of MULTUM drug category #4 (broad level)"
label variable RX21V2C1 "For RX21, level 2 of MULTUM drug category #1 (intermediate level)"
label variable RX21V2C2 "For RX21, level 2 of MULTUM drug category #2 (intermediate level)"
label variable RX21V2C3 "For RX21, level 2 of MULTUM drug category #3 (intermediate level)"
label variable RX21V2C4 "For RX21, level 2 of MULTUM drug category #4 (intermediate level)"
label variable RX21V3C1 "For RX21, level 3 of MULTUM drug category #1 (detailed level)"
label variable RX21V3C2 "For RX21, level 3 of MULTUM drug category #2 (detailed level)"
label variable RX21V3C3 "For RX21, level 3 of MULTUM drug category #3 (detailed level)"
label variable RX21V3C4 "For RX21, level 3 of MULTUM drug category #4 (detailed level)"
label variable DRUGID22 "Drug ID code for medication #22"
label variable PRESCR22 "Prescription status code for medication #22"
label variable CONTSUB22 "Controlled substance status code for medication #22"
label variable COMSTAT22 "Composition status code for medication #22"
label variable RX22CAT1 "For RX22, MULTUM drug category #1 - most detailed level (can be either Level 1,2 or 3)"
label variable RX22CAT2 "For RX22, MULTUM drug category #2 - most detailed level (can be either Level 1,2 or 3)"
label variable RX22CAT3 "For RX22, MULTUM drug category #3 - most detailed level (can be either Level 1,2 or 3)"
label variable RX22CAT4 "For RX22, MULTUM drug category #4 - most detailed level (can be either Level 1,2 or 3)"
label variable RX22V1C1 "For RX22, level 1 of MULTUM drug category #1 (broad level)"
label variable RX22V1C2 "For RX22, level 1 of MULTUM drug category #2 (broad level)"
label variable RX22V1C3 "For RX22, level 1 of MULTUM drug category #3 (broad level)"
label variable RX22V1C4 "For RX22, level 1 of MULTUM drug category #4 (broad level)"
label variable RX22V2C1 "For RX22, level 2 of MULTUM drug category #1 (intermediate level)"
label variable RX22V2C2 "For RX22, level 2 of MULTUM drug category #2 (intermediate level)"
label variable RX22V2C3 "For RX22, level 2 of MULTUM drug category #3 (intermediate level)"
label variable RX22V2C4 "For RX22, level 2 of MULTUM drug category #4 (intermediate level)"
label variable RX22V3C1 "For RX22, level 3 of MULTUM drug category #1 (detailed level)"
label variable RX22V3C2 "For RX22, level 3 of MULTUM drug category #2 (detailed level)"
label variable RX22V3C3 "For RX22, level 3 of MULTUM drug category #3 (detailed level)"
label variable RX22V3C4 "For RX22, level 3 of MULTUM drug category #4 (detailed level)"
label variable DRUGID23 "Drug ID code for medication #23"
label variable PRESCR23 "Prescription status code for medication #23"
label variable CONTSUB23 "Controlled substance status code for medication #23"
label variable COMSTAT23 "Composition status code for medication #23"
label variable RX23CAT1 "For RX23, MULTUM drug category #1 - most detailed level (can be either Level 1,2 or 3)"
label variable RX23CAT2 "For RX23, MULTUM drug category #2 - most detailed level (can be either Level 1,2 or 3)"
label variable RX23CAT3 "For RX23, MULTUM drug category #3 - most detailed level (can be either Level 1,2 or 3)"
label variable RX23CAT4 "For RX23, MULTUM drug category #4 - most detailed level (can be either Level 1,2 or 3)"
label variable RX23V1C1 "For RX23, level 1 of MULTUM drug category #1 (broad level)"
label variable RX23V1C2 "For RX23, level 1 of MULTUM drug category #2 (broad level)"
label variable RX23V1C3 "For RX23, level 1 of MULTUM drug category #3 (broad level)"
label variable RX23V1C4 "For RX23, level 1 of MULTUM drug category #4 (broad level)"
label variable RX23V2C1 "For RX23, level 2 of MULTUM drug category #1 (intermediate level)"
label variable RX23V2C2 "For RX23, level 2 of MULTUM drug category #2 (intermediate level)"
label variable RX23V2C3 "For RX23, level 2 of MULTUM drug category #3 (intermediate level)"
label variable RX23V2C4 "For RX23, level 2 of MULTUM drug category #4 (intermediate level)"
label variable RX23V3C1 "For RX23, level 3 of MULTUM drug category #1 (detailed level)"
label variable RX23V3C2 "For RX23, level 3 of MULTUM drug category #2 (detailed level)"
label variable RX23V3C3 "For RX23, level 3 of MULTUM drug category #3 (detailed level)"
label variable RX23V3C4 "For RX23, level 3 of MULTUM drug category #4 (detailed level)"
label variable DRUGID24 "Drug ID code for medication #24"
label variable PRESCR24 "Prescription status code for medication #24"
label variable CONTSUB24 "Controlled substance status code for medication #24"
label variable COMSTAT24 "Composition status code for medication #24"
label variable RX24CAT1 "For RX24, MULTUM drug category #1 - most detailed level (can be either Level 1,2 or 3)"
label variable RX24CAT2 "For RX24, MULTUM drug category #2 - most detailed level (can be either Level 1,2 or 3)"
label variable RX24CAT3 "For RX24, MULTUM drug category #3 - most detailed level (can be either Level 1,2 or 3)"
label variable RX24CAT4 "For RX24, MULTUM drug category #4 - most detailed level (can be either Level 1,2 or 3)"
label variable RX24V1C1 "For RX24, level 1 of MULTUM drug category #1 (broad level)"
label variable RX24V1C2 "For RX24, level 1 of MULTUM drug category #2 (broad level)"
label variable RX24V1C3 "For RX24, level 1 of MULTUM drug category #3 (broad level)"
label variable RX24V1C4 "For RX24, level 1 of MULTUM drug category #4 (broad level)"
label variable RX24V2C1 "For RX24, level 2 of MULTUM drug category #1 (intermediate level)"
label variable RX24V2C2 "For RX24, level 2 of MULTUM drug category #2 (intermediate level)"
label variable RX24V2C3 "For RX24, level 2 of MULTUM drug category #3 (intermediate level)"
label variable RX24V2C4 "For RX24, level 2 of MULTUM drug category #4 (intermediate level)"
label variable RX24V3C1 "For RX24, level 3 of MULTUM drug category #1 (detailed level)"
label variable RX24V3C2 "For RX24, level 3 of MULTUM drug category #2 (detailed level)"
label variable RX24V3C3 "For RX24, level 3 of MULTUM drug category #3 (detailed level)"
label variable RX24V3C4 "For RX24, level 3 of MULTUM drug category #4 (detailed level)"
label variable DRUGID25 "Drug ID code for medication #25"
label variable PRESCR25 "Prescription status code for medication #25"
label variable CONTSUB25 "Controlled substance status code for medication #25"
label variable COMSTAT25 "Composition status code for medication #25"
label variable RX25CAT1 "For RX25, MULTUM drug category #1 - most detailed level (can be either Level 1,2 or 3)"
label variable RX25CAT2 "For RX25, MULTUM drug category #2 - most detailed level (can be either Level 1,2 or 3)"
label variable RX25CAT3 "For RX25, MULTUM drug category #3 - most detailed level (can be either Level 1,2 or 3)"
label variable RX25CAT4 "For RX25, MULTUM drug category #4 - most detailed level (can be either Level 1,2 or 3)"
label variable RX25V1C1 "For RX25, level 1 of MULTUM drug category #1 (broad level)"
label variable RX25V1C2 "For RX25, level 1 of MULTUM drug category #2 (broad level)"
label variable RX25V1C3 "For RX25, level 1 of MULTUM drug category #3 (broad level)"
label variable RX25V1C4 "For RX25, level 1 of MULTUM drug category #4 (broad level)"
label variable RX25V2C1 "For RX25, level 2 of MULTUM drug category #1 (intermediate level)"
label variable RX25V2C2 "For RX25, level 2 of MULTUM drug category #2 (intermediate level)"
label variable RX25V2C3 "For RX25, level 2 of MULTUM drug category #3 (intermediate level)"
label variable RX25V2C4 "For RX25, level 2 of MULTUM drug category #4 (intermediate level)"
label variable RX25V3C1 "For RX25, level 3 of MULTUM drug category #1 (detailed level)"
label variable RX25V3C2 "For RX25, level 3 of MULTUM drug category #2 (detailed level)"
label variable RX25V3C3 "For RX25, level 3 of MULTUM drug category #3 (detailed level)"
label variable RX25V3C4 "For RX25, level 3 of MULTUM drug category #4 (detailed level)"
label variable DRUGID26 "Drug ID code for medication #26"
label variable PRESCR26 "Prescription status code for medication #26"
label variable CONTSUB26 "Controlled substance status code for medication #26"
label variable COMSTAT26 "Composition status code for medication #26"
label variable RX26CAT1 "For RX26, MULTUM drug category #1 - most detailed level (can be either Level 1,2 or 3)"
label variable RX26CAT2 "For RX26, MULTUM drug category #2 - most detailed level (can be either Level 1,2 or 3)"
label variable RX26CAT3 "For RX26, MULTUM drug category #3 - most detailed level (can be either Level 1,2 or 3)"
label variable RX26CAT4 "For RX26, MULTUM drug category #4 - most detailed level (can be either Level 1,2 or 3)"
label variable RX26V1C1 "For RX26, level 1 of MULTUM drug category #1 (broad level)"
label variable RX26V1C2 "For RX26, level 1 of MULTUM drug category #2 (broad level)"
label variable RX26V1C3 "For RX26, level 1 of MULTUM drug category #3 (broad level)"
label variable RX26V1C4 "For RX26, level 1 of MULTUM drug category #4 (broad level)"
label variable RX26V2C1 "For RX26, level 2 of MULTUM drug category #1 (intermediate level)"
label variable RX26V2C2 "For RX26, level 2 of MULTUM drug category #2 (intermediate level)"
label variable RX26V2C3 "For RX26, level 2 of MULTUM drug category #3 (intermediate level)"
label variable RX26V2C4 "For RX26, level 2 of MULTUM drug category #4 (intermediate level)"
label variable RX26V3C1 "For RX26, level 3 of MULTUM drug category #1 (detailed level)"
label variable RX26V3C2 "For RX26, level 3 of MULTUM drug category #2 (detailed level)"
label variable RX26V3C3 "For RX26, level 3 of MULTUM drug category #3 (detailed level)"
label variable RX26V3C4 "For RX26, level 3 of MULTUM drug category #4 (detailed level)"
label variable DRUGID27 "Drug ID code for medication #27"
label variable PRESCR27 "Prescription status code for medication #27"
label variable CONTSUB27 "Controlled substance status code for medication #27"
label variable COMSTAT27 "Composition status code for medication #27"
label variable RX27CAT1 "For RX27, MULTUM drug category #1 - most detailed level (can be either Level 1,2 or 3)"
label variable RX27CAT2 "For RX27, MULTUM drug category #2 - most detailed level (can be either Level 1,2 or 3)"
label variable RX27CAT3 "For RX27, MULTUM drug category #3 - most detailed level (can be either Level 1,2 or 3)"
label variable RX27CAT4 "For RX27, MULTUM drug category #4 - most detailed level (can be either Level 1,2 or 3)"
label variable RX27V1C1 "For RX27, level 1 of MULTUM drug category #1 (broad level)"
label variable RX27V1C2 "For RX27, level 1 of MULTUM drug category #2 (broad level)"
label variable RX27V1C3 "For RX27, level 1 of MULTUM drug category #3 (broad level)"
label variable RX27V1C4 "For RX27, level 1 of MULTUM drug category #4 (broad level)"
label variable RX27V2C1 "For RX27, level 2 of MULTUM drug category #1 (intermediate level)"
label variable RX27V2C2 "For RX27, level 2 of MULTUM drug category #2 (intermediate level)"
label variable RX27V2C3 "For RX27, level 2 of MULTUM drug category #3 (intermediate level)"
label variable RX27V2C4 "For RX27, level 2 of MULTUM drug category #4 (intermediate level)"
label variable RX27V3C1 "For RX27, level 3 of MULTUM drug category #1 (detailed level)"
label variable RX27V3C2 "For RX27, level 3 of MULTUM drug category #2 (detailed level)"
label variable RX27V3C3 "For RX27, level 3 of MULTUM drug category #3 (detailed level)"
label variable RX27V3C4 "For RX27, level 3 of MULTUM drug category #4 (detailed level)"
label variable DRUGID28 "Drug ID code for medication #28"
label variable PRESCR28 "Prescription status code for medication #28"
label variable CONTSUB28 "Controlled substance status code for medication #28"
label variable COMSTAT28 "Composition status code for medication #28"
label variable RX28CAT1 "For RX28, MULTUM drug category #1 - most detailed level (can be either Level 1,2 or 3)"
label variable RX28CAT2 "For RX28, MULTUM drug category #2 - most detailed level (can be either Level 1,2 or 3)"
label variable RX28CAT3 "For RX28, MULTUM drug category #3 - most detailed level (can be either Level 1,2 or 3)"
label variable RX28CAT4 "For RX28, MULTUM drug category #4 - most detailed level (can be either Level 1,2 or 3)"
label variable RX28V1C1 "For RX28, level 1 of MULTUM drug category #1 (broad level)"
label variable RX28V1C2 "For RX28, level 1 of MULTUM drug category #2 (broad level)"
label variable RX28V1C3 "For RX28, level 1 of MULTUM drug category #3 (broad level)"
label variable RX28V1C4 "For RX28, level 1 of MULTUM drug category #4 (broad level)"
label variable RX28V2C1 "For RX28, level 2 of MULTUM drug category #1 (intermediate level)"
label variable RX28V2C2 "For RX28, level 2 of MULTUM drug category #2 (intermediate level)"
label variable RX28V2C3 "For RX28, level 2 of MULTUM drug category #3 (intermediate level)"
label variable RX28V2C4 "For RX28, level 2 of MULTUM drug category #4 (intermediate level)"
label variable RX28V3C1 "For RX28, level 3 of MULTUM drug category #1 (detailed level)"
label variable RX28V3C2 "For RX28, level 3 of MULTUM drug category #2 (detailed level)"
label variable RX28V3C3 "For RX28, level 3 of MULTUM drug category #3 (detailed level)"
label variable RX28V3C4 "For RX28, level 3 of MULTUM drug category #4 (detailed level)"
label variable DRUGID29 "Drug ID code for medication #29"
label variable PRESCR29 "Prescription status code for medication #29"
label variable CONTSUB29 "Controlled substance status code for medication #29"
label variable COMSTAT29 "Composition status code for medication #29"
label variable RX29CAT1 "For RX29, MULTUM drug category #1 - most detailed level (can be either Level 1,2 or 3)"
label variable RX29CAT2 "For RX29, MULTUM drug category #2 - most detailed level (can be either Level 1,2 or 3)"
label variable RX29CAT3 "For RX29, MULTUM drug category #3 - most detailed level (can be either Level 1,2 or 3)"
label variable RX29CAT4 "For RX29, MULTUM drug category #4 - most detailed level (can be either Level 1,2 or 3)"
label variable RX29V1C1 "For RX29, level 1 of MULTUM drug category #1 (broad level)"
label variable RX29V1C2 "For RX29, level 1 of MULTUM drug category #2 (broad level)"
label variable RX29V1C3 "For RX29, level 1 of MULTUM drug category #3 (broad level)"
label variable RX29V1C4 "For RX29, level 1 of MULTUM drug category #4 (broad level)"
label variable RX29V2C1 "For RX29, level 2 of MULTUM drug category #1 (intermediate level)"
label variable RX29V2C2 "For RX29, level 2 of MULTUM drug category #2 (intermediate level)"
label variable RX29V2C3 "For RX29, level 2 of MULTUM drug category #3 (intermediate level)"
label variable RX29V2C4 "For RX29, level 2 of MULTUM drug category #4 (intermediate level)"
label variable RX29V3C1 "For RX29, level 3 of MULTUM drug category #1 (detailed level)"
label variable RX29V3C2 "For RX29, level 3 of MULTUM drug category #2 (detailed level)"
label variable RX29V3C3 "For RX29, level 3 of MULTUM drug category #3 (detailed level)"
label variable RX29V3C4 "For RX29, level 3 of MULTUM drug category #4 (detailed level)"
label variable DRUGID30 "Drug ID code for medication #30"
label variable PRESCR30 "Prescription status code for medication #30"
label variable CONTSUB30 "Controlled substance status code for medication #30"
label variable COMSTAT30 "Composition status code for medication #30"
label variable RX30CAT1 "For RX30, MULTUM drug category #1 - most detailed level (can be either Level 1,2 or 3)"
label variable RX30CAT2 "For RX30, MULTUM drug category #2 - most detailed level (can be either Level 1,2 or 3)"
label variable RX30CAT3 "For RX30, MULTUM drug category #3 - most detailed level (can be either Level 1,2 or 3)"
label variable RX30CAT4 "For RX30, MULTUM drug category #4 - most detailed level (can be either Level 1,2 or 3)"
label variable RX30V1C1 "For RX30, level 1 of MULTUM drug category #1 (broad level)"
label variable RX30V1C2 "For RX30, level 1 of MULTUM drug category #2 (broad level)"
label variable RX30V1C3 "For RX30, level 1 of MULTUM drug category #3 (broad level)"
label variable RX30V1C4 "For RX30, level 1 of MULTUM drug category #4 (broad level)"
label variable RX30V2C1 "For RX30, level 2 of MULTUM drug category #1 (intermediate level)"
label variable RX30V2C2 "For RX30, level 2 of MULTUM drug category #2 (intermediate level)"
label variable RX30V2C3 "For RX30, level 2 of MULTUM drug category #3 (intermediate level)"
label variable RX30V2C4 "For RX30, level 2 of MULTUM drug category #4 (intermediate level)"
label variable RX30V3C1 "For RX30, level 3 of MULTUM drug category #1 (detailed level)"
label variable RX30V3C2 "For RX30, level 3 of MULTUM drug category #2 (detailed level)"
label variable RX30V3C3 "For RX30, level 3 of MULTUM drug category #3 (detailed level)"
label variable RX30V3C4 "For RX30, level 3 of MULTUM drug category #4 (detailed level)"
label variable SETTYPE "Setting type"
label variable YEAR "Survey year"
label variable CSTRATM "Clustered CSTRATM -- masked"
label variable CPSUM "Clustered CPSUM -- masked"
label variable PATWT "Patient visit weight"
label variable EDWT "ED weight"
label variable BOARDED "Length of time boarded in ED in minutes"

label define ADISPF 	-9 "Blank"  
label define ADISPF 	-8 "Unknown (data not available)" , add
label define ADISPF 	-7 "Not applicable" , add
label define ADISPF 	 1 "Home/Residence" , add
label define ADISPF 	 2 "Return/Transfer to nursing home" , add
label define ADISPF 	 3 "Transfer to another facility (not usual place of residence)" , add
label define ADISPF      4 "Other" , add
label define ADMDIVF -9 "Blank"  
label define ADMDIVF -8 "Unknown" , add
label define ADMDIVF -7 "Not applicable" , add
label define ADMDIVF 1 "Yes" , add
label define ADMDIVF 2 "No" , add
label define ADMITF -9 "Blank"  
label define ADMITF -8 "Unknown (data not available)" , add
label define ADMITF -7 "Not applicable" , add
label define ADMITF 	1 "Critical care unit" , add
label define ADMITF 	2 "Stepdown unit" , add
label define ADMITF 	3 "Operating room" , add
label define ADMITF 	4 "Mental health or detox unit" , add
label define ADMITF 	5 "Cardiac catheterization lab" , add
label define ADMITF 	6 "Other bed/unit" , add
label define ADMTPHYSF -9 "Blank"  
label define ADMTPHYSF -8 "Unknown" , add
label define ADMTPHYSF -7 "Not applicable" , add
label define ADMTPHYSF 1 "Hospitalist" , add
label define ADMTPHYSF 2 "Not hospitalist" , add
label define AGEDAYSF 000 "Less than 1 day"  
label define AGEDAYSF -7 "One year or more" , add
label define AGEF 0 "Under one year"  
label define AGEF 94 "94 years and over" , add
label define AGEFLF    -9 "Age calculated by NCHS based on imputed birth date"  
label define AGEFLF     0 "Age calculated by NCHS based on reported date of birth" , add
label define AGEFLF 	1 "Age entered in survey instrument without date of birth" , add
label define AGERF 1 "Under 15 years"  
label define AGERF 2 "15-24 years" , add
label define AGERF 3 "25-44 years" , add
label define AGERF 4 "45-64 years" , add
label define AGERF 5 "65-74 years" , add
label define AGERF 6 "75 years and over" , add
label define AMBDIVF -9 "Blank"  
label define AMBDIVF -8 "Unknown" , add
label define AMBDIVF -6 "Refused to answer" , add
label define AMBDIVF 1 "Hospital's ED went on ambulance diversion in 2021" , add
label define AMBDIVF 2 "Hospital's ED did not go on diversion in 2021" , add
label define AMBTRANF -9 "Blank"  
label define AMBTRANF -8 "Unknown" , add
label define AMBTRANF -7 "Not applicable" , add
label define AMBTRANF 1 "Yes" , add
label define AMBTRANF 2 "No" , add
label define ARREMSF -9 "Blank"  
label define ARREMSF -8 "Unknown" , add
label define ARREMSF 1 "Yes" , add
label define ARREMSF 2 "No" , add
label define BEDCZARF -9 "Blank"  
label define BEDCZARF -8 "Unknown" , add
label define BEDCZARF 1 "Yes" , add
label define BEDCZARF 2 "No" , add
label define BEDDATAF -9 "Blank"  
label define BEDDATAF -8 "Unknown" , add
label define BEDDATAF 1 "Instantaneously" , add
label define BEDDATAF 2 "Every 4 hours" , add
label define BEDDATAF 3 "Every 8 hours" , add
label define BEDDATAF 4 "Every 12 hours" , add
label define BEDDATAF 5 "Every 24 hours" , add
label define BEDDATAF 6 "Other" , add
label define BEDREGF -9 "Blank"  
label define BEDREGF -8 "Unknown" , add
label define BEDREGF -6 "Refused to answer" , add
label define BEDREGF 1 "Yes" , add
label define BEDREGF 2 "No" , add
label define BOARDF -9 "Blank"  
label define BOARDF -8 "Unknown" , add
label define BOARDF -6 "Refused to answer" , add
label define BOARDF 1 "Yes" , add
label define BOARDF 2 "No" , add
label define BOARDHOSF -9 "Blank"  
label define BOARDHOSF -8 "Unknown" , add
label define BOARDHOSF -6 "Refused to answer" , add
label define BOARDHOSF 1 "Yes" , add
label define BOARDHOSF 2 "No" , add
label define BPDIASF -9 "Blank"  
label define BPDIASF 998 "P, Palp, DOP or DOPPLER" , add
label define BPSYSF -9 "Blank"  
label define COMSTATF 1 "Single entity drug"  
label define COMSTATF 2 "Combination drug" , add
label define COMSTATF 3 "Undetermined" , add
label define CONTRASTF -9 "Blank"  
label define CONTRASTF -8 "Unknown" , add
label define CONTRASTF -7 "Not applicable" , add
label define CONTRASTF 	1 "Yes" , add
label define CONTRASTF 	2 "No" , add
label define CONTSUBF 1 "Schedule I (research only)"  
label define CONTSUBF 2 "Schedule II" , add
label define CONTSUBF 3 "Schedule III" , add
label define CONTSUBF 4 "Schedule IV" , add
label define CONTSUBF 5 "Schedule V" , add
label define CONTSUBF 6 "No control" , add
label define CONTSUBF 7 "Undetermined" , add
label define CONTSUBF 8 "Multiple schedules" , add
label define DIAGSCRF 0 "No"  
label define DIAGSCRF 1 "Yes" , add
label define DIAGSCRF 2 "Entire item blank, including 'None' box" , add
label define EBILLANYF 1 "Yes"  
label define EBILLANYF 2 "No" , add
label define EBILLANYF -6 "Refused to answer" , add
label define EBILLANYF -8 "Unknown" , add
label define EBILLANYF -9 "Blank" , add
label define EDINFOF -9 "Blank"  
label define EDINFOF -8 "Unknown" , add
label define EDINFOF 1 "Yes" , add
label define EDINFOF 2 "No" , add
label define EDPRIMF -9 "Blank"  
label define EDPRIMF -8 "Unknown" , add
label define EDPRIMF -7 "Not applicable" , add
label define EDPRIMF -6 "Refused to answer" , add
label define EDPRIMF 1 "Always" , add
label define EDPRIMF 2 "Sometimes" , add
label define EDPRIMF 3 "Rarely" , add
label define EDPRIMF 4 "Never" , add
label define EHRINSF -9 "Blank"  
label define EHRINSF -8 "Unknown" , add
label define EHRINSF -6 "Refused to answer" , add
label define EHRINSF 1 "Yes" , add
label define EHRINSF 2 "No" , add
label define EHRINSF 3 "Maybe" , add
label define EMREDF -9 "Blank"  
label define EMREDF -8 "Unknown" , add
label define EMREDF -6 "Refused to answer" , add
label define EMREDF 1 "Yes, all electronic" , add
label define EMREDF 2 "Yes, part paper, part electronic" , add
label define EMREDF 3 "No" , add
label define EPISODEF -9 "Blank"  
label define EPISODEF -8 "Unknown" , add
label define EPISODEF 	1 "Initial visit to this ED" , add
label define EPISODEF 	2 "Follow-up visit to this ED" , add
label define ETHIMF 1 "Hispanic or Latino"  
label define ETHIMF 2 "Not Hispanic or Latino" , add
label define ETHUNF -9 "Blank"  
label define ETHUNF 1 "Hispanic or Latino" , add
label define ETHUNF 2 "Not Hispanic or Latino" , add
label define EXPSPACF -9 "Blank"  
label define EXPSPACF -8 "Unknown" , add
label define EXPSPACF -7 "Not applicable" , add
label define EXPSPACF 1 "Yes" , add
label define EXPSPACF 2 "No" , add
label define GPMEDF -9 "Blank"  
label define GPMEDF -7 "Not applicable, no medication listed" , add
label define GPMEDF 	1 "Given in  ED" , add
label define GPMEDF 	2 "RX at discharge" , add
label define GPMEDF 	3 "Both given and RX marked" , add
label define HDSTATF -9 "Blank"  
label define HDSTATF -8 "Unknown (data not available)" , add
label define HDSTATF -7 "Not applicable" , add
label define HDSTATF 	1 "Alive" , add
label define HDSTATF 	2 "Dead" , add
label define HHSMUEF 1 "Yes"  
label define HHSMUEF 2 "No" , add
label define HHSMUEF -6 "Refused" , add
label define HHSMUEF -7 "Not applicable" , add
label define HHSMUEF -8 "Unknown" , add
label define HHSMUEF -9 "Blank" , add
label define HLISTEDF -9 "Blank"  
label define HLISTEDF -8 "Unknown" , add
label define HLISTEDF -7 "Not applicable" , add
label define HLISTEDF 1 "Yes" , add
label define HLISTEDF 2 "No" , add
label define HLISTF -9 "Blank"  
label define HLISTF -8 "Unknown" , add
label define HLISTF 1 "Yes" , add
label define HLISTF 2 "No" , add
label define IMMEDRF -9 "Blank"  
label define IMMEDRF -8 "Unknown" , add
label define IMMEDRF 0 "No triage for this visit but ESA does conduct triage" , add
label define IMMEDRF 	1 "Immediate" , add
label define IMMEDRF 	2 "Emergent" , add
label define IMMEDRF 	3 "Urgent" , add
label define IMMEDRF 	4 "Semi-urgent" , add
label define IMMEDRF 	5 "Nonurgent" , add
label define IMMEDRF 	7 "Visit occurred in ESA that does not conduct nursing triage" , add
label define IMPUTF 0 "Not imputed"  
label define IMPUTF 1 "Imputed" , add
label define INCSHXF -9 "Blank"  
label define INCSHXF -8 "Unknown" , add
label define INCSHXF 1 "Yes" , add
label define INCSHXF 2 "No" , add
label define INJPOISADF 1 "Yes, injury/trauma"  
label define INJPOISADF 2 "Yes, overdose/poisoning" , add
label define INJPOISADF 3 "Yes, adverse effect of medical/surgical treatment" , add
label define INJPOISADF 4 "No, visit is not related to injury/trauma, overdose/poisoning, or adverse effe" , add
label define INJPOISADF 5 "Questionable injury status" , add
label define INJPOISADF -8 "Unknown" , add
label define INJPOISADF -9 "Blank" , add
label define INJURY72F -9 "Blank"  
label define INJURY72F -8 "Unknown" , add
label define INJURY72F -7 "Not applicable" , add
label define INJURY72F 1 "Yes" , add
label define INJURY72F 2 "No" , add
label define INJURY72F 3 "Questionable injury status" , add
label define INJURYENCF -9 "Blank"  
label define INJURYENCF 1 "Initial encounter for injury" , add
label define INJURYENCF 2 "Subsequent encounter for injury" , add
label define INJURYENCF 3 "Sequela encounter for injury" , add
label define INJURYENCF 4 "Both initial and subsequent encounter codes present" , add
label define INJURYENCF 5 "Both initial and sequela encounter codes present" , add
label define INJURYENCF 6 "Both subsequent and sequela encounter codes present" , add
label define INJURYENCF 7 "Initial, subsequent, and sequela codes present" , add
label define INJURYF -9 "Blank"  
label define INJURYF -8 "Unknown" , add
label define INJURYF 	0 "No" , add
label define INJURYF 	1 "Yes" , add
label define INJURYF 2 "Questionable injury status" , add
label define INTENT15F -9 "Blank"  
label define INTENT15F -8 "Unknown/intent unclear" , add
label define INTENT15F 	1 "Intentional" , add
label define INTENT15F 	2 "Unintentional" , add
label define INTENT15F 4 "Questionable injury status" , add
label define LOSF -9 "Blank"  
label define LOSF -7 "Not Applicable" , add
label define LOSF 99 "99 days or more" , add
label define LOVF -9 "Blank"  
label define MEDCODF -9 "NO ENTRY MADE"  
label define MEDCODF 00002 "TAMIFLU" , add
label define MEDCODF 00004 "LIDODERM PATCH" , add
label define MEDCODF 00009 "BICILLIN L-A" , add
label define MEDCODF 00013 "MYCOPHENOLATE MOFETIL" , add
label define MEDCODF 00032 "EXCEDRIN MIGRAINE" , add
label define MEDCODF 00036 "MAALOX PLUS" , add
label define MEDCODF 00042 "PROTONIX" , add
label define MEDCODF 00043 "D-50-W" , add
label define MEDCODF 00048 "MOBIC" , add
label define MEDCODF 00052 "SILDENAFIL CITRATE" , add
label define MEDCODF 00053 "TAMSULOSIN HYDROCHLORIDE" , add
label define MEDCODF 00059 "RHO IMMUNE GLOBULIN" , add
label define MEDCODF 00071 "CERTAVITE" , add
label define MEDCODF 00076 "TRILEPTAL" , add
label define MEDCODF 00080 "CARBIDOPA-LEVODOPA" , add
label define MEDCODF 00081 "EXELON" , add
label define MEDCODF 00084 "PREGABALIN" , add
label define MEDCODF 00101 "ISOSORBIDE DINITRATE" , add
label define MEDCODF 00102 "ISOSORBIDE MONONITRATE" , add
label define MEDCODF 00109 "URSODIOL" , add
label define MEDCODF 00117 "CRANBERRY" , add
label define MEDCODF 00122 "GATORADE" , add
label define MEDCODF 00123 "NICOTINE" , add
label define MEDCODF 00133 "CANDESARTAN" , add
label define MEDCODF 00150 "NICODERM CQ PATCH" , add
label define MEDCODF 00159 "KALETRA" , add
label define MEDCODF 00161 "BISOPROLOL" , add
label define MEDCODF 00164 "FIBRINOGEN (HUMAN)" , add
label define MEDCODF 00167 "NOVOLIN N" , add
label define MEDCODF 00169 "KETOROLAC TROMETHAMINE" , add
label define MEDCODF 00176 "PREDNISOLONE ACETATE" , add
label define MEDCODF 00184 "KEPPRA" , add
label define MEDCODF 00195 "TEMOZOLOMIDE" , add
label define MEDCODF 00198 "ENOXAPARIN SODIUM" , add
label define MEDCODF 00200 "MEPERIDINE HCL" , add
label define MEDCODF 00208 "CELECOXIB" , add
label define MEDCODF 00213 "PANTOPRAZOLE SODIUM" , add
label define MEDCODF 00218 "CARBAMIDE PEROXIDE" , add
label define MEDCODF 00224 "MILK AND MOLASSES ENEMA" , add
label define MEDCODF 00233 "CONCERTA" , add
label define MEDCODF 00239 "FEMHRT" , add
label define MEDCODF 00240 "ACEPHEN" , add
label define MEDCODF 00253 "LISPRO" , add
label define MEDCODF 00254 "CARTIA XT" , add
label define MEDCODF 00259 "FML" , add
label define MEDCODF 00260 "ACETAMINOPHEN" , add
label define MEDCODF 00268 "MOMETASONE FUROATE" , add
label define MEDCODF 00269 "SUCCINYLCHOLINE CHLORIDE" , add
label define MEDCODF 00274 "QVAR" , add
label define MEDCODF 00280 "ACETAMINOPHEN W/CODEINE" , add
label define MEDCODF 00283 "ACETAMINOPHEN W/OXYCODONE" , add
label define MEDCODF 00295 "ACETAZOLAMIDE" , add
label define MEDCODF 00305 "ACETIC ACID" , add
label define MEDCODF 00316 "LEFLUNOMIDE" , add
label define MEDCODF 00320 "ACETONE" , add
label define MEDCODF 00338 "ACETYLCYSTEINE" , add
label define MEDCODF 00341 "TDAP" , add
label define MEDCODF 00358 "FLORINEF" , add
label define MEDCODF 00361 "FLOVENT HFA" , add
label define MEDCODF 00414 "DOXAPRAM" , add
label define MEDCODF 00486 "ACTIVASE" , add
label define MEDCODF 00535 "ADENOSINE" , add
label define MEDCODF 00560 "ADRENALIN" , add
label define MEDCODF 00597 "ADVIL" , add
label define MEDCODF 00645 "AFRIN" , add
label define MEDCODF 00785 "ALCAINE" , add
label define MEDCODF 00790 "ALCOHOL" , add
label define MEDCODF 00800 "ALCOHOL ISOPROPYL" , add
label define MEDCODF 00805 "ALCOHOL RUBBING" , add
label define MEDCODF 00830 "ALDACTONE" , add
label define MEDCODF 00880 "ALKA-SELTZER" , add
label define MEDCODF 01002 "NEXIUM" , add
label define MEDCODF 01003 "ANAPROX DS" , add
label define MEDCODF 01012 "BUDESONIDE" , add
label define MEDCODF 01017 "BACTRIM DS" , add
label define MEDCODF 01020 "OPTIVAR" , add
label define MEDCODF 01021 "BUTORPHANOL TARTRATE" , add
label define MEDCODF 01022 "METOPROLOL TARTRATE" , add
label define MEDCODF 01024 "RABAVERT" , add
label define MEDCODF 01029 "EFFEXOR XR" , add
label define MEDCODF 01030 "ALLOPURINOL" , add
label define MEDCODF 01034 "ADVAIR DISKUS" , add
label define MEDCODF 01036 "GEODON" , add
label define MEDCODF 01038 "HALDOL DECANOATE" , add
label define MEDCODF 01043 "ZIPRASIDONE HCL" , add
label define MEDCODF 01044 "Z-PAK" , add
label define MEDCODF 01050 "TOLTERODINE TARTRATE" , add
label define MEDCODF 01053 "AMPICILLIN AND SULBACTAM" , add
label define MEDCODF 01055 "ORAPRED" , add
label define MEDCODF 01057 "DETROL LA" , add
label define MEDCODF 01064 "WELLBUTRIN SR" , add
label define MEDCODF 01084 "LUMIGAN" , add
label define MEDCODF 01087 "PROTOPIC" , add
label define MEDCODF 01094 "CARDIZEM CD" , add
label define MEDCODF 01106 "LUTEIN" , add
label define MEDCODF 01111 "TRAVATAN" , add
label define MEDCODF 01116 "ZYVOX" , add
label define MEDCODF 01119 "INDERAL LA" , add
label define MEDCODF 01124 "ULTRACET" , add
label define MEDCODF 01160 "D5NS" , add
label define MEDCODF 01178 "PODOFILOX" , add
label define MEDCODF 01193 "HALOPERIDOL DECONATE" , add
label define MEDCODF 01196 "MOXIFLOXACIN" , add
label define MEDCODF 01197 "AMBISOME" , add
label define MEDCODF 01206 "COENZYME Q10" , add
label define MEDCODF 01207 "LITHIUM CARBONATE" , add
label define MEDCODF 01214 "LANTUS" , add
label define MEDCODF 01216 "OXCARBAZEPINE" , add
label define MEDCODF 01222 "NORDITROPIN" , add
label define MEDCODF 01223 "ALUMINUM CHLORIDE" , add
label define MEDCODF 01225 "ALUMINUM HYDROXIDE" , add
label define MEDCODF 01228 "BECLOMETHASONE DIPROPIONATE" , add
label define MEDCODF 01242 "CEFAZOLIN SODIUM" , add
label define MEDCODF 01246 "RIZATRIPTAN BENZOATE" , add
label define MEDCODF 01248 "METERED DOSE INHALER" , add
label define MEDCODF 01259 "MILK THISTLE" , add
label define MEDCODF 01264 "DEPACON" , add
label define MEDCODF 01266 "INSULIN GLARGINE" , add
label define MEDCODF 01275 "ZONISAMIDE" , add
label define MEDCODF 01281 "ADDERALL XR" , add
label define MEDCODF 01282 "LATANOPROST" , add
label define MEDCODF 01290 "AMANTADINE" , add
label define MEDCODF 01292 "CALCIUM POLYCARBOPHIL" , add
label define MEDCODF 01297 "NICOTINE GUM" , add
label define MEDCODF 01307 "DORZOLAMIDE AND TIMOLOL" , add
label define MEDCODF 01312 "CETYLPYRIDINIUM CHLORIDE" , add
label define MEDCODF 01378 "AMIDATE" , add
label define MEDCODF 01530 "AMITRIPTYLINE" , add
label define MEDCODF 01563 "AMMONIA INHALANTS" , add
label define MEDCODF 01570 "AMMONIUM CHLORIDE" , add
label define MEDCODF 01630 "AMOXICILLIN" , add
label define MEDCODF 01640 "AMOXIL" , add
label define MEDCODF 01660 "AMPHETAMINE" , add
label define MEDCODF 01685 "AMPICILLIN" , add
label define MEDCODF 01775 "ANALGESIC" , add
label define MEDCODF 01838 "ANAPROX" , add
label define MEDCODF 01865 "ANCEF" , add
label define MEDCODF 01975 "ANECTINE" , add
label define MEDCODF 01983 "ANESTHETIC" , add
label define MEDCODF 02016 "CLARINEX" , add
label define MEDCODF 02018 "FOCALIN" , add
label define MEDCODF 02026 "YASMIN" , add
label define MEDCODF 02027 "GLUCAGEN" , add
label define MEDCODF 02036 "EXTRA STRENGTH TYLENOL" , add
label define MEDCODF 02037 "LEVETIRACETAM" , add
label define MEDCODF 02042 "DUONEB" , add
label define MEDCODF 02054 "TRIMETHOPRIM SULFATE/POLYMYXIN B SULFAT" , add
label define MEDCODF 02061 "GUAIFENESIN/PSEUDOEPHEDRINE" , add
label define MEDCODF 02077 "MEROPENEM" , add
label define MEDCODF 02079 "NITROGLYCERIN SUBLINGUAL" , add
label define MEDCODF 02083 "UNITHROID" , add
label define MEDCODF 02099 "DEPAKOTE ER" , add
label define MEDCODF 02104 "MAGNESIUM HYDROXIDE" , add
label define MEDCODF 02119 "LEXAPRO" , add
label define MEDCODF 02127 "BANANA BAG" , add
label define MEDCODF 02128 "BENZONATATE" , add
label define MEDCODF 02131 "ESOMEPRAZOLE MAGNESIUM" , add
label define MEDCODF 02137 "ZYPREXA ZYDIS" , add
label define MEDCODF 02140 "THIAMINE HCL" , add
label define MEDCODF 02146 "ADOXA" , add
label define MEDCODF 02158 "ANTIBIOTIC AGENT" , add
label define MEDCODF 02176 "ALPHA LIPOIC ACID" , add
label define MEDCODF 02186 "ORTHO EVRA" , add
label define MEDCODF 02187 "ALPHAGAN P" , add
label define MEDCODF 02189 "GLUCOPHAGE XR" , add
label define MEDCODF 02203 "ABILIFY" , add
label define MEDCODF 02204 "BILBERRY EXTRACT" , add
label define MEDCODF 02209 "NOVOLOG" , add
label define MEDCODF 02213 "ELIDEL" , add
label define MEDCODF 02223 "ZETIA" , add
label define MEDCODF 02231 "ADALAT CC" , add
label define MEDCODF 02244 "CALAN SR" , add
label define MEDCODF 02247 "FLOXIN OTIC" , add
label define MEDCODF 02249 "PEPCID AC" , add
label define MEDCODF 02250 "ANTIVERT" , add
label define MEDCODF 02256 "ESCITALOPRAM OXALATE" , add
label define MEDCODF 02279 "PULMICORT" , add
label define MEDCODF 02311 "PIOGLITAZONE HCL" , add
label define MEDCODF 02315 "ANUSOL-HC" , add
label define MEDCODF 02333 "ROXICODONE" , add
label define MEDCODF 02405 "APRESOLINE" , add
label define MEDCODF 02465 "AQUAMEPHYTON" , add
label define MEDCODF 02470 "AQUAPHOR" , add
label define MEDCODF 02485 "AQUASOL A" , add
label define MEDCODF 02555 "ARGININE" , add
label define MEDCODF 02627 "ARMOUR THYROID" , add
label define MEDCODF 02645 "ARTANE" , add
label define MEDCODF 02705 "ASCORBIC ACID" , add
label define MEDCODF 02805 "ASPIRIN" , add
label define MEDCODF 02875 "ATARAX" , add
label define MEDCODF 02900 "ATIVAN" , add
label define MEDCODF 02940 "ATROPINE" , add
label define MEDCODF 02982 "ATROVENT" , add
label define MEDCODF 03002 "AVODART" , add
label define MEDCODF 03012 "DEPAKOTE SPRINKLE" , add
label define MEDCODF 03039 "IMODIUM A-D" , add
label define MEDCODF 03044 "RENAL CAPS" , add
label define MEDCODF 03046 "NEPRO" , add
label define MEDCODF 03050 "AVEENO" , add
label define MEDCODF 03055 "AVEENO LOTION" , add
label define MEDCODF 03056 "CITROMA" , add
label define MEDCODF 03079 "CROFAB" , add
label define MEDCODF 03080 "STRATTERA" , add
label define MEDCODF 03081 "AMOXICILLIN AND CLAVULANATE POTASSIUM" , add
label define MEDCODF 03091 "AZELASTINE HCL" , add
label define MEDCODF 03099 "CILOSTAZOL" , add
label define MEDCODF 03104 "METROCREAM" , add
label define MEDCODF 03115 "AYR SALINE MIST" , add
label define MEDCODF 03117 "AZACTAM" , add
label define MEDCODF 03123 "AZATHIOPRINE" , add
label define MEDCODF 03134 "RESTASIS" , add
label define MEDCODF 03142 "NIFEDIPINE ER" , add
label define MEDCODF 03156 "BUPROPION SR" , add
label define MEDCODF 03161 "MICROGESTIN FE" , add
label define MEDCODF 03173 "BIOGLO" , add
label define MEDCODF 03184 "WELLBUTRIN XL" , add
label define MEDCODF 03187 "CRESTOR" , add
label define MEDCODF 03188 "MUCINEX" , add
label define MEDCODF 03192 "VIGAMOX" , add
label define MEDCODF 03201 "MEMANTINE" , add
label define MEDCODF 03211 "CIALIS" , add
label define MEDCODF 03226 "ENALAPRIL MALEATE" , add
label define MEDCODF 03229 "RED YEAST RICE" , add
label define MEDCODF 03237 "ATOMOXETINE HCL" , add
label define MEDCODF 03269 "SEASONALE" , add
label define MEDCODF 03272 "METOPROLOL SUCCINATE" , add
label define MEDCODF 03273 "NOVOLIN R" , add
label define MEDCODF 03276 "SUBOXONE" , add
label define MEDCODF 03283 "CEFDINIR" , add
label define MEDCODF 03296 "IVERMECTIN" , add
label define MEDCODF 03309 "PROVENTIL HFA" , add
label define MEDCODF 03318 "HEPARIN SODIUM" , add
label define MEDCODF 03319 "TRAMADOL HCL" , add
label define MEDCODF 03321 "TRIMETHOPRIM SULFATE" , add
label define MEDCODF 03327 "BIMATOPROST" , add
label define MEDCODF 03329 "FERRLECIT" , add
label define MEDCODF 03332 "BENADRYL ALLERGY" , add
label define MEDCODF 03359 "MODAFINIL" , add
label define MEDCODF 03368 "LINEZOLID" , add
label define MEDCODF 03371 "ALTEPLASE" , add
label define MEDCODF 03381 "MELOXICAM" , add
label define MEDCODF 03392 "TYLENOL ELIXIR" , add
label define MEDCODF 03410 "BACITRACIN" , add
label define MEDCODF 03411 "FLAX SEED" , add
label define MEDCODF 03421 "DARBEPOETIN ALFA" , add
label define MEDCODF 03423 "BACLOFEN" , add
label define MEDCODF 03424 "BACTERIOSTATIC WATER FOR IRRIG" , add
label define MEDCODF 03430 "BACTRIM" , add
label define MEDCODF 03434 "HYOSCYAMINE" , add
label define MEDCODF 03438 "BACTROBAN" , add
label define MEDCODF 03442 "SILVASORB" , add
label define MEDCODF 03700 "BECLOMETHASONE" , add
label define MEDCODF 03905 "BENADRYL" , add
label define MEDCODF 04000 "BENTYL" , add
label define MEDCODF 04011 "NAMENDA" , add
label define MEDCODF 04014 "ARIPIPRAZOLE" , add
label define MEDCODF 04041 "ALBUTEROL/ATROVENT" , add
label define MEDCODF 04042 "SPIRIVA" , add
label define MEDCODF 04044 "CIPROFLOXACIN EYE SOLUTION" , add
label define MEDCODF 04051 "CYMBALTA" , add
label define MEDCODF 04058 "DIALYVITE" , add
label define MEDCODF 04059 "DOCUSATE -SENNA" , add
label define MEDCODF 04070 "BENZOIN" , add
label define MEDCODF 04079 "GLYCOLAX" , add
label define MEDCODF 04088 "BENZOYL PEROXIDE" , add
label define MEDCODF 04093 "JUVEN" , add
label define MEDCODF 04114 "VYTORIN" , add
label define MEDCODF 04120 "BETADINE" , add
label define MEDCODF 04146 "EZETIMIBE" , add
label define MEDCODF 04175 "METFORMIN HYDROCHLORIDE ER" , add
label define MEDCODF 04176 "SENNA-S" , add
label define MEDCODF 04204 "CARMEX" , add
label define MEDCODF 04235 "BICILLIN" , add
label define MEDCODF 04246 "FLORASTOR" , add
label define MEDCODF 04266 "GARLIC OIL" , add
label define MEDCODF 04292 "SENSIPAR" , add
label define MEDCODF 04299 "TURMERIC" , add
label define MEDCODF 04307 "SENNOSIDES" , add
label define MEDCODF 04320 "ATENOLOL/CHLORTHALIDONE" , add
label define MEDCODF 04344 "HYPROMELLOSE" , add
label define MEDCODF 04345 "BIOTIN" , add
label define MEDCODF 04370 "BISACODYL" , add
label define MEDCODF 04393 "TRUVADA" , add
label define MEDCODF 04396 "POLYCARBOPHIL" , add
label define MEDCODF 04421 "ERTAPENEM" , add
label define MEDCODF 04422 "BABY SHAMPOO" , add
label define MEDCODF 04423 "LETROZOLE" , add
label define MEDCODF 04424 "TRIFLURIDINE" , add
label define MEDCODF 04440 "BISMUTH SUBSALICYLATE" , add
label define MEDCODF 04448 "AMMONIUM LACTATE" , add
label define MEDCODF 04473 "IOPAMIDOL" , add
label define MEDCODF 04488 "ELETRIPTAN HYDROBROMIDE" , add
label define MEDCODF 04491 "SYMBICORT" , add
label define MEDCODF 04529 "METHYLPREDNISOLONE SODIUM SUCCINATE" , add
label define MEDCODF 04535 "BARIUM SULFATE" , add
label define MEDCODF 04536 "ABX OINTMENT" , add
label define MEDCODF 04556 "SEVELAMER HYDROCHLORIDE" , add
label define MEDCODF 04576 "DULOXETINE" , add
label define MEDCODF 04589 "TIOTROPIUM BROMIDE" , add
label define MEDCODF 04612 "IRON SUCROSE" , add
label define MEDCODF 04617 "ACCUNEB" , add
label define MEDCODF 04622 "EXEMESTANE" , add
label define MEDCODF 04649 "MYFORTIC" , add
label define MEDCODF 04650 "BRETHINE" , add
label define MEDCODF 04664 "MIRENA" , add
label define MEDCODF 04679 "STATINS" , add
label define MEDCODF 04680 "MAGNOX" , add
label define MEDCODF 04684 "S-ADENOSYL-L-METHIONINE" , add
label define MEDCODF 04803 "BROMFED" , add
label define MEDCODF 04820 "BROMPHEN" , add
label define MEDCODF 05012 "PRESERVISION" , add
label define MEDCODF 05024 "BUMEX" , add
label define MEDCODF 05033 "LUNESTA" , add
label define MEDCODF 05035 "BUPIVACAINE" , add
label define MEDCODF 05051 "VESICARE" , add
label define MEDCODF 05054 "SUBUTEX" , add
label define MEDCODF 05081 "OXYIR" , add
label define MEDCODF 05095 "BUTALBITAL" , add
label define MEDCODF 05097 "LYRICA" , add
label define MEDCODF 05106 "GLIPIZIDE ER" , add
label define MEDCODF 05154 "TECHNETIUM TC 99M MERTIATIDE INJECTION" , add
label define MEDCODF 05171 "PRAMOTIC OTIC DROPS" , add
label define MEDCODF 05172 "SULFUR HEXAFLUORIDE" , add
label define MEDCODF 05194 "DUTASTERIDE" , add
label define MEDCODF 05197 "LOSARTAN-HCTZ" , add
label define MEDCODF 05198 "TEGASEROD" , add
label define MEDCODF 05207 "CEFUROXIME AXETIL" , add
label define MEDCODF 05212 "FROVATRIPTAN" , add
label define MEDCODF 05218 "CICLOPIROX" , add
label define MEDCODF 05223 "HOMATROPINE-HYDROCODONE" , add
label define MEDCODF 05224 "FLUORETS" , add
label define MEDCODF 05240 "ISOTRETINOIN" , add
label define MEDCODF 05244 "ROZEREM" , add
label define MEDCODF 05261 "SOLIFENACIN" , add
label define MEDCODF 05265 "CAFFEINE" , add
label define MEDCODF 05273 "ANTIZOL" , add
label define MEDCODF 05280 "CAFFEINE CITRATED" , add
label define MEDCODF 05291 "LIDOCAINE/PRILOCAINE" , add
label define MEDCODF 05308 "MUCINEX DM" , add
label define MEDCODF 05314 "CATHFLO ACTIVASE" , add
label define MEDCODF 05320 "CALAMINE" , add
label define MEDCODF 05324 "EPLERENONE" , add
label define MEDCODF 05327 "SPRINTEC" , add
label define MEDCODF 05331 "COMMIT" , add
label define MEDCODF 05335 "CALAMINE LOTION" , add
label define MEDCODF 05337 "LOFIBRA" , add
label define MEDCODF 05338 "FLUTICASON-SALMETEROL" , add
label define MEDCODF 05341 "DROSPIRENONE" , add
label define MEDCODF 05347 "CALAN" , add
label define MEDCODF 05375 "CALCIFEROL" , add
label define MEDCODF 05393 "CALCITONIN" , add
label define MEDCODF 05395 "CALCIUM ACETATE" , add
label define MEDCODF 05405 "CALCIUM CARBONATE" , add
label define MEDCODF 05415 "CALCIUM" , add
label define MEDCODF 05418 "CALCIUM CHLORIDE" , add
label define MEDCODF 05430 "CALCIUM GLUCONATE" , add
label define MEDCODF 05648 "CAPOTEN" , add
label define MEDCODF 05663 "CARAFATE" , add
label define MEDCODF 05680 "CARBAMAZEPINE" , add
label define MEDCODF 05789 "CARDIZEM" , add
label define MEDCODF 05810 "CARISOPRODOL" , add
label define MEDCODF 05820 "CARMOL" , add
label define MEDCODF 05895 "CATAPRES" , add
label define MEDCODF 05983 "CEFADROXIL" , add
label define MEDCODF 05993 "CEFTIN" , add
label define MEDCODF 05995 "CEFAZOLIN" , add
label define MEDCODF 06004 "FOCALIN XR" , add
label define MEDCODF 06017 "AMLODIPINE/BENAZEPRIL" , add
label define MEDCODF 06064 "GLYBURIDE/METFORMIN" , add
label define MEDCODF 06068 "ANASTROZOLE" , add
label define MEDCODF 06074 "ZOLEDRONIC ACID" , add
label define MEDCODF 06091 "RALLY PACK" , add
label define MEDCODF 06092 "ACETADOTE" , add
label define MEDCODF 06100 "CENTRUM" , add
label define MEDCODF 06115 "CEPACOL ANESTHETIC TROCHE" , add
label define MEDCODF 06121 "RANEXA" , add
label define MEDCODF 06122 "RIFAXIMIN" , add
label define MEDCODF 06125 "CEPHALEXIN" , add
label define MEDCODF 06128 "CEPHALOSPORINS" , add
label define MEDCODF 06129 "ADACEL" , add
label define MEDCODF 06138 "BOOSTRIX" , add
label define MEDCODF 06162 "CEFUROXIME" , add
label define MEDCODF 06164 "LEVEMIR" , add
label define MEDCODF 06176 "OLOPATADINE" , add
label define MEDCODF 06193 "JANUVIA" , add
label define MEDCODF 06194 "REVATIO" , add
label define MEDCODF 06202 "RIVASTIGMINE" , add
label define MEDCODF 06229 "DAPTOMYCIN" , add
label define MEDCODF 06242 "LEVSIN/SL" , add
label define MEDCODF 06247 "FLECAINIDE" , add
label define MEDCODF 06249 "SALONPAS" , add
label define MEDCODF 06253 "JUNEL FE" , add
label define MEDCODF 06260 "CHARCOAL" , add
label define MEDCODF 06291 "TELMISARTAN" , add
label define MEDCODF 06302 "OLMESARTAN" , add
label define MEDCODF 06324 "CLOBAZAM" , add
label define MEDCODF 06374 "CHILDREN'S TYLENOL" , add
label define MEDCODF 06465 "CHLORAMPHENICOL" , add
label define MEDCODF 06470 "CHLORASEPTIC" , add
label define MEDCODF 06495 "CHLORDIAZEPOXIDE" , add
label define MEDCODF 06580 "CHLOROQUINE" , add
label define MEDCODF 06620 "CHLORPROMAZINE" , add
label define MEDCODF 06645 "CHLORTHALIDONE" , add
label define MEDCODF 06800 "CHRONULAC SYRUP" , add
label define MEDCODF 06815 "CIMETIDINE" , add
label define MEDCODF 06839 "CIPRO" , add
label define MEDCODF 06905 "CLEOCIN" , add
label define MEDCODF 06913 "CLEOCIN T" , add
label define MEDCODF 06920 "CLINDAMYCIN" , add
label define MEDCODF 06925 "CLINDAMYCIN (PHOSPHATE)" , add
label define MEDCODF 06980 "CLONAZEPAM" , add
label define MEDCODF 06985 "CLONIDINE" , add
label define MEDCODF 07001 "OSELTAMIVIR" , add
label define MEDCODF 07002 "FONDAPARINUX" , add
label define MEDCODF 07003 "CLOTRIMAZOLE" , add
label define MEDCODF 07005 "CLOVE OIL" , add
label define MEDCODF 07018 "ORENCIA" , add
label define MEDCODF 07023 "PROBIOTIC ACIDAPHILES" , add
label define MEDCODF 07049 "APIDRA" , add
label define MEDCODF 07067 "CO-TRIMOXAZOLE" , add
label define MEDCODF 07076 "INVEGA" , add
label define MEDCODF 07079 "BROVANA" , add
label define MEDCODF 07090 "BANOPHEN" , add
label define MEDCODF 07096 "FLUTICASONE PROPIONATE" , add
label define MEDCODF 07106 "CINNAMON" , add
label define MEDCODF 07144 "PROAIR HFA" , add
label define MEDCODF 07150 "COD LIVER OIL" , add
label define MEDCODF 07170 "BENAZEPRIL-HYDROCHLOROTHIAZIDE" , add
label define MEDCODF 07180 "CODEINE" , add
label define MEDCODF 07182 "PATADAY" , add
label define MEDCODF 07199 "SILICONE GEL" , add
label define MEDCODF 07228 "THERA-M" , add
label define MEDCODF 07250 "COGENTIN" , add
label define MEDCODF 07251 "PERCOCET 10" , add
label define MEDCODF 07265 "COLACE" , add
label define MEDCODF 07275 "COLCHICINE" , add
label define MEDCODF 07332 "POLYVINYL ALCOHOL" , add
label define MEDCODF 07337 "RACEPINEPHRINE" , add
label define MEDCODF 07342 "SENOKOTXTRA" , add
label define MEDCODF 07366 "VITAMIN D3" , add
label define MEDCODF 07371 "CARBOXYMETHYLCELLULOSE" , add
label define MEDCODF 07386 "BARACLUDE" , add
label define MEDCODF 07388 "ENDOMENTRIN" , add
label define MEDCODF 07393 "CLINDAMYCIN TOPICAL" , add
label define MEDCODF 07406 "VYVANSE" , add
label define MEDCODF 07412 "ASA" , add
label define MEDCODF 07422 "SACCHAROMYCES BOULARDII" , add
label define MEDCODF 07450 "PREZISTA" , add
label define MEDCODF 07470 "COMPAZINE" , add
label define MEDCODF 07481 "XYZAL" , add
label define MEDCODF 07534 "ETONOGESTREL" , add
label define MEDCODF 07576 "ALIGN" , add
label define MEDCODF 07606 "CALPHRON" , add
label define MEDCODF 07616 "DERMABOND" , add
label define MEDCODF 07622 "FLUARIX" , add
label define MEDCODF 07652 "ETHINYL ESTRADIOL-NORETHINDRONE" , add
label define MEDCODF 07688 "INSULIN ASPART" , add
label define MEDCODF 07706 "MYCOPHENOLIC ACID" , add
label define MEDCODF 07755 "CORTAID" , add
label define MEDCODF 07760 "CORTEF" , add
label define MEDCODF 07778 "CORTICOTROPIN" , add
label define MEDCODF 07780 "CORTIFOAM" , add
label define MEDCODF 07920 "COUGH SYRUP" , add
label define MEDCODF 07930 "COUMADIN" , add
label define MEDCODF 07997 "CREON" , add
label define MEDCODF 08006 "TAMSULOSIN" , add
label define MEDCODF 08009 "INSULIN N" , add
label define MEDCODF 08015 "CROMOLYN" , add
label define MEDCODF 08032 "BYSTOLIC" , add
label define MEDCODF 08047 "LIALDA" , add
label define MEDCODF 08058 "PRENATAL" , add
label define MEDCODF 08061 "TENOFOVIR" , add
label define MEDCODF 08066 "IOHEXOL" , add
label define MEDCODF 08067 "BICARB" , add
label define MEDCODF 08074 "PIPERACILLIN TAZOBACTAM" , add
label define MEDCODF 08077 "ESOMEPRAZOLE" , add
label define MEDCODF 08084 "LIDOGEL" , add
label define MEDCODF 08090 "CYANOCOBALAMIN" , add
label define MEDCODF 08097 "EMTRICITABINE/TENOFOVIR" , add
label define MEDCODF 08140 "CYCLOGYL" , add
label define MEDCODF 08147 "MICRO-K" , add
label define MEDCODF 08149 "ADVAIR" , add
label define MEDCODF 08161 "ROSUVASTATIN" , add
label define MEDCODF 08179 "SANCTURA XR" , add
label define MEDCODF 08180 "CYPROHEPTADINE" , add
label define MEDCODF 08196 "ECZEMA CREAM" , add
label define MEDCODF 08202 "ALBUTEROL/IPRATROPIUM" , add
label define MEDCODF 08204 "TADALAFIL" , add
label define MEDCODF 08209 "MUCINEX D" , add
label define MEDCODF 08212 "SEROQUEL XR" , add
label define MEDCODF 08219 "SUDOGEST" , add
label define MEDCODF 08222 "SALINE LOCK" , add
label define MEDCODF 08224 "CITRANATAL" , add
label define MEDCODF 08226 "PYRIDINE" , add
label define MEDCODF 08230 "CYTOMEL" , add
label define MEDCODF 08234 "PRISTIQ" , add
label define MEDCODF 08286 "MULTIHANCE" , add
label define MEDCODF 08293 "SITAGLIPTIN" , add
label define MEDCODF 08303 "BACITRACIN ZINC" , add
label define MEDCODF 08304 "BROMPLEX HD" , add
label define MEDCODF 08307 "ATROPINE/HYOSCYAMINE/PB/SCOPOL" , add
label define MEDCODF 08317 "BACITRACIN W/NEOSPORIN" , add
label define MEDCODF 08340 "D-50" , add
label define MEDCODF 08341 "CALCIUM CARBONATE W/VIT D" , add
label define MEDCODF 08343 "OCEAN NASAL SPRAY" , add
label define MEDCODF 08351 "IRON SULFATE" , add
label define MEDCODF 08378 "VARENICLINE" , add
label define MEDCODF 08413 "LACTAID" , add
label define MEDCODF 08418 "POLYMYXIN B SULFATE DROPS" , add
label define MEDCODF 08426 "DOXYLAMINE" , add
label define MEDCODF 08429 "RHOPHYLAC" , add
label define MEDCODF 08432 "NOVOLOG FLEXPEN" , add
label define MEDCODF 08440 "DAPSONE" , add
label define MEDCODF 08452 "TUSSIONEX PENNKINETIC" , add
label define MEDCODF 08481 "ADIPEX-P" , add
label define MEDCODF 08497 "CENTRUM D" , add
label define MEDCODF 08513 "OPHTHALMIC SOLUTION" , add
label define MEDCODF 08535 "DDAVP" , add
label define MEDCODF 08547 "PCV" , add
label define MEDCODF 08552 "PEG 3350" , add
label define MEDCODF 08565 "DEBROX" , add
label define MEDCODF 08585 "DECADRON" , add
label define MEDCODF 08591 "ISENTRESS" , add
label define MEDCODF 08592 "NEBIVOLOL" , add
label define MEDCODF 08595 "DECADRON PHOSPHATE" , add
label define MEDCODF 08611 "BENZAC AC" , add
label define MEDCODF 08619 "RALTEGRAVIR" , add
label define MEDCODF 08637 "IODIXANOL" , add
label define MEDCODF 08667 "IBANDRONATE" , add
label define MEDCODF 08670 "DECONGESTANT" , add
label define MEDCODF 08678 "BRINZOLAMIDE" , add
label define MEDCODF 08679 "GLATIRAMER" , add
label define MEDCODF 08688 "REGADENOSON" , add
label define MEDCODF 08692 "MEDIHONEY" , add
label define MEDCODF 08753 "DELSYM" , add
label define MEDCODF 08770 "DELTASONE" , add
label define MEDCODF 08835 "DEPAKENE" , add
label define MEDCODF 08836 "DEPAKOTE" , add
label define MEDCODF 08865 "DEPO-MEDROL" , add
label define MEDCODF 08870 "DEPO-PROVERA" , add
label define MEDCODF 09000 "DERMOPLAST" , add
label define MEDCODF 09002 "CONTRAST" , add
label define MEDCODF 09025 "DESITIN" , add
label define MEDCODF 09038 "TOPICAL SKIN CREAM" , add
label define MEDCODF 09039 "HYDROFERA BLUE" , add
label define MEDCODF 09075 "DEXAMETHASONE" , add
label define MEDCODF 09077 "GADOLINIUM" , add
label define MEDCODF 09080 "DEXAMETHASONE ACETATE" , add
label define MEDCODF 09090 "DEXAMETHASONE SODIUM" , add
label define MEDCODF 09095 "DEXAMETHASONE SODIUM PHOSPHATE" , add
label define MEDCODF 09122 "ULORIC" , add
label define MEDCODF 09149 "INSULIN R" , add
label define MEDCODF 09151 "STEROID" , add
label define MEDCODF 09157 "CELLULOSE OXIDIDE" , add
label define MEDCODF 09174 "PRECEDEX" , add
label define MEDCODF 09175 "DEXTROSE" , add
label define MEDCODF 09199 "LACOSAMIDE" , add
label define MEDCODF 09213 "ESZOPICLONE" , add
label define MEDCODF 09224 "HEMATOMA BLOCK" , add
label define MEDCODF 09229 "SULFONAMIDE" , add
label define MEDCODF 09230 "CEFTRIAXONE W/LIDOCAINE" , add
label define MEDCODF 09237 "DEXLANSOPRAZOLE" , add
label define MEDCODF 09253 "EPIPEN JR" , add
label define MEDCODF 09270 "SILVER ALGINATE" , add
label define MEDCODF 09297 "VALSARTAN/HYDROCHLOROTHIAZIDE" , add
label define MEDCODF 09301 "ANXIOLYTIC" , add
label define MEDCODF 09305 "DIAMOX" , add
label define MEDCODF 09318 "MYCOLOG II" , add
label define MEDCODF 09319 "DOCOSAHEXAENOIC" , add
label define MEDCODF 09326 "METFORMIN ER" , add
label define MEDCODF 09327 "LEXISCAN" , add
label define MEDCODF 09329 "URO-JET" , add
label define MEDCODF 09334 "PALIPERIDONE" , add
label define MEDCODF 09344 "PACKED RED BLOOD CELLS" , add
label define MEDCODF 09361 "PRENATAL AD" , add
label define MEDCODF 09364 "DROSPIRENONE/ETHINYL ESTRADIOL" , add
label define MEDCODF 09365 "DIATRIZOATE" , add
label define MEDCODF 09366 "ANTIBACTERIAL SOAP" , add
label define MEDCODF 09370 "DIAZEPAM" , add
label define MEDCODF 09377 "Z-PACK" , add
label define MEDCODF 09378 "MAALOX MAX" , add
label define MEDCODF 09384 "DEXMETHYLPHENIDATE" , add
label define MEDCODF 09390 "DIBUCAINE" , add
label define MEDCODF 09391 "SAPHRIS" , add
label define MEDCODF 09392 "LET GEL" , add
label define MEDCODF 09396 "INTUNIV" , add
label define MEDCODF 09417 "THERA-M PLUS" , add
label define MEDCODF 09453 "FELODIPINE ER" , add
label define MEDCODF 09455 "DICYCLOMINE" , add
label define MEDCODF 09481 "MENTHOL/METHYL SALICYLATE" , add
label define MEDCODF 09495 "DIETHYLPROPION" , add
label define MEDCODF 09522 "TOPEX" , add
label define MEDCODF 09545 "DIGOXIN" , add
label define MEDCODF 09551 "POSIFLUSH" , add
label define MEDCODF 09562 "DEXTROMETHORPHAN/GUAIFENSIN" , add
label define MEDCODF 09576 "POTASSIUM CITRATE" , add
label define MEDCODF 09577 "NYQUIL" , add
label define MEDCODF 09579 "DESOGESTREL ETHINYL-ESTRADIOL" , add
label define MEDCODF 09581 "ALMOTRIPTAN" , add
label define MEDCODF 09583 "LANTUS SOLOSTAR" , add
label define MEDCODF 09585 "DILANTIN" , add
label define MEDCODF 09587 "BUPROPION XL" , add
label define MEDCODF 09589 "PROPRANOLOL ER" , add
label define MEDCODF 09598 "EYE LUBRICANT" , add
label define MEDCODF 09600 "DILAUDID" , add
label define MEDCODF 09601 "RENVELA" , add
label define MEDCODF 09603 "RAMELTEON" , add
label define MEDCODF 09609 "DOFETILIDE" , add
label define MEDCODF 09614 "ZOLPIDEM" , add
label define MEDCODF 09621 "NIFEDIPINE XL" , add
label define MEDCODF 09624 "CLOBETASOL PROPIONATE" , add
label define MEDCODF 09648 "RELISTOR" , add
label define MEDCODF 09655 "IV FLUIDS" , add
label define MEDCODF 09657 "LIDOCAINE/TETRACAINE" , add
label define MEDCODF 09667 "DEXMEDETOMIDINE" , add
label define MEDCODF 09669 "XYLOCAINE-MPF" , add
label define MEDCODF 09687 "TESTOSTERONE CYPIONATE" , add
label define MEDCODF 09718 "EXENATIDE" , add
label define MEDCODF 09721 "UBIDECARENONE" , add
label define MEDCODF 09722 "CHOLECALCIFEROL" , add
label define MEDCODF 09729 "MALATHION" , add
label define MEDCODF 09734 "ASPIRIN/ACETAMINOPHEN/CAFFEINE" , add
label define MEDCODF 09741 "FEROSUL" , add
label define MEDCODF 09760 "KETOTIFEN FUMARATE" , add
label define MEDCODF 09772 "TOVIAZ" , add
label define MEDCODF 09783 "INSULIN 70/30" , add
label define MEDCODF 09787 "HYDROCORTISONE OTIC" , add
label define MEDCODF 09789 "PERFLUTREN" , add
label define MEDCODF 09809 "ASPIR-LOW" , add
label define MEDCODF 09827 "GADOBENATE DIMEGLUMINE" , add
label define MEDCODF 09834 "DITROPAN XL" , add
label define MEDCODF 09848 "ACELLULAR PERTUSSIS" , add
label define MEDCODF 09849 "ENALAPRILAT" , add
label define MEDCODF 09850 "DIPHENHYDRAMINE" , add
label define MEDCODF 09867 "POTASSIUM BICARBONATE" , add
label define MEDCODF 09876 "POWERADE" , add
label define MEDCODF 09880 "DIPHENOXYLATE HCL & ATROPINE SULFATE" , add
label define MEDCODF 09882 "DEXTROMETHORPHAN" , add
label define MEDCODF 09888 "INSULIN DETEMIR" , add
label define MEDCODF 09899 "MEPILEX AG" , add
label define MEDCODF 09902 "GENTEAL PF" , add
label define MEDCODF 09910 "VIMPAT" , add
label define MEDCODF 09924 "DRONEDARONE" , add
label define MEDCODF 09928 "DASATINIB" , add
label define MEDCODF 09931 "ETHINYL ESTRADIOL/LEVONORGESTREL" , add
label define MEDCODF 09944 "RANOLAZINE" , add
label define MEDCODF 09954 "DIVALPROEX" , add
label define MEDCODF 09958 "RIVAROXABAN" , add
label define MEDCODF 09964 "DIASTAT ACUDIAL" , add
label define MEDCODF 09975 "DISULFIRAM" , add
label define MEDCODF 09979 "SODIUM POLYSTYRENE SULFONATE" , add
label define MEDCODF 09995 "DITROPAN" , add
label define MEDCODF 10003 "ELDERBERRY JUICE" , add
label define MEDCODF 10025 "DIURIL" , add
label define MEDCODF 10028 "INVEGA SUSTENNA" , add
label define MEDCODF 10053 "SE-NATAL" , add
label define MEDCODF 10055 "DOBUTREX" , add
label define MEDCODF 10064 "UBIQUINONE" , add
label define MEDCODF 10078 "DIGITAL NERVE BLOCK" , add
label define MEDCODF 10087 "DOCUSATE" , add
label define MEDCODF 10113 "NERVE BLOCK" , add
label define MEDCODF 10121 "DULERA" , add
label define MEDCODF 10123 "VICTOZA" , add
label define MEDCODF 10126 "DOLOBID" , add
label define MEDCODF 10131 "OCTAGAM" , add
label define MEDCODF 10149 "LIDOCAINE/EPINEPHRINE/MARCAINE" , add
label define MEDCODF 10157 "MINERAL OIL ENEMA" , add
label define MEDCODF 10161 "ETHANOL" , add
label define MEDCODF 10166 "BUPRENORPHINE-NALOXONE" , add
label define MEDCODF 10169 "MCV4" , add
label define MEDCODF 10181 "LISDEXAMFETAMINE" , add
label define MEDCODF 10192 "SALINE FLUSH" , add
label define MEDCODF 10210 "DONNATAL" , add
label define MEDCODF 10225 "DOPAMINE" , add
label define MEDCODF 10231 "NEOMYCIN/POLYMYXIN B/HYDROCORTISONE" , add
label define MEDCODF 10234 "USTEKINUMAB" , add
label define MEDCODF 10238 "BUTALBITAL-ASA-CAFFEINE-CODEINE" , add
label define MEDCODF 10241 "GADOTERIDOL" , add
label define MEDCODF 10248 "FEXOFENADINE-PSEUDOEPHEDRINE" , add
label define MEDCODF 10251 "TROSPIUM" , add
label define MEDCODF 10256 "NICOTINE POLACRILEX" , add
label define MEDCODF 10262 "HYDROCORTISONE-PRAMOXINE" , add
label define MEDCODF 10272 "STELARA" , add
label define MEDCODF 10299 "IMMUNOGLOBULIN" , add
label define MEDCODF 10301 "VITAMIN D2" , add
label define MEDCODF 10307 "NASAL IRRIGATION" , add
label define MEDCODF 10316 "PCV 13" , add
label define MEDCODF 10322 "HYDROCHLOROTHIAZIDE/TRIAMTERENE" , add
label define MEDCODF 10325 "DOXEPIN" , add
label define MEDCODF 10328 "BRIMONIDINE-TIMOLOL" , add
label define MEDCODF 10337 "ADALIMUMAB" , add
label define MEDCODF 10355 "DOXYCYCLINE" , add
label define MEDCODF 10356 "PRADAXA" , add
label define MEDCODF 10360 "DOXYLAMINE SUCCINATE & PYRIDOXINE HCL" , add
label define MEDCODF 10368 "LEVOCETIRIZINE DIHYDROCHLORIDE" , add
label define MEDCODF 10389 "DEXTROAMPHETAMINE/AMPHETAMINE" , add
label define MEDCODF 10393 "LORATADINE-PSEUDOEPHEDRINE" , add
label define MEDCODF 10399 "CIPROFLOXACIN-DEXAMETHASONE" , add
label define MEDCODF 10437 "PRASUGREL" , add
label define MEDCODF 10440 "DRISDOL" , add
label define MEDCODF 10464 "EMU OIL" , add
label define MEDCODF 10496 "PROHANCE" , add
label define MEDCODF 10500 "DROPERIDOL" , add
label define MEDCODF 10518 "DRYSOL" , add
label define MEDCODF 10526 "INSULIN ISOPHANE AND REGULAR" , add
label define MEDCODF 10528 "PRORENAL" , add
label define MEDCODF 10575 "DULCOLAX" , add
label define MEDCODF 10800 "DURICEF" , add
label define MEDCODF 10815 "DYAZIDE" , add
label define MEDCODF 10865 "DYRENIUM" , add
label define MEDCODF 10975 "ECOTRIN" , add
label define MEDCODF 11065 "ELAVIL" , add
label define MEDCODF 11093 "RECOTHROM" , add
label define MEDCODF 11096 "BESIFLOXACIN" , add
label define MEDCODF 11128 "PROLIA" , add
label define MEDCODF 11130 "ELECTROLYTE" , add
label define MEDCODF 11142 "LATUDA" , add
label define MEDCODF 11143 "VIIBRYD" , add
label define MEDCODF 11152 "ELOCON" , add
label define MEDCODF 11160 "CLEARLAX" , add
label define MEDCODF 11161 "CEFTAROLINE" , add
label define MEDCODF 11171 "DEFINITY" , add
label define MEDCODF 11172 "OPTISON" , add
label define MEDCODF 11197 "LURASIDONE" , add
label define MEDCODF 11224 "OFIRMEV" , add
label define MEDCODF 11228 "QUINAPRIL-HCTZ" , add
label define MEDCODF 11281 "SUPPLEMENTAL SHAKES" , add
label define MEDCODF 11309 "OCULAR LUBRICANT" , add
label define MEDCODF 11354 "BUDESONIDE-FORMOTEROL" , add
label define MEDCODF 11384 "ISOVUE-370" , add
label define MEDCODF 11387 "VASHE" , add
label define MEDCODF 11393 "XARELTO" , add
label define MEDCODF 11450 "EPHEDRINE" , add
label define MEDCODF 11535 "EPINEPHRICAINE" , add
label define MEDCODF 11540 "EPINEPHRINE" , add
label define MEDCODF 11548 "EPIPEN" , add
label define MEDCODF 11615 "ERGOCALCIFEROL" , add
label define MEDCODF 11657 "ERYPED" , add
label define MEDCODF 11665 "ERYTHROMYCIN" , add
label define MEDCODF 11668 "ERYTHROMYCIN OPHTHALMIC" , add
label define MEDCODF 11688 "ESGIC" , add
label define MEDCODF 11740 "ESTRACE" , add
label define MEDCODF 11745 "ESTRADIOL" , add
label define MEDCODF 11800 "ESTROGEN" , add
label define MEDCODF 11880 "ETHINYL ESTRADIOL" , add
label define MEDCODF 11898 "ETHOSUXAMIDE" , add
label define MEDCODF 11945 "EUCERIN" , add
label define MEDCODF 12000 "MERREM" , add
label define MEDCODF 12006 "MICROGESTIN" , add
label define MEDCODF 12007 "MIDAZOLAM" , add
label define MEDCODF 12008 "MORPHINE ER" , add
label define MEDCODF 12009 "ALENDRONATE" , add
label define MEDCODF 12011 "NEXPLANON" , add
label define MEDCODF 12013 "NICOTINE PATCH" , add
label define MEDCODF 12016 "NORETHINDRONE" , add
label define MEDCODF 12023 "ORAPRED ODT" , add
label define MEDCODF 12028 "OXYCODONE" , add
label define MEDCODF 12029 "OXYBUTYNIN" , add
label define MEDCODF 12031 "OXYMETAZOLINE" , add
label define MEDCODF 12034 "PANTOPRAZOLE" , add
label define MEDCODF 12036 "PARAGARD" , add
label define MEDCODF 12042 "ASPIR 81" , add
label define MEDCODF 12046 "PERCOCET" , add
label define MEDCODF 12056 "POLYMYXIN B-TRIMETHOPRIM" , add
label define MEDCODF 12057 "TUBERCULIN PURIFIED PROTEIN DERIVATIVE" , add
label define MEDCODF 12060 "BENZOCAINE/DEXTROMETHORPHAN" , add
label define MEDCODF 12062 "BIRTH CONTROL PILLS" , add
label define MEDCODF 12071 "CHERATUSSIN AC" , add
label define MEDCODF 12078 "EYE PREPARATION" , add
label define MEDCODF 12082 "PROMETHAZINE DM" , add
label define MEDCODF 12088 "ROBITUSSIN DM" , add
label define MEDCODF 12090 "ROMYCIN" , add
label define MEDCODF 12096 "SALINE MIST" , add
label define MEDCODF 12104 "SINUS RINSE" , add
label define MEDCODF 12106 "SYSTANE ULTRA" , add
label define MEDCODF 12108 "DILTIAZEM ER" , add
label define MEDCODF 12116 "FESOTERODINE" , add
label define MEDCODF 12122 "GUAIFENESIN DM" , add
label define MEDCODF 12123 "ZYRTEC-D" , add
label define MEDCODF 12149 "CORTISPORIN" , add
label define MEDCODF 12151 "DEXTROMETHORPHAN/PROMETHAZINE" , add
label define MEDCODF 12154 "ESCITALOPRAM" , add
label define MEDCODF 12157 "LEVOCETIRIZINE" , add
label define MEDCODF 12158 "LEUPROLIDE" , add
label define MEDCODF 12161 "MOMETASONE" , add
label define MEDCODF 12171 "NORGESTIMATE-ETHINYL ESTRADIOL" , add
label define MEDCODF 12176 "PREPARATION H" , add
label define MEDCODF 12189 "GARLIC" , add
label define MEDCODF 12191 "LEVALBUTEROL" , add
label define MEDCODF 12196 "SULFAMETHOXAZOLE-TRIMETHOPRIM" , add
label define MEDCODF 12199 "CORTIZONE-10" , add
label define MEDCODF 12202 "FORMOTEROL-MOMETASONE" , add
label define MEDCODF 12216 "HEPARIN PORCINE" , add
label define MEDCODF 12227 "ZIOPTAN" , add
label define MEDCODF 12236 "CAMPHOR-MENTHOL" , add
label define MEDCODF 12257 "ARMODAFINIL" , add
label define MEDCODF 12287 "CETIRIZINE-PSEUDOEPHEDRINE" , add
label define MEDCODF 12300 "FERGON" , add
label define MEDCODF 12318 "MYRBETRIQ" , add
label define MEDCODF 12342 "BRILINTA" , add
label define MEDCODF 12368 "EFFER-K" , add
label define MEDCODF 12396 "LINAGLIPTIN" , add
label define MEDCODF 12436 "PHENYLEPHRINE-CHLORPHENIRAMINE-DEXTROME" , add
label define MEDCODF 12440 "BENLYSTA" , add
label define MEDCODF 12476 "EMTRICITABINE/RILPIVIRINE/TENOFOVIR" , add
label define MEDCODF 12477 "ARFORMOTEROL" , add
label define MEDCODF 12479 "CYANOACRYLATE" , add
label define MEDCODF 12480 "FERROUS GLUCONATE" , add
label define MEDCODF 12482 "GADAVIST" , add
label define MEDCODF 12490 "FERROUS SULFATE" , add
label define MEDCODF 12521 "FIBERCON" , add
label define MEDCODF 12585 "FLAGYL" , add
label define MEDCODF 12620 "FLEET ENEMA" , add
label define MEDCODF 12635 "FLEXERIL" , add
label define MEDCODF 12715 "FLUORESCEIN" , add
label define MEDCODF 12735 "FLUORIDE" , add
label define MEDCODF 12780 "FLUPHENAZINE" , add
label define MEDCODF 12830 "FLUZONE" , add
label define MEDCODF 12865 "FOLIC ACID" , add
label define MEDCODF 12880 "FOLVITE" , add
label define MEDCODF 12967 "FORTAZ" , add
label define MEDCODF 13009 "ELIQUIS" , add
label define MEDCODF 13011 "ETONOGESTREL/ETHINYL ESTRADIOL" , add
label define MEDCODF 13015 "LISINOPRIL-HYDROCHLOROTHIAZIDE" , add
label define MEDCODF 13034 "AFLIBERCEPT" , add
label define MEDCODF 13035 "FUL-GLO" , add
label define MEDCODF 13036 "ALBENZA" , add
label define MEDCODF 13063 "DOLUTEGRAVIR" , add
label define MEDCODF 13094 "LINACLOTIDE" , add
label define MEDCODF 13097 "LINZESS" , add
label define MEDCODF 13103 "L-TYROSINE" , add
label define MEDCODF 13104 "LUBIPROSTONE" , add
label define MEDCODF 13105 "FURADANTIN" , add
label define MEDCODF 13111 "MIRABEGRON" , add
label define MEDCODF 13118 "FUROSEMIDE" , add
label define MEDCODF 13121 "PITAVASTATIN" , add
label define MEDCODF 13122 "PROLENSA" , add
label define MEDCODF 13129 "ROFLUMILAST" , add
label define MEDCODF 13130 "SIMBRINZA" , add
label define MEDCODF 13146 "TINIDAZOLE" , add
label define MEDCODF 13149 "DIHYDROERGOTAMINE" , add
label define MEDCODF 13154 "ELLA" , add
label define MEDCODF 13156 "FOSFOMYCIN" , add
label define MEDCODF 13159 "TENIVAC" , add
label define MEDCODF 13161 "TICAGRELOR" , add
label define MEDCODF 13205 "GARAMYCIN" , add
label define MEDCODF 13215 "GASTROGRAFIN" , add
label define MEDCODF 13220 "GAVISCON" , add
label define MEDCODF 13275 "GELFOAM" , add
label define MEDCODF 13320 "GENTAMICIN" , add
label define MEDCODF 13535 "GLUCAGON" , add
label define MEDCODF 13550 "GLUCOSE" , add
label define MEDCODF 13553 "GLUCOTROL" , add
label define MEDCODF 13590 "GLUTOSE" , add
label define MEDCODF 13655 "GLYCOPYRROLATE" , add
label define MEDCODF 13800 "GRISEOFULVIN" , add
label define MEDCODF 13835 "GUAIFENESIN" , add
label define MEDCODF 13838 "GUAIFENESIN W/CODEINE" , add
label define MEDCODF 13930 "GYNE-LOTRIMIN" , add
label define MEDCODF 13999 "HALCION" , add
label define MEDCODF 14000 "HALDOL" , add
label define MEDCODF 14002 "APIXABAN" , add
label define MEDCODF 14006 "GADOBUTROL" , add
label define MEDCODF 14008 "ANORO ELLIPTA" , add
label define MEDCODF 14013 "BREO ELLIPTA" , add
label define MEDCODF 14014 "ACETAMINOPHEN/BUTALBITAL/CAFFEINE" , add
label define MEDCODF 14019 "IMBRUVICA" , add
label define MEDCODF 14023 "OTEZLA" , add
label define MEDCODF 14040 "HALOPERIDOL" , add
label define MEDCODF 14046 "ATOVAQUONE-PROGUANIL" , add
label define MEDCODF 14076 "DAPAGLIFLOZIN" , add
label define MEDCODF 14087 "FARXIGA" , add
label define MEDCODF 14102 "JARDIANCE" , add
label define MEDCODF 14122 "TIVICAY" , add
label define MEDCODF 14131 "ABACAVIR-DOLUTEGRAVIR-LAMIVUDINE" , add
label define MEDCODF 14225 "HEP-LOCK" , add
label define MEDCODF 14240 "HEPARIN" , add
label define MEDCODF 14415 "HIBICLENS" , add
label define MEDCODF 14727 "HUMULIN" , add
label define MEDCODF 14730 "HURRICAINE" , add
label define MEDCODF 14750 "HYALURONIDASE" , add
label define MEDCODF 14840 "HYDRALAZINE" , add
label define MEDCODF 14875 "HYDREA" , add
label define MEDCODF 14930 "HYDROCHLOROTHIAZIDE" , add
label define MEDCODF 14955 "HYDROCODONE" , add
label define MEDCODF 14965 "HYDROCORTISONE" , add
label define MEDCODF 14985 "HYDRODIURIL" , add
label define MEDCODF 14990 "HYDROGEN PEROXIDE" , add
label define MEDCODF 15005 "HYDROMORPHONE" , add
label define MEDCODF 15019 "GLYXAMBI" , add
label define MEDCODF 15023 "NEXTERONE" , add
label define MEDCODF 15046 "HYOPHEN" , add
label define MEDCODF 15070 "HYDROXYCHLOROQUINE" , add
label define MEDCODF 15090 "HYDROXYUREA" , add
label define MEDCODF 15100 "HYDROXYZINE" , add
label define MEDCODF 15105 "HYDROXYZINE PAMOATE" , add
label define MEDCODF 15115 "HYGROTON" , add
label define MEDCODF 15195 "HYPERAB" , add
label define MEDCODF 15307 "HYTRIN" , add
label define MEDCODF 15395 "IBUPROFEN" , add
label define MEDCODF 15455 "ICY HOT ANALGESIC BALM" , add
label define MEDCODF 15495 "ILOTYCIN" , add
label define MEDCODF 15545 "IMODIUM" , add
label define MEDCODF 15548 "IMOVAX RABIES" , add
label define MEDCODF 15555 "IMURAN" , add
label define MEDCODF 15560 "INAPSINE" , add
label define MEDCODF 15575 "INDERAL" , add
label define MEDCODF 15590 "INDOCIN" , add
label define MEDCODF 15600 "INDOMETHACIN" , add
label define MEDCODF 15680 "INSULIN" , add
label define MEDCODF 15730 "IODINE" , add
label define MEDCODF 15805 "IOPIDINE" , add
label define MEDCODF 15985 "ISOLYTE" , add
label define MEDCODF 15990 "ISONIAZID" , add
label define MEDCODF 16000 "DICLEGIS" , add
label define MEDCODF 16007 "GENVOYA" , add
label define MEDCODF 16009 "INCRUSE ELLIPTA" , add
label define MEDCODF 16016 "TOUJEO SOLOSTAR" , add
label define MEDCODF 16018 "TRULICITY" , add
label define MEDCODF 16020 "ISOPROPYL ALCOHOL" , add
label define MEDCODF 16051 "VELTASSA" , add
label define MEDCODF 16061 "ENTRESTO" , add
label define MEDCODF 16076 "INSULIN DEGLUDEC" , add
label define MEDCODF 16077 "VRAYLAR" , add
label define MEDCODF 16089 "KCENTRA" , add
label define MEDCODF 16090 "ISOPTO TEARS" , add
label define MEDCODF 16095 "ISORDIL" , add
label define MEDCODF 16096 "JADENU" , add
label define MEDCODF 16104 "INSULIN LISPRO" , add
label define MEDCODF 16105 "ISOSORBIDE" , add
label define MEDCODF 16106 "ALOGLIPTIN" , add
label define MEDCODF 16108 "FLUTICASONE FUROATE" , add
label define MEDCODF 16111 "OTOVEL" , add
label define MEDCODF 16112 "EUCRISA" , add
label define MEDCODF 16113 "NUPLAZID" , add
label define MEDCODF 16114 "STIOLTO RESPIMAT" , add
label define MEDCODF 16123 "DUPIXENT" , add
label define MEDCODF 16124 "LACTOBACILLUS RHAMNOSUS" , add
label define MEDCODF 16128 "TRULANCE" , add
label define MEDCODF 16132 "SACUBITRIL" , add
label define MEDCODF 16134 "OPTICAINE" , add
label define MEDCODF 16136 "AMPICILLIN/SULBACTAM" , add
label define MEDCODF 16139 "SACUBITRIL/VALSARTAN" , add
label define MEDCODF 16141 "TETANUS-DIPTHERIA TOXOIDS-TD" , add
label define MEDCODF 16143 "VENELEX" , add
label define MEDCODF 16157 "NUCALA" , add
label define MEDCODF 16164 "AIMOVIG" , add
label define MEDCODF 16167 "TRELEGY ELLIPTA" , add
label define MEDCODF 16169 "BIKTARVY" , add
label define MEDCODF 16181 "CLENPIQ" , add
label define MEDCODF 16186 "OZEMPIC" , add
label define MEDCODF 16192 "CANNABIDIOL" , add
label define MEDCODF 16196 "CLEVIDIPINE" , add
label define MEDCODF 16197 "GADOTERATE MEGLUMINE" , add
label define MEDCODF 16214 "EFINACONAZOLE" , add
label define MEDCODF 16215 "K-LYTE DS" , add
label define MEDCODF 16217 "VASOPRESSIN" , add
label define MEDCODF 16218 "DORNASE ALPHA (PULMOZYME)" , add
label define MEDCODF 16219 "DIPHENHYDRAMINE/LIDOCAINE/NYSTATIN TOPI" , add
label define MEDCODF 16221 "CAPSAICIN-MENTHOL TOPICAL" , add
label define MEDCODF 16224 "LIDOCAINE-MENTHOL TOPICAL" , add
label define MEDCODF 16229 "ELVITEG/COBI/EMTRIC/TENOFO ALA" , add
label define MEDCODF 16232 "TIOTROPIUM-OLODATEROL" , add
label define MEDCODF 16238 "BACILLUS COAGULANS" , add
label define MEDCODF 16243 "MAGNESIUM GLYCINATE" , add
label define MEDCODF 16259 "VITAMIN A & D TOPICAL" , add
label define MEDCODF 16264 "IXEKIZUMAB" , add
label define MEDCODF 16271 "ZINC ACETATE" , add
label define MEDCODF 16275 "PRUCALOPRIDE" , add
label define MEDCODF 16276 "RETACRIT" , add
label define MEDCODF 16281 "ADMELOG" , add
label define MEDCODF 16283 "SEMAGLUTIDE" , add
label define MEDCODF 16286 "BONJESTA" , add
label define MEDCODF 16291 "EMGALITY" , add
label define MEDCODF 16292 "AJOVY" , add
label define MEDCODF 16299 "EMPAGLIFLOZIN" , add
label define MEDCODF 16301 "TRESIBA" , add
label define MEDCODF 16323 "SYMTUZA" , add
label define MEDCODF 16324 "REMDESIVIR" , add
label define MEDCODF 16326 "SODIUM ZIRCONIUM CYCLOSILICATE" , add
label define MEDCODF 16327 "TRINTELLIX" , add
label define MEDCODF 16332 "BREXPIPRAZOLE" , add
label define MEDCODF 16334 "BASAGLAR" , add
label define MEDCODF 16336 "CORLANOR" , add
label define MEDCODF 16338 "NURTEC ODT" , add
label define MEDCODF 16341 "ESLICARBAZEPINE ACETATE" , add
label define MEDCODF 16346 "NINJACOF-D" , add
label define MEDCODF 16348 "NALOXEGOL" , add
label define MEDCODF 16351 "LOKELMA" , add
label define MEDCODF 16354 "PAXLOVID" , add
label define MEDCODF 16357 "VEKLURY" , add
label define MEDCODF 16359 "DULAGLUTIDE" , add
label define MEDCODF 16362 "BARICITINIB" , add
label define MEDCODF 16363 "UMECLIDINIUM-VILANTEROL" , add
label define MEDCODF 16364 "ERENUMAB-AOOE" , add
label define MEDCODF 16365 "KAOPECTATE" , add
label define MEDCODF 16367 "UBREVLY" , add
label define MEDCODF 16369 "GALCANEZUMAB" , add
label define MEDCODF 16371 "BAMLANIVIMAB" , add
label define MEDCODF 16373 "ADDYI" , add
label define MEDCODF 16379 "SUVOREXANT" , add
label define MEDCODF 16383 "PERAMPANEL" , add
label define MEDCODF 16384 "LEVOMEFOLATE" , add
label define MEDCODF 16386 "COVID-19 VACCINE, MODERNA" , add
label define MEDCODF 16387 "BREZTRI-AEROSPHERE" , add
label define MEDCODF 16388 "REGEN-COV" , add
label define MEDCODF 16389 "COVID-19 VACCINE" , add
label define MEDCODF 16391 "SOTROVIMAB" , add
label define MEDCODF 16392 "UBROGEPANT" , add
label define MEDCODF 16393 "CILNIDIPINE" , add
label define MEDCODF 16394 "MEPHENTERMINE" , add
label define MEDCODF 16396 "HEATHER" , add
label define MEDCODF 16397 "COVID-19 BNT162B2" , add
label define MEDCODF 16398 "DORAVIRINE" , add
label define MEDCODF 16399 "WIXELA" , add
label define MEDCODF 16400 "DAPAGLIFLOZIN-METFORMIN" , add
label define MEDCODF 16401 "BEBTELOVIMAB" , add
label define MEDCODF 16402 "MYXREDLIN" , add
label define MEDCODF 16403 "SYMJEPI" , add
label define MEDCODF 16404 "SHAROBEL" , add
label define MEDCODF 16406 "BAQSIMI" , add
label define MEDCODF 16407 "CABENUVA" , add
label define MEDCODF 16408 "LAGEVRIO" , add
label define MEDCODF 16409 "NOZIN" , add
label define MEDCODF 16410 "VERICIGUAT" , add
label define MEDCODF 16411 "UPADACITINIB" , add
label define MEDCODF 16412 "VALTOCO" , add
label define MEDCODF 16413 "CLARISCAN" , add
label define MEDCODF 16414 "DIACOMIT" , add
label define MEDCODF 16416 "NAYZILAM" , add
label define MEDCODF 16417 "MOUNJARO" , add
label define MEDCODF 16418 "TECOVIRIMAT" , add
label define MEDCODF 16419 "ARTESUNATE" , add
label define MEDCODF 16421 "SEMGLEE" , add
label define MEDCODF 16455 "KAYEXALATE" , add
label define MEDCODF 16475 "KEFLEX" , add
label define MEDCODF 16505 "KENALOG" , add
label define MEDCODF 16585 "KETALAR" , add
label define MEDCODF 16590 "KETAMINE" , add
label define MEDCODF 16710 "KLOR-CON" , add
label define MEDCODF 16800 "KONSYL" , add
label define MEDCODF 16955 "LACTOBACILLUS ACIDOPHILUS" , add
label define MEDCODF 16975 "LACTULOSE" , add
label define MEDCODF 17070 "LANOLIN" , add
label define MEDCODF 17115 "LANOXIN" , add
label define MEDCODF 17165 "LASIX" , add
label define MEDCODF 17243 "LAXATIVE" , add
label define MEDCODF 17355 "LEVOPHED" , add
label define MEDCODF 17365 "LEVOTHROID" , add
label define MEDCODF 17370 "LEVOTHYROXINE" , add
label define MEDCODF 17375 "LEVSIN" , add
label define MEDCODF 17450 "LIBRIUM" , add
label define MEDCODF 17475 "LIDEX" , add
label define MEDCODF 17485 "LIDOCAINE" , add
label define MEDCODF 17490 "LIDOCAINE HCL" , add
label define MEDCODF 17495 "LIDOCAINE HCL W/EPINEPHRINE" , add
label define MEDCODF 17560 "LIORESAL" , add
label define MEDCODF 17563 "LIOTHYRONINE SODIUM" , add
label define MEDCODF 17595 "LIPODERM" , add
label define MEDCODF 17715 "LITHIUM" , add
label define MEDCODF 17725 "LITHOBID" , add
label define MEDCODF 17833 "LOCAL ANESTHETIC" , add
label define MEDCODF 17840 "LOESTRIN" , add
label define MEDCODF 17865 "LOMOTIL" , add
label define MEDCODF 17880 "LOPERAMIDE" , add
label define MEDCODF 17883 "LOPID" , add
label define MEDCODF 17885 "LOPRESSOR" , add
label define MEDCODF 17888 "LORAZEPAM" , add
label define MEDCODF 17925 "LOTRIMIN" , add
label define MEDCODF 18015 "LUMINAL" , add
label define MEDCODF 18050 "LYSINE" , add
label define MEDCODF 18125 "MAALOX" , add
label define MEDCODF 18189 "MAGNESIUM CARBONATE" , add
label define MEDCODF 18190 "MAGNESIUM CHLORIDE" , add
label define MEDCODF 18195 "MAGNESIUM CITRATE" , add
label define MEDCODF 18200 "MAGNESIUM GLUCONATE" , add
label define MEDCODF 18215 "MAGNESIUM SULFATE" , add
label define MEDCODF 18220 "MAGNESIUM TRISILICATE" , add
label define MEDCODF 18315 "MANDELAMINE" , add
label define MEDCODF 18345 "MANNITOL" , add
label define MEDCODF 18395 "MARCAINE" , add
label define MEDCODF 18400 "MARCAINE HCL W/EPINEPHRN" , add
label define MEDCODF 18523 "MAXZIDE" , add
label define MEDCODF 18555 "MECLIZINE" , add
label define MEDCODF 18640 "MEDROL" , add
label define MEDCODF 18643 "MEDROXYPROGESTERONE" , add
label define MEDCODF 18655 "MEGACE" , add
label define MEDCODF 18663 "MEGESTROL" , add
label define MEDCODF 18745 "MENTHOL" , add
label define MEDCODF 18760 "MEPERIDINE" , add
label define MEDCODF 18930 "METAMUCIL" , add
label define MEDCODF 18985 "METHADONE" , add
label define MEDCODF 19035 "METHENAMINE" , add
label define MEDCODF 19070 "METHOCARBAMOL" , add
label define MEDCODF 19090 "METHOTREXATE" , add
label define MEDCODF 19130 "METHYL SALICYLATE" , add
label define MEDCODF 19140 "METHYLCELLULOSE" , add
label define MEDCODF 19175 "METHYLPHENIDATE" , add
label define MEDCODF 19180 "METHYLPREDNISOLONE" , add
label define MEDCODF 19208 "METOCLOPRAMIDE" , add
label define MEDCODF 19210 "METOLAZONE" , add
label define MEDCODF 19218 "METOPROLOL" , add
label define MEDCODF 19231 "METRO" , add
label define MEDCODF 19233 "METRONIDAZOLE" , add
label define MEDCODF 19242 "MEVACOR" , add
label define MEDCODF 19280 "MICATIN" , add
label define MEDCODF 19290 "MICONAZOLE" , add
label define MEDCODF 19320 "MICRONOR" , add
label define MEDCODF 19445 "MINERAL OIL" , add
label define MEDCODF 19455 "MINIPRESS" , add
label define MEDCODF 19465 "MINOCYCLINE" , add
label define MEDCODF 19635 "MICONAZOLE NITRATE" , add
label define MEDCODF 19650 "MORPHINE" , add
label define MEDCODF 19675 "MOTRIN" , add
label define MEDCODF 19680 "MOUTHWASH" , add
label define MEDCODF 19699 "MS CONTIN" , add
label define MEDCODF 19825 "MULTIPLE VITAMINS" , add
label define MEDCODF 19840 "MULTIVITAMIN" , add
label define MEDCODF 20000 "MYAMBUTOL" , add
label define MEDCODF 20010 "MYCELEX" , add
label define MEDCODF 20060 "MYCOSTATIN" , add
label define MEDCODF 20065 "MYDFRIN" , add
label define MEDCODF 20075 "MYDRIACYL" , add
label define MEDCODF 20080 "MYLANTA" , add
label define MEDCODF 20095 "MYLICON" , add
label define MEDCODF 20260 "NAPHCON" , add
label define MEDCODF 20285 "NAPROSYN" , add
label define MEDCODF 20290 "NAPROXEN" , add
label define MEDCODF 20310 "NARCAN" , add
label define MEDCODF 20315 "NARDIL" , add
label define MEDCODF 20595 "NEO-SYNEPHRINE" , add
label define MEDCODF 20690 "NEOMYCIN" , add
label define MEDCODF 20693 "NEOMYCIN-POLYMYXIN B" , add
label define MEDCODF 20735 "NEOSTIGMINE" , add
label define MEDCODF 20835 "NEUTRA-PHOS" , add
label define MEDCODF 20885 "NIACIN" , add
label define MEDCODF 21130 "NITRO-BID" , add
label define MEDCODF 21145 "NITROFURANTOIN" , add
label define MEDCODF 21160 "NITROGLYCERIN" , add
label define MEDCODF 21165 "NITROGLYN" , add
label define MEDCODF 21185 "NITROSTAT" , add
label define MEDCODF 21203 "NIZORAL" , add
label define MEDCODF 21225 "NOLVADEX" , add
label define MEDCODF 21280 "NORFLEX" , add
label define MEDCODF 21373 "NORMODYNE" , add
label define MEDCODF 21403 "NORTRIPTYLINE" , add
label define MEDCODF 21550 "NUBAIN" , add
label define MEDCODF 21695 "NYSTATIN" , add
label define MEDCODF 21750 "OCEAN MIST" , add
label define MEDCODF 22065 "ORPHENADRINE" , add
label define MEDCODF 22110 "OS-CAL" , add
label define MEDCODF 22233 "OXACILLIN" , add
label define MEDCODF 22287 "OXYBUTYNIN CHLORIDE" , add
label define MEDCODF 22303 "OXYCODONE HCL" , add
label define MEDCODF 22305 "OXYCODONE HCL & ACETAMINOPHEN" , add
label define MEDCODF 22306 "OXYCODONE W/APAP" , add
label define MEDCODF 22315 "OXYGEN" , add
label define MEDCODF 22323 "OXYMETAZOLINE HCL" , add
label define MEDCODF 22520 "PAMELOR" , add
label define MEDCODF 22643 "PANCRELIPASE" , add
label define MEDCODF 22810 "PARAFON FORTE" , add
label define MEDCODF 23120 "PEDIALYTE" , add
label define MEDCODF 23215 "PENICILLIN" , add
label define MEDCODF 23221 "PENICILLIN G POTASSIUM" , add
label define MEDCODF 23225 "PENICILLIN V" , add
label define MEDCODF 23228 "PENICILLIN V POTASSIUM" , add
label define MEDCODF 23230 "PENICILLIN VK" , add
label define MEDCODF 23340 "PEPPERMINT OIL" , add
label define MEDCODF 23370 "PEPTO-BISMOL" , add
label define MEDCODF 23385 "PERCOCET-5" , add
label define MEDCODF 23430 "PERI-COLACE" , add
label define MEDCODF 23440 "PERIACTIN" , add
label define MEDCODF 23523 "PERPHENAZINE" , add
label define MEDCODF 23585 "PETROLATUM" , add
label define MEDCODF 23660 "PHENAPHEN" , add
label define MEDCODF 23715 "PHENAZOPYRIDINE" , add
label define MEDCODF 23755 "PHENERGAN" , add
label define MEDCODF 23798 "PHENERGAN W/CODEINE" , add
label define MEDCODF 23845 "PHENOBARBITAL" , add
label define MEDCODF 23935 "PHENOL" , add
label define MEDCODF 23970 "PHENTERMINE" , add
label define MEDCODF 24015 "PHENYLEPHRINE" , add
label define MEDCODF 24045 "PHENYTOIN" , add
label define MEDCODF 24175 "PHYTONADIONE" , add
label define MEDCODF 24190 "PILOCAR" , add
label define MEDCODF 24255 "PITOCIN" , add
label define MEDCODF 24300 "PLAQUENIL" , add
label define MEDCODF 24310 "PLASMA-LYTE" , add
label define MEDCODF 24470 "POLYMYXIN" , add
label define MEDCODF 24510 "POLYSPORIN" , add
label define MEDCODF 24555 "PONTOCAINE" , add
label define MEDCODF 24590 "POT CHLOR" , add
label define MEDCODF 24653 "POTASSIUM CHLORIDE" , add
label define MEDCODF 24695 "POTASSIUM GLUCONATE" , add
label define MEDCODF 24730 "POTASSIUM PHOSPHATE" , add
label define MEDCODF 24765 "POVIDONE" , add
label define MEDCODF 24805 "PRAZOSIN" , add
label define MEDCODF 24850 "PRED FORTE" , add
label define MEDCODF 24885 "PREDNISOLONE" , add
label define MEDCODF 24890 "PREDNISONE" , add
label define MEDCODF 24950 "PREMARIN" , add
label define MEDCODF 25055 "PRIMIDONE" , add
label define MEDCODF 25078 "PRINIVIL" , add
label define MEDCODF 25213 "PROCARDIA" , add
label define MEDCODF 25220 "PROCHLORPERAZINE" , add
label define MEDCODF 25240 "PROCTOCORT" , add
label define MEDCODF 25250 "PROCTOFOAM" , add
label define MEDCODF 25255 "PROCTOFOAM-HC" , add
label define MEDCODF 25305 "PROGESTERONE" , add
label define MEDCODF 25355 "PROMAZINE" , add
label define MEDCODF 25365 "PROMETHAZINE" , add
label define MEDCODF 25432 "PROMETHAZINE W/CODEINE" , add
label define MEDCODF 25433 "PROMETHAZINE W/DM" , add
label define MEDCODF 25485 "PROPARACAINE" , add
label define MEDCODF 25638 "PROVENTIL" , add
label define MEDCODF 25640 "PROVERA" , add
label define MEDCODF 25660 "PROXENE" , add
label define MEDCODF 25674 "PROZAC" , add
label define MEDCODF 25695 "PSEUDOEPHEDRINE" , add
label define MEDCODF 25810 "PYRIDIUM" , add
label define MEDCODF 25825 "PYRIDOXINE HCL" , add
label define MEDCODF 25965 "QUESTRAN" , add
label define MEDCODF 26090 "RABIES VACCINE" , add
label define MEDCODF 26255 "REGLAN" , add
label define MEDCODF 26453 "RESTORIL" , add
label define MEDCODF 26475 "RETIN-A" , add
label define MEDCODF 26477 "RETROVIR" , add
label define MEDCODF 26685 "RIBOFLAVIN" , add
label define MEDCODF 26705 "RIFADIN" , add
label define MEDCODF 26715 "RIFAMPIN" , add
label define MEDCODF 26760 "RITALIN" , add
label define MEDCODF 26785 "ROBAXIN" , add
label define MEDCODF 26805 "ROBINUL" , add
label define MEDCODF 26830 "ROBITUSSIN" , add
label define MEDCODF 26835 "ROBITUSSIN A-C SYRUP" , add
label define MEDCODF 26870 "ROCALTROL" , add
label define MEDCODF 27340 "SALICYLATE" , add
label define MEDCODF 27345 "SALICYLIC ACID" , add
label define MEDCODF 27368 "SALINE" , add
label define MEDCODF 27405 "SALSALATE" , add
label define MEDCODF 27445 "SANTYL" , add
label define MEDCODF 27545 "SCOPOLAMINE" , add
label define MEDCODF 27725 "SELENIUM" , add
label define MEDCODF 27749 "SENEXON" , add
label define MEDCODF 27770 "SENNA" , add
label define MEDCODF 27785 "SENOKOT" , add
label define MEDCODF 27795 "SENOKOT S" , add
label define MEDCODF 27816 "SENSORCAINE" , add
label define MEDCODF 27835 "SEPTRA" , add
label define MEDCODF 27840 "SEPTRA DS" , add
label define MEDCODF 27985 "SILVADENE" , add
label define MEDCODF 27995 "SILVER NITRATE" , add
label define MEDCODF 28015 "SILVER SULFADIAZINE" , add
label define MEDCODF 28030 "SIMETHICONE" , add
label define MEDCODF 28080 "SINEMET" , add
label define MEDCODF 28085 "SINEQUAN" , add
label define MEDCODF 28350 "SKELAXIN" , add
label define MEDCODF 28391 "SLOW-MAG" , add
label define MEDCODF 28455 "SODIUM BICARBONATE" , add
label define MEDCODF 28495 "SODIUM CHLORIDE" , add
label define MEDCODF 28560 "SODIUM CHLORIDE IRRIGATION" , add
label define MEDCODF 28595 "SODIUM FLUORIDE" , add
label define MEDCODF 28665 "SODIUM PHOSPHATE" , add
label define MEDCODF 28670 "SODIUM PHOSPHATE & BIPHOSPHATE" , add
label define MEDCODF 28685 "SODIUM SULFATE" , add
label define MEDCODF 28790 "SOLU-CORTEF" , add
label define MEDCODF 28800 "SOLU-MEDROL" , add
label define MEDCODF 28833 "SOMINEX" , add
label define MEDCODF 28910 "SORBITOL" , add
label define MEDCODF 29250 "SPIRONOLACTONE" , add
label define MEDCODF 29255 "SPIRONOLACTONE W/HYDROCHLOROTHIAZIDE" , add
label define MEDCODF 29285 "STADOL" , add
label define MEDCODF 29498 "STEROID(S)" , add
label define MEDCODF 29645 "SUBLIMAZE" , add
label define MEDCODF 29660 "SUCCINYLCHOLINE" , add
label define MEDCODF 29705 "SUDAFED" , add
label define MEDCODF 29840 "SULFAMETHOXAZOLE" , add
label define MEDCODF 29865 "SULFASALAZINE" , add
label define MEDCODF 30215 "SURGICEL" , add
label define MEDCODF 30305 "SYMMETREL" , add
label define MEDCODF 30395 "SYNTHROID" , add
label define MEDCODF 30553 "TAMOXIFEN" , add
label define MEDCODF 30585 "TAPAZOLE" , add
label define MEDCODF 30615 "TARTARIC ACID" , add
label define MEDCODF 30730 "TEGRETOL" , add
label define MEDCODF 30756 "TEMAZEPAM" , add
label define MEDCODF 30782 "TENORMIN" , add
label define MEDCODF 30805 "TERBUTALINE" , add
label define MEDCODF 30880 "TESSALON PERLE" , add
label define MEDCODF 30915 "TESTOSTERONE" , add
label define MEDCODF 31005 "TETANUS DIPHTHERIA TOXOID" , add
label define MEDCODF 31015 "TETANUS TOXOID" , add
label define MEDCODF 31025 "TETRACAINE" , add
label define MEDCODF 31030 "TETRACAINE HCL" , add
label define MEDCODF 31045 "TETRACYCLINE" , add
label define MEDCODF 31050 "TETRACYCLINE HCL" , add
label define MEDCODF 31225 "THEOPHYL" , add
label define MEDCODF 31325 "THERAGRAN" , add
label define MEDCODF 31455 "THIAMINE" , add
label define MEDCODF 31550 "THORAZINE" , add
label define MEDCODF 31585 "THROAT LOZENGE NEO-VADRIN" , add
label define MEDCODF 31655 "TIGAN" , add
label define MEDCODF 31658 "TIMOLOL" , add
label define MEDCODF 31660 "TIMOPTIC" , add
label define MEDCODF 31723 "TOBRADEX" , add
label define MEDCODF 31725 "TOBRAMYCIN" , add
label define MEDCODF 31728 "TOBREX OPHTHALMIC" , add
label define MEDCODF 31927 "TRANDATE" , add
label define MEDCODF 31939 "TRANSDERM-SCOP" , add
label define MEDCODF 31945 "TRANXENE" , add
label define MEDCODF 31997 "TRAZODONE" , add
label define MEDCODF 32195 "TRIAMCINOLONE" , add
label define MEDCODF 32200 "TRIAMCINOLONE ACETONIDE" , add
label define MEDCODF 32273 "TRIAMTERENE" , add
label define MEDCODF 32353 "TRIDIL" , add
label define MEDCODF 32363 "TRIFLUOPERAZINE" , add
label define MEDCODF 32390 "TRIHEXYPHENIDYL" , add
label define MEDCODF 32438 "TRIMETHOPRIM" , add
label define MEDCODF 32515 "TRIPLE ANTIBIOTIC" , add
label define MEDCODF 32658 "TROPICAMIDE" , add
label define MEDCODF 32735 "TUMS" , add
label define MEDCODF 32905 "TYLENOL" , add
label define MEDCODF 32920 "TYLENOL NO. 3" , add
label define MEDCODF 32925 "TYLENOL NO. 4" , add
label define MEDCODF 32930 "TYLENOL W/CODEINE" , add
label define MEDCODF 33550 "VALISONE" , add
label define MEDCODF 33555 "VALIUM" , add
label define MEDCODF 33573 "VALPROIC ACID" , add
label define MEDCODF 33580 "VANCOCIN" , add
label define MEDCODF 33588 "VANCOMYCIN" , add
label define MEDCODF 33625 "VAPONEFRIN" , add
label define MEDCODF 33670 "VASELINE" , add
label define MEDCODF 33780 "VEETIDS" , add
label define MEDCODF 33843 "VENTOLIN" , add
label define MEDCODF 33858 "VERAPAMIL" , add
label define MEDCODF 34085 "VIBRA" , add
label define MEDCODF 34090 "VIBRAMYCIN" , add
label define MEDCODF 34103 "VICKS VAPORUB" , add
label define MEDCODF 34110 "VICODIN" , add
label define MEDCODF 34260 "VISINE" , add
label define MEDCODF 34270 "VISTARIL" , add
label define MEDCODF 34360 "VITAMIN A" , add
label define MEDCODF 34425 "VITAMIN B COMPLEX" , add
label define MEDCODF 34455 "VITAMIN B-1" , add
label define MEDCODF 34495 "VITAMIN B-12" , add
label define MEDCODF 34510 "VITAMIN B-6" , add
label define MEDCODF 34520 "VITAMIN C" , add
label define MEDCODF 34565 "VITAMIN D" , add
label define MEDCODF 34575 "VITAMIN E" , add
label define MEDCODF 34623 "VITAMIN K" , add
label define MEDCODF 34725 "VOLTAREN" , add
label define MEDCODF 34775 "WARFARIN" , add
label define MEDCODF 34855 "WESTCORT" , add
label define MEDCODF 35023 "XANAX" , add
label define MEDCODF 35050 "XEROFOAM DRESSING" , add
label define MEDCODF 35060 "XYLOCAINE" , add
label define MEDCODF 35080 "XYLOCAINE HCL W/EPINEPHRINE" , add
label define MEDCODF 35085 "XYLOCAINE VISCOUS" , add
label define MEDCODF 35095 "XYLOMETAZOLINE" , add
label define MEDCODF 35224 "ZESTRIL" , add
label define MEDCODF 35240 "ZINC" , add
label define MEDCODF 35245 "ZINC GLUCONATE" , add
label define MEDCODF 35250 "ZINC OXIDE" , add
label define MEDCODF 35260 "ZINC SULFATE" , add
label define MEDCODF 35295 "ZINCATE" , add
label define MEDCODF 35341 "ZOVIRAX" , add
label define MEDCODF 35350 "ZYLOPRIM" , add
label define MEDCODF 35430 "ANTIEMETIC AGENT" , add
label define MEDCODF 35450 "ANTIHISTAMINE" , add
label define MEDCODF 35495 "ANTIPYRETIC AGENT" , add
label define MEDCODF 35590 "TRIMETHOBENZAMIDE HCL" , add
label define MEDCODF 35595 "TRIMETHOPRIM/SULFAMETHOXAZOLE" , add
label define MEDCODF 40285 "CALTRATE" , add
label define MEDCODF 40455 "CYCLOPENTOLATE" , add
label define MEDCODF 40520 "DESYREL" , add
label define MEDCODF 40540 "DEXTROSE SODIUM CHLORIDE" , add
label define MEDCODF 40605 "DIPHENOXY/ATROP" , add
label define MEDCODF 40610 "DIPHENOXYLATE" , add
label define MEDCODF 40905 "ISOPTIN" , add
label define MEDCODF 41150 "NASALCROM" , add
label define MEDCODF 41315 "POLYETHYLENE GLYCOL" , add
label define MEDCODF 41495 "SODIUM POLYSTYRENE SULFON" , add
label define MEDCODF 41505 "SPECTAZOLE" , add
label define MEDCODF 41780 "ZANTAC" , add
label define MEDCODF 41830 "PSYLLIUM" , add
label define MEDCODF 41840 "HYOSCINE" , add
label define MEDCODF 41860 "FOLATE" , add
label define MEDCODF 42425 "GOLYTELY" , add
label define MEDCODF 42780 "NEOSPORIN OPHTHALMIC" , add
label define MEDCODF 42800 "NORMAL SALINE" , add
label define MEDCODF 42985 "PROPRANOLOL" , add
label define MEDCODF 60115 "AUGMENTIN" , add
label define MEDCODF 60125 "AUGMENTIN 500" , add
label define MEDCODF 60150 "BACITRACIN OPHTHALMIC" , add
label define MEDCODF 60180 "BENZTROPINE MESYLATE" , add
label define MEDCODF 60195 "BETAMETHASONE SOD PHOSPHATE" , add
label define MEDCODF 60205 "BETOPTIC" , add
label define MEDCODF 60265 "BUPRENEX" , add
label define MEDCODF 60270 "BUSPAR" , add
label define MEDCODF 60325 "CITRUCEL" , add
label define MEDCODF 60370 "CORDARONE" , add
label define MEDCODF 60415 "DEXAMETHASONE/NEOMYCIN/POLYMIX" , add
label define MEDCODF 60550 "EYE DROPS" , add
label define MEDCODF 60565 "FENTANYL CITRATE" , add
label define MEDCODF 60595 "FIORICET" , add
label define MEDCODF 60640 "GENTAMICIN OPHTHALMIC" , add
label define MEDCODF 60665 "GLYCERIN" , add
label define MEDCODF 60735 "INFLUENZA VIRUS VACC" , add
label define MEDCODF 60765 "ISOVUE" , add
label define MEDCODF 60790 "KLONOPIN" , add
label define MEDCODF 60795 "LACHYDRIN" , add
label define MEDCODF 60800 "LACTATED RINGER'S" , add
label define MEDCODF 60835 "LOTRISONE" , add
label define MEDCODF 60995 "NALOXONE HCL" , add
label define MEDCODF 61025 "NICORETTE" , add
label define MEDCODF 61035 "NIX" , add
label define MEDCODF 61080 "OMNIPAQUE" , add
label define MEDCODF 61160 "PEPCID" , add
label define MEDCODF 61185 "PIPERACILLIN" , add
label define MEDCODF 61205 "POVIDONE-IODINE" , add
label define MEDCODF 61245 "PROPRANOLOL HCL" , add
label define MEDCODF 61295 "ROCEPHIN" , add
label define MEDCODF 61405 "TAMBOCOR" , add
label define MEDCODF 61440 "TEMOVATE" , add
label define MEDCODF 61480 "TOLNAFTATE" , add
label define MEDCODF 61570 "VERSED" , add
label define MEDCODF 61605 "WELLBUTRIN" , add
label define MEDCODF 61625 "TRIAMTERENE W/HCTZ" , add
label define MEDCODF 70078 "CANNABIS" , add
label define MEDCODF 89010 "BETAMETHASONE DIPROPIONATE" , add
label define MEDCODF 89012 "BROMFED-DM" , add
label define MEDCODF 89013 "BROMPHEN DX" , add
label define MEDCODF 89014 "BUPIVACAINE W/EPINEPHRINE" , add
label define MEDCODF 89016 "CHARCOAL, ACTIVATED W/ SORBITOL" , add
label define MEDCODF 89018 "CLINDAMYCIN HCL" , add
label define MEDCODF 89019 "CLONIDINE HCL" , add
label define MEDCODF 89020 "CYCLOBENZAPRINE HCL" , add
label define MEDCODF 89021 "CYKLOKAPRON" , add
label define MEDCODF 89025 "DOXEPIN HCL" , add
label define MEDCODF 89035 "FLUOCINONIDE" , add
label define MEDCODF 89039 "HYDROCODONE W/ACETAMINOPHEN" , add
label define MEDCODF 89040 "HYDROCORTISONE ACETATE" , add
label define MEDCODF 89041 "HYDROCORTISONE SOD SUCCINATE" , add
label define MEDCODF 89045 "LIDOCAINE HCL VISCOUS" , add
label define MEDCODF 89049 "METHYLPREDNISOLONE ACETATE" , add
label define MEDCODF 89050 "MOTRIN IB" , add
label define MEDCODF 89053 "NITROFURANTOIN MACROCRYSTALS" , add
label define MEDCODF 89061 "POLYTRIM" , add
label define MEDCODF 89062 "PRAZOSIN HCL" , add
label define MEDCODF 89066 "PRELONE" , add
label define MEDCODF 89067 "PROCARDIA XL" , add
label define MEDCODF 89068 "PROCHLORPERAZINE EDISYLATE" , add
label define MEDCODF 89069 "PROCHLORPERAZINE MALEATE" , add
label define MEDCODF 89076 "SUPRAX" , add
label define MEDCODF 89080 "TIMOLOL MALEATE" , add
label define MEDCODF 91000 "ALBUTEROL SULFATE" , add
label define MEDCODF 91002 "AMILORIDE HCL" , add
label define MEDCODF 91008 "BROMATANE DX" , add
label define MEDCODF 91009 "BUTALBITAL/APAP/CAFFAINE" , add
label define MEDCODF 91015 "DOXYCYCLINE HYCLATE" , add
label define MEDCODF 91027 "GUAIFENESIN AC" , add
label define MEDCODF 91028 "HALOPERIDOL LACTATE" , add
label define MEDCODF 91029 "HYDROXYZINE HCL" , add
label define MEDCODF 91039 "NIFEDIPINE" , add
label define MEDCODF 91043 "PRILOSEC" , add
label define MEDCODF 91052 "SSD" , add
label define MEDCODF 91061 "ACYCLOVIR" , add
label define MEDCODF 91062 "ALPRAZOLAM" , add
label define MEDCODF 91063 "ATENOLOL" , add
label define MEDCODF 91064 "AZTREONAM" , add
label define MEDCODF 91066 "BUSPIRONE HCL" , add
label define MEDCODF 91068 "CEFTAZIDIME" , add
label define MEDCODF 91069 "CEFTRIAXONE" , add
label define MEDCODF 91072 "DILTIAZEM HCL" , add
label define MEDCODF 91074 "ENALAPRIL" , add
label define MEDCODF 91079 "FLUOXETINE" , add
label define MEDCODF 91081 "GLIPIZIDE" , add
label define MEDCODF 91084 "IPRATROPIUM BROMIDE" , add
label define MEDCODF 91085 "KETOCONAZOLE" , add
label define MEDCODF 91088 "LOVASTATIN" , add
label define MEDCODF 91089 "METHIMAZOLE" , add
label define MEDCODF 91091 "MISOPROSTOL" , add
label define MEDCODF 91096 "OMEPRAZOLE" , add
label define MEDCODF 91099 "RANITIDINE" , add
label define MEDCODF 91102 "TRETINOIN" , add
label define MEDCODF 91103 "IBU" , add
label define MEDCODF 92000 "ACCUPRIL" , add
label define MEDCODF 92003 "ALTACE" , add
label define MEDCODF 92006 "BIAXIN" , add
label define MEDCODF 92012 "CARDURA" , add
label define MEDCODF 92015 "CILOXAN" , add
label define MEDCODF 92016 "CLOZARIL" , add
label define MEDCODF 92019 "DEXTRAN" , add
label define MEDCODF 92024 "DURAGESIC" , add
label define MEDCODF 92031 "FLOXIN" , add
label define MEDCODF 92033 "FLUPHENAZINE DECANOATE" , add
label define MEDCODF 92038 "GENTAMICIN SULFATE" , add
label define MEDCODF 92043 "HYOSCYAMINE SULFATE" , add
label define MEDCODF 92051 "LODINE" , add
label define MEDCODF 92052 "LOTENSIN" , add
label define MEDCODF 92055 "MIACALCIN" , add
label define MEDCODF 92061 "NASACORT" , add
label define MEDCODF 92076 "PRAVACHOL" , add
label define MEDCODF 92087 "STERILE WATER" , add
label define MEDCODF 92104 "ZEASORB-AF" , add
label define MEDCODF 92105 "ZOFRAN" , add
label define MEDCODF 92107 "BENAZEPRIL" , add
label define MEDCODF 92109 "CEFACLOR" , add
label define MEDCODF 92110 "CEFIXIME" , add
label define MEDCODF 92111 "CIPROFLOXACIN" , add
label define MEDCODF 92112 "CLARITHROMYCIN" , add
label define MEDCODF 92115 "CLOZAPINE" , add
label define MEDCODF 92116 "DICLOFENAC" , add
label define MEDCODF 92120 "DOXAZOSIN MESYLATE" , add
label define MEDCODF 92122 "EPOETIN ALFA" , add
label define MEDCODF 92124 "ETODOLAC" , add
label define MEDCODF 92125 "FELODIPINE" , add
label define MEDCODF 92126 "FLUTICASONE" , add
label define MEDCODF 92130 "HALOBETASOL" , add
label define MEDCODF 92134 "LEVONORGESTREL" , add
label define MEDCODF 92135 "MESALAMINE" , add
label define MEDCODF 92137 "METROGEL" , add
label define MEDCODF 92138 "NADOLOL" , add
label define MEDCODF 92140 "OFLOXACIN" , add
label define MEDCODF 92141 "ONDANSETRON" , add
label define MEDCODF 92143 "PENTOXIFYLLINE" , add
label define MEDCODF 92150 "RAMIPRIL" , add
label define MEDCODF 92152 "TERCONAZOLE" , add
label define MEDCODF 92153 "TRANEXAMIC ACID" , add
label define MEDCODF 92156 "DIFLUCAN" , add
label define MEDCODF 92157 "ELIMITE" , add
label define MEDCODF 92160 "PRINZIDE" , add
label define MEDCODF 92161 "TORADOL" , add
label define MEDCODF 92164 "LISINOPRIL" , add
label define MEDCODF 92178 "HUMIBID" , add
label define MEDCODF 92180 "LORTAB" , add
label define MEDCODF 93009 "ALBUMIN" , add
label define MEDCODF 93014 "ALLERGY MEDICATION" , add
label define MEDCODF 93022 "ARTIFICIAL TEAR SOLUTION" , add
label define MEDCODF 93023 "ASACOL" , add
label define MEDCODF 93024 "ASPERCREME" , add
label define MEDCODF 93036 "CARDENE" , add
label define MEDCODF 93040 "CELLUVISC" , add
label define MEDCODF 93041 "CITRACAL" , add
label define MEDCODF 93048 "DILACOR-XR" , add
label define MEDCODF 93049 "DIPHEN" , add
label define MEDCODF 93057 "ENULOSE" , add
label define MEDCODF 93059 "EPOGEN" , add
label define MEDCODF 93062 "FISH OIL" , add
label define MEDCODF 93065 "GAS-X" , add
label define MEDCODF 93090 "MACROBID" , add
label define MEDCODF 93094 "ROMAZICON (MAZICON)" , add
label define MEDCODF 93098 "MONODOX" , add
label define MEDCODF 93101 "NASAL SPRAY" , add
label define MEDCODF 93105 "NICODERM" , add
label define MEDCODF 93107 "NICOTROL" , add
label define MEDCODF 93109 "NUTRITIONAL SUPPLEMENT" , add
label define MEDCODF 93113 "OCUVITE" , add
label define MEDCODF 93121 "PERIDEX" , add
label define MEDCODF 93127 "PROSCAR" , add
label define MEDCODF 93131 "REFRESH" , add
label define MEDCODF 93136 "RHOGAM" , add
label define MEDCODF 93143 "SHUR-CLENS" , add
label define MEDCODF 93151 "SUPPOSITORY" , add
label define MEDCODF 93152 "TAC" , add
label define MEDCODF 93156 "TOPROL XL" , add
label define MEDCODF 93166 "VANTIN" , add
label define MEDCODF 93179 "ZITHROMAX" , add
label define MEDCODF 93181 "ZOCOR" , add
label define MEDCODF 93183 "ZOLOFT" , add
label define MEDCODF 93185 "ZOSTRIX" , add
label define MEDCODF 93187 "NORVASC" , add
label define MEDCODF 93188 "NALTREXONE" , add
label define MEDCODF 93193 "SERTRALINE" , add
label define MEDCODF 93200 "ACTIGALL" , add
label define MEDCODF 93202 "CYCLOSPORINE" , add
label define MEDCODF 93203 "LABETALOL" , add
label define MEDCODF 93211 "AMIODARONE" , add
label define MEDCODF 93212 "PAXIL" , add
label define MEDCODF 93213 "GEMFIBROZIL" , add
label define MEDCODF 93214 "AZITHROMYCIN" , add
label define MEDCODF 93215 "FLUCONAZOLE" , add
label define MEDCODF 93220 "KETOROLAC" , add
label define MEDCODF 93221 "FELBAMATE" , add
label define MEDCODF 93224 "CLARITIN" , add
label define MEDCODF 93231 "IMITREX" , add
label define MEDCODF 93237 "SIMVASTATIN" , add
label define MEDCODF 93238 "BETAPACE" , add
label define MEDCODF 93243 "LAMISIL" , add
label define MEDCODF 93245 "HALFPRIN" , add
label define MEDCODF 93248 "SUMATRIPTAN" , add
label define MEDCODF 93249 "VALPROATE" , add
label define MEDCODF 93257 "LORATADINE" , add
label define MEDCODF 93262 "MIDAZOLAM HCL" , add
label define MEDCODF 93305 "GLYBURIDE" , add
label define MEDCODF 93306 "ADENOCARD" , add
label define MEDCODF 93309 "BENZODIAZEPINES" , add
label define MEDCODF 93313 "DOBUTAMINE" , add
label define MEDCODF 93325 "EMLA" , add
label define MEDCODF 93337 "PROPOFOL" , add
label define MEDCODF 93344 "SOAP" , add
label define MEDCODF 93345 "DIPRIVAN" , add
label define MEDCODF 93347 "AMBIEN" , add
label define MEDCODF 93348 "PHOSLO" , add
label define MEDCODF 93352 "FAMOTIDINE" , add
label define MEDCODF 93355 "BUPROPION" , add
label define MEDCODF 93356 "ANTIGEN" , add
label define MEDCODF 93371 "MIDODRINE" , add
label define MEDCODF 93386 "GI COCKTAIL" , add
label define MEDCODF 93387 "CEFOXITIN" , add
label define MEDCODF 93396 "AMLODIPINE" , add
label define MEDCODF 93400 "NEBULIZER" , add
label define MEDCODF 93404 "SUCRALFATE" , add
label define MEDCODF 93405 "SANDOSTATIN" , add
label define MEDCODF 93418 "FILGRASTIM" , add
label define MEDCODF 93422 "FLUNISOLIDE" , add
label define MEDCODF 93424 "FLUDROCORTISONE ACETATE" , add
label define MEDCODF 93437 "THIAZIDE" , add
label define MEDCODF 93447 "EMOLLIENT / LOTION / CREAM /MOISTURIZER" , add
label define MEDCODF 93449 "RABIES IMMUNE GLOBULIN" , add
label define MEDCODF 93451 "CLOMIPRAMINE" , add
label define MEDCODF 94001 "SOTALOL" , add
label define MEDCODF 94002 "BENZONATE" , add
label define MEDCODF 94004 "PAROXETINE" , add
label define MEDCODF 94007 "ENEMA" , add
label define MEDCODF 94011 "CATAFLAM" , add
label define MEDCODF 94014 "VENLAFAXINE" , add
label define MEDCODF 94016 "ZIAC" , add
label define MEDCODF 94027 "SHAMPOO" , add
label define MEDCODF 94029 "NULYTELY" , add
label define MEDCODF 94031 "IMDUR" , add
label define MEDCODF 94035 "ZOLPIDEM TARTRATE" , add
label define MEDCODF 94048 "METROGEL VAGINAL" , add
label define MEDCODF 94049 "OYSTER SHELL CALCIUM" , add
label define MEDCODF 94062 "MONOKET" , add
label define MEDCODF 94070 "EFFEXOR" , add
label define MEDCODF 94072 "NSAID" , add
label define MEDCODF 94073 "OCUFLOX" , add
label define MEDCODF 94079 "CORTICOSTEROID(S)" , add
label define MEDCODF 94080 "DESMOPRESSIN" , add
label define MEDCODF 94081 "DIVALPROEX SODIUM" , add
label define MEDCODF 94099 "NEURONTIN" , add
label define MEDCODF 94103 "QUININE" , add
label define MEDCODF 94104 "RISPERIDONE" , add
label define MEDCODF 94110 "LOZENGES" , add
label define MEDCODF 94114 "GABAPENTIN" , add
label define MEDCODF 94116 "HUMULIN R" , add
label define MEDCODF 94117 "LOVENOX" , add
label define MEDCODF 94124 "CHOLESTYRAMINE" , add
label define MEDCODF 94125 "ALEVE" , add
label define MEDCODF 94126 "DEMADEX" , add
label define MEDCODF 94128 "DAYQUIL" , add
label define MEDCODF 94133 "TERAZOSIN" , add
label define MEDCODF 94134 "DESONIDE" , add
label define MEDCODF 94139 "CEFPODOXIME" , add
label define MEDCODF 94145 "OINTMENT" , add
label define MEDCODF 94146 "PENICILLIN G BENZATHINE" , add
label define MEDCODF 94158 "RISPERDAL" , add
label define MEDCODF 94173 "ACEBUTOLOL" , add
label define MEDCODF 94175 "ANTIBACTERIAL AGENT" , add
label define MEDCODF 94188 "FENTANYL" , add
label define MEDCODF 94189 "FLUMAZENIL" , add
label define MEDCODF 94190 "MG" , add
label define MEDCODF 94191 "MONISTAT" , add
label define MEDCODF 94196 "OCTREOTIDE" , add
label define MEDCODF 95003 "ECONAZOLE" , add
label define MEDCODF 95005 "FLONASE" , add
label define MEDCODF 95016 "ADDERALL" , add
label define MEDCODF 95017 "FAMVIR" , add
label define MEDCODF 95020 "NICARDIPINE" , add
label define MEDCODF 95023 "CHILDRENS MOTRIN" , add
label define MEDCODF 95024 "FLUVOXAMINE" , add
label define MEDCODF 95036 "BUPRENORPHINE" , add
label define MEDCODF 95042 "NOREPINEPHRINE" , add
label define MEDCODF 95044 "ROBITUSSIN W/ CODEINE" , add
label define MEDCODF 95045 "TYLENOL PM" , add
label define MEDCODF 95046 "AMYLASE" , add
label define MEDCODF 95050 "ULTRAM" , add
label define MEDCODF 95052 "OPTIRAY" , add
label define MEDCODF 95057 "DTAP" , add
label define MEDCODF 95065 "ZEMURON" , add
label define MEDCODF 95072 "BENZTROPINE" , add
label define MEDCODF 95089 "METAXALONE" , add
label define MEDCODF 95092 "PRAVASTATIN" , add
label define MEDCODF 95097 "CARDIOLITE" , add
label define MEDCODF 95100 "PROTEIN SUPPLEMENT" , add
label define MEDCODF 95111 "GLUCOPHAGE" , add
label define MEDCODF 95114 "TRUSOPT" , add
label define MEDCODF 95116 "CAPSAICIN" , add
label define MEDCODF 95118 "HEPATITIS A VACCINE" , add
label define MEDCODF 95122 "PREVACID" , add
label define MEDCODF 95133 "METFORMIN" , add
label define MEDCODF 95144 "LOTREL" , add
label define MEDCODF 95149 "ZOSYN" , add
label define MEDCODF 95152 "COZAAR" , add
label define MEDCODF 95155 "FLAX SEED OIL" , add
label define MEDCODF 95157 "COLESTIPOL" , add
label define MEDCODF 95160 "CLIMARA" , add
label define MEDCODF 95164 "DORZOLAMIDE" , add
label define MEDCODF 95171 "HYZAAR" , add
label define MEDCODF 95173 "LEVBID" , add
label define MEDCODF 95174 "PROGRAF" , add
label define MEDCODF 95177 "FINASTERIDE" , add
label define MEDCODF 95178 "FIORICET/ CODEINE" , add
label define MEDCODF 95181 "LAMICTAL" , add
label define MEDCODF 95183 "FOSAMAX" , add
label define MEDCODF 95186 "ESMOLOL" , add
label define MEDCODF 95191 "EPIVIR" , add
label define MEDCODF 95192 "CASODEX" , add
label define MEDCODF 96003 "PERMETHRIN" , add
label define MEDCODF 96005 "ALENDRONATE SODIUM" , add
label define MEDCODF 96007 "CETIRIZINE" , add
label define MEDCODF 96009 "BENZOCAINE" , add
label define MEDCODF 96022 "ZYRTEC" , add
label define MEDCODF 96024 "CLOBETASOL" , add
label define MEDCODF 96027 "DOCUSATE SODIUM" , add
label define MEDCODF 96028 "ACETAMINOPHEN-HYDROCODONE" , add
label define MEDCODF 96029 "ALBENDAZOLE" , add
label define MEDCODF 96031 "DRONABINOL" , add
label define MEDCODF 96034 "RIFAPENTINE" , add
label define MEDCODF 96038 "MUPIROCIN" , add
label define MEDCODF 96041 "TRAMADOL" , add
label define MEDCODF 96043 "VALTREX" , add
label define MEDCODF 96045 "DEMEROL" , add
label define MEDCODF 96065 "GEMCITABINE" , add
label define MEDCODF 96087 "VIBRA-TABS" , add
label define MEDCODF 96091 "FLOVENT" , add
label define MEDCODF 96095 "ETOMIDATE" , add
label define MEDCODF 96105 "TEGADERM" , add
label define MEDCODF 96107 "BUMETANIDE" , add
label define MEDCODF 96122 "REMERON" , add
label define MEDCODF 96123 "ZEBETA" , add
label define MEDCODF 96125 "MELATONIN" , add
label define MEDCODF 96130 "LANSOPRAZOLE" , add
label define MEDCODF 96135 "PHENERGAN DM" , add
label define MEDCODF 96138 "AMARYL" , add
label define MEDCODF 96147 "CELLCEPT" , add
label define MEDCODF 96164 "BETIMOL" , add
label define MEDCODF 96167 "XALATAN" , add
label define MEDCODF 96169 "ACIDOPHILUS" , add
label define MEDCODF 96173 "ZYPREXA" , add
label define MEDCODF 96174 "ALLEGRA" , add
label define MEDCODF 96177 "IMMUNO THERAPY" , add
label define MEDCODF 97002 "OLANZAPINE" , add
label define MEDCODF 97005 "CEREBYX" , add
label define MEDCODF 97011 "MIGRAINE AGENT" , add
label define MEDCODF 97016 "ARICEPT" , add
label define MEDCODF 97017 "HUMALOG" , add
label define MEDCODF 97019 "SAW PALMETTO" , add
label define MEDCODF 97020 "LIPITOR" , add
label define MEDCODF 97028 "ALPHAGAN" , add
label define MEDCODF 97030 "NEOCATE" , add
label define MEDCODF 97035 "ASTELIN" , add
label define MEDCODF 97036 "DIOVAN" , add
label define MEDCODF 97037 "PATANOL" , add
label define MEDCODF 97045 "LEVAQUIN" , add
label define MEDCODF 97047 "MAGNESIUM" , add
label define MEDCODF 97049 "TOPAMAX" , add
label define MEDCODF 97050 "VISIPAQUE" , add
label define MEDCODF 97056 "MIRTAZAPINE" , add
label define MEDCODF 97073 "LOSARTAN" , add
label define MEDCODF 97084 "ROCURONIUM" , add
label define MEDCODF 97085 "TORSEMIDE" , add
label define MEDCODF 97089 "GUANFACINE" , add
label define MEDCODF 97098 "PRAMIPEXOLE" , add
label define MEDCODF 97103 "ALA-CORT" , add
label define MEDCODF 97105 "COMBIVENT" , add
label define MEDCODF 97113 "ZANAFLEX" , add
label define MEDCODF 97126 "FLOMAX" , add
label define MEDCODF 97130 "TACROLIMUS" , add
label define MEDCODF 97132 "MAXIPIME" , add
label define MEDCODF 97134 "PLASMA" , add
label define MEDCODF 97135 "VALACYCLOVIR" , add
label define MEDCODF 97136 "LAMOTRIGINE" , add
label define MEDCODF 97142 "COREG" , add
label define MEDCODF 97145 "AVAPRO" , add
label define MEDCODF 97150 "REQUIP" , add
label define MEDCODF 97152 "MIRAPEX" , add
label define MEDCODF 97157 "ATORVASTATIN" , add
label define MEDCODF 97159 "CALCITRIOL" , add
label define MEDCODF 97162 "FOSPHENYTOIN" , add
label define MEDCODF 97163 "LEVOFLOXACIN" , add
label define MEDCODF 97168 "SEROQUEL" , add
label define MEDCODF 97170 "CENTRUM SILVER" , add
label define MEDCODF 97174 "BABY ASPIRIN" , add
label define MEDCODF 98001 "MAG-OX" , add
label define MEDCODF 98008 "CARVEDILOL" , add
label define MEDCODF 98010 "NASONEX" , add
label define MEDCODF 98025 "MONUROL" , add
label define MEDCODF 98033 "ALDARA" , add
label define MEDCODF 98036 "NORCO" , add
label define MEDCODF 98038 "SINGULAIR" , add
label define MEDCODF 98041 "VIAGRA" , add
label define MEDCODF 98046 "MICROZIDE" , add
label define MEDCODF 98049 "DONEPEZIL HCL" , add
label define MEDCODF 98075 "CALCIUM CITRATE" , add
label define MEDCODF 98085 "NIASPAN" , add
label define MEDCODF 98086 "PLAVIX" , add
label define MEDCODF 98089 "TERBINAFINE" , add
label define MEDCODF 98090 "ARIMIDEX" , add
label define MEDCODF 98093 "MONTELUKAST" , add
label define MEDCODF 98098 "COSOPT" , add
label define MEDCODF 98109 "CHLORHEXIDINE GLUCONATE" , add
label define MEDCODF 98115 "CELEXA" , add
label define MEDCODF 98117 "FENOFIBRATE" , add
label define MEDCODF 98131 "TOPIRAMATE" , add
label define MEDCODF 98139 "TIZANIDINE" , add
label define MEDCODF 98141 "VALSARTAN" , add
label define MEDCODF 98156 "MAXALT" , add
label define MEDCODF 98158 "TRICOR" , add
label define MEDCODF 99001 "CEFEPIME" , add
label define MEDCODF 99002 "CELEBREX" , add
label define MEDCODF 99005 "REMICADE" , add
label define MEDCODF 99008 "ALLEGRA D" , add
label define MEDCODF 99014 "OMNICEF" , add
label define MEDCODF 99016 "PRIMROSE OIL" , add
label define MEDCODF 99026 "GLUCOSAMINE" , add
label define MEDCODF 99029 "PREDNISOLONE ACETATE OPHTHALMIC" , add
label define MEDCODF 99033 "CLOPIDOGREL" , add
label define MEDCODF 99036 "GLUCOSAMINE CHONDROITIN" , add
label define MEDCODF 99042 "PACERONE" , add
label define MEDCODF 99043 "PROAMATINE" , add
label define MEDCODF 99052 "ACTIVATED CHARCOAL" , add
label define MEDCODF 99054 "FERATAB" , add
label define MEDCODF 99056 "GLIMEPIRIDE" , add
label define MEDCODF 99059 "MICARDIS" , add
label define MEDCODF 99062 "PRIMACOR" , add
label define MEDCODF 99074 "CITALOPRAM" , add
label define MEDCODF 99075 "ENBREL" , add
label define MEDCODF 99080 "MIRALAX" , add
label define MEDCODF 99090 "ACTOS" , add
label define MEDCODF 99099 "PLETAL" , add
label define MEDCODF 99101 "QUETIAPINE FUMARATE" , add
label define MEDCODF 99102 "THERATEARS" , add
label define MEDCODF 99106 "XOPENEX" , add
label define MEDCODF 99107 "ZADITOR" , add
label define MEDCODF 99109 "BUFFERED LIDOCAINE" , add
label define MEDCODF 99112 "D-5-W" , add
label define MEDCODF 99123 "MORPHINE SULFATE" , add
label define MEDCODF 99127 "LIDOCAINE/EPINEPHRINE/TETRACAINE" , add
label define MEDCODF 99128 "LIPASE" , add
label define MEDCODF 99132 "EVISTA" , add
label define MEDCODF 99133 "ALBUTEROL" , add
label define MEDCODF 99136 "HELIOX" , add
label define MEDCODF 99137 "HERBS" , add
label define MEDCODF 99139 "MAGIC MOUTHWASH" , add
label define MEDCODF 99144 "RACEMIC EPINEPHRINE" , add
label define MEDCODF 99161 "ROPINIROLE HCL" , add
label define MEDCODF 99167 "COQ-10" , add
label define MEDCODF 99174 "PHOSPHORUS" , add
label define MEDCODF 99187 "ACTICIN" , add
label define MEDCODF 99201 "ORTHO-CYCLEN" , add
label define MEDCODF 99207 "BRIMONIDINE" , add
label define MEDCODF 99213 "DIASTAT" , add
label define MEDCODF 99214 "DIOVAN HCT" , add
label define MEDCODF 99216 "FEXOFENADINE" , add
label define MEDCODF 99224 "OMEGA-3" , add
label define MEDCODF 99999 "ILLEGIBLE" , add
label define MEDF 0 "No"  
label define MEDF 1 "Yes" , add
label define MEDF 2 "Entire item blank, including 'None' box" , add
label define MSAF 1 "MSA (Metropolitan Statistical Area)"  
label define MSAF 2 "Non-MSA" , add
label define NODISPF 0 "One or more answers to the disposition item"  
label define NODISPF 1 "No answer to the disposition item" , add
label define NOPAYF 0 "At least one source of payment is recorded"  
label define NOPAYF 1 "All sources of payment are blank" , add
label define NOYESF 0 "No"  
label define NOYESF 1 "Yes" , add
label define NUMDISF 0 "None listed/listed drug given at ED only or unknown"  
label define NUMGIVF 0 "None listed/listed drug Rx at discharge only or unknown"  
label define OBSPHYSEDF -7 "Not applicable"  
label define OBSPHYSEDF 0 "Box is not marked" , add
label define OBSPHYSEDF 1 "Box is marked" , add
label define OBSSEPF -9 "Blank"  
label define OBSSEPF -8 "Unknown" , add
label define OBSSEPF -7 "Not applicable" , add
label define OBSSEPF 1 "Yes" , add
label define OBSSEPF 2 "No" , add
label define PAINSCALEF -9 "Blank"  
label define PAINSCALEF -8 "Unknown" , add
label define PAYTYPERF -9 "All sources of payment are blank"  
label define PAYTYPERF -8 "Unknown" , add
label define PAYTYPERF 1 "Private insurance" , add
label define PAYTYPERF 2 "Medicare" , add
label define PAYTYPERF 3 "Medicaid or CHIP or other state-based program" , add
label define PAYTYPERF 4 "Worker's compensation" , add
label define PAYTYPERF 5 "Self-pay" , add
label define PAYTYPERF 6 "No charge/Charity" , add
label define PAYTYPERF 7 "Other" , add
label define POPCTF -9 "Blank"  
label define PRDIAGF 	0 "No"  
label define PRDIAGF 	1 "Yes" , add
label define PRDIAGF -7 "Not applicable" , add
label define PRESCRF 1 "Prescription drug"  
label define PRESCRF 2 "Nonprescription drug" , add
label define PRESCRF 3 "Undetermined" , add
label define PRESCRF 4 "Illicit" , add
label define PRESCRF 5 "Prescription or Nonprescription drug" , add
label define PROCF 0 "No"  
label define PROCF 1 "Yes" , add
label define PROCF 2 "Entire item blank, including 'None' box" , add
label define PULSEF -9 "Blank"  
label define PULSEF 998 "DOPP or DOPPLER" , add
label define RACERETHF 1 "Non-Hispanic White"  
label define RACERETHF 2 "Non-Hispanic Black" , add
label define RACERETHF 3 "Hispanic" , add
label define RACERETHF 4 "Non-Hispanic Other" , add
label define RACERF 1 "White"  
label define RACERF 2 "Black" , add
label define RACERF 3 "Other" , add
label define RACEUNF -9 "Blank"  
label define RACEUNF 1 "White Only" , add
label define RACEUNF 2 "Black/African American Only" , add
label define RACEUNF 3 "Asian Only" , add
label define RACEUNF 4 "Native Hawaiian/Oth Pac Isl Only" , add
label define RACEUNF 5 "American Indian/Alaska Native Only" , add
label define RACEUNF 6 "More than one race reported" , add
label define REGDIVF -9 "Blank"  
label define REGDIVF -8 "Unknown" , add
label define REGDIVF -7 "Not applicable" , add
label define REGDIVF 1 "Yes" , add
label define REGDIVF 2 "No" , add
label define REGIONF 1 "Northeast"  
label define REGIONF 2 "Midwest" , add
label define REGIONF 3 "South" , add
label define REGIONF 4 "West" , add
label define RESIDF -9 "Blank"  
label define RESIDF -8 "Unknown" , add
label define RESIDF 	1 "Private residence" , add
label define RESIDF 	2 "Nursing home" , add
label define RESIDF 	3 "Homeless/homeless shelter" , add
label define RESIDF 	4 "Other" , add
label define RESPRF -9 "Blank"  
label define RFV3DF 0 "Blank"  
label define RFV3DF 1005 "Chills" , add
label define RFV3DF 1010 "Fever" , add
label define RFV3DF 1012 "Other symptoms of body temperature" , add
label define RFV3DF 1015 "Tiredness, exhaustion" , add
label define RFV3DF 1020 "General weakness" , add
label define RFV3DF 1025 "General ill feeling" , add
label define RFV3DF 1030 "Fainting (syncope)" , add
label define RFV3DF 1035 "Symptoms of fluid abnormalities" , add
label define RFV3DF 1040 "Weight gain" , add
label define RFV3DF 1045 "Weight loss" , add
label define RFV3DF 1046 "Symptoms of face, not elsewhere class..." , add
label define RFV3DF 1050 "Chest pain and related symptoms (not ..." , add
label define RFV3DF 1055 "Pain, site not referable to a specifi..." , add
label define RFV3DF 1060 "Pain and related symptoms, general, s..." , add
label define RFV3DF 1065 "Tumor or mass, site unspecified" , add
label define RFV3DF 1066 "Lesion, internal, NOS (excludes brain and" , add
label define RFV3DF 1070 "Bleeding, site unspecified" , add
label define RFV3DF 1075 "Symptoms of growth and developmental ..." , add
label define RFV3DF 1080 "General symptoms of infants, NEC" , add
label define RFV3DF 1085 "General or unspecified nonviral infec..." , add
label define RFV3DF 1090 "Allergy, NOS" , add
label define RFV3DF 1095 "Disorders of motor functions" , add
label define RFV3DF 1096 "Dyslexia, NOS" , add
label define RFV3DF 1100 "Anxiety and nervousness" , add
label define RFV3DF 1105 "Fears and phobias" , add
label define RFV3DF 1110 "Depression" , add
label define RFV3DF 1115 "Anger" , add
label define RFV3DF 1120 "Problems with identity and self-esteem" , add
label define RFV3DF 1123 "Transgender" , add
label define RFV3DF 1125 "Restlessness" , add
label define RFV3DF 1130 "Behavioral disturbances" , add
label define RFV3DF 1135 "Disturbances of sleep" , add
label define RFV3DF 1140 "Smoking problems" , add
label define RFV3DF 1145 "Alcohol-related problems" , add
label define RFV3DF 1150 "Abnormal drug usage" , add
label define RFV3DF 1155 "Delusions or hallucinations" , add
label define RFV3DF 1160 "Psychosexual disorders" , add
label define RFV3DF 1165 "Oth sympt/prob relat psychological an..." , add
label define RFV3DF 1200 "Abnormal involuntary movements" , add
label define RFV3DF 1205 "Convulsions" , add
label define RFV3DF 1207 "Symptoms of head, NEC" , add
label define RFV3DF 1210 "Headache, pain in head" , add
label define RFV3DF 1215 "Memory, disturbances of" , add
label define RFV3DF 1220 "Disturbances of sensation" , add
label define RFV3DF 1225 "Vertigo - dizziness" , add
label define RFV3DF 1230 "Weakness (neurologic)" , add
label define RFV3DF 1235 "Disorders of speech, speech disturbance" , add
label define RFV3DF 1240 "Other symptoms referable to the nervo..." , add
label define RFV3DF 1260 "Abnormal pulsations and palpitations" , add
label define RFV3DF 1265 "Heart pain" , add
label define RFV3DF 1270 "Other symptoms of the heart" , add
label define RFV3DF 1275 "Symptoms of lymph glands (or nodes)" , add
label define RFV3DF 1280 "Oth sympt referable to the cardiovasc..." , add
label define RFV3DF 1305 "Vision dysfunctions" , add
label define RFV3DF 1310 "Discharge from eye" , add
label define RFV3DF 1315 "Eye infection and inflammation" , add
label define RFV3DF 1320 "Abnormal sensations of the eye" , add
label define RFV3DF 1325 "Abnormal eye movements" , add
label define RFV3DF 1330 "Abnormal appearance of eyes" , add
label define RFV3DF 1335 "Other symptoms referable to eye, NEC" , add
label define RFV3DF 1340 "Symptoms of eyelids" , add
label define RFV3DF 1345 "Hearing dysfunctions" , add
label define RFV3DF 1350 "Discharge from ear" , add
label define RFV3DF 1355 "Earache, or ear infection" , add
label define RFV3DF 1360 "Plugged feeling in ear" , add
label define RFV3DF 1365 "Other symptoms referable to the ears,..." , add
label define RFV3DF 1400 "Nasal congestion" , add
label define RFV3DF 1405 "Other symptoms of nose" , add
label define RFV3DF 1410 "Sinus problems" , add
label define RFV3DF 1415 "Shortness of breath" , add
label define RFV3DF 1420 "Labored or difficult breathing" , add
label define RFV3DF 1425 "Wheezing" , add
label define RFV3DF 1430 "Breathing problems, NEC" , add
label define RFV3DF 1435 "Sneezing" , add
label define RFV3DF 1440 "Cough" , add
label define RFV3DF 1445 "Head cold, upper respiratory infectio..." , add
label define RFV3DF 1450 "General viral infection" , add
label define RFV3DF 1455 "Symptoms referable to throat" , add
label define RFV3DF 1460 "Symptoms referable to tonsils" , add
label define RFV3DF 1470 "Abnormalities of sputum or phlegm" , add
label define RFV3DF 1475 "Congestion in chest" , add
label define RFV3DF 1480 "Disorders of voice" , add
label define RFV3DF 1485 "Other symptoms referable to the respi..." , add
label define RFV3DF 1500 "Symptoms of teeth and gums" , add
label define RFV3DF 1501 "Symptoms of the jaw, NOS" , add
label define RFV3DF 1505 "Symptoms referable to lips" , add
label define RFV3DF 1510 "Symptoms referable to mouth" , add
label define RFV3DF 1515 "Symptoms referable to tongue" , add
label define RFV3DF 1520 "Difficulty in swallowing (dysphagia)" , add
label define RFV3DF 1525 "Nausea" , add
label define RFV3DF 1530 "Vomiting" , add
label define RFV3DF 1535 "Heartburn and indigestion (dyspepsia)" , add
label define RFV3DF 1540 "Gastrointestinal infection" , add
label define RFV3DF 1545 "Stomach and abdominal pain, cramps an..." , add
label define RFV3DF 1565 "Change in abdominal size" , add
label define RFV3DF 1570 "Appetite, abnormal" , add
label define RFV3DF 1575 "Difficulty eating" , add
label define RFV3DF 1580 "Gastrointestinal bleeding" , add
label define RFV3DF 1585 "Flatulence" , add
label define RFV3DF 1590 "Constipation" , add
label define RFV3DF 1595 "Diarrhea" , add
label define RFV3DF 1600 "Other symptoms or changes in bowel fu..." , add
label define RFV3DF 1605 "Symptoms referable to anus-rectum" , add
label define RFV3DF 1610 "Symptoms of liver, gallbladder, and b..." , add
label define RFV3DF 1615 "Other symptoms referable to digestive..." , add
label define RFV3DF 1640 "Abnormalities of urine" , add
label define RFV3DF 1645 "Frequency and urgency of urination" , add
label define RFV3DF 1650 "Painful urination" , add
label define RFV3DF 1655 "Incontinence of urine (enuresis)" , add
label define RFV3DF 1660 "Other urinary dysfunctions" , add
label define RFV3DF 1665 "Symptoms of bladder" , add
label define RFV3DF 1670 "Symptoms of the kidneys" , add
label define RFV3DF 1675 "Urinary tract infection, NOS" , add
label define RFV3DF 1680 "Other symptoms referable to urinary t..." , add
label define RFV3DF 1700 "Symptoms of penis" , add
label define RFV3DF 1705 "Penile discharge" , add
label define RFV3DF 1710 "Symptoms of prostate" , add
label define RFV3DF 1715 "Symptoms of the scrotum and testes" , add
label define RFV3DF 1720 "Other symptoms of male reproductive s..." , add
label define RFV3DF 1730 "Absence of menstruation (amenorrhea)" , add
label define RFV3DF 1735 "Irregularity of menstrual interval" , add
label define RFV3DF 1740 "Irregularity of menstrual flow" , add
label define RFV3DF 1745 "Menstrual symptoms, other and unspeci..." , add
label define RFV3DF 1750 "Menopausal symptoms" , add
label define RFV3DF 1755 "Uterine and vaginal bleeding" , add
label define RFV3DF 1760 "Vaginal discharge" , add
label define RFV3DF 1765 "Other vaginal symptoms" , add
label define RFV3DF 1770 "Vulvar disorders" , add
label define RFV3DF 1775 "Pelvic symptoms" , add
label define RFV3DF 1790 "Problems of pregnancy" , add
label define RFV3DF 1791 "Postpartum problems" , add
label define RFV3DF 1795 "Other symptoms referable to the femal..." , add
label define RFV3DF 1800 "Pain or soreness of breast" , add
label define RFV3DF 1805 "Lump or mass of breast" , add
label define RFV3DF 1810 "Other symptoms referable to breast" , add
label define RFV3DF 1815 "Symptoms of infertility" , add
label define RFV3DF 1820 "Hormone deficiency or problem" , add
label define RFV3DF 1825 "Symptoms of sexual dysfunction" , add
label define RFV3DF 1830 "Acne or pimples" , add
label define RFV3DF 1835 "Discoloration or pigmentation" , add
label define RFV3DF 1840 "Infections of skin, NOS" , add
label define RFV3DF 1845 "Symptoms of skin moles" , add
label define RFV3DF 1850 "Warts, NOS" , add
label define RFV3DF 1855 "Other growths of skin" , add
label define RFV3DF 1860 "Skin rash" , add
label define RFV3DF 1865 "Skin lesion" , add
label define RFV3DF 1870 "Skin irritations, NEC" , add
label define RFV3DF 1875 "Swelling of skin" , add
label define RFV3DF 1880 "Other symptoms referable to skin" , add
label define RFV3DF 1885 "Symptoms referable to nails" , add
label define RFV3DF 1890 "Symptoms referable to hair and scalp" , add
label define RFV3DF 1895 "Other symptoms of nails and hair" , add
label define RFV3DF 1900 "Neck symptoms" , add
label define RFV3DF 1905 "Back symptoms" , add
label define RFV3DF 1910 "Low back symptoms" , add
label define RFV3DF 1915 "Hip symptoms" , add
label define RFV3DF 1920 "Leg symptoms" , add
label define RFV3DF 1925 "Knee symptoms" , add
label define RFV3DF 1930 "Ankle symptoms" , add
label define RFV3DF 1935 "Foot and toe symptoms" , add
label define RFV3DF 1940 "Shoulder symptoms" , add
label define RFV3DF 1945 "Arm symptoms" , add
label define RFV3DF 1950 "Elbow symptoms" , add
label define RFV3DF 1955 "Wrist symptoms" , add
label define RFV3DF 1960 "Hand and finger symptoms" , add
label define RFV3DF 1965 "Symptoms of unspecified muscles" , add
label define RFV3DF 1970 "Symptoms of unspecified joints" , add
label define RFV3DF 1975 "Musculoskeletal deformities" , add
label define RFV3DF 1980 "Other musculoskeletal symptoms; inclu..." , add
label define RFV3DF 2005 "Intestinal infectious diseases" , add
label define RFV3DF 2010 "Streptococcal infection" , add
label define RFV3DF 2015 "Viral diseases" , add
label define RFV3DF 2016 "Coronavirus infection, unspecified" , add
label define RFV3DF 2017 "SARS-assoc coronavirus cause of dis class..." , add
label define RFV3DF 2020 "Venereal diseases" , add
label define RFV3DF 2025 "Fungus infections (mycoses)" , add
label define RFV3DF 2030 "Parasitic diseases" , add
label define RFV3DF 2031 "Sepsis, septicemia" , add
label define RFV3DF 2035 "Other and unspecified infectious and ..." , add
label define RFV3DF 2100 "Cancer, gastrointestinal tract" , add
label define RFV3DF 2105 "Cancer, respiratory tract" , add
label define RFV3DF 2110 "Cancer, skin and subcutaneous tissues" , add
label define RFV3DF 2115 "Cancer, breast" , add
label define RFV3DF 2120 "Cancer, female genital tract" , add
label define RFV3DF 2125 "Cancer, male genital tract" , add
label define RFV3DF 2126 "Cancer of urinary tract" , add
label define RFV3DF 2130 "Other malignant and unspecified neopl..." , add
label define RFV3DF 2135 "Hodgkin's disease, lymphomata, leukemias" , add
label define RFV3DF 2140 "Fibroids and other uterine neoplasms" , add
label define RFV3DF 2145 "Other benign neoplasms" , add
label define RFV3DF 2150 "Neoplasm of uncertain nature" , add
label define RFV3DF 2200 "Diseases of the thyroid gland" , add
label define RFV3DF 2201 "Diabetic skin ulcer (wound check)" , add
label define RFV3DF 2205 "Diabetes mellitus" , add
label define RFV3DF 2210 "Gout, hyperuricemia" , add
label define RFV3DF 2215 "Other endocrine, nutritional, and met..." , add
label define RFV3DF 2250 "Anemia" , add
label define RFV3DF 2255 "Other diseases of blood and blood-for..." , add
label define RFV3DF 2300 "Organic psychoses" , add
label define RFV3DF 2305 "Functional psychoses" , add
label define RFV3DF 2310 "Neuroses" , add
label define RFV3DF 2315 "Personality and character disorders" , add
label define RFV3DF 2320 "Alcoholism" , add
label define RFV3DF 2321 "Drug dependence" , add
label define RFV3DF 2325 "Mental retardation" , add
label define RFV3DF 2330 "Other mental disease" , add
label define RFV3DF 2350 "Multiple sclerosis" , add
label define RFV3DF 2355 "Parkinson's disease (paralysis agitans)" , add
label define RFV3DF 2360 "Epilepsy" , add
label define RFV3DF 2365 "Migraine headache" , add
label define RFV3DF 2370 "Other diseases of central nervous system" , add
label define RFV3DF 2400 "Inflammatory diseases of the eye" , add
label define RFV3DF 2405 "Refractive error" , add
label define RFV3DF 2410 "Cataract" , add
label define RFV3DF 2415 "Glaucoma" , add
label define RFV3DF 2420 "Other diseases of the eye" , add
label define RFV3DF 2450 "Otitis media" , add
label define RFV3DF 2455 "Other diseases of the ear" , add
label define RFV3DF 2500 "Rheumatic fever and chronic rheumatic..." , add
label define RFV3DF 2505 "Hypertension with involvement of targ..." , add
label define RFV3DF 2510 "Hypertension" , add
label define RFV3DF 2515 "Ischemic heart disease" , add
label define RFV3DF 2520 "Other heart disease" , add
label define RFV3DF 2525 "Cerebrovascular disease" , add
label define RFV3DF 2530 "Atherosclerosis" , add
label define RFV3DF 2535 "Phlebitis, thrombophlebitis" , add
label define RFV3DF 2540 "Varicose veins" , add
label define RFV3DF 2545 "Hemorrhoids" , add
label define RFV3DF 2550 "Other disease of circulatory system" , add
label define RFV3DF 2600 "Upper respiratory infections except t..." , add
label define RFV3DF 2605 "Tonsillitis" , add
label define RFV3DF 2610 "Bronchitis" , add
label define RFV3DF 2620 "Emphysema" , add
label define RFV3DF 2625 "Asthma" , add
label define RFV3DF 2630 "Pneumonia" , add
label define RFV3DF 2631 "COVID-19" , add
label define RFV3DF 2632 "COVID-19, virus not identified" , add
label define RFV3DF 2633 "Vaping-related disorder" , add
label define RFV3DF 2635 "Hay fever" , add
label define RFV3DF 2636 "Personal history of COVID-19" , add
label define RFV3DF 2637 "Post COVID-10 condition, unspecified" , add
label define RFV3DF 2640 "Other respiratory diseases" , add
label define RFV3DF 2650 "Diseases of the esophagus, stomach, a..." , add
label define RFV3DF 2655 "Appendicitis, all types" , add
label define RFV3DF 2660 "Hernia of abdominal cavity" , add
label define RFV3DF 2665 "Diseases of the intestine and peritoneum" , add
label define RFV3DF 2670 "Diseases of the liver, gallbladder, p..." , add
label define RFV3DF 2675 "Other diseases of digestive system" , add
label define RFV3DF 2700 "Cystitis" , add
label define RFV3DF 2705 "Urinary tract disease except cystitis" , add
label define RFV3DF 2710 "Diseases of the male genital organs" , add
label define RFV3DF 2715 "Fibrocystic and other diseases of breast" , add
label define RFV3DF 2720 "Pelvic inflammatory disease (PID)" , add
label define RFV3DF 2725 "Cervicitis, vaginitis" , add
label define RFV3DF 2730 "Other diseases of female reproductive..." , add
label define RFV3DF 2735 "Diagnosed complications of pregnancy ..." , add
label define RFV3DF 2736 "Other diseases genitourinary system, NEC" , add
label define RFV3DF 2800 "Carbuncle, furuncle, boil, cellulitis..." , add
label define RFV3DF 2805 "Impetigo" , add
label define RFV3DF 2810 "Seborrheic dermatitis" , add
label define RFV3DF 2815 "Eczema and dermatitis, NOS" , add
label define RFV3DF 2820 "Psoriasis" , add
label define RFV3DF 2825 "Other diseases of the skin" , add
label define RFV3DF 2900 "Arthritis" , add
label define RFV3DF 2905 "Nonarticular rheumatism" , add
label define RFV3DF 2910 "Other musculoskeletal or connective t..." , add
label define RFV3DF 2950 "Congenital anomalies of heart and cir..." , add
label define RFV3DF 2955 "Undescended testicles" , add
label define RFV3DF 2960 "Other congenital anomalies" , add
label define RFV3DF 2980 "Prematurity" , add
label define RFV3DF 2990 "All perinatal conditions" , add
label define RFV3DF 3100 "General medical examination" , add
label define RFV3DF 3103 "Encounter for screening for COVID-19" , add
label define RFV3DF 3105 "Well baby examination" , add
label define RFV3DF 3130 "General psychiatric or psychological ..." , add
label define RFV3DF 3200 "Pregnancy, unconfirmed" , add
label define RFV3DF 3205 "Prenatal examination, routine" , add
label define RFV3DF 3215 "Postpartum examination, routine" , add
label define RFV3DF 3220 "Breast examination" , add
label define RFV3DF 3225 "Gynecological examination" , add
label define RFV3DF 3230 "Eye examination" , add
label define RFV3DF 3235 "Heart examination" , add
label define RFV3DF 3240 "Other special examination" , add
label define RFV3DF 3300 "Sensitization test" , add
label define RFV3DF 3305 "Skin immunity test" , add
label define RFV3DF 3310 "Glucose level determination" , add
label define RFV3DF 3311 "SARS-CoV-2 (Coronavirus disease [COVID-19] test" , add
label define RFV3DF 3314 "Human immunodeficiency virus (HIV) test" , add
label define RFV3DF 3315 "Other blood test" , add
label define RFV3DF 3320 "Blood pressure test" , add
label define RFV3DF 3325 "Urine test" , add
label define RFV3DF 3330 "Diagnostic endoscopies" , add
label define RFV3DF 3335 "Biopsies" , add
label define RFV3DF 3340 "Mammography, xerography, breast therm..." , add
label define RFV3DF 3345 "Diagnostic radiology" , add
label define RFV3DF 3350 "EKG, ECG, electrocardiogram, treadmil..." , add
label define RFV3DF 3355 "EEG, electroencephalogram" , add
label define RFV3DF 3360 "Hearing test" , add
label define RFV3DF 3365 "Pap smear" , add
label define RFV3DF 3370 "Other and unspecified diagnostic tests" , add
label define RFV3DF 3400 "Prophylactic inoculations" , add
label define RFV3DF 3405 "Exposure to venereal disease" , add
label define RFV3DF 3408 "Possible HIV" , add
label define RFV3DF 3409 "Exposure to human immunodeficiency vi..." , add
label define RFV3DF 3410 "Exposure to other infectious diseases" , add
label define RFV3DF 3415 "Exposure to bodily fluids of another person" , add
label define RFV3DF 3500 "Family planning, NOS" , add
label define RFV3DF 3505 "Contraceptive medication" , add
label define RFV3DF 3510 "Contraceptive device" , add
label define RFV3DF 3515 "Counseling and examinations for pregn..." , add
label define RFV3DF 3520 "Abortion to be performed (at this visit)" , add
label define RFV3DF 3525 "Sterilization to be performed (at thi..." , add
label define RFV3DF 3530 "Artificial insemination" , add
label define RFV3DF 3535 "Preconception Counseling and Education" , add
label define RFV3DF 4100 "Allergy medication" , add
label define RFV3DF 4110 "Injections" , add
label define RFV3DF 4111 "Noncompliance with medication therapy" , add
label define RFV3DF 4115 "Medication, other and unspecified kinds" , add
label define RFV3DF 4200 "Preoperative visit for spec/unspec ty..." , add
label define RFV3DF 4205 "Postoperative visit" , add
label define RFV3DF 4400 "Physical medicine and rehabilitation" , add
label define RFV3DF 4401 "Cardiopulmonary resuscitation" , add
label define RFV3DF 4405 "Respiratory therapy" , add
label define RFV3DF 4410 "Psychotherapy" , add
label define RFV3DF 4415 "Radiation therapy" , add
label define RFV3DF 4420 "Acupuncture" , add
label define RFV3DF 4425 "Chemotherapy" , add
label define RFV3DF 4500 "Tube insertion" , add
label define RFV3DF 4505 "Cauterization, all sites" , add
label define RFV3DF 4507 "IV therapy, infusion" , add
label define RFV3DF 4510 "Urinary tract instrumentation and cat..." , add
label define RFV3DF 4515 "Fitting glasses and contact lenses" , add
label define RFV3DF 4518 "Detoxification" , add
label define RFV3DF 4520 "Minor surgery" , add
label define RFV3DF 4521 "Major surgery" , add
label define RFV3DF 4525 "Kidney dialysis" , add
label define RFV3DF 4529 "Internal prosthetic device" , add
label define RFV3DF 4530 "Extern prosthet dev, art body parts (..." , add
label define RFV3DF 4535 "Corrective appliances" , add
label define RFV3DF 4540 "Cast, splint - application, removal" , add
label define RFV3DF 4545 "Dressing, bandage - application, change" , add
label define RFV3DF 4550 "Irrigation, lavage" , add
label define RFV3DF 4555 "Suture - insertion, removal" , add
label define RFV3DF 4556 "Cosmetic injection, NOS" , add
label define RFV3DF 4565 "Transplants" , add
label define RFV3DF 4560 "Other specific therapeutic procedures..." , add
label define RFV3DF 4600 "Diet and nutritional counseling" , add
label define RFV3DF 4604 "Human immunodeficiency virus (HIV) co..." , add
label define RFV3DF 4605 "Counseling, NOS" , add
label define RFV3DF 4700 "Economic problem" , add
label define RFV3DF 4702 "Problem with access to medical care" , add
label define RFV3DF 4705 "Marital problems" , add
label define RFV3DF 4710 "Parent-child problems" , add
label define RFV3DF 4715 "Other problems of family relationship" , add
label define RFV3DF 4720 "Educational problems" , add
label define RFV3DF 4725 "Occupational problems" , add
label define RFV3DF 4730 "Social adjustment problems" , add
label define RFV3DF 4735 "Legal problems" , add
label define RFV3DF 4740 "Other social problems" , add
label define RFV3DF 4800 "Progress visit, NOS" , add
label define RFV3DF 5005 "Head and face fractures and dislocations" , add
label define RFV3DF 5010 "Spinal column fractures and dislocations" , add
label define RFV3DF 5015 "Trunk area, except spinal column, fra..." , add
label define RFV3DF 5020 "Leg fractures and dislocations" , add
label define RFV3DF 5025 "Ankle fractures and dislocations" , add
label define RFV3DF 5030 "Foot and toe(s) fractures and disloca..." , add
label define RFV3DF 5035 "Arm fractures and dislocations" , add
label define RFV3DF 5040 "Wrist fractures and dislocations" , add
label define RFV3DF 5045 "Hand and finger(s) fractures and disl..." , add
label define RFV3DF 5050 "Fractures and dislocations, other and..." , add
label define RFV3DF 5105 "Cervical spine, neck strains and sprains" , add
label define RFV3DF 5110 "Back strains and sprains" , add
label define RFV3DF 5115 "Knee strains and sprains" , add
label define RFV3DF 5120 "Ankle strains and sprains" , add
label define RFV3DF 5125 "Wrist strains and sprains" , add
label define RFV3DF 5130 "Sprain or strain, other and unspecified" , add
label define RFV3DF 5205 "Head and neck area lacerations and cuts" , add
label define RFV3DF 5210 "Facial area lacerations and cuts" , add
label define RFV3DF 5215 "Trunk area lacerations and cuts" , add
label define RFV3DF 5220 "Lower extremity lacerations and cuts" , add
label define RFV3DF 5225 "Upper extremity lacerations and cuts" , add
label define RFV3DF 5230 "Laceration and cuts, site unspecified" , add
label define RFV3DF 5305 "Head, neck and facial area puncture w..." , add
label define RFV3DF 5310 "Trunk area puncture wounds" , add
label define RFV3DF 5315 "Lower extremity puncture wounds" , add
label define RFV3DF 5320 "Upper extremity puncture wounds" , add
label define RFV3DF 5325 "Puncture wound, site unspecified" , add
label define RFV3DF 5405 "Head, neck, and face contusion, abras..." , add
label define RFV3DF 5410 "Eye contusion, abrasion, bruise" , add
label define RFV3DF 5415 "Trunk area contusion, abrasion, bruise" , add
label define RFV3DF 5420 "Lower extremity contusion, abrasion, ..." , add
label define RFV3DF 5425 "Upper extremity contusion, abrasion, ..." , add
label define RFV3DF 5430 "Contusion, abrasion, bruise, site uns..." , add
label define RFV3DF 5505 "Head, neck, and face injury, type uns..." , add
label define RFV3DF 5510 "Eye injury, type unpsecified" , add
label define RFV3DF 5515 "Back injury, type unspecified" , add
label define RFV3DF 5520 "Chest and abdomen injury, type unspec..." , add
label define RFV3DF 5525 "Hip injury, type unspecified" , add
label define RFV3DF 5530 "Leg injury, type unspecified" , add
label define RFV3DF 5535 "Knee injury, type unspecified" , add
label define RFV3DF 5540 "Ankle injury, type unspecified" , add
label define RFV3DF 5545 "Foot and toe(s) injury, type unspecified" , add
label define RFV3DF 5550 "Shoulder injury, type unspecified" , add
label define RFV3DF 5555 "Arm injury, type unspecified" , add
label define RFV3DF 5560 "Elbow injury, type unspecified" , add
label define RFV3DF 5565 "Wrist injury, type unspecified" , add
label define RFV3DF 5570 "Hand and finger(s) injury, type unspe..." , add
label define RFV3DF 5575 "Injury, multiple or unspecified" , add
label define RFV3DF 5600 "Eye, foreign body" , add
label define RFV3DF 5605 "Nose, foreign body" , add
label define RFV3DF 5610 "Skin, foreign body" , add
label define RFV3DF 5615 "Digestive tract, foreign body" , add
label define RFV3DF 5616 "Respiratory tract, foreign body" , add
label define RFV3DF 5620 "Other and unspecified sites, foreign ..." , add
label define RFV3DF 5705 "Head, neck, and face burns, all degrees" , add
label define RFV3DF 5710 "Trunk area burns" , add
label define RFV3DF 5715 "Extremities burns" , add
label define RFV3DF 5720 "Burn, site unspecified" , add
label define RFV3DF 5750 "Sunburn, windburn" , add
label define RFV3DF 5755 "Insect bites" , add
label define RFV3DF 5760 "Animal, human bite" , add
label define RFV3DF 5800 "Late effects of an old injury" , add
label define RFV3DF 5805 "Motor vehicle accident, type of injur..." , add
label define RFV3DF 5810 "Accident, NOS" , add
label define RFV3DF 5815 "Violence, NOS" , add
label define RFV3DF 5818 "Intentional self-mutilation" , add
label define RFV3DF 5820 "Suicide attempt" , add
label define RFV3DF 5830 "Rape" , add
label define RFV3DF 5835 "Dead on arrival (DOA)" , add
label define RFV3DF 5836 "Respiratory arrest" , add
label define RFV3DF 5837 "Cardiac arrest" , add
label define RFV3DF 5838 "Drowning" , add
label define RFV3DF 5839 "Cardiopulmonary arrest" , add
label define RFV3DF 5840 "Unconscious on arrival" , add
label define RFV3DF 5841 "State of consciousness not specified" , add
label define RFV3DF 5842 "Altered level of consciousness" , add
label define RFV3DF 5900 "Accidental poisoning" , add
label define RFV3DF 5905 "Adverse effect of medication" , add
label define RFV3DF 5910 "Adverse effect of drug abuse" , add
label define RFV3DF 5915 "Adverse effect of alcohol" , add
label define RFV3DF 5916 "Alcohol poisoning" , add
label define RFV3DF 5920 "Adverse effects of environment" , add
label define RFV3DF 5921 "Adverse effects of secondhand smoke" , add
label define RFV3DF 5922 "Adverse effects of terrorism and bio.." , add
label define RFV3DF 5925 "Adverse effects, other and unspecified" , add
label define RFV3DF 5930 "Surgical complications due to any imp..." , add
label define RFV3DF 5935 "Systemic inflammatory response syndrome (SIRS)" , add
label define RFV3DF 6100 "For results of blood glucose tests" , add
label define RFV3DF 6105 "For results of cholesterol and trigly..." , add
label define RFV3DF 6106 "For results of test for human immunod..." , add
label define RFV3DF 6110 "For other findings of blood tests" , add
label define RFV3DF 6200 "For results of urine tests" , add
label define RFV3DF 6300 "For cytology findings" , add
label define RFV3DF 6400 "For radiological findings" , add
label define RFV3DF 6500 "For results of EKG" , add
label define RFV3DF 6600 "For results of skin tests" , add
label define RFV3DF 6700 "For other and unspecified test results" , add
label define RFV3DF 7100 "Physical examination required for sch..." , add
label define RFV3DF 7120 "Driver's license examination" , add
label define RFV3DF 7125 "Insurance examination" , add
label define RFV3DF 7130 "Disability examination" , add
label define RFV3DF 7131 "Worker's Compensation examination" , add
label define RFV3DF 7135 "Premarital examination" , add
label define RFV3DF 7137 "Direct admission to hospital" , add
label define RFV3DF 7140 "Oth reas for visit requir by party ot..." , add
label define RFV3DF 8990 "Problems, complaints, NEC" , add
label define RFV3DF 8991 "Patient unable to speak English" , add
label define RFV3DF 8993 "Patient (or spokesperson) refused care" , add
label define RFV3DF 8997 "Entry of 'none' or 'no complaint'" , add
label define RFV3DF 8998 "Inadequate data base" , add
label define RFV3DF 8999 "Illegible entry" , add
label define RFV3DF -9 "Blank" , add
label define RFVF 10050 "Chills"  
label define RFVF 10100 "Fever" , add
label define RFVF 10120 "Other symptoms of body temperature" , add
label define RFVF 10121 "Feeling cold" , add
label define RFVF 10122 "Feeling hot" , add
label define RFVF 10123 "Feeling hot and cold" , add
label define RFVF 10150 "Tiredness, exhaustion" , add
label define RFVF 10200 "General weakness" , add
label define RFVF 10250 "General ill feeling" , add
label define RFVF 10300 "Fainting (syncope)" , add
label define RFVF 10350 "Symptoms of fluid abnormalities" , add
label define RFVF 10351 "Edema" , add
label define RFVF 10352 "Excessive sweating, perspiration" , add
label define RFVF 10353 "Excessive thirst" , add
label define RFVF 10400 "Weight gain" , add
label define RFVF 10450 "Weight loss" , add
label define RFVF 10451 "Recent weight loss" , add
label define RFVF 10452 "Underweight" , add
label define RFVF 10460 "Symptoms of face, not elsewhere class..." , add
label define RFVF 10500 "Chest pain and related symptoms" , add
label define RFVF 10501 "Chest pain" , add
label define RFVF 10502 "Chest discomfort, pressure, tightness" , add
label define RFVF 10503 "Burning sensation in the chest" , add
label define RFVF 10550 "Pain, specified site not referable to..." , add
label define RFVF 10551 "Rib pain" , add
label define RFVF 10552 "Side pain, flank pain" , add
label define RFVF 10553 "Groin pain" , add
label define RFVF 10554 "Facial pain" , add
label define RFVF 10600 "Pain and related symptoms, generalize..." , add
label define RFVF 10601 "Pain, unspecified" , add
label define RFVF 10602 "Cramps, spasms, site unspecified" , add
label define RFVF 10603 "Stiffness, site unspecified" , add
label define RFVF 10650 "Tumor or mass, site unspecified" , add
label define RFVF 10651 "Internal mass, NOS" , add
label define RFVF 10660 "Lesion, Internal, NOS (excludes brain and skin)" , add
label define RFVF 10700 "Bleeding, multiple or unspecified sites" , add
label define RFVF 10750 "Symptoms of growth and developmental ..." , add
label define RFVF 10751 "Lack of growth" , add
label define RFVF 10752 "Excessive growth" , add
label define RFVF 10800 "General symptoms of infants, NEC" , add
label define RFVF 10801 "Infant crying too much, fussy, fidget..." , add
label define RFVF 10802 "Infant regurgitation, spitting up" , add
label define RFVF 10803 "Infant feeding problem" , add
label define RFVF 10850 "General or unspecified nonviral infec..." , add
label define RFVF 10900 "Allergy, NOS" , add
label define RFVF 10950 "Disorders of motor functions" , add
label define RFVF 10960 "Dyslexia, NOS" , add
label define RFVF 11000 "Anxiety and nervousness" , add
label define RFVF 11050 "Fears and phobias" , add
label define RFVF 11100 "Depression" , add
label define RFVF 11150 "Anger" , add
label define RFVF 11200 "Problems with identity and self-esteem" , add
label define RFVF 11230 "Transgender" , add
label define RFVF 11250 "Restlessness" , add
label define RFVF 11300 "Behavioral disturbances" , add
label define RFVF 11301 "Antisocial behavior" , add
label define RFVF 11302 "Hostile behavior" , add
label define RFVF 11303 "Hysterical behavior" , add
label define RFVF 11304 "Temper problems" , add
label define RFVF 11305 "Obsessions and compulsions" , add
label define RFVF 11350 "Disturbances of sleep" , add
label define RFVF 11351 "Insomnia" , add
label define RFVF 11352 "Sleepiness (hypersomnia)" , add
label define RFVF 11353 "Nightmares" , add
label define RFVF 11354 "Sleepwalking" , add
label define RFVF 11355 "Sleep apnea" , add
label define RFVF 11400 "Smoking problems" , add
label define RFVF 11450 "Alcohol-related problems" , add
label define RFVF 11500 "Abnormal drug usage" , add
label define RFVF 11501 "Substance abuse, NOS" , add
label define RFVF 11550 "Delusions or hallucinations" , add
label define RFVF 11600 "Psychosexual disorders" , add
label define RFVF 11601 "Frigidity, loss of sex drive, lack of..." , add
label define RFVF 11602 "Homosexuality, concerns with" , add
label define RFVF 11603 "Impotence" , add
label define RFVF 11604 "Premature ejaculation" , add
label define RFVF 11605 "Masturbation excessive, concerns about" , add
label define RFVF 11606 "Orgasm, problem with" , add
label define RFVF 11607 "Preoccupation with sex" , add
label define RFVF 11650 "Oth symptoms/problems relat to psycho..." , add
label define RFVF 11651 "Nailbiting" , add
label define RFVF 11652 "Thumbsucking" , add
label define RFVF 12000 "Abnormal involuntary movements" , add
label define RFVF 12050 "Convulsions" , add
label define RFVF 12070 "Symptoms of head, NEC" , add
label define RFVF 12100 "Headache, pain in head" , add
label define RFVF 12101 "Tension headache" , add
label define RFVF 12150 "Memory, disturbances of" , add
label define RFVF 12200 "Disturbances of sensation" , add
label define RFVF 12201 "Loss of feeling (anesthesia)" , add
label define RFVF 12202 "Increased sensation (hyperesthesia)" , add
label define RFVF 12203 "Abnormal sensation (paresthesia)" , add
label define RFVF 12204 "Other disturbances of sense, includin..." , add
label define RFVF 12250 "Vertigo - dizziness" , add
label define RFVF 12300 "Weakness (neurologic)" , add
label define RFVF 12350 "Disorders of speech, speech disturbance" , add
label define RFVF 12351 "Stuttering, stammering" , add
label define RFVF 12352 "Slurring" , add
label define RFVF 12400 "Other symptoms referable to the nervo..." , add
label define RFVF 12600 "Abnormal pulsations and palpitations" , add
label define RFVF 12601 "Increased heartbeat" , add
label define RFVF 12602 "Decreased heartbeat" , add
label define RFVF 12603 "Irregular heartbeat" , add
label define RFVF 12650 "Heart pain" , add
label define RFVF 12700 "Other symptoms of the heart" , add
label define RFVF 12750 "Symptoms of lymph glands (or nodes)" , add
label define RFVF 12751 "Swollen or enlarged glands" , add
label define RFVF 12752 "Sore glands" , add
label define RFVF 12800 "Other symptoms ref to the cardiovas/l..." , add
label define RFVF 12801 "Poor circulation" , add
label define RFVF 12802 "Pallor, paleness" , add
label define RFVF 12803 "Flushed, blushing" , add
label define RFVF 13050 "Vision dysfunctions" , add
label define RFVF 13051 "Blindness and half vision" , add
label define RFVF 13052 "Diminished vision" , add
label define RFVF 13053 "Extraneous vision" , add
label define RFVF 13054 "Double vision (diplopia)" , add
label define RFVF 13100 "Discharge from eye" , add
label define RFVF 13101 "Discharge from eye--bleeding" , add
label define RFVF 13102 "Discharge from eye--tearing, watering..." , add
label define RFVF 13103 "Discharge from eye--pus, matter, whit..." , add
label define RFVF 13150 "Eye infection and inflammation" , add
label define RFVF 13151 "Pinkeye" , add
label define RFVF 13200 "Abnormal sensations of the eye" , add
label define RFVF 13201 "Eye pain" , add
label define RFVF 13202 "Eye itching" , add
label define RFVF 13203 "Eye burning" , add
label define RFVF 13204 "Eye strain" , add
label define RFVF 13250 "Abnormal eye movements" , add
label define RFVF 13251 "Abnormal retraction of eye" , add
label define RFVF 13252 "Cross-eyed" , add
label define RFVF 13253 "Pupils unequal" , add
label define RFVF 13254 "Deviation of eyes" , add
label define RFVF 13300 "Abnormal appearance of eyes" , add
label define RFVF 13301 "Abnormal color of eyes" , add
label define RFVF 13302 "Protrusion (exophthalmos) of eyes" , add
label define RFVF 13303 "Cloudy, dull, hazy appearance of eyes" , add
label define RFVF 13350 "Other and unspecified symptoms refera..." , add
label define RFVF 13351 "Contact lens problems" , add
label define RFVF 13352 "Allergy problems referable to eye" , add
label define RFVF 13353 "Swelling of eyes" , add
label define RFVF 13400 "Symptoms of eyelids" , add
label define RFVF 13401 "Infection, inflammation, swelling of ..." , add
label define RFVF 13402 "Itching of eyelids" , add
label define RFVF 13403 "Mass or growth of eyelids" , add
label define RFVF 13404 "Abnormal movement of eyelids" , add
label define RFVF 13450 "Hearing dysfunctions" , add
label define RFVF 13451 "Diminished hearing" , add
label define RFVF 13452 "Heightened or acute hearing" , add
label define RFVF 13453 "Extraneous hearing" , add
label define RFVF 13500 "Discharge from ear" , add
label define RFVF 13501 "Bleeding of ear" , add
label define RFVF 13502 "Pus (purulent drainage) from ear" , add
label define RFVF 13503 "Swimmer's ear" , add
label define RFVF 13550 "Earache, or ear infection" , add
label define RFVF 13551 "Earache, pain" , add
label define RFVF 13552 "Ear infection" , add
label define RFVF 13600 "Plugged feeling in ear" , add
label define RFVF 13650 "Other and unspecified symptoms refera..." , add
label define RFVF 13651 "Itching of ears" , add
label define RFVF 13652 "Growths or mass of ears" , add
label define RFVF 13653 "Pulling at ears, picking at ears" , add
label define RFVF 13654 "Abnormal size or shape of ears, ears..." , add
label define RFVF 14000 "Nasal congestion" , add
label define RFVF 14050 "Other symptoms of nose" , add
label define RFVF 14051 "Nosebleed (epistaxis)" , add
label define RFVF 14052 "Sore in nose" , add
label define RFVF 14053 "Inflammation and swelling of nose" , add
label define RFVF 14054 "Problem with appearance of nose" , add
label define RFVF 14100 "Sinus problems" , add
label define RFVF 14101 "Sinus pain and pressure" , add
label define RFVF 14102 "Sinus inflammation, infection" , add
label define RFVF 14103 "Sinus congestion" , add
label define RFVF 14150 "Shortness of breath" , add
label define RFVF 14200 "Labored or difficult breathing (dyspnea)" , add
label define RFVF 14250 "Wheezing" , add
label define RFVF 14300 "Breathing problems, NEC" , add
label define RFVF 14301 "Disorders of respiratory sound, NEC" , add
label define RFVF 14302 "Rapid breathing (hyperventilation)" , add
label define RFVF 14350 "Sneezing" , add
label define RFVF 14400 "Cough" , add
label define RFVF 14450 "Head cold, upper respiratory infectio..." , add
label define RFVF 14500 "General viral infection" , add
label define RFVF 14501 "Flu" , add
label define RFVF 14550 "Symptoms referable to throat" , add
label define RFVF 14551 "Throat soreness" , add
label define RFVF 14552 "Throat pain" , add
label define RFVF 14553 "Throat infection" , add
label define RFVF 14554 "Throat irritation, scratch, tickle" , add
label define RFVF 14555 "Throat swelling" , add
label define RFVF 14556 "Throat lump or mass" , add
label define RFVF 14600 "Symptoms referable to tonsils" , add
label define RFVF 14700 "Abnormalities of sputum or phlegm" , add
label define RFVF 14701 "Coughing up blood" , add
label define RFVF 14702 "Pus in sputum" , add
label define RFVF 14703 "Excessive sputum" , add
label define RFVF 14750 "Congestion in chest" , add
label define RFVF 14800 "Disorders of voice" , add
label define RFVF 14801 "Hoarseness, loss of voice" , add
label define RFVF 14802 "Hypernasality" , add
label define RFVF 14850 "Other symptoms referable to the respi..." , add
label define RFVF 14851 "Lung pain" , add
label define RFVF 14852 "Lung infection" , add
label define RFVF 15000 "Symptoms of teeth and gums" , add
label define RFVF 15001 "Toothache" , add
label define RFVF 15002 "Gum pain" , add
label define RFVF 15003 "Bleeding gums" , add
label define RFVF 15010 "Symptoms of the jaw, NOS" , add
label define RFVF 15011 "Symptoms of the jaw, swelling" , add
label define RFVF 15012 "Symptoms of the jaw, lump or mass" , add
label define RFVF 15050 "Symptoms referable to lips" , add
label define RFVF 15051 "Cracked, bleeding, dry lips" , add
label define RFVF 15052 "Abnormal color of lips" , add
label define RFVF 15053 "Cold sore" , add
label define RFVF 15100 "Symptoms referable to mouth" , add
label define RFVF 15101 "Mouth pain, burning, soreness" , add
label define RFVF 15102 "Mouth bleeding" , add
label define RFVF 15103 "Mouth dryness" , add
label define RFVF 15104 "Mouth ulcer, sore" , add
label define RFVF 15150 "Symptoms referable to tongue" , add
label define RFVF 15151 "Tongue pain" , add
label define RFVF 15152 "Tongue bleeding" , add
label define RFVF 15153 "Tongue inflammation, infection, swelling" , add
label define RFVF 15154 "Abnormal color, ridges, coated tongue" , add
label define RFVF 15200 "Difficulty in swallowing (dysphagia)" , add
label define RFVF 15250 "Nausea" , add
label define RFVF 15300 "Vomiting" , add
label define RFVF 15350 "Heartburn and indigestion (dyspepsia)" , add
label define RFVF 15400 "Gastrointestinal infection" , add
label define RFVF 15450 "Stomach and abdominal pain, cramps an..." , add
label define RFVF 15451 "Abdominal pain, cramps, spasms, NOS" , add
label define RFVF 15452 "Lower abdominal pain, cramps, spasms," , add
label define RFVF 15453 "Upper abdominal pain, cramps, spasms" , add
label define RFVF 15650 "Change in abdominal size" , add
label define RFVF 15651 "Abdominal distention, fullness, NOS" , add
label define RFVF 15652 "Abdominal mass or tumor" , add
label define RFVF 15653 "Abdominal swelling, NOS" , add
label define RFVF 15700 "Appetite, abnormal" , add
label define RFVF 15701 "Excessive appetite" , add
label define RFVF 15702 "Decreased appetite" , add
label define RFVF 15750 "Difficulty eating" , add
label define RFVF 15800 "Gastrointestinal bleeding" , add
label define RFVF 15801 "Blood in stool (melena)" , add
label define RFVF 15802 "Vomiting blood (hematemesis)" , add
label define RFVF 15850 "Flatulence" , add
label define RFVF 15900 "Constipation" , add
label define RFVF 15950 "Diarrhea" , add
label define RFVF 16000 "Other symptoms or changes in bowel fu..." , add
label define RFVF 16001 "Discharge in stools" , add
label define RFVF 16002 "Worms" , add
label define RFVF 16003 "Changes in size, color, shape, or odo..." , add
label define RFVF 16004 "Incontinence of stool" , add
label define RFVF 16050 "Symptoms referable to anus-rectum" , add
label define RFVF 16051 "Anal-rectal pain" , add
label define RFVF 16052 "Anal-rectal bleeding" , add
label define RFVF 16053 "Anal-rectal swelling or mass" , add
label define RFVF 16054 "Anal-rectal itching" , add
label define RFVF 16100 "Symptoms of liver, gallbladder, and b..." , add
label define RFVF 16101 "Pain of liver, gallbladder, and bilia..." , add
label define RFVF 16102 "Jaundice" , add
label define RFVF 16150 "Other and unspecified symptoms refera..." , add
label define RFVF 16400 "Abnormalities of urine" , add
label define RFVF 16401 "Blood in urine (hematuria)" , add
label define RFVF 16402 "Pus in urine" , add
label define RFVF 16403 "Unusual color or odor of urine" , add
label define RFVF 16450 "Frequency and urgency of urination" , add
label define RFVF 16451 "Excessive urination, night (nocturia)" , add
label define RFVF 16500 "Painful urination" , add
label define RFVF 16550 "Incontinence of urine (enuresis)" , add
label define RFVF 16551 "Involuntary urination, can't hold uri..." , add
label define RFVF 16552 "Bedwetting" , add
label define RFVF 16600 "Other urinary dysfunctions" , add
label define RFVF 16601 "Retention of urine" , add
label define RFVF 16602 "Urinary hesitancy" , add
label define RFVF 16603 "Large volume of urine" , add
label define RFVF 16604 "Small volume of urine" , add
label define RFVF 16650 "Symptoms of bladder" , add
label define RFVF 16651 "Bladder pain" , add
label define RFVF 16652 "Bladder infection" , add
label define RFVF 16653 "Bladder mass" , add
label define RFVF 16700 "Symptoms of the kidneys" , add
label define RFVF 16701 "Kidney pain" , add
label define RFVF 16702 "Kidney infection" , add
label define RFVF 16703 "Symptoms of the kidneys -- mass" , add
label define RFVF 16750 "Urinary tract infection, NOS" , add
label define RFVF 16800 "Other symptoms referable to urinary t..." , add
label define RFVF 17000 "Symptoms of penis" , add
label define RFVF 17001 "Pain, aching, soreness, tenderness, p..." , add
label define RFVF 17002 "Infection, inflammation, swelling of ..." , add
label define RFVF 17003 "Lumps, bumps, growths, warts of penis" , add
label define RFVF 17050 "Penile discharge" , add
label define RFVF 17100 "Symptoms of prostate" , add
label define RFVF 17101 "Swelling of prostate" , add
label define RFVF 17102 "Infection of prostate" , add
label define RFVF 17150 "Symptoms of the scrotum and testes" , add
label define RFVF 17151 "Pain, aching, tenderness of the scrot..." , add
label define RFVF 17152 "Swelling, inflammation of the scrotum..." , add
label define RFVF 17153 "Growths, warts, lumps, bumps of the s..." , add
label define RFVF 17154 "Itching, jock itch of the scrotum and..." , add
label define RFVF 17200 "Other symptoms of male reproductive s..." , add
label define RFVF 17300 "Absence of menstruation (amenorrhea)" , add
label define RFVF 17350 "Irregularity of menstrual interval" , add
label define RFVF 17351 "Frequent menstrual interval" , add
label define RFVF 17352 "Infrequent menstrual interval" , add
label define RFVF 17353 "Unpredictable menstrual interval" , add
label define RFVF 17400 "Irregularity of menstrual flow" , add
label define RFVF 17401 "Excessively heavy (menorrhagia) menst..." , add
label define RFVF 17402 "Scanty flow (oligomenorrhea) menstrua..." , add
label define RFVF 17403 "Abnormal material in menstrual flow, ..." , add
label define RFVF 17450 "Menstrual symptoms, other and unspeci..." , add
label define RFVF 17451 "Premenstrual symptoms" , add
label define RFVF 17452 "Painful menstruation (dysmenorrhea)" , add
label define RFVF 17500 "Menopausal symptoms" , add
label define RFVF 17501 "Early or late onset of menopause" , add
label define RFVF 17502 "Vasomotor symptoms-hot flashes" , add
label define RFVF 17503 "Emotional symptoms, change of life pr..." , add
label define RFVF 17550 "Uterine and vaginal bleeding" , add
label define RFVF 17551 "Intermenstrual bleeding (metrorrhagia)" , add
label define RFVF 17552 "Postmenopausal bleeding" , add
label define RFVF 17553 "Postcoital bleeding, female" , add
label define RFVF 17600 "Vaginal discharge" , add
label define RFVF 17650 "Other vaginal symptoms" , add
label define RFVF 17651 "Vaginal pain" , add
label define RFVF 17652 "Vaginal infection" , add
label define RFVF 17653 "Vaginal itching, burning" , add
label define RFVF 17654 "Vaginal dryness" , add
label define RFVF 17700 "Vulvar disorders" , add
label define RFVF 17701 "Vulvar itching and irritation, swelling" , add
label define RFVF 17702 "Vulvar mass, lump" , add
label define RFVF 17703 "Vulvar growth, wart, cyst, ulcer, sore" , add
label define RFVF 17750 "Pelvic symptoms" , add
label define RFVF 17751 "Pelvic pain" , add
label define RFVF 17752 "Pelvic pressure or dropping sensation" , add
label define RFVF 17753 "Pelvic infection, inflammation" , add
label define RFVF 17900 "Problems of pregnancy" , add
label define RFVF 17901 "Pain during pregnancy" , add
label define RFVF 17902 "Spotting, bleeding during pregnancy" , add
label define RFVF 17903 "Symptoms of onset of labor" , add
label define RFVF 17910 "Postpartum problems" , add
label define RFVF 17950 "Other symptoms referable to the femal..." , add
label define RFVF 18000 "Pain or soreness of breast" , add
label define RFVF 18050 "Lump or mass of breast" , add
label define RFVF 18100 "Other symptoms referable to breast" , add
label define RFVF 18101 "Bleeding or discharge from nipple of ..." , add
label define RFVF 18102 "Postpartum problems of breast" , add
label define RFVF 18103 "Problems with shape or size of breast" , add
label define RFVF 18150 "Symptoms of infertility" , add
label define RFVF 18200 "Hormone deficiency or problem" , add
label define RFVF 18250 "Symptoms of sexual dysfunction" , add
label define RFVF 18300 "Acne or pimples" , add
label define RFVF 18350 "Discoloration or abnormal pigmentation" , add
label define RFVF 18400 "Infections of skin, NOS" , add
label define RFVF 18401 "Infection of skin of head or neck area" , add
label define RFVF 18402 "Infection of skin of arm, hand, or fi..." , add
label define RFVF 18403 "Infection of skin of leg, foot, or toe" , add
label define RFVF 18450 "Symptoms of skin moles" , add
label define RFVF 18451 "Change in size or color of skin moles" , add
label define RFVF 18452 "Bleeding mole" , add
label define RFVF 18500 "Warts, NOS" , add
label define RFVF 18550 "Other growths of skin" , add
label define RFVF 18600 "Skin rash" , add
label define RFVF 18601 "Diaper rash" , add
label define RFVF 18650 "Skin lesion" , add
label define RFVF 18700 "Skin irritations, NEC" , add
label define RFVF 18701 "Skin pain" , add
label define RFVF 18702 "Skin itching" , add
label define RFVF 18750 "Swelling of skin" , add
label define RFVF 18800 "Other symptoms referable to skin" , add
label define RFVF 18801 "Oiliness of skin" , add
label define RFVF 18802 "Dryness, peeling, scaliness, roughnes..." , add
label define RFVF 18803 "Wrinkles of skin" , add
label define RFVF 18850 "Symptoms referable to nails" , add
label define RFVF 18851 "Infected nails" , add
label define RFVF 18852 "Ingrown nails" , add
label define RFVF 18853 "Brittle, breaking, splitting, cracked..." , add
label define RFVF 18900 "Symptoms referable to hair and scalp" , add
label define RFVF 18901 "Too little hair" , add
label define RFVF 18902 "Unwanted hair" , add
label define RFVF 18903 "Dryness, flaky scalp" , add
label define RFVF 18904 "Itching of scalp" , add
label define RFVF 18950 "Navel problems" , add
label define RFVF 19000 "Neck symptoms" , add
label define RFVF 19001 "Neck pain, ache, soreness, discomfort" , add
label define RFVF 19002 "Neck cramps, contractures, spasms" , add
label define RFVF 19003 "Limitation of movement, stiffness of ..." , add
label define RFVF 19004 "Weakness of neck" , add
label define RFVF 19005 "Swelling of neck" , add
label define RFVF 19006 "Lump, mass, tumor of neck" , add
label define RFVF 19050 "Back symptoms" , add
label define RFVF 19051 "Back pain, ache, soreness, discomfort" , add
label define RFVF 19052 "Back cramps, contractures, spasms" , add
label define RFVF 19053 "Limitation of movement, stiffness of ..." , add
label define RFVF 19054 "Weakness of back" , add
label define RFVF 19055 "Swelling of back" , add
label define RFVF 19056 "Lump, mass, tumor of back" , add
label define RFVF 19100 "Low back symptoms" , add
label define RFVF 19101 "Low back pain, ache, soreness, discom..." , add
label define RFVF 19102 "Low back cramps, contractures, spasms" , add
label define RFVF 19103 "Limitation of movement, stiffness of ..." , add
label define RFVF 19104 "Weakness of lower back" , add
label define RFVF 19105 "Swelling of lower back" , add
label define RFVF 19106 "Lump, mass, tumor of lower back" , add
label define RFVF 19150 "Hip symptoms" , add
label define RFVF 19151 "Hip pain, ache, soreness, discomfort" , add
label define RFVF 19152 "Hip cramps, contractures, spasms" , add
label define RFVF 19153 "Limitation of movement, stiffness of hip" , add
label define RFVF 19154 "Weakness of hip" , add
label define RFVF 19155 "Swelling of hip" , add
label define RFVF 19156 "Lump, mass, tumor of hip" , add
label define RFVF 19200 "Leg symptoms" , add
label define RFVF 19201 "Leg pain, ache, soreness, discomfort" , add
label define RFVF 19202 "Leg cramps, contractures, spasms" , add
label define RFVF 19203 "Limitation of movement, stiffness of leg" , add
label define RFVF 19204 "Weakness of leg" , add
label define RFVF 19205 "Swelling of leg" , add
label define RFVF 19206 "Lump, mass, tumor of leg" , add
label define RFVF 19250 "Knee symptoms" , add
label define RFVF 19251 "Knee pain, ache, soreness, discomfort" , add
label define RFVF 19252 "Knee cramps, contractures, spasms" , add
label define RFVF 19253 "Limitation of movement, stiffness of ..." , add
label define RFVF 19254 "Weakness of knee" , add
label define RFVF 19255 "Swelling of knee" , add
label define RFVF 19256 "Lump, mass, tumor of knee" , add
label define RFVF 19300 "Ankle symptoms" , add
label define RFVF 19301 "Ankle pain, ache, soreness, discomfort" , add
label define RFVF 19302 "Ankle cramps, contractures, spasms" , add
label define RFVF 19303 "Limitation of movement, stiffness of ..." , add
label define RFVF 19304 "Weakness of ankle" , add
label define RFVF 19305 "Swelling of ankle" , add
label define RFVF 19306 "Lump, mass, tumor of ankle" , add
label define RFVF 19350 "Foot and toe symptoms" , add
label define RFVF 19351 "Foot and toe pain, ache, soreness, di..." , add
label define RFVF 19352 "Foot and toe cramps, contractures, sp..." , add
label define RFVF 19353 "Limitation of movement, stiffness of ..." , add
label define RFVF 19354 "Weakness of foot and toe" , add
label define RFVF 19355 "Swelling of foot and toe" , add
label define RFVF 19356 "Lump, mass, tumor of foot and toe" , add
label define RFVF 19400 "Shoulder symptoms" , add
label define RFVF 19401 "Shoulder pain, ache, soreness, discom..." , add
label define RFVF 19402 "Shoulder cramps, contractures, spasms" , add
label define RFVF 19403 "Limitation of movement, stiffness of ..." , add
label define RFVF 19404 "Weakness of shoulder" , add
label define RFVF 19405 "Swelling of shoulder" , add
label define RFVF 19406 "Lump, mass, tumor of shoulder" , add
label define RFVF 19450 "Arm symptoms" , add
label define RFVF 19451 "Arm pain, ache, soreness, discomfort" , add
label define RFVF 19452 "Arm cramps, contractures, spasms" , add
label define RFVF 19453 "Limitation of movement, stiffness of arm" , add
label define RFVF 19454 "Weakness of arm" , add
label define RFVF 19455 "Swelling of arm" , add
label define RFVF 19456 "Lump, mass, tumor of arm" , add
label define RFVF 19500 "Elbow symptoms" , add
label define RFVF 19501 "Elbow pain, ache, soreness, discomfort" , add
label define RFVF 19502 "Elbow cramps, contractures, spasms" , add
label define RFVF 19503 "Limitation of movement, stiffness of ..." , add
label define RFVF 19504 "Weakness of elbow" , add
label define RFVF 19505 "Swelling of elbow" , add
label define RFVF 19506 "Lump, mass, tumor of elbow" , add
label define RFVF 19550 "Wrist symptoms" , add
label define RFVF 19551 "Wrist pain, ache, soreness, discomfort" , add
label define RFVF 19552 "Wrist cramps, contractures, spasms" , add
label define RFVF 19553 "Limitation of movement, stiffness of ..." , add
label define RFVF 19554 "Weakness of wrist" , add
label define RFVF 19555 "Swelling of wrist" , add
label define RFVF 19556 "Lump, mass, tumor of wrist" , add
label define RFVF 19600 "Hand and finger symptoms" , add
label define RFVF 19601 "Hand and finger pain, ache, soreness,..." , add
label define RFVF 19602 "Hand and finger cramps, contractures,..." , add
label define RFVF 19603 "Limitation of movement, stiffness of ..." , add
label define RFVF 19604 "Weakness of hand and finger" , add
label define RFVF 19605 "Swelling of hand and finger" , add
label define RFVF 19606 "Lump, mass, tumor of hand and finger" , add
label define RFVF 19650 "Symptoms of unspecified muscles" , add
label define RFVF 19651 "Unspecified muscle pain, ache, sorene..." , add
label define RFVF 19652 "Unspecified muscle cramps, contractur..." , add
label define RFVF 19653 "Limitation of movement, stiffness of ..." , add
label define RFVF 19654 "Weakness of unspecified muscles" , add
label define RFVF 19655 "Swelling of unspecified muscles" , add
label define RFVF 19656 "Lump, mass, tumor of unspecified muscles" , add
label define RFVF 19700 "Symptoms of unspecified joints" , add
label define RFVF 19701 "Unspecified joint pain, ache, sorenes..." , add
label define RFVF 19702 "Unspecified joint cramps, contracture..." , add
label define RFVF 19703 "Limitation of movement, stiffness of ..." , add
label define RFVF 19704 "Weakness of unspecified joints" , add
label define RFVF 19705 "Swelling of unspecified joints" , add
label define RFVF 19706 "Lump, mass, tumor of unspecified joints" , add
label define RFVF 19750 "Musculoskeletal deformities" , add
label define RFVF 19751 "Bowlegged, knock-kneed" , add
label define RFVF 19752 "Posture problems" , add
label define RFVF 19753 "Pigeon-toed, feet turn in" , add
label define RFVF 19800 "Other musculoskeletal symptoms" , add
label define RFVF 20050 "Intestinal infectious diseases" , add
label define RFVF 20100 "Streptococcal infection" , add
label define RFVF 20150 "Viral diseases" , add
label define RFVF 20151 "HIV with or without associated conditions" , add
label define RFVF 20160 "Coronavirus infection, unspecified" , add
label define RFVF 20170 "SARS-assoc coronavirus cause of dis class..." , add
label define RFVF 20171 "Other coronavirus cause of dis class..." , add
label define RFVF 20200 "Venereal diseases" , add
label define RFVF 20250 "Fungus infections (mycoses)" , add
label define RFVF 20300 "Parasitic diseases" , add
label define RFVF 20310 "Sepsis, septicemia" , add
label define RFVF 20350 "Other and unspecified infectious and ..." , add
label define RFVF 21000 "Cancer, gastrointestinal tract" , add
label define RFVF 21050 "Cancer, respiratory tract" , add
label define RFVF 21100 "Cancer, skin and subcutaneous tissues" , add
label define RFVF 21150 "Cancer, breast" , add
label define RFVF 21200 "Cancer, female genital tract" , add
label define RFVF 21250 "Cancer, male genital tract" , add
label define RFVF 21260 "Cancer of urinary tract" , add
label define RFVF 21300 "Other malignant neoplasms" , add
label define RFVF 21350 "Hodgkin's disease, lymphomata, leukemias" , add
label define RFVF 21400 "Fibroids and other uterine neoplasms" , add
label define RFVF 21450 "Other benign neoplasms" , add
label define RFVF 21500 "Neoplasm of uncertain nature" , add
label define RFVF 22000 "Diseases of the thyroid gland" , add
label define RFVF 22050 "Diabetes mellitus" , add
label define RFVF 22010 "Diabetic skin ulcer (wound check)" , add
label define RFVF 22100 "Gout, hyperuricemia" , add
label define RFVF 22150 "Other endocrine, nutritional, and met..." , add
label define RFVF 22500 "Anemia" , add
label define RFVF 22550 "Other diseases of blood and blood-for..." , add
label define RFVF 23000 "Organic psychoses" , add
label define RFVF 23050 "Functional psychoses" , add
label define RFVF 23100 "Neuroses" , add
label define RFVF 23150 "Personality and character disorders" , add
label define RFVF 23200 "Alcoholism" , add
label define RFVF 23210 "Drug dependence" , add
label define RFVF 23250 "Mental retardation" , add
label define RFVF 23300 "Other and unspecified mental disorders" , add
label define RFVF 23301 "Attention deficit disorder (ADD)" , add
label define RFVF 23500 "Multiple sclerosis" , add
label define RFVF 23550 "Parkinson's disease (paralysis agitans)" , add
label define RFVF 23600 "Epilepsy" , add
label define RFVF 23650 "Migraine headache" , add
label define RFVF 23700 "Other and unspecified diseases of the..." , add
label define RFVF 24000 "Inflammatory diseases of the eye" , add
label define RFVF 24050 "Refractive error" , add
label define RFVF 24100 "Cataract" , add
label define RFVF 24150 "Glaucoma" , add
label define RFVF 24200 "Other diseases of the eye" , add
label define RFVF 24500 "Otitis media" , add
label define RFVF 24550 "Other diseases of the ear" , add
label define RFVF 25000 "Rheumatic fever and chronic rheumatic..." , add
label define RFVF 25050 "Hypertension with involvement of targ..." , add
label define RFVF 25100 "Hypertension" , add
label define RFVF 25150 "Ischemic heart disease" , add
label define RFVF 25200 "Other heart disease" , add
label define RFVF 25250 "Cerebrovascular disease" , add
label define RFVF 25300 "Atherosclerosis" , add
label define RFVF 25350 "Phlebitis, thrombophlebitis" , add
label define RFVF 25400 "Varicose veins" , add
label define RFVF 25450 "Hemorrhoids" , add
label define RFVF 25500 "Other disease of circulatory system" , add
label define RFVF 26000 "Upper respiratory infections except t..." , add
label define RFVF 26050 "Tonsillitis" , add
label define RFVF 26100 "Bronchitis" , add
label define RFVF 26200 "Emphysema" , add
label define RFVF 26250 "Asthma" , add
label define RFVF 26300 "Pneumonia" , add
label define RFVF 26301 "Pneumonia due to SARS-associated coronavirus" , add
label define RFVF 26310 "COVID-19" , add
label define RFVF 26320 "COVID-19, virus not identified" , add
label define RFVF 26330 "Vaping-related disorder" , add
label define RFVF 26350 "Hay fever" , add
label define RFVF 26360 "Personal history of COVID-19" , add
label define RFVF 26370 "Post COVID-10 condition, unspecified" , add
label define RFVF 26400 "Other respiratory diseases" , add
label define RFVF 26500 "Diseases of the esophagus, stomach, a..." , add
label define RFVF 26550 "Appendicitis, all types" , add
label define RFVF 26600 "Hernia of abdominal cavity" , add
label define RFVF 26650 "Diseases of the intestine and peritoneum" , add
label define RFVF 26700 "Diseases of the liver, gallbladder, a..." , add
label define RFVF 26751 "Dental abscess" , add
label define RFVF 26752 "Dental cavities" , add
label define RFVF 26750 "Other diseases of digestive system" , add
label define RFVF 26753 "Canker sore" , add
label define RFVF 26755 "Temperomandibular joint (TMJ) pain" , add
label define RFVF 27000 "Cystitis" , add
label define RFVF 27050 "Urinary tract disease except cystitis" , add
label define RFVF 27100 "Diseases of the male genital organs" , add
label define RFVF 27150 "Fibrocystic and other diseases of breast" , add
label define RFVF 27200 "Pelvic inflammatory disease (PID)" , add
label define RFVF 27250 "Cervicitis, vaginitis" , add
label define RFVF 27300 "Other diseases of female reproductive..." , add
label define RFVF 27350 "Diagnosed complications of pregnancy ..." , add
label define RFVF 27360 "Other diseases genitourinary system, NEC" , add
label define RFVF 28000 "Carbuncle, furuncle, boil, cellulitis..." , add
label define RFVF 28050 "Impetigo" , add
label define RFVF 28100 "Seborrheic dermatitis" , add
label define RFVF 28150 "Eczema and dermatitis, NOS" , add
label define RFVF 28200 "Psoriasis" , add
label define RFVF 28250 "Other diseases of the skin" , add
label define RFVF 29000 "Arthritis" , add
label define RFVF 29050 "Nonarticular rheumatism" , add
label define RFVF 29100 "Other musculoskeletal or connective t..." , add
label define RFVF 29500 "Congenital anomalies of heart and cir..." , add
label define RFVF 29550 "Undescended testicles" , add
label define RFVF 29600 "Other and unspecified congenital anom..." , add
label define RFVF 29800 "Prematurity" , add
label define RFVF 29900 "All other perinatal conditions" , add
label define RFVF 31000 "General medical examination" , add
label define RFVF 31030 "Encounter for screening for COVID-19" , add
label define RFVF 31050 "Well baby examination" , add
label define RFVF 31300 "General psychiatric or psychological ..." , add
label define RFVF 32000 "Pregnancy, unconfirmed" , add
label define RFVF 32050 "Prenatal examination, routine" , add
label define RFVF 32150 "Postpartum examination, routine" , add
label define RFVF 32200 "Breast examination" , add
label define RFVF 32250 "Gynecological examination" , add
label define RFVF 32300 "Eye examination" , add
label define RFVF 32350 "Heart examination" , add
label define RFVF 32400 "Other special examination" , add
label define RFVF 33000 "Sensitization test" , add
label define RFVF 33050 "Skin immunity test" , add
label define RFVF 33100 "Glucose level determination" , add
label define RFVF 33110 "SARS-CoV-2 (Coronavirus disease [COVID-19]) test" , add
label define RFVF 33111 "SARS-CoV-2 (Coronavirus disease [COVID-19]) antibody test" , add
label define RFVF 33140 "Human immunodeficiency virus (HIV) test" , add
label define RFVF 33150 "Other blood test" , add
label define RFVF 33151 "Blood test for venereal disease" , add
label define RFVF 33200 "Blood pressure test" , add
label define RFVF 33250 "Urine test" , add
label define RFVF 33300 "Diagnostic endoscopies" , add
label define RFVF 33350 "Biopsies" , add
label define RFVF 33400 "Mammography, xerography, breast therm..." , add
label define RFVF 33450 "Diagnostic radiology" , add
label define RFVF 33500 "EKG, ECG, electrocardiogram, treadmil..." , add
label define RFVF 33550 "EEG, electroencephalogram" , add
label define RFVF 33600 "Hearing test" , add
label define RFVF 33650 "Pap smear" , add
label define RFVF 33700 "Other and unspecified diagnostic tests" , add
label define RFVF 33701 "Glaucoma test" , add
label define RFVF 33702 "Throat culture" , add
label define RFVF 33703 "Heart catheterization" , add
label define RFVF 33704 "Other cultures" , add
label define RFVF 34000 "Prophylactic inoculations" , add
label define RFVF 34001 "COVID-19 immunization" , add
label define RFVF 34050 "Exposure to venereal disease" , add
label define RFVF 34080 "Possible HIV" , add
label define RFVF 34090 "Exposure to human immunodeficiency vi..." , add
label define RFVF 34100 "Exposure to other infectious diseases" , add
label define RFVF 34150 "Exposure to bodily fluids of another ..." , add
label define RFVF 35000 "Family planning, NOS" , add
label define RFVF 35050 "Contraceptive medication" , add
label define RFVF 35100 "Contraceptive device" , add
label define RFVF 35150 "Counseling and examinations for pregn..." , add
label define RFVF 35200 "Abortion to be performed (at this visit)" , add
label define RFVF 35250 "Sterilization to be performed (at thi..." , add
label define RFVF 35300 "Artificial insemination" , add
label define RFVF 35350 "Preconception Counseling and Education" , add
label define RFVF 41000 "Allergy medication" , add
label define RFVF 41100 "Injections" , add
label define RFVF 41110 "Noncompliance with medication therapy" , add
label define RFVF 41150 "Medication, other and unspecified kinds" , add
label define RFVF 42000 "Preoperative visit for specified/unsp..." , add
label define RFVF 42050 "Postoperative visit" , add
label define RFVF 44000 "Physical medicine and rehabilitation" , add
label define RFVF 44010 "Cardiopulmonary resuscitation" , add
label define RFVF 44050 "Respiratory therapy" , add
label define RFVF 44100 "Psychotherapy" , add
label define RFVF 44101 "Group counseling" , add
label define RFVF 44150 "Radiation therapy" , add
label define RFVF 44200 "Acupuncture" , add
label define RFVF 44250 "Chemotherapy" , add
label define RFVF 45000 "Tube insertion" , add
label define RFVF 45050 "Cauterization, all sites" , add
label define RFVF 45070 "IV therapy, infusion" , add
label define RFVF 45100 "Urinary tract instrumentation and cat..." , add
label define RFVF 45150 "Fitting glasses and contact lenses" , add
label define RFVF 45180 "Detoxification" , add
label define RFVF 45181 "Alcohol detoxification" , add
label define RFVF 45182 "Drug detoxification" , add
label define RFVF 45200 "Minor surgery" , add
label define RFVF 45201 "Wart removed" , add
label define RFVF 45210 "Major surgery" , add
label define RFVF 45290 "Internal prosthetic device" , add
label define RFVF 45250 "Kidney dialysis" , add
label define RFVF 45300 "External prosthetic devices, artifici..." , add
label define RFVF 45350 "Corrective appliances" , add
label define RFVF 45400 "Cast, splint - application, removal" , add
label define RFVF 45450 "Dressing, bandage - application, change" , add
label define RFVF 45500 "Irrigation, lavage" , add
label define RFVF 45550 "Suture - insertion, removal" , add
label define RFVF 45560 "Cosmetic injection, NOS" , add
label define RFVF 45561 "Botox injection" , add
label define RFVF 45600 "Other specific therapeutic procedures..." , add
label define RFVF 45650 "Transplant, NOS" , add
label define RFVF 45651 "Transplant, failure" , add
label define RFVF 45652 "Transplant, rejection" , add
label define RFVF 46000 "Diet and nutritional counseling" , add
label define RFVF 46040 "Human immunodeficiency virus (HIV) co..." , add
label define RFVF 46050 "Medical counseling, NOS" , add
label define RFVF 46051 "Family history of cardiovascular disease" , add
label define RFVF 46052 "Family history of cancer" , add
label define RFVF 46053 "Family history of diabetes" , add
label define RFVF 46054 "Family history of other disease or co..." , add
label define RFVF 47000 "Economic problem" , add
label define RFVF 47020 "Problem with access to medical care" , add
label define RFVF 47050 "Marital problems" , add
label define RFVF 47100 "Parent-child problems" , add
label define RFVF 47150 "Other problems of family relationship" , add
label define RFVF 47200 "Educational problems" , add
label define RFVF 47250 "Occupational problems" , add
label define RFVF 47300 "Social adjustment problems" , add
label define RFVF 47350 "Legal problems" , add
label define RFVF 47351 "Police involvement in outpatient visi..." , add
label define RFVF 47400 "Other social problems" , add
label define RFVF 48000 "Progress visit, NOS" , add
label define RFVF 50050 "Fracture/dislocation of head and face" , add
label define RFVF 50100 "Fracture/dislocation of spinal column" , add
label define RFVF 50150 "Fracture/dislocation of trunk area, e..." , add
label define RFVF 50200 "Fracture/dislocation of leg" , add
label define RFVF 50250 "Fracture/dislocation of ankle" , add
label define RFVF 50300 "Fracture/dislocation of foot and toes" , add
label define RFVF 50350 "Fracture/dislocation of arm" , add
label define RFVF 50400 "Fracture/dislocation of wrist" , add
label define RFVF 50450 "Fracture/dislocation of hand and fingers" , add
label define RFVF 50500 "Fracture, other and unspecified" , add
label define RFVF 51050 "Sprain and strain of cervical spine, ..." , add
label define RFVF 51100 "Sprain and strain of back" , add
label define RFVF 51150 "Sprain and strain of knee" , add
label define RFVF 51200 "Sprain and strain of ankle" , add
label define RFVF 51250 "Sprain and strain of wrist" , add
label define RFVF 51300 "Sprain or strain, other and unspecified" , add
label define RFVF 52050 "Laceration/cut of head and neck area" , add
label define RFVF 52100 "Laceration/cut of facial area" , add
label define RFVF 52150 "Laceration/cut of trunk area" , add
label define RFVF 52200 "Laceration/cut of lower extremity" , add
label define RFVF 52250 "Laceration/cut of upper extremity" , add
label define RFVF 52300 "Laceration/cut, site unspecified" , add
label define RFVF 53050 "Puncture wound of head, neck and faci..." , add
label define RFVF 53100 "Puncture wound of trunk area" , add
label define RFVF 53150 "Puncture wound of lower extremity" , add
label define RFVF 53200 "Puncture wound of upper extremity" , add
label define RFVF 53250 "Puncture wound, site unspecified" , add
label define RFVF 54050 "Contusions/abrasions/bruises of head,..." , add
label define RFVF 54100 "Contusions/abrasions/bruises of eye" , add
label define RFVF 54150 "Contusions/abrasions/bruises of trunk..." , add
label define RFVF 54200 "Contusions/abrasions/bruises of lower..." , add
label define RFVF 54250 "Contusions/abrasions/bruises of upper..." , add
label define RFVF 54300 "Contusion/abrasion/bruise, site unspe..." , add
label define RFVF 55050 "Injury, other and unspecified of head..." , add
label define RFVF 55100 "Injury, other and unspecified, of eye" , add
label define RFVF 55150 "Injury, other and unspecified, of back" , add
label define RFVF 55200 "Injury, other and unspecified, of che..." , add
label define RFVF 55250 "Injury, other and unspecified, of hip" , add
label define RFVF 55300 "Injury, other and unspecified, of leg" , add
label define RFVF 55350 "Injury, other and unspecified, of knee" , add
label define RFVF 55400 "Injury, other and unspecified, of ankle" , add
label define RFVF 55450 "Injury, other and unspecified, of foo..." , add
label define RFVF 55500 "Injury, other and unspecified, of sho..." , add
label define RFVF 55550 "Injury, other and unspecified, of arm" , add
label define RFVF 55600 "Injury, other and unspecified, of elbow" , add
label define RFVF 55650 "Injury, other and unspecified, of wrist" , add
label define RFVF 55700 "Injury, other and unspecified, of han..." , add
label define RFVF 55750 "Injury, multiple or unspecified" , add
label define RFVF 56000 "Foreign body in eye" , add
label define RFVF 56050 "Foreign body in nose" , add
label define RFVF 56100 "Foreign body in skin" , add
label define RFVF 56150 "Foreign body in digestive tract" , add
label define RFVF 56160 "Foreign body in respiratory tract" , add
label define RFVF 56200 "Foreign body in other and unspecified..." , add
label define RFVF 57050 "Burn, all degrees, to head, neck, and..." , add
label define RFVF 57100 "Burn, all degrees, to trunk area" , add
label define RFVF 57150 "Burn, all degrees, to extremities" , add
label define RFVF 57200 "Burn, all degrees, to site unspecified" , add
label define RFVF 57500 "Sunburn, windburn" , add
label define RFVF 57550 "Insect bite" , add
label define RFVF 57600 "Animal, human bite" , add
label define RFVF 58000 "Late effects of an old injury" , add
label define RFVF 58050 "Motor vehicle accident, type of injur..." , add
label define RFVF 58100 "Accident, NOS" , add
label define RFVF 58150 "Violence, NOS" , add
label define RFVF 58151 "Child abuse or neglect" , add
label define RFVF 58152 "Battered spouse" , add
label define RFVF 58153 "Elder abuse" , add
label define RFVF 58154 "Gunshot wound" , add
label define RFVF 58180 "Intentional self-mutilation" , add
label define RFVF 58200 "Suicide attempt" , add
label define RFVF 58201 "Overdose, intentional" , add
label define RFVF 58300 "Rape" , add
label define RFVF 58301 "Sexual abuse" , add
label define RFVF 58350 "Dead on arrival (DOA)" , add
label define RFVF 58360 "Respiratory arrest" , add
label define RFVF 58370 "Cardiac arrest" , add
label define RFVF 58380 "Drowning" , add
label define RFVF 58390 "Cardiopulmonary arrest" , add
label define RFVF 58400 "Unconscious on arrival" , add
label define RFVF 58410 "State of consciousness not specified" , add
label define RFVF 58420 "Altered level of consciousness" , add
label define RFVF 59000 "Accidental poisoning" , add
label define RFVF 59001 "Food poisoning" , add
label define RFVF 59002 "Ingestion, inhalation, or exposure to..." , add
label define RFVF 59050 "Adverse effect of medication" , add
label define RFVF 59100 "Adverse effect of drug abuse" , add
label define RFVF 59150 "Adverse effect of alcohol" , add
label define RFVF 59160 "Alcohol poisoning" , add
label define RFVF 59200 "Adverse effects of environment" , add
label define RFVF 59210 "Adverse effects of secondhand smoke" , add
label define RFVF 59220 "Adverse effects of terrorism and biot..." , add
label define RFVF 59250 "Adverse effects, other and unspecified" , add
label define RFVF 59300 "Surgical Complications due to any imp..." , add
label define RFVF 59301 "Due to presence of any implant, inter..." , add
label define RFVF 59302 "Post-operative Medical Complications" , add
label define RFVF 59350 "Systemic inflammatory response syndrome (SIRS), unspecified" , add
label define RFVF 59352 "Severe sepsis" , add
label define RFVF 59354 "Systemic inflammatory response syndrome due to noninfect process..." , add
label define RFVF 61000 "For results of blood glucose tests" , add
label define RFVF 61050 "For results of cholesterol and trigly..." , add
label define RFVF 61060 "For results of test for human immunod..." , add
label define RFVF 61100 "For other findings of blood tests" , add
label define RFVF 62000 "For results of urine tests" , add
label define RFVF 63000 "For cytology findings" , add
label define RFVF 64000 "For radiological findings" , add
label define RFVF 65000 "For results of EKG" , add
label define RFVF 66000 "For results of skin tests" , add
label define RFVF 67000 "For other and unspecified test results" , add
label define RFVF 71000 "Physical examination required for sch..." , add
label define RFVF 71001 "Physical examination required for emp..." , add
label define RFVF 71002 "Executive physical examination" , add
label define RFVF 71003 "Physical examination required for school" , add
label define RFVF 71004 "Physical examination for extracurricu..." , add
label define RFVF 71200 "Driver's license examination" , add
label define RFVF 71250 "Insurance examination" , add
label define RFVF 71300 "Disability examination" , add
label define RFVF 71310 "Worker's Compensation examination" , add
label define RFVF 71350 "Premarital examination" , add
label define RFVF 71351 "Premarital blood test" , add
label define RFVF 71370 "Direct admission to hospital" , add
label define RFVF 71400 "Other reason for visit required by party" , add
label define RFVF 89900 "Problems, complaints, NEC" , add
label define RFVF 89910 "Patient unable to speak English" , add
label define RFVF 89930 "Patient (or spokesperson) refused care" , add
label define RFVF 89970 "Entry of 'none' or 'no complaint'" , add
label define RFVF 89980 "Inadequate data base" , add
label define RFVF 89990 "Illegible entry" , add
label define RFVF -9 "Blank" , add
label define SETTYPF 1 "NAMCS"  
label define SETTYPF 2 "NHAMCS - OPD" , add
label define SETTYPF 3 "NHAMCS - ED" , add
label define SEXF 1 "Female"  
label define SEXF 2 "Male" , add
label define STAY24F 1 "Patient was discharged from ED in more than 24 hours"  
label define STAY24F 	2 "Patient was discharged from ED in 24 hours or less" , add
label define STAY24F 3 "Missing data for ED discharge date and/or time" , add
label define SURGDAYF -9 "Blank"  
label define SURGDAYF -8 "Unknown" , add
label define TEMPFF -9 "Blank"  
label define TEMPFF 600 "60.0" , add
label define TEMPFF 601 "60.1" , add
label define TEMPFF 602 "60.2" , add
label define TEMPFF 603 "60.3" , add
label define TEMPFF 604 "60.4" , add
label define TEMPFF 605 "60.5" , add
label define TEMPFF 606 "60.6" , add
label define TEMPFF 607 "60.7" , add
label define TEMPFF 608 "60.8" , add
label define TEMPFF 609 "60.9" , add
label define TEMPFF 610 "61.0" , add
label define TEMPFF 611 "61.1" , add
label define TEMPFF 612 "61.2" , add
label define TEMPFF 613 "61.3" , add
label define TEMPFF 614 "61.4" , add
label define TEMPFF 615 "61.5" , add
label define TEMPFF 616 "61.6" , add
label define TEMPFF 617 "61.7" , add
label define TEMPFF 618 "61.8" , add
label define TEMPFF 619 "61.9" , add
label define TEMPFF 620 "62.0" , add
label define TEMPFF 621 "62.1" , add
label define TEMPFF 622 "62.2" , add
label define TEMPFF 623 "62.3" , add
label define TEMPFF 624 "62.4" , add
label define TEMPFF 625 "62.5" , add
label define TEMPFF 626 "62.6" , add
label define TEMPFF 627 "62.7" , add
label define TEMPFF 628 "62.8" , add
label define TEMPFF 629 "62.9" , add
label define TEMPFF 630 "63.0" , add
label define TEMPFF 631 "63.1" , add
label define TEMPFF 632 "63.2" , add
label define TEMPFF 633 "63.3" , add
label define TEMPFF 634 "63.4" , add
label define TEMPFF 635 "63.5" , add
label define TEMPFF 636 "63.6" , add
label define TEMPFF 637 "63.7" , add
label define TEMPFF 638 "63.8" , add
label define TEMPFF 639 "63.9" , add
label define TEMPFF 640 "64.0" , add
label define TEMPFF 641 "64.1" , add
label define TEMPFF 642 "64.2" , add
label define TEMPFF 643 "64.3" , add
label define TEMPFF 644 "64.4" , add
label define TEMPFF 645 "64.5" , add
label define TEMPFF 646 "64.6" , add
label define TEMPFF 647 "64.7" , add
label define TEMPFF 648 "64.8" , add
label define TEMPFF 649 "64.9" , add
label define TEMPFF 650 "65.0" , add
label define TEMPFF 651 "65.1" , add
label define TEMPFF 652 "65.2" , add
label define TEMPFF 653 "65.3" , add
label define TEMPFF 654 "65.4" , add
label define TEMPFF 655 "65.5" , add
label define TEMPFF 656 "65.6" , add
label define TEMPFF 657 "65.7" , add
label define TEMPFF 658 "65.8" , add
label define TEMPFF 659 "65.9" , add
label define TEMPFF 660 "65.0" , add
label define TEMPFF 661 "66.1" , add
label define TEMPFF 662 "66.2" , add
label define TEMPFF 663 "66.3" , add
label define TEMPFF 664 "66.4" , add
label define TEMPFF 665 "66.5" , add
label define TEMPFF 666 "66.6" , add
label define TEMPFF 667 "66.7" , add
label define TEMPFF 668 "66.8" , add
label define TEMPFF 669 "66.9" , add
label define TEMPFF 670 "67.0" , add
label define TEMPFF 671 "67.1" , add
label define TEMPFF 672 "67.2" , add
label define TEMPFF 673 "67.3" , add
label define TEMPFF 674 "67.4" , add
label define TEMPFF 675 "67.5" , add
label define TEMPFF 676 "67.6" , add
label define TEMPFF 677 "67.7" , add
label define TEMPFF 678 "67.8" , add
label define TEMPFF 679 "67.9" , add
label define TEMPFF 680 "68.0" , add
label define TEMPFF 681 "68.1" , add
label define TEMPFF 682 "68.2" , add
label define TEMPFF 683 "68.3" , add
label define TEMPFF 684 "68.4" , add
label define TEMPFF 685 "68.5" , add
label define TEMPFF 686 "68.6" , add
label define TEMPFF 687 "68.7" , add
label define TEMPFF 688 "68.8" , add
label define TEMPFF 689 "68.9" , add
label define TEMPFF 690 "69.0" , add
label define TEMPFF 691 "69.1" , add
label define TEMPFF 692 "69.2" , add
label define TEMPFF 693 "69.3" , add
label define TEMPFF 694 "69.4" , add
label define TEMPFF 695 "69.5" , add
label define TEMPFF 696 "69.6" , add
label define TEMPFF 697 "69.7" , add
label define TEMPFF 698 "69.8" , add
label define TEMPFF 699 "69.9" , add
label define TEMPFF 700 "70.0" , add
label define TEMPFF 701 "70.1" , add
label define TEMPFF 702 "70.2" , add
label define TEMPFF 703 "70.3" , add
label define TEMPFF 704 "70.4" , add
label define TEMPFF 705 "70.5" , add
label define TEMPFF 706 "70.6" , add
label define TEMPFF 707 "70.7" , add
label define TEMPFF 708 "70.8" , add
label define TEMPFF 709 "70.9" , add
label define TEMPFF 710 "71.0" , add
label define TEMPFF 711 "71.1" , add
label define TEMPFF 712 "71.2" , add
label define TEMPFF 713 "71.3" , add
label define TEMPFF 714 "71.4" , add
label define TEMPFF 715 "71.5" , add
label define TEMPFF 716 "71.6" , add
label define TEMPFF 717 "71.7" , add
label define TEMPFF 718 "71.8" , add
label define TEMPFF 719 "71.9" , add
label define TEMPFF 720 "72.0" , add
label define TEMPFF 721 "72.1" , add
label define TEMPFF 722 "72.2" , add
label define TEMPFF 723 "72.3" , add
label define TEMPFF 724 "72.4" , add
label define TEMPFF 725 "72.5" , add
label define TEMPFF 726 "72.6" , add
label define TEMPFF 727 "72.7" , add
label define TEMPFF 728 "72.8" , add
label define TEMPFF 729 "72.9" , add
label define TEMPFF 730 "73.0" , add
label define TEMPFF 731 "73.1" , add
label define TEMPFF 732 "73.2" , add
label define TEMPFF 733 "73.3" , add
label define TEMPFF 734 "73.4" , add
label define TEMPFF 735 "73.5" , add
label define TEMPFF 736 "73.6" , add
label define TEMPFF 737 "73.7" , add
label define TEMPFF 738 "73.8" , add
label define TEMPFF 739 "73.9" , add
label define TEMPFF 740 "74.0" , add
label define TEMPFF 741 "74.1" , add
label define TEMPFF 742 "74.2" , add
label define TEMPFF 743 "74.3" , add
label define TEMPFF 744 "74.4" , add
label define TEMPFF 745 "74.5" , add
label define TEMPFF 746 "74.6" , add
label define TEMPFF 747 "74.7" , add
label define TEMPFF 748 "74.8" , add
label define TEMPFF 749 "74.9" , add
label define TEMPFF 750 "75.0" , add
label define TEMPFF 751 "75.1" , add
label define TEMPFF 752 "75.2" , add
label define TEMPFF 753 "75.3" , add
label define TEMPFF 754 "75.4" , add
label define TEMPFF 755 "75.5" , add
label define TEMPFF 756 "75.6" , add
label define TEMPFF 757 "75.7" , add
label define TEMPFF 758 "75.8" , add
label define TEMPFF 759 "75.9" , add
label define TEMPFF 760 "76.0" , add
label define TEMPFF 761 "76.1" , add
label define TEMPFF 762 "76.2" , add
label define TEMPFF 763 "76.3" , add
label define TEMPFF 764 "76.4" , add
label define TEMPFF 765 "76.5" , add
label define TEMPFF 766 "76.6" , add
label define TEMPFF 767 "76.7" , add
label define TEMPFF 768 "76.8" , add
label define TEMPFF 769 "76.9" , add
label define TEMPFF 770 "77.0" , add
label define TEMPFF 771 "77.1" , add
label define TEMPFF 772 "77.2" , add
label define TEMPFF 773 "77.3" , add
label define TEMPFF 774 "77.4" , add
label define TEMPFF 775 "77.5" , add
label define TEMPFF 776 "77.6" , add
label define TEMPFF 777 "77.7" , add
label define TEMPFF 778 "77.8" , add
label define TEMPFF 779 "77.9" , add
label define TEMPFF 780 "78.0" , add
label define TEMPFF 781 "78.1" , add
label define TEMPFF 782 "78.2" , add
label define TEMPFF 783 "78.3" , add
label define TEMPFF 784 "78.4" , add
label define TEMPFF 785 "78.5" , add
label define TEMPFF 786 "78.6" , add
label define TEMPFF 787 "78.7" , add
label define TEMPFF 788 "78.8" , add
label define TEMPFF 789 "78.9" , add
label define TEMPFF 790 "79.0" , add
label define TEMPFF 791 "79.1" , add
label define TEMPFF 792 "79.2" , add
label define TEMPFF 793 "79.3" , add
label define TEMPFF 794 "79.4" , add
label define TEMPFF 795 "79.5" , add
label define TEMPFF 796 "79.6" , add
label define TEMPFF 797 "79.7" , add
label define TEMPFF 798 "79.8" , add
label define TEMPFF 799 "79.9" , add
label define TEMPFF 800 "80.0" , add
label define TEMPFF 801 "80.1" , add
label define TEMPFF 802 "80.2" , add
label define TEMPFF 803 "80.3" , add
label define TEMPFF 804 "80.4" , add
label define TEMPFF 805 "80.5" , add
label define TEMPFF 806 "80.6" , add
label define TEMPFF 807 "80.7" , add
label define TEMPFF 808 "80.8" , add
label define TEMPFF 809 "80.9" , add
label define TEMPFF 810 "81.0" , add
label define TEMPFF 811 "81.1" , add
label define TEMPFF 812 "81.2" , add
label define TEMPFF 813 "81.3" , add
label define TEMPFF 814 "81.4" , add
label define TEMPFF 815 "81.5" , add
label define TEMPFF 816 "81.6" , add
label define TEMPFF 817 "81.7" , add
label define TEMPFF 818 "81.8" , add
label define TEMPFF 819 "81.9" , add
label define TEMPFF 820 "82.0" , add
label define TEMPFF 821 "82.1" , add
label define TEMPFF 822 "82.2" , add
label define TEMPFF 823 "82.3" , add
label define TEMPFF 824 "82.4" , add
label define TEMPFF 825 "82.5" , add
label define TEMPFF 826 "82.6" , add
label define TEMPFF 827 "82.7" , add
label define TEMPFF 828 "82.8" , add
label define TEMPFF 829 "82.9" , add
label define TEMPFF 830 "83.0" , add
label define TEMPFF 831 "83.1" , add
label define TEMPFF 832 "83.2" , add
label define TEMPFF 833 "83.3" , add
label define TEMPFF 834 "83.4" , add
label define TEMPFF 835 "83.5" , add
label define TEMPFF 836 "83.6" , add
label define TEMPFF 837 "83.7" , add
label define TEMPFF 838 "83.8" , add
label define TEMPFF 839 "83.9" , add
label define TEMPFF 840 "84.0" , add
label define TEMPFF 841 "84.1" , add
label define TEMPFF 842 "84.2" , add
label define TEMPFF 843 "84.3" , add
label define TEMPFF 844 "84.4" , add
label define TEMPFF 845 "84.5" , add
label define TEMPFF 846 "84.6" , add
label define TEMPFF 847 "84.7" , add
label define TEMPFF 848 "84.8" , add
label define TEMPFF 849 "84.9" , add
label define TEMPFF 850 "85.0" , add
label define TEMPFF 851 "85.1" , add
label define TEMPFF 852 "85.2" , add
label define TEMPFF 853 "85.3" , add
label define TEMPFF 854 "85.4" , add
label define TEMPFF 855 "85.5" , add
label define TEMPFF 856 "85.6" , add
label define TEMPFF 857 "85.7" , add
label define TEMPFF 858 "85.8" , add
label define TEMPFF 859 "85.9" , add
label define TEMPFF 860 "86.0" , add
label define TEMPFF 861 "86.1" , add
label define TEMPFF 862 "86.2" , add
label define TEMPFF 863 "86.3" , add
label define TEMPFF 864 "86.4" , add
label define TEMPFF 865 "86.5" , add
label define TEMPFF 866 "86.6" , add
label define TEMPFF 867 "86.7" , add
label define TEMPFF 868 "86.8" , add
label define TEMPFF 869 "86.9" , add
label define TEMPFF 870 "87.0" , add
label define TEMPFF 871 "87.1" , add
label define TEMPFF 872 "87.2" , add
label define TEMPFF 873 "87.3" , add
label define TEMPFF 874 "87.4" , add
label define TEMPFF 875 "87.5" , add
label define TEMPFF 876 "87.6" , add
label define TEMPFF 877 "87.7" , add
label define TEMPFF 878 "87.8" , add
label define TEMPFF 879 "87.9" , add
label define TEMPFF 880 "88.0" , add
label define TEMPFF 881 "88.1" , add
label define TEMPFF 882 "88.2" , add
label define TEMPFF 883 "88.3" , add
label define TEMPFF 884 "88.4" , add
label define TEMPFF 885 "88.5" , add
label define TEMPFF 886 "88.6" , add
label define TEMPFF 887 "88.7" , add
label define TEMPFF 888 "88.8" , add
label define TEMPFF 889 "88.9" , add
label define TEMPFF 890 "89.0" , add
label define TEMPFF 891 "89.1" , add
label define TEMPFF 892 "89.2" , add
label define TEMPFF 893 "89.3" , add
label define TEMPFF 894 "89.4" , add
label define TEMPFF 895 "89.5" , add
label define TEMPFF 896 "89.6" , add
label define TEMPFF 897 "89.7" , add
label define TEMPFF 898 "89.8" , add
label define TEMPFF 899 "89.9" , add
label define TEMPFF 900 "90.0" , add
label define TEMPFF 901 "90.1" , add
label define TEMPFF 902 "90.2" , add
label define TEMPFF 903 "90.3" , add
label define TEMPFF 904 "90.4" , add
label define TEMPFF 905 "90.5" , add
label define TEMPFF 906 "90.6" , add
label define TEMPFF 907 "90.7" , add
label define TEMPFF 908 "90.8" , add
label define TEMPFF 909 "90.9" , add
label define TEMPFF 910 "91.0" , add
label define TEMPFF 911 "91.1" , add
label define TEMPFF 912 "91.2" , add
label define TEMPFF 913 "91.3" , add
label define TEMPFF 914 "91.4" , add
label define TEMPFF 915 "91.5" , add
label define TEMPFF 916 "91.6" , add
label define TEMPFF 917 "91.7" , add
label define TEMPFF 918 "91.8" , add
label define TEMPFF 919 "91.9" , add
label define TEMPFF 920 "92.0" , add
label define TEMPFF 921 "92.1" , add
label define TEMPFF 922 "92.2" , add
label define TEMPFF 923 "92.3" , add
label define TEMPFF 924 "92.4" , add
label define TEMPFF 925 "92.5" , add
label define TEMPFF 926 "92.6" , add
label define TEMPFF 927 "92.7" , add
label define TEMPFF 928 "92.8" , add
label define TEMPFF 929 "92.9" , add
label define TEMPFF 930 "93.0" , add
label define TEMPFF 931 "93.1" , add
label define TEMPFF 932 "93.2" , add
label define TEMPFF 933 "93.3" , add
label define TEMPFF 934 "93.4" , add
label define TEMPFF 935 "93.5" , add
label define TEMPFF 936 "93.6" , add
label define TEMPFF 937 "93.7" , add
label define TEMPFF 938 "93.8" , add
label define TEMPFF 939 "93.9" , add
label define TEMPFF 940 "94.0" , add
label define TEMPFF 941 "94.1" , add
label define TEMPFF 942 "94.2" , add
label define TEMPFF 943 "94.3" , add
label define TEMPFF 944 "94.4" , add
label define TEMPFF 945 "94.5" , add
label define TEMPFF 946 "94.6" , add
label define TEMPFF 947 "94.7" , add
label define TEMPFF 948 "94.8" , add
label define TEMPFF 949 "94.9" , add
label define TEMPFF 950 "95.0" , add
label define TEMPFF 951 "95.1" , add
label define TEMPFF 952 "95.2" , add
label define TEMPFF 953 "95.3" , add
label define TEMPFF 954 "95.4" , add
label define TEMPFF 955 "95.5" , add
label define TEMPFF 956 "95.6" , add
label define TEMPFF 957 "95.7" , add
label define TEMPFF 958 "95.8" , add
label define TEMPFF 959 "95.9" , add
label define TEMPFF 960 "96.0" , add
label define TEMPFF 961 "96.1" , add
label define TEMPFF 962 "96.2" , add
label define TEMPFF 963 "96.3" , add
label define TEMPFF 964 "96.4" , add
label define TEMPFF 965 "96.5" , add
label define TEMPFF 966 "96.6" , add
label define TEMPFF 967 "96.7" , add
label define TEMPFF 968 "96.8" , add
label define TEMPFF 969 "96.9" , add
label define TEMPFF 970 "97.0" , add
label define TEMPFF 971 "97.1" , add
label define TEMPFF 972 "97.2" , add
label define TEMPFF 973 "97.3" , add
label define TEMPFF 974 "97.4" , add
label define TEMPFF 975 "97.5" , add
label define TEMPFF 976 "97.6" , add
label define TEMPFF 977 "97.7" , add
label define TEMPFF 978 "97.8" , add
label define TEMPFF 979 "97.9" , add
label define TEMPFF 980 "98.0" , add
label define TEMPFF 981 "98.1" , add
label define TEMPFF 982 "98.2" , add
label define TEMPFF 983 "98.3" , add
label define TEMPFF 984 "98.4" , add
label define TEMPFF 985 "98.5" , add
label define TEMPFF 986 "98.6" , add
label define TEMPFF 987 "98.7" , add
label define TEMPFF 988 "98.8" , add
label define TEMPFF 989 "98.9" , add
label define TEMPFF 990 "99.0" , add
label define TEMPFF 991 "99.1" , add
label define TEMPFF 992 "99.2" , add
label define TEMPFF 993 "99.3" , add
label define TEMPFF 994 "99.4" , add
label define TEMPFF 995 "99.5" , add
label define TEMPFF 996 "99.6" , add
label define TEMPFF 997 "99.7" , add
label define TEMPFF 998 "99.8" , add
label define TEMPFF 999 "99.9" , add
label define TEMPFF 1000 "100.0" , add
label define TEMPFF 1001 "100.1" , add
label define TEMPFF 1002 "100.2" , add
label define TEMPFF 1003 "100.3" , add
label define TEMPFF 1004 "100.4" , add
label define TEMPFF 1005 "100.5" , add
label define TEMPFF 1006 "100.6" , add
label define TEMPFF 1007 "100.7" , add
label define TEMPFF 1008 "100.8" , add
label define TEMPFF 1009 "100.9" , add
label define TEMPFF 1010 "100.0" , add
label define TEMPFF 1011 "101.1" , add
label define TEMPFF 1012 "101.2" , add
label define TEMPFF 1013 "101.3" , add
label define TEMPFF 1014 "101.4" , add
label define TEMPFF 1015 "101.5" , add
label define TEMPFF 1016 "101.6" , add
label define TEMPFF 1017 "101.7" , add
label define TEMPFF 1018 "101.8" , add
label define TEMPFF 1019 "101.9" , add
label define TEMPFF 1020 "102.0" , add
label define TEMPFF 1021 "102.1" , add
label define TEMPFF 1022 "102.2" , add
label define TEMPFF 1023 "102.3" , add
label define TEMPFF 1024 "102.4" , add
label define TEMPFF 1025 "102.5" , add
label define TEMPFF 1026 "102.6" , add
label define TEMPFF 1027 "102.7" , add
label define TEMPFF 1028 "102.8" , add
label define TEMPFF 1029 "102.9" , add
label define TEMPFF 1030 "103.0" , add
label define TEMPFF 1031 "103.1" , add
label define TEMPFF 1032 "103.2" , add
label define TEMPFF 1033 "103.3" , add
label define TEMPFF 1034 "103.4" , add
label define TEMPFF 1035 "103.5" , add
label define TEMPFF 1036 "103.6" , add
label define TEMPFF 1037 "103.7" , add
label define TEMPFF 1038 "103.8" , add
label define TEMPFF 1039 "103.9" , add
label define TEMPFF 1040 "104.0" , add
label define TEMPFF 1041 "104.1" , add
label define TEMPFF 1042 "104.2" , add
label define TEMPFF 1043 "104.3" , add
label define TEMPFF 1044 "104.4" , add
label define TEMPFF 1045 "104.5" , add
label define TEMPFF 1046 "104.6" , add
label define TEMPFF 1047 "104.7" , add
label define TEMPFF 1048 "104.8" , add
label define TEMPFF 1049 "104.9" , add
label define TEMPFF 1050 "105.0" , add
label define TEMPFF 1051 "105.1" , add
label define TEMPFF 1052 "105.2" , add
label define TEMPFF 1053 "105.3" , add
label define TEMPFF 1054 "105.4" , add
label define TEMPFF 1055 "105.5" , add
label define TEMPFF 1056 "105.6" , add
label define TEMPFF 1057 "105.7" , add
label define TEMPFF 1058 "105.8" , add
label define TEMPFF 1059 "105.9" , add
label define TEMPFF 1060 "106.0" , add
label define TEMPFF 1061 "106.1" , add
label define TEMPFF 1062 "106.2" , add
label define TEMPFF 1063 "106.3" , add
label define TEMPFF 1064 "106.4" , add
label define TEMPFF 1065 "106.5" , add
label define TEMPFF 1066 "106.6" , add
label define TEMPFF 1067 "106.7" , add
label define TEMPFF 1068 "106.8" , add
label define TEMPFF 1069 "106.9" , add
label define TEMPFF 1070 "107.0" , add
label define TEMPFF 1071 "107.1" , add
label define TEMPFF 1072 "107.2" , add
label define TEMPFF 1073 "107.3" , add
label define TEMPFF 1074 "107.4" , add
label define TEMPFF 1075 "107.5" , add
label define TEMPFF 1076 "107.6" , add
label define TEMPFF 1077 "107.7" , add
label define TEMPFF 1078 "107.8" , add
label define TEMPFF 1079 "107.9" , add
label define TEMPFF 1080 "108.0" , add
label define TEMPFF 1081 "108.1" , add
label define TEMPFF 1082 "108.2" , add
label define TEMPFF 1083 "108.3" , add
label define TEMPFF 1084 "108.4" , add
label define TEMPFF 1085 "108.5" , add
label define TEMPFF 1086 "108.6" , add
label define TEMPFF 1087 "108.7" , add
label define TEMPFF 1088 "108.8" , add
label define TEMPFF 1089 "108.9" , add
label define TEMPFF 1090 "109.0" , add
label define TEMPFF 1091 "109.1" , add
label define TEMPFF 1092 "109.2" , add
label define TEMPFF 1093 "109.3" , add
label define TEMPFF 1094 "109.4" , add
label define TEMPFF 1095 "109.5" , add
label define TEMPFF 1096 "109.6" , add
label define TEMPFF 1097 "109.7" , add
label define TEMPFF 1098 "109.8" , add
label define TEMPFF 1099 "109.9" , add
label define TEMPFF 1100 "110.0" , add
label define TEMPFF 1101 "110.1" , add
label define TEMPFF 1102 "110.2" , add
label define TEMPFF 1103 "110.3" , add
label define TEMPFF 1104 "110.4" , add
label define TEMPFF 1105 "110.5" , add
label define TEMPFF 1106 "110.6" , add
label define TEMPFF 1107 "110.7" , add
label define TEMPFF 1108 "110.8" , add
label define TEMPFF 1109 "110.9" , add
label define TEMPFF 1110 "111.0" , add
label define TEMPFF 1111 "111.1" , add
label define TEMPFF 1112 "111.2" , add
label define TOTDIAGF -9 "'None' box and all item fields are blank"  
label define TOTHRDIVRF -9 "Blank"  
label define TOTHRDIVRF -8 "Unknown" , add
label define TOTHRDIVRF -7 "Not applicable" , add
label define TOTHRDIVRF -6 "Refused to answer" , add
label define TOTHRDIVRF 2 "1-99 hours on diversion" , add
label define TOTHRDIVRF 3 "100-499 hours on diversion" , add
label define TOTHRDIVRF 4 "500 or more hours on diversion" , add
label define TOTHRDIVRF 5 "Diversion data not available" , add
label define TOTPROCF -9 "'None' box and all item fields are blank"  
label define VDAYRF 1 "Sunday"  
label define VDAYRF 2 "Monday" , add
label define VDAYRF 3 "Tuesday" , add
label define VDAYRF 4 "Wednesday" , add
label define VDAYRF 5 "Thursday" , add
label define VDAYRF 6 "Friday" , add
label define VDAYRF 7 "Saturday" , add
label define VMONTHF 01 "January"  
label define VMONTHF 02 "February" , add
label define VMONTHF 03 "March" , add
label define VMONTHF 04 "April" , add
label define VMONTHF 05 "May" , add
label define VMONTHF 06 "June" , add
label define VMONTHF 07 "July" , add
label define VMONTHF 08 "August" , add
label define VMONTHF 09 "September" , add
label define VMONTHF 10 "October" , add
label define VMONTHF 11 "November" , add
label define VMONTHF 12 "December" , add
label define WAITTIMEF -9 "Blank"  
label define WAITTIMEF -7 "Not Applicable" , add
label define YESNOUBF -9 "Blank"  
label define YESNOUBF -8 "Unknown" , add
label define YESNOUBF 	1 "Yes" , add
label define YESNOUBF 	2 "No" , add

label values VMONTH VMONTHF
label values VDAYR VDAYRF
label values AGE AGEF
label values AGEDAYS AGEDAYSF
label values AGER AGERF
label values WAITTIME WAITTIMEF
label values LOS BOARDED WAITTIMEF
label values OBSSTAY WAITTIMEF
label values LOS LOSF
label values LOV LOVF
label values RESIDNCE RESIDF
label values SEX SEXF
label values ETHUN ETHUNF
label values RACEUN RACEUNF
label values ETHIM ETHIMF
label values RACER RACERF
label values RACERETH RACERETHF
label values ARREMS ARREMSF
label values AMBTRANSFER AMBTRANF
label values NOPAY NOPAYF
label values PAYPRIV NOYESF
label values PAYMCARE NOYESF
label values PAYMCAID NOYESF
label values PAYWKCMP NOYESF
label values PAYSELF NOYESF
label values PAYNOCHG NOYESF
label values PAYOTH NOYESF
label values PAYDK NOYESF
label values PAYTYPER PAYTYPERF
label values TEMPF TEMPFF
label values PULSE PULSEF
label values RESPR RESPRF
label values BPSYS BPSYSF
label values BPDIAS BPDIASF
label values POPCT POPCTF
label values IMMEDR IMMEDRF
label values PAINSCALE PAINSCALEF
label values SEEN72 CONTRASTF
label values CTCONTRAST CONTRASTF
label values MRICONTRAST CONTRASTF
label values RFV1 RFVF
label values RFV2 RFVF
label values RFV3 RFVF
label values RFV4 RFVF
label values RFV5 RFVF
label values RFV13D RFV3DF
label values RFV23D RFV3DF
label values RFV33D RFV3DF
label values RFV43D RFV3DF
label values RFV53D RFV3DF
label values EPISODE EPISODEF
label values INJURY INJURYF
label values INJPOISAD INJPOISADF
label values INJURY72 INJURY72F
label values INTENT15 INTENT15F
label values INJURY_ENC INJURYENCF
label values PRDIAG1 PRDIAGF
label values PRDIAG2 PRDIAGF
label values PRDIAG3 PRDIAGF
label values PRDIAG4 PRDIAGF
label values PRDIAG5 PRDIAGF
label values ETOHAB NOYESF
label values ALZHD NOYESF
label values ASTHMA NOYESF
label values CANCER NOYESF
label values CEBVD NOYESF
label values CKD NOYESF
label values COPD NOYESF
label values CHF NOYESF
label values CAD NOYESF
label values DEPRN NOYESF
label values DIABTYP1 NOYESF
label values DIABTYP2 NOYESF
label values DIABTYP0 NOYESF
label values ESRD NOYESF
label values HPE NOYESF
label values EDHIV NOYESF
label values HYPLIPID NOYESF
label values HTN NOYESF
label values OBESITY NOYESF
label values OSA NOYESF
label values OSTPRSIS NOYESF
label values SUBSTAB NOYESF
label values DIAGSCRN DIAGSCRF
label values ABG NOYESF
label values BAC NOYESF
label values BLOODCX NOYESF
label values BMP NOYESF
label values BNP NOYESF
label values BUNCREAT NOYESF
label values CARDENZ NOYESF
label values CBC NOYESF
label values CMP NOYESF
label values DDIMER NOYESF
label values ELECTROL NOYESF
label values GLUCOSE NOYESF
label values LACTATE NOYESF
label values LFT NOYESF
label values PTTINR NOYESF
label values OTHERBLD NOYESF
label values CARDMON NOYESF
label values EKG NOYESF
label values HIVTEST NOYESF
label values FLUTEST NOYESF
label values PREGTEST NOYESF
label values TOXSCREN NOYESF
label values TRTCX NOYESF
label values URINE NOYESF
label values URINECX NOYESF
label values WOUNDCX NOYESF
label values OTHCX NOYESF
label values OTHRTEST NOYESF
label values ANYIMAGE NOYESF
label values XRAY NOYESF
label values CATSCAN NOYESF
label values CTAB NOYESF
label values CTCHEST NOYESF
label values CTHEAD NOYESF
label values CTOTHER NOYESF
label values CTUNK NOYESF
label values MRI NOYESF
label values ULTRASND NOYESF
label values OTHIMAGE NOYESF
label values COVIDTEST NOYESF
label values COVIDANTIBODY NOYESF
label values TOTDIAG TOTDIAGF
label values NOCHRON PROCF
label values PROC PROCF
label values BPAP NOYESF
label values BLADCATH NOYESF
label values CASTSPLINT NOYESF
label values CENTLINE NOYESF
label values CPR NOYESF
label values ENDOINT NOYESF
label values INCDRAIN NOYESF
label values IVFLUIDS NOYESF
label values LUMBAR NOYESF
label values NEBUTHER NOYESF
label values PELVIC NOYESF
label values SKINADH NOYESF
label values SUTURE NOYESF
label values OTHPROC NOYESF
label values TOTPROC TOTPROCF
label values TOTCHRON TOTPROCF
label values MED MEDF
label values MED1 MEDCODF
label values MED2 MEDCODF
label values MED3 MEDCODF
label values MED4 MEDCODF
label values MED5 MEDCODF
label values MED6 MEDCODF
label values MED7 MEDCODF
label values MED8 MEDCODF
label values MED9 MEDCODF
label values MED10 MEDCODF
label values MED11 MEDCODF
label values MED12 MEDCODF
label values MED13 MEDCODF
label values MED14 MEDCODF
label values MED15 MEDCODF
label values MED16 MEDCODF
label values MED17 MEDCODF
label values MED18 MEDCODF
label values MED19 MEDCODF
label values MED20 MEDCODF
label values MED21 MEDCODF
label values MED22 MEDCODF
label values MED23 MEDCODF
label values MED24 MEDCODF
label values MED25 MEDCODF
label values MED26 MEDCODF
label values MED27 MEDCODF
label values MED28 MEDCODF
label values MED29 MEDCODF
label values MED30 MEDCODF
label values GPMED1 GPMEDF
label values GPMED2 GPMEDF
label values GPMED3 GPMEDF
label values GPMED4 GPMEDF
label values GPMED5 GPMEDF
label values GPMED6 GPMEDF
label values GPMED7 GPMEDF
label values GPMED8 GPMEDF
label values GPMED9 GPMEDF
label values GPMED10 GPMEDF
label values GPMED11 GPMEDF
label values GPMED12 GPMEDF
label values GPMED13 GPMEDF
label values GPMED14 GPMEDF
label values GPMED15 GPMEDF
label values GPMED16 GPMEDF
label values GPMED17 GPMEDF
label values GPMED18 GPMEDF
label values GPMED19 GPMEDF
label values GPMED20 GPMEDF
label values GPMED21 GPMEDF
label values GPMED22 GPMEDF
label values GPMED23 GPMEDF
label values GPMED24 GPMEDF
label values GPMED25 GPMEDF
label values GPMED26 GPMEDF
label values GPMED27 GPMEDF
label values GPMED28 GPMEDF
label values GPMED29 GPMEDF
label values GPMED30 GPMEDF
label values NUMGIV NUMGIVF
label values NUMDIS NUMDISF
label values VITALSD YESNOUBF
label values TEMPDF TEMPFF
label values PULSED PULSEF
label values RESPRD RESPRF
label values BPSYSD BPSYSF
label values BPDIASD BPDIASF
label values NOPROVID NOYESF
label values ATTPHYS NOYESF
label values RESINT NOYESF
label values CONSULT NOYESF
label values RNLPN NOYESF
label values NURSEPR NOYESF
label values PHYSASST NOYESF
label values EMT NOYESF
label values MHPROV NOYESF
label values OTHPROV NOYESF
label values NODISP NODISPF
label values NOFU NOYESF
label values RETRNED NOYESF
label values RETREFFU NOYESF
label values LWBS NOYESF
label values LBTC NOYESF
label values LEFTAMA NOYESF
label values DOA NOYESF
label values DIEDED NOYESF
label values TRANNH NOYESF
label values TRANPSYC NOYESF
label values TRANOTH NOYESF
label values ADMITHOS NOYESF
label values OBSHOS NOYESF
label values OBSDIS NOYESF
label values OTHDISP NOYESF
label values ADMIT ADMITF
label values ADMTPHYS ADMTPHYSF
label values HDSTAT HDSTATF
label values ADISP ADISPF
label values STAY24 STAY24F
label values AGEFL AGEFLF
label values MSA MSAF
label values REGION REGIONF
label values BDATEFL IMPUTF
label values SEXFL IMPUTF
label values ETHNICFL IMPUTF
label values RACERFL IMPUTF
label values PRESCR1 PRESCRF
label values PRESCR2 PRESCRF
label values PRESCR3 PRESCRF
label values PRESCR4 PRESCRF
label values PRESCR5 PRESCRF
label values PRESCR6 PRESCRF
label values PRESCR7 PRESCRF
label values PRESCR8 PRESCRF
label values PRESCR9 PRESCRF
label values PRESCR10 PRESCRF
label values PRESCR11 PRESCRF
label values PRESCR12 PRESCRF
label values PRESCR13 PRESCRF
label values PRESCR14 PRESCRF
label values PRESCR15 PRESCRF
label values PRESCR16 PRESCRF
label values PRESCR17 PRESCRF
label values PRESCR18 PRESCRF
label values PRESCR19 PRESCRF
label values PRESCR20 PRESCRF
label values PRESCR21 PRESCRF
label values PRESCR22 PRESCRF
label values PRESCR23 PRESCRF
label values PRESCR24 PRESCRF
label values PRESCR25 PRESCRF
label values PRESCR26 PRESCRF
label values PRESCR27 PRESCRF
label values PRESCR28 PRESCRF
label values PRESCR29 PRESCRF
label values PRESCR30 PRESCRF
label values CONTSUB1 CONTSUBF
label values CONTSUB2 CONTSUBF
label values CONTSUB3 CONTSUBF
label values CONTSUB4 CONTSUBF
label values CONTSUB5 CONTSUBF
label values CONTSUB6 CONTSUBF
label values CONTSUB7 CONTSUBF
label values CONTSUB8 CONTSUBF
label values CONTSUB9 CONTSUBF
label values CONTSUB10 CONTSUBF
label values CONTSUB11 CONTSUBF
label values CONTSUB12 CONTSUBF
label values CONTSUB13 CONTSUBF
label values CONTSUB14 CONTSUBF
label values CONTSUB15 CONTSUBF
label values CONTSUB16 CONTSUBF
label values CONTSUB17 CONTSUBF
label values CONTSUB18 CONTSUBF
label values CONTSUB19 CONTSUBF
label values CONTSUB20 CONTSUBF
label values CONTSUB21 CONTSUBF
label values CONTSUB22 CONTSUBF
label values CONTSUB23 CONTSUBF
label values CONTSUB24 CONTSUBF
label values CONTSUB25 CONTSUBF
label values CONTSUB26 CONTSUBF
label values CONTSUB27 CONTSUBF
label values CONTSUB28 CONTSUBF
label values CONTSUB29 CONTSUBF
label values CONTSUB30 CONTSUBF
label values COMSTAT1 COMSTATF
label values COMSTAT2 COMSTATF
label values COMSTAT3 COMSTATF
label values COMSTAT4 COMSTATF
label values COMSTAT5 COMSTATF
label values COMSTAT6 COMSTATF
label values COMSTAT7 COMSTATF
label values COMSTAT8 COMSTATF
label values COMSTAT9 COMSTATF
label values COMSTAT10 COMSTATF
label values COMSTAT11 COMSTATF
label values COMSTAT12 COMSTATF
label values COMSTAT13 COMSTATF
label values COMSTAT14 COMSTATF
label values COMSTAT15 COMSTATF
label values COMSTAT16 COMSTATF
label values COMSTAT17 COMSTATF
label values COMSTAT18 COMSTATF
label values COMSTAT19 COMSTATF
label values COMSTAT20 COMSTATF
label values COMSTAT21 COMSTATF
label values COMSTAT22 COMSTATF
label values COMSTAT23 COMSTATF
label values COMSTAT24 COMSTATF
label values COMSTAT25 COMSTATF
label values COMSTAT26 COMSTATF
label values COMSTAT27 COMSTATF
label values COMSTAT28 COMSTATF
label values COMSTAT29 COMSTATF
label values COMSTAT30 COMSTATF
label values EMRED EMREDF
label values EHRINSE EHRINSF
label values HHSMUE HHSMUEF
label values OBSSEP OBSSEPF
label values OBSPHYSED OBSPHYSEDF
label values OBSHOSP OBSPHYSEDF
label values OBSPHYSOT OBSPHYSEDF
label values OBSPHYSUN OBSPHYSEDF
label values BOARD BOARDF
label values BOARDHOS BOARDHOSF
label values EXPSPACE EXPSPACF
label values SURGDAY SURGDAYF
label values BEDCZAR BEDCZARF
label values BEDDATA BEDDATAF
label values HLIST HLISTF
label values HLISTED HLISTEDF
label values AMBDIV AMBDIVF
label values TOTHRDIVR TOTHRDIVRF
label values REGDIV REGDIVF
label values ADMDIV ADMDIVF
label values INCSHX INCSHXF
label values INCPHYS INCSHXF
label values BEDREG BEDREGF
label values KIOSELCHK BEDREGF
label values CATRIAGE BEDREGF
label values IMBED BEDREGF
label values ADVTRIAG BEDREGF
label values PHYSPRACTRIA BEDREGF
label values FASTTRAK BEDREGF
label values EDPTOR BEDREGF
label values DASHBORD BEDREGF
label values RFID BEDREGF
label values WIRELESS BEDREGF
label values ZONENURS BEDREGF
label values POOLNURS BEDREGF
label values EDINFO BEDREGF
label values OBSCLIN BEDREGF
label values EDPRIM EDPRIMF
label values EDINFO EDINFOF
label values SETTYPE SETTYPF
label values EMEDRES YESNOUBF

saveold ed2022-stata, replace