# CO2 Emissions Analysis Project

Analyzes global CO2 emissions (2008-2011) using R and Tableau. Built a linear regression model in R to predict CO2 emissions, then visualized results in Tableau with a focus on oil producers.

## Files
- `CO2_Emissions_Project.R`: R script for data cleaning and linear regression.
- `Predicted_CO2_Model.xlsx`: Dataset with R predictions for Tableau.

## Tableau Dashboard
View the interactive dashboard: [CO2 Emissions Dashboard]
(https://public.tableau.com/views/PredictedCO2RModel/CO2EmissionsDashboard2008-2011?:language=en-US&:sid=&:redirect=auth&:display_count=n&:origin=viz_share_link)

## Summary
Developed a Tableau dashboard with R-based predictions to analyze CO2 emissions, highlighting oil-producing countries for the energy sector.

## Objective
Enhanced a prior Tableau dashboard analyzing global CO2 emissions (2008–2011) by integrating a predictive model built in R, focusing on oil-producing countries for the oil and gas sector.

## R Analysis
- **Data**: Used three datasets (CO2 Emissions_data.csv, Energy Use_data.csv, GDP_data.csv) with columns: Country, CO2_Per_Capita, Energy_Per_Capita, GDP, Population.
- **Cleaning**: Merged datasets on Country. Converted columns to numeric, calculated GDP_Per_Capita (GDP / Population), and imputed NA values with medians to handle missing data.
- **Model**: Built a linear regression model to predict CO2_Per_Capita using Energy_Per_Capita and GDP_Per_Capita. Added predictions as Predicted_CO2 column to the data set.
- **Output**: Exported results to Predicted_CO2_Model.xlsx for Tableau. Resolved CSV write issues by confirming the working directory and adding debug print statements.

## Tableau Dashboard (Recreated in Tableau Public)
- **Data Source**: Connected to Predicted_CO2_Model.xlsx.
- **Visualizations**:
  - **Map of CO2 Emissions**: Showed CO2_Per_Capita by country with tooltips (Country, CO2_Per_Capita, Energy_Per_Capita).
  - **Scatter Plot CO2 vs. Energy**: Plotted CO2_Per_Capita vs. Energy_Per_Capita, sized by GDP_Per_Capita, colored by Oil_Producer (calculated field: IF [Country] IN ('Saudi Arabia', 'Kuwait', 'UAE', 'Qatar', 'Oman') THEN 'Oil Producer' ELSE 'Other' END).
  - **Scatter Plot Actual vs. Predicted CO2**: Plotted CO2_Per_Capita vs. Predicted_CO2, colored by Oil_Producer, with tooltips (Country, CO2_Per_Capita, Predicted_CO2).
  - **Bar Chart**: Displayed top 10 countries by CO2_Per_Capita.
- **Interactivity**: Added a single-select Oil_Producer filter (via worksheet Filters shelf) to focus on oil-producing countries in the dashboard page.

## Predictive Model Analysis Summary
- **Predictive Model Summary**: The linear regression model’s residuals are between -304.116 to 255.160 with a median near zero (-3.998), showing a balanced fit with some outliers like high-emission countries (Qatar) impacting accuracy. The coefficients Energy_Per_Capita (0.0017, p < 2e-16) and GDP_Per_Capita (0.0006, p = 0.0006) show as significant positive predictors. The intercept of 8.3357 (p = 0.038) indicates energy use and wealth strongly drive CO2 emissions. The model fit is solid, with a Multiple R-squared of 0.6467 and an F-statistic of 191.3 (p < 2.2e-16) explaining 64.67% of variability. Although the adjusted R-squared is (0.6433) and residual standard error (45.14) might suggest a potential further analysis to account for extreme values.
- **Summary**: The linear regression model indicates that higher energy use and GDP per capita significantly drive CO2 emissions, with oil-producing countries like Saudi Arabia and Qatar showing elevated levels due to their energy-intensive economies. Stakeholders should focus on reducing energy consumption and optimizing economic growth strategies to lower emissions, particularly in these high-impact regions.

## Conclusion
Energy use strongly predicts CO2 emissions while GDP also has a positive and significant impact with oil-producing countries like Qatar showing high emissions.

## Tableau Dashboard
View the interactive dashboard: [CO2 Emissions Dashboard](https://public.tableau.com/views/PredictedCO2RModel/CO2EmissionsDashboard2008-2011?:language=en-US&:sid=&:redirect=auth&:display_count=n&:origin=viz_share_link)
