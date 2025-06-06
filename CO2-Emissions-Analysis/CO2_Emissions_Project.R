


#Load libraries
library(tidyverse)

#Importing csv datasets into RStudio
co2_data <- read.csv("CO2 Emissions_data.csv")
head(co2_data)

energy_data <- read.csv("Energy Use_data.csv")
head(energy_data)

gdp_data <- read.csv("GDP_data.csv")
head(gdp_data)

---------------------------------------------------------------
  
#Rename columns to simplify cleaning
colnames(co2_data) <- c("Country", "Latitude", "Longitude", "CO2_Per_Capita")
colnames(energy_data) <- c("Country", "Latitude", "Longitude", "Energy_Per_Capita")
colnames(gdp_data) <- c("Country", "Latitude", "Longitude", "GDP", "Population")

---------------------------------------------------------------

#Merge datasets to one single dataset for analysis
merged_data <- co2_data %>%
  inner_join(energy_data, by= "Country") %>%
  inner_join(gdp_data, by= "Country") %>%
  select(Country, CO2_Per_Capita, Energy_Per_Capita, GDP, Population)

head(merged_data, 20)

----------------------------------------------------------------

#Convert col data types to numeric for predictive variables
#Calculated GDP_Per_Capita for use in predictive analysis
merged_data <- merged_data %>%
  mutate(
    CO2_Per_Capita= as.numeric(as.character(CO2_Per_Capita)),
    Energy_Per_Capita= as.numeric(as.character(Energy_Per_Capita)),
    GDP= as.numeric(as.character(GDP)),
    Population= as.numeric(as.character(Population)),
    GDP_Per_Capita= ifelse(Population > 0, GDP / Population, NA)
  )

head(merged_data, 20)

-----------------------------------------------------------------

#Handle NA values with median
merged_data <- merged_data %>%
  mutate(
    CO2_Per_Capita= ifelse(is.na(CO2_Per_Capita), median(CO2_Per_Capita, na.rm= TRUE), CO2_Per_Capita),
    Energy_Per_Capita= ifelse(is.na(Energy_Per_Capita), median(Energy_Per_Capita, na.rm= TRUE), Energy_Per_Capita),
    GDP_Per_Capita= ifelse(is.na(GDP_Per_Capita), median(GDP_Per_Capita, na.rm= TRUE), GDP_Per_Capita)
  )

head(merged_data, 50)

------------------------------------------------------------------

#Check for remaining NA values
if (any(is.na(merged_data[, c("CO2_Per_Capita", "Energy_Per_Capita", "GDP_Per_Capita")]))) {
  print("Rows with NA values:")
  print(merged_data[is.na(merged_data$CO2_Per_Capita) | is.na(merged_data$Energy_Per_Capita) | is.na(merged_data$GDP_Per_Capita), ])
  stop("NA values remain")
}

------------------------------------------------------------------

#Linear regression model
model <- lm(CO2_Per_Capita ~ Energy_Per_Capita + GDP_Per_Capita, data= merged_data)
summary(model)

------------------------------------------------------------------

#Add predictions to dataset
merged_data$Predicted_CO2 <- predict(model, merged_data)

head(merged_data, 20)

------------------------------------------------------------------

#Export CSV for Tableau
getwd()

write.csv(merged_data, "Predicted_CO2_Model.csv", row.names = FALSE)
print("CSV written successfully")



