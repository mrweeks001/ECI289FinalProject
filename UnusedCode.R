##---Unused code
#Missing values. Some of the values are <NULL>. Should I leave them or replace them with NA? Check to see if this is an issue: 
class(ROIDat$roi_people) #Factor
is.na.data.frame(ROIDat) #Best way to check for missing values?

#Transform the variables from factor to numeric
indx = sapply(ROIDat, is.factor)
ROIDat[indx] = lapply(ROIDat[indx], function(x) as.numeric(as.character(x)))
warnings() #NAs introduced by coercion. This is not a problem, right?
#Why didn't this work?: ROIDatTest=lapply(ROIDat, as.numeric) 