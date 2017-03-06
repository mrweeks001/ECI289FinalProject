##---Unused code
#Missing values. Some of the values are <NULL>. Should I leave them or replace them with NA? Check to see if this is an issue: 
class(ROIDat$roi_people) #Factor
is.na.data.frame(ROIDat) #Best way to check for missing values?

#Transform the variables from factor to numeric
indx = sapply(ROIDat, is.factor)
ROIDat[indx] = lapply(ROIDat[indx], function(x) as.numeric(as.character(x)))
warnings() #NAs introduced by coercion. This is not a problem, right?
#Why didn't this work?: ROIDatTest=lapply(ROIDat, as.numeric) 


#Merge with Palm_ROI_cityrevenue dataset. First, subset this dataset for only Los Angeles. 
head(CityRevenue)
colnames(CityRevenue)=c("CityName","cntyname","TotalRevenue","LocalRevenue","pLocalRevenue","TotalRevPerCap","TotalPop","TotalPopMOE") #Change the name of the second row header. 
CityRevenueLA = subset (CityRevenue, cntyname=="Los Angeles") #Subset for only Los Angeles. 

#Add CityRevenue to the MergedData set. 
MergedDat2=merge(CityRevenueLA,MergedDat, by="cntyname")
#this issue is that cntyname is Factor in CityRevenue and cntyname is numeric in MergedDat.
#It multiplied 88 obs from CityRevenueLA by MergedDat 1,000 observations. Correct? NO. These are not comparable data sets. 