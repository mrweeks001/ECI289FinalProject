# LOAD THE DATASETS
#  The two datasets we will be using are:
#  Palm-ROI_downloadable_data.xls
#  Palm-LosAngelesRentalCensus.csv. 
#  Note that Palm-ROI_downloadable_data.xls has multiple tabs so we will upload them as separate CSV files. Do this for the tabs: ROI_12.14.14, City Revenue, JHFIT-places, and JHFIT-nhoods. Decide not to use the ROI_old tab or dictionary tabs. Select the tab “ROI_12.15.14,” save this as a CSV and rename as “Palm-ROI_12.15.14.csv” Remove the first row of meta column header. Then upload to R. Repeat for the other tabs. 

#  The Los Angeles Rental Census data: 
CensusDat = read.csv("Palm-LosAngelesRentalCensus.csv", sep=",", header=TRUE) #I had deleted the first header row for this csv file. Was running into issue deleting it with R alone. 
#  Individual CSV files for the ROI data:
ROIDat = read.csv("Palm-ROI_12.15.14.csv", sep=",", header=TRUE)
CityRevenue = read.csv("Palm-ROI_cityrevenue.csv", sep=",", header=TRUE)
Jplaces = read.csv("Palm-ROI_JHFIT-places.csv", sep=",", header=TRUE)
Jhoods = read.csv("Palm-ROI_JHFIT-nhoods.csv", sep=",", header=TRUE)

#EXAMINE THE DATASETS
#Begin with ROI data
head (ROIDat) #Need to remove the excess headers
colnames(ROIDat) = lapply(ROIDat[2,], as.character) #Assign row 2 names to the header and convert all the column names to character. 
ROIDat = ROIDat[-c(1:2), ] #Remove rows 1 and 2. 

#Now bring in the Census data
head(CensusDat)
#Remove the first column since this is not linked to anything:
CensusDat = CensusDat[, -1]

#Merge the data
#  Common variable: Census tract identifier. On the CensusDat this is GEOID. On ROIDat this is tract.	Census tract identification number is a Geographic identifier. 

colnames(CensusDat)=c("tract","ACS_MFRENTALS","ACS_Owners","ACS_SF_Rents","LUPAMS","HCIDLA","LUPAMS_RC","HCIDLA_RC") #Change the name in CensusDat from GEOID to tract. 
class(CensusDat$tract) #numeric
class(ROIDat$tract) #factor. Change to numeric: 
# ROIDat$tract = as.numeric(ROIDat$tract)
# class(ROIDat$tract) #numeric. ??It changed all the tracts to single digits. 
#No, it doesn't seem to matter that one is numeric and one is factor because when merge will take the highest level, in this case factor. 

MergedDat=merge(ROIDat,CensusDat) #Warning: column names ‘rflag_ecppl1’, ‘rflag_ecppl2’ are duplicated in the result. The problem is that there are two columns labeled rlfag_ecppl1 ("Homeownership reliability flag" and "Employment Rate reliability flag") and two columns labeled rlflag_ecppl2 ("Min. Basic Income reliability flag" and "Housing Cost Burden reliability flag"). Go back to the csv file and add an x to differentiate these two.
#Old issue: levels(ROIDat$rflag_ecppl1) #NULL levels. All the values are zero.
#Old issue: levels(ROIDat$rflag_ecppl2) #NULL levels. All the values are zero.
#These above issues were corrected by changing the csv file and re-running the code. 

MergedDat2=merge(ROIDat,CensusDat, by=="tract") #Error Error in by == "tract" : comparison (1) is possible only for atomic and list types. Possible question for Deb. 

#Observe the merged dataset. Notice there are 1,000 observations according to the CensusDat tract. 

##To Do: Edit the Excel document/CSV files before importing them. Convert all to numeric then hand select to keep some as factor.  
as.numeric(factor(ROIDat))

ROIDat = read.csv("Palm-ROI_12.15.14.csv", sep=",", header=TRUE, stringsAsFactors=FALSE) #Nope. This changes all to character. 


#To Do
#1) Subset ROI only for Los Angeles. 
#2) Match places to mergedDat

#COMPARISON
#Remove the rows for missing data. HCIDLA and ACS=0. 
#Look at regions for which ACS=0 and HCIDLA has a value. Are these regions where: There is no internet access (moppl3), there are fewer English speakers (soppl3), there are lower education rates (combine the education opportunity data), lower economic opportunity
#Look at regions for which ACS has a value and HCIDLA=0. 

#ACS ONLY: COMPARE THE PLACE DOMAINS TO THE PEOPLE DOMAINS # HOUSING OPPORTUNITY PLACE DOMAIN: Does housing affordability spatially correspond with education levels? With health levels? Do the same for housing adequcy?
#Do these 

#Do we have information on rental prices?



#Beginning exploratory
summary(MergedDat$ACS_MFRENTALS)
summary(MergedDat$HCIDLA)
summary(MergedDat$LUPAMS)

