capture log close
cd "/Users/luiselizondogracia/documents/GitHub/seniorthesis/dofiles/logs"
log using 2021_Data_Complete.log, replace

clear all



					* 2021 * Note, 2021 files contain data obtained during 2020!
					
					
				
					* Convert DBF to DTA files *

cd "/Users/luiselizondogracia/documents/GitHub/seniorthesis/data/original/2021/administracion_cngmd2021_csv/conjunto_de_datos"			
insheet using "admncion_cngmd2021.csv", comma clear
save "/Users/luiselizondogracia/documents/GitHub/seniorthesis/data/original/2021/administracion_cngmd2021_csv/conjunto_de_datos/admncion_cngmd2021.dta", replace
insheet using "cuotafij_cngmd2021.csv", comma clear
save "/Users/luiselizondogracia/documents/GitHub/seniorthesis/data/original/2021/administracion_cngmd2021_csv/conjunto_de_datos/cuotafij_cngmd2021.dta", replace
insheet using "mediadop_cngmd2021.csv", comma clear
save "/Users/luiselizondogracia/documents/GitHub/seniorthesis/data/original/2021/administracion_cngmd2021_csv/conjunto_de_datos/mediadop_cngmd2021.dta", replace
insheet using "reciboag_cngmd2021.csv", comma clear
save "/Users/luiselizondogracia/documents/GitHub/seniorthesis/data/original/2021/administracion_cngmd2021_csv/conjunto_de_datos/reciboag_cngmd2021.dta", replace
insheet using "servmedi_cngmd2021.csv", comma clear
save "/Users/luiselizondogracia/documents/GitHub/seniorthesis/data/original/2021/administracion_cngmd2021_csv/conjunto_de_datos/servmedi_cngmd2021.dta", replace

clear

cd "/Users/luiselizondogracia/documents/GitHub/seniorthesis/data/original/2021/programas_servicio_agua_cngmd2021_csv/conjunto_de_datos"			
insheet using "aguaprog_cngmd2021.csv", comma clear
save "/Users/luiselizondogracia/documents/GitHub/seniorthesis/data/original/2021/programas_servicio_agua_cngmd2021_csv/conjunto_de_datos/aguaprog_cngmd2021.dta", replace
insheet using "programs_cngmd2021.csv", comma clear
save "/Users/luiselizondogracia/documents/GitHub/seniorthesis/data/original/2021/programas_servicio_agua_cngmd2021_csv/conjunto_de_datos/programs_cngmd2021.dta", replace
clear

					* Merger *
clear

cd "/Users/luiselizondogracia/documents/GitHub/seniorthesis/data/modified/2021"		
* Merge #1 *	
use "/Users/luiselizondogracia/documents/GitHub/seniorthesis/data/original/2021/administracion_cngmd2021_csv/conjunto_de_datos/admncion_cngmd2021.dta"
merge 1:1 folio using "/Users/luiselizondogracia/documents/GitHub/seniorthesis/data/original/2021/programas_servicio_agua_cngmd2021_csv/conjunto_de_datos/programs_cngmd2021.dta", gen(aaa116)
save "/Users/luiselizondogracia/documents/GitHub/seniorthesis/data/modified/2021/2021_Merged", replace	

log close





					* Mergers * 
					

clear

cd "/Users/luiselizondogracia/Desktop/Research Project/Agua Ciudad de Mexico/New Work/Set up/Original Data & dbt to dta conversion /2019/Convert"
					
* Merge #1 *
use encig2019_03_sec_6.dta
drop if N_TRA!="02"
merge 1:1 ID_VIV using encig2019_01_sec1_3_4_5_8_9_10.dta, gen (sec11)
save "/Users/luiselizondogracia/Desktop/Research Project/Agua Ciudad de Mexico/New Work/Set up/Original Data & dbt to dta conversion /2019/Mergers/m_19_drop03sec6_01sec13468910.dta", replace
clear

* Merge #2 *
use encig2019_04_sec_7.dta
drop if N_TRA!="02"
cd "/Users/luiselizondogracia/Desktop/Research Project/Agua Ciudad de Mexico/New Work/Set up/Original Data & dbt to dta conversion /2019/Mergers"
merge 1:1 ID_VIV using m_19_drop03sec6_01sec13468910.dta, gen (sec2)
save "/Users/luiselizondogracia/Desktop/Research Project/Agua Ciudad de Mexico/New Work/Set up/Original Data & dbt to dta conversion /2019/Mergers/m_19_drop04sec7_drop03sec6_01sec13468910.dta", replace
clear

* Merge #3 *
cd "/Users/luiselizondogracia/Desktop/Research Project/Agua Ciudad de Mexico/New Work/Set up/Original Data & dbt to dta conversion /2019/Convert"
use encig2019_05_sec_8.dta
drop if N_TRA!="02"
cd "/Users/luiselizondogracia/Desktop/Research Project/Agua Ciudad de Mexico/New Work/Set up/Original Data & dbt to dta conversion /2019/Mergers"
merge 1:1 ID_VIV using m_19_drop04sec7_drop03sec6_01sec13468910.dta, gen (sec3)
save "/Users/luiselizondogracia/Desktop/Research Project/Agua Ciudad de Mexico/New Work/Set up/Original Data & dbt to dta conversion /2019/Mergers/m_19_drop5sec8_drop04sec7_drop03sec6_01sec13468910.dta", replace
clear

* Merge #4 *
cd "/Users/luiselizondogracia/Desktop/Research Project/Agua Ciudad de Mexico/New Work/Set up/Original Data & dbt to dta conversion /2019/Convert"
use encig2019_02_residentes_sec_2.dta
cd "/Users/luiselizondogracia/Desktop/Research Project/Agua Ciudad de Mexico/New Work/Set up/Original Data & dbt to dta conversion /2019/Mergers"
merge 1:1 ID_PER using m_19_drop5sec8_drop04sec7_drop03sec6_01sec13468910.dta, gen (sec4)
save "/Users/luiselizondogracia/Desktop/Research Project/Agua Ciudad de Mexico/New Work/Set up/Original Data & dbt to dta conversion /2019/Mergers/m_19_02residentes2_drop5sec8_drop04sec7_drop03sec6_01sec13468910.dta", replace
clear


			
					* Variable Manipulation * 
					

clear

cd "/Users/luiselizondogracia/Desktop/Research Project/Agua Ciudad de Mexico/New Work/Set up/Original Data & dbt to dta conversion /2019/Mergers"

use m_19_02residentes2_drop5sec8_drop04sec7_drop03sec6_01sec13468910.dta
					
* Destring important variables *
destring P6_1 P4_1A P4_1B P4_2B EDAD NIV P1_1 P1_2 P3_1_99 P5_1_7 P5_1_7 P4_1_1 P4_1_2 P4_1_3 P4_1_4 P4_1_5 P4_1_6 P4_1_7 P4_1A P4_1B, replace

* Drop as these represent unspecified age *
drop if EDAD==98
drop if EDAD==99
drop if EDAD==.

* Water Related Questions P4's *
drop if P4_1A == 9
drop if P4_1A == .

forvalues i = 1/7 {
	drop if P4_1_`i' == 9
	gen P4_1_`i'R = P4_1_`i' 
	recode P4_1_`i'R (1=1) (2=0)
}
drop P4_1_4 P4_1_4R
	* Confusing wording ^ *

gene P4_1AR = 5 if P4_1A == 1
replace P4_1AR = 4 if P4_1A == 2
replace P4_1AR = 3 if P4_1A == 3
replace P4_1AR = 2 if P4_1A == 4
replace P4_1AR = 1 if P4_1A == 5
replace P4_1AR = 0 if P4_1A == 6

* Generate a binary variable for education, 1 = preparatoria + *
generate NIV_R = NIV
recode NIV_R (0/5=0) (6/9=1)
destring NIV_R, replace
drop if NIV==.

* Generate regressionable variable for P6_1 * 
gene P6_1R=0 if P6_1==2
replace P6_1R=1 if P6_1==1
destring P6_1R, replace

* Create unique variable for each Municipio in the database (can repeat across states) *
gen MUN_INDEX = ENT + MUN
destring MUN_INDEX, replace
sort MUN_INDEX

* Create binary variable for Sex *
destring SEX, replace
recode SEX (1=0) (2=1)
rename SEXO SEX

* Create variable for time spent on tramite *
destring P7_5D_H, replace
destring P7_5D_M, replace
gene TRAMITE_HRS = P7_5D_H * 60
gene TRAMITE_TIEMPO = TRAMITE_HRS + P7_5D_M
egen TRAMITE_TIEMPO_M=mean(TRAMITE_TIEMPO), by(MUN_INDEX)

* Tramite Manipulation *
forvalues I=1/11 {
	destring P7_4_`I', replace
	gene P7_4_`I'R = 1 if P7_4_`I' == 2
	replace P7_4_`I'R = 0 if P7_4_`I' == 1
	
	egen P7_4_`I'M=mean(P7_4_`I'R), by(MUN_INDEX)
}

** Flip variable, from lower values = higher rating to higher values = higher rating **
** Generate a mean for each MUN_INDEX for each defined variable **
forvalues I=6/7 {
	destring P7_`I', replace
	gene P7_`I'R = 5 if P7_`I' == 1
	replace P7_`I'R = 4 if P7_`I' == 2
	replace P7_`I'R = 3 if P7_`I' == 3
	replace P7_`I'R = 2 if P7_`I' == 4
	replace P7_`I'R = 1 if P7_`I' == 5
	replace P7_`I'R = 0 if P7_`I' == 6
	egen P7_`I'M=mean(P7_`I'R), by(MUN_INDEX)
}

* Generate a mean for NIV and P6_1 for each MUN_INDEX *
egen NIV_M=mean(NIV_R), by(MUN_INDEX)
egen P6_1M=mean(P6_1R), by(MUN_INDEX)

* Generate Aggregates *
gen CALIDAD_DE_SERVICIO_DE_AGUA = P4_1_1R + P4_1_2R + P4_1_3R
egen CALIDAD_DE_SERVICIO_DE_AGUA_M=mean(CALIDAD_DE_SERVICIO_DE_AGUA), by(MUN_INDEX)

gen CALIDAD_DE_TRAMITE = P7_4_1R + P7_4_3R + P7_4_4R + P7_4_5R + P7_4_9R + P7_4_10R
egen CALIDAD_DE_TRAMITE_M=mean(CALIDAD_DE_TRAMITE), by(MUN_INDEX)

* Generate dummy variables for manera de pago de tramite *
destring P7_3, replace

gen TRAMITE_GOB = 1 if P7_3==1
replace TRAMITE_GOB = 0 if P7_3==2
replace TRAMITE_GOB = 0 if P7_3==3
replace TRAMITE_GOB = 0 if P7_3==4
replace TRAMITE_GOB = 0 if P7_3==5
replace TRAMITE_GOB = 0 if P7_3==6
replace TRAMITE_GOB = 0 if P7_3==7
replace TRAMITE_GOB = 0 if P7_3==8
replace TRAMITE_GOB = 0 if P7_3==9
egen TRAMITE_GOB_M=max(TRAMITE_GOB), by(MUN_INDEX)

gen TRAMITE_BANCO_SUPERM_FARM = 1 if P7_3==2
replace TRAMITE_BANCO_SUPERM_FARM = 0 if P7_3==1
replace TRAMITE_BANCO_SUPERM_FARM = 0 if P7_3==3
replace TRAMITE_BANCO_SUPERM_FARM = 0 if P7_3==4
replace TRAMITE_BANCO_SUPERM_FARM = 0 if P7_3==5
replace TRAMITE_BANCO_SUPERM_FARM = 0 if P7_3==6
replace TRAMITE_BANCO_SUPERM_FARM = 0 if P7_3==7
replace TRAMITE_BANCO_SUPERM_FARM = 0 if P7_3==8
replace TRAMITE_BANCO_SUPERM_FARM = 0 if P7_3==9
egen TRAMITE_BANCO_SUPERM_FARM_M=max(TRAMITE_BANCO_SUPERM_FARM), by(MUN_INDEX)

gen TRAMITE_TELEFONO = 1 if P7_3==3
replace TRAMITE_TELEFONO = 0 if P7_3==1
replace TRAMITE_TELEFONO = 0 if P7_3==2
replace TRAMITE_TELEFONO = 0 if P7_3==4
replace TRAMITE_TELEFONO = 0 if P7_3==5
replace TRAMITE_TELEFONO = 0 if P7_3==6
replace TRAMITE_TELEFONO = 0 if P7_3==7
replace TRAMITE_TELEFONO = 0 if P7_3==8
replace TRAMITE_TELEFONO = 0 if P7_3==9
egen TRAMITE_TELEFONO_M=max(TRAMITE_TELEFONO), by(MUN_INDEX)

gen TRAMITE_INTERNET = 1 if P7_3==4
replace TRAMITE_INTERNET = 0 if P7_3==1
replace TRAMITE_INTERNET = 0 if P7_3==2
replace TRAMITE_INTERNET = 0 if P7_3==3
replace TRAMITE_INTERNET = 0 if P7_3==5
replace TRAMITE_INTERNET = 0 if P7_3==6
replace TRAMITE_INTERNET = 0 if P7_3==7
replace TRAMITE_INTERNET = 0 if P7_3==8
replace TRAMITE_INTERNET = 0 if P7_3==9
egen TRAMITE_INTERNET_M=max(TRAMITE_INTERNET), by(MUN_INDEX)

gen TRAMITE_CAJERO = 1 if P7_3==5
replace TRAMITE_CAJERO = 0 if P7_3==1
replace TRAMITE_CAJERO = 0 if P7_3==2
replace TRAMITE_CAJERO = 0 if P7_3==3
replace TRAMITE_CAJERO = 0 if P7_3==4
replace TRAMITE_CAJERO = 0 if P7_3==6
replace TRAMITE_CAJERO = 0 if P7_3==7
replace TRAMITE_CAJERO = 0 if P7_3==8
replace TRAMITE_CAJERO = 0 if P7_3==9
egen TRAMITE_CAJERO_M=max(TRAMITE_CAJERO), by(MUN_INDEX)

gen TRAMITE_TEMPORAL_MOVIL = 1 if P7_3==6
replace TRAMITE_TEMPORAL_MOVIL = 0 if P7_3==1
replace TRAMITE_TEMPORAL_MOVIL = 0 if P7_3==2
replace TRAMITE_TEMPORAL_MOVIL = 0 if P7_3==3
replace TRAMITE_TEMPORAL_MOVIL = 0 if P7_3==4
replace TRAMITE_TEMPORAL_MOVIL = 0 if P7_3==5
replace TRAMITE_TEMPORAL_MOVIL = 0 if P7_3==7
replace TRAMITE_TEMPORAL_MOVIL = 0 if P7_3==8
replace TRAMITE_TEMPORAL_MOVIL = 0 if P7_3==9
egen TRAMITE_TEMPORAL_MOVIL_M=max(TRAMITE_TEMPORAL_MOVIL), by(MUN_INDEX)

gen TRAMITE_NO = 1 if P7_3==7
replace TRAMITE_NO = 0 if P7_3==1
replace TRAMITE_NO = 0 if P7_3==2
replace TRAMITE_NO = 0 if P7_3==3
replace TRAMITE_NO = 0 if P7_3==4
replace TRAMITE_NO = 0 if P7_3==5
replace TRAMITE_NO = 0 if P7_3==6
replace TRAMITE_NO = 0 if P7_3==8
replace TRAMITE_NO = 0 if P7_3==9
egen TRAMITE_NO_M=max(TRAMITE_NO), by(MUN_INDEX)

gen TRAMITE_OTROS = 1 if P7_3==8
replace TRAMITE_OTROS = 0 if P7_3==1
replace TRAMITE_OTROS = 0 if P7_3==2
replace TRAMITE_OTROS = 0 if P7_3==3
replace TRAMITE_OTROS = 0 if P7_3==4
replace TRAMITE_OTROS = 0 if P7_3==5
replace TRAMITE_OTROS = 0 if P7_3==6
replace TRAMITE_OTROS = 0 if P7_3==7
replace TRAMITE_OTROS = 0 if P7_3==9
egen TRAMITE_OTROS_M=max(TRAMITE_OTROS), by(MUN_INDEX)

gen TRAMITE_NO_SABE = 1 if P7_3==9
replace TRAMITE_NO_SABE = 0 if P7_3==1
replace TRAMITE_NO_SABE = 0 if P7_3==2
replace TRAMITE_NO_SABE = 0 if P7_3==3
replace TRAMITE_NO_SABE = 0 if P7_3==4
replace TRAMITE_NO_SABE = 0 if P7_3==5
replace TRAMITE_NO_SABE = 0 if P7_3==6
replace TRAMITE_NO_SABE = 0 if P7_3==7
replace TRAMITE_NO_SABE = 0 if P7_3==8
egen TRAMITE_NO_SABE_M=max(TRAMITE_NO_SABE), by(MUN_INDEX)

* Generate a variable that can be weighted for scatterplots using the population # of each Municipio *
egen POP_MUN_INDEX=count(MUN_INDEX), by(MUN_INDEX)

* Recoding Estados with new variables *
gene ENT_CDMX_Chiapas_NL="Ciudad de México" if ENT=="09"
replace ENT_CDMX_Chiapas_NL="Chiapas" if ENT=="07"
replace ENT_CDMX_Chiapas_NL="Nuevo León" if ENT=="19"

gene ENT_NOM="Aguascalientes" if ENT=="01"
replace ENT_NOM="Baja California" if ENT=="02"
replace ENT_NOM="Baja California Sur" if ENT=="03"
replace ENT_NOM="Campeche" if ENT=="04"
replace ENT_NOM="Coahuila" if ENT=="05"
replace ENT_NOM="Colima" if ENT=="06"
replace ENT_NOM="Chiapas" if ENT=="07"
replace ENT_NOM="Chihuahua" if ENT=="08"
replace ENT_NOM="Ciudad de México" if ENT=="09"
replace ENT_NOM="Durango" if ENT=="10"
replace ENT_NOM="Guanajuato" if ENT=="11"
replace ENT_NOM="Guerrero" if ENT=="12"
replace ENT_NOM="Hidalgo" if ENT=="13"
replace ENT_NOM="Jalisco" if ENT=="14"
replace ENT_NOM="Estado de México" if ENT=="15"
replace ENT_NOM="Michoacán" if ENT=="16"
replace ENT_NOM="Morelos" if ENT=="17"
replace ENT_NOM="Nayarit" if ENT=="18"
replace ENT_NOM="Nuevo León" if ENT=="19"
replace ENT_NOM="Oaxaca" if ENT=="20"
replace ENT_NOM="Puebla" if ENT=="21"
replace ENT_NOM="Querétaro" if ENT=="22"
replace ENT_NOM="Quintana Roo" if ENT=="23"
replace ENT_NOM="San Luis Potosí" if ENT=="24"
replace ENT_NOM="Sinaloa" if ENT=="25"
replace ENT_NOM="Sonora" if ENT=="26"
replace ENT_NOM="Tabasco" if ENT=="27"
replace ENT_NOM="Tamaulipas" if ENT=="28"
replace ENT_NOM="Tlaxcala" if ENT=="29"
replace ENT_NOM="Veracruz" if ENT=="30"
replace ENT_NOM="Yucatán" if ENT=="31"
replace ENT_NOM="Zacatecas" if ENT=="32"

reg P6_1R EDAD NIV_R CALIDAD_DE_SERVICIO_DE_AGUA CALIDAD_DE_TRAMITE_M if ENT=="09", robust

save "/Users/luiselizondogracia/Desktop/Research Project/Agua Ciudad de Mexico/New Work/Set up/Original Data & dbt to dta conversion /2019/Variable Manipulation/m_19_Variable_Manipulation_02residentes2_drop5sec8_drop04sec7_drop03sec6_01sec13468910.dta", replace
clear



					* Collapse * 
					

clear

cd "/Users/luiselizondogracia/Desktop/Research Project/Agua Ciudad de Mexico/New Work/Set up/Original Data & dbt to dta conversion /2019/Variable Manipulation"
use m_19_Variable_Manipulation_02residentes2_drop5sec8_drop04sec7_drop03sec6_01sec13468910

destring ENT, replace
collapse (mean) P6_1M ENT POP_MUN_INDEX EDAD NIV_M CALIDAD_DE_SERVICIO_DE_AGUA CALIDAD_DE_TRAMITE, by (MUN_INDEX)
save "/Users/luiselizondogracia/Desktop/Research Project/Agua Ciudad de Mexico/New Work/Set up/Original Data & dbt to dta conversion /2019/Collapse/19_Mean_Collapse.dta", replace

use m_19_Variable_Manipulation_02residentes2_drop5sec8_drop04sec7_drop03sec6_01sec13468910.dta
collapse (max) TRAMITE_INTERNET, by (MUN_INDEX)
save "/Users/luiselizondogracia/Desktop/Research Project/Agua Ciudad de Mexico/New Work/Set up/Original Data & dbt to dta conversion /2019/Collapse/19_Max_Collapse.dta", replace
clear



					* Merge *
					

clear

cd "/Users/luiselizondogracia/Desktop/Research Project/Agua Ciudad de Mexico/New Work/Set up/Original Data & dbt to dta conversion /2019/Collapse"

use 19_Mean_Collapse.dta
merge 1:1 MUN_INDEX using 19_Max_Collapse.dta, gen (s0001)
drop s0001
gene YEAR = 2019

save "/Users/luiselizondogracia/Desktop/Research Project/Agua Ciudad de Mexico/New Work/Set up/Original Data & dbt to dta conversion /2019/Final Product/DATA_2019.dta", replace

clear


* Collapse 2
					

clear

cd "/Users/luiselizondogracia/Desktop/Research Project/Agua Ciudad de Mexico/New Work/Set up/Original Data & dbt to dta conversion /2019/Variable Manipulation"
use m_19_Variable_Manipulation_02residentes2_drop5sec8_drop04sec7_drop03sec6_01sec13468910
destring ENT, replace
gene YEAR = 2019
keep P6_1R ENT MUN_INDEX POP_MUN_INDEX EDAD NIV_R SEX CALIDAD_DE_SERVICIO_DE_AGUA CALIDAD_DE_TRAMITE_M YEAR P4_1_1R P4_1_2R P4_1_3R P4_1_5R P4_1_6R P4_1_7R P4_1AR P4_1B

save "/Users/luiselizondogracia/Desktop/Research Project/Agua Ciudad de Mexico/New Work/Set up/Original Data & dbt to dta conversion /2019/Final Product/19_New.dta", replace

clear

log close
