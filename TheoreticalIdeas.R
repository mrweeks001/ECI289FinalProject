#From the Palm-Boeing article:
#What are the more fine, grained temporal patterns within an across metropolitan housing? 
#Conclusions from the article: A large portion of the rental market activity is not on data trails like census rental data. We want to explore the spatial patterns of housing that is represented by another dataset other than the Census. 
#Issues with census data: does not consider the unit of analysis

#CALCULATIONS:
#Affordability=Rent burdens and proportins of listings below the HUD fair market rents. 
#Rental power=how many sq. ft can be rented in each region for nationwide median rent: (Nationwide median rent)/(Regional Median rent per sq. ft.), p. 13

#VALIDATION METHODS
#Present reasoning for 'reasonable' value of upper and lower bound (13 and Table 2). 
#Have a validation method (e.g. t-tests to determine if the means of two samples are significantly different from each other--first check if th eGaussian condition are met (simple random sample and normal distributions))

#DEFININT OUR PARAMETERS AND TERMS
#REGION=Does the Census definition match up with the other dataset definition? How are Census geographies defined?


##FROM THE DATASET:
#CHALLENGE: Developing the right fit between available housing types and the income level of households is an important part of regional planning and development.



#Project Objective: The American Community Survey is a rolling five year survey that is used to acquire information on education, employment, income, and housing and transportation costs among others. These data are not full census data and are used to direct federal funding across several important programs. There is some question as to whether these data are sufficiently representative. The purpose of this project is to compare the Los Angeles rental data (required by the City when a landlord rents a unit in a multi-family unit) to that reported in the ACS. In addition, if the data sources are markedly different, are there any factors in which data vary along?

#The two datasets we will be using are:
Palm-ROI_downloadable_data
Palm-LosAngelesRentalCensus.csv

#STRATEGY
# Re-format and upload the datasets. 
# DATA CLEANING
#  1) Begin with data cleaning. Remove duplicates. 
# 2) Determine useful indicators to address the research questions. 
## 3) Define parameters for those indicators. Identify inconsistencies in definitions such as region. Define 'reasonable' ranges for upper and lower boundaries to remove externalities. See Table 2 (within the middle 99.6% of each variable's distribution)
#   3) Create a filtered data set based on those 'reasonable' ranges. 
# MERGE THE DATA
# Merge with the Census data
# DATA ANALYSIS
#  1) Analyze the data by region/district to assess housing characteristics and detect patterns. 
# 2) Analyze the data in relation to the census data: e.g. compare to national averages.
# 3) Map the geolocated data to analyze spatial patterns within and between districts. 
# PRESENT FINDINGS
# ggplot, graphing
# Make conclusions about the original challenge/research question. 
#  RMarkdown 

#Ways to match up the data:
ROI_12.15.14: County name
City Revenue: County name


#questions about the data
1) What is the difference between ROI_12.15.14 and ROI_old. Should we bother to look at the old one?