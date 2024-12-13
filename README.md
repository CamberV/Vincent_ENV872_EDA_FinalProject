# Vincent_ENV872_EDA_FinalProject

Created by Camber Vincent for Environmental Data Analytics (ENV872) Fall 2024. 

## Project Title 

Visualizing the EPA's eGRID Database.

## Summary

This purpose of this project repository is to provide the data and code necessary to construct an interactive Shiny dashboard where users can interact with data from the EPA's eGRID database. 

**Context**: The EPA’s eGRID dataset provides comprehensive data on power generation, fuel type, and associated environmental impacts for US electricity generation. My project will focus on creating a Shiny dashboard for visualization and spatial comparison of the eGRID data to understand regional energy profiles and their environmental effects.

**Purpose**: The purpose of this project is to explore the use of Shiny dashboards in data visualization and how they play a unique role in environmental data analtics due to their interactive and dynamic nature. This specific proejct attempts to visualize how power generation's associated pollution varies spatially across the United States, allowing users to select the type of emission to analyze(output emission, input emission, non-baseload emission), the pollutant of choice (CO2, NOX, SO2, CH4, N2O, CO2eq), and the spatial level (EPA subregion, state) to explore various combinations that may to visual conclusions of where certain types of pollution are concentrated.

The final Shiny Dashboard can be accessed online at https://cambervincent.shinyapps.io/EDAFinalProjectCV2024/

The structure of this GitHub repository is modified from a provided exemplar in order to meet the needs of an R Shiny Dashboard final project rather than the traditional final project format.

## Investigators

Camber Vincent | Master's of Environmental Management Candidate '26 | Duke Nicholas School of the Environment | cav33@duke.edu

## Keywords

emissions, EPA, electric grid, subregion, carbon dioxide, CO2 equivalent, pollution, energy, generation, power production

## Database Information

The primary dataset used in this visualization was the EPA's eGRID database which can be accessed at https://www.epa.gov/egrid/download-data. The most recent data release was January 30, 2024 and the database was originally accessed on December 1, 2024. The data is originally downloaded as a full .xlsx file (egrid2022_data.xlsx), which was further extracted into two individual .xlsx files for further analysis (StateData.xlsx and SubgridData.xlsx).

## Folder structure

• **Data Folder**: includes all accessed raw data from the EPA, including the original eGRID 2022 data and associated subregion shapefiles.

• **rsconnect Folder**: includes relevant .dcf file to connect the produced ShinyApp from a personal RStudio hub to a cloud hub, making the final Shiny app accessible online.

## Metadata

Data in the intial eGRID database includes over 150 columns of information. For the information on the full dataset, see the technical guide which can be accessed online at https://www.epa.gov/egrid/egrid-technical-guide.

The information for the different emission selections users can make is as follows: 
| **Emission Type**       | **Description**                                  |
|-----------------|-------------------------------------------------|
| Output Emission Rate       | Represents the amount of pollutant emissions per unit of electricity generated (lb/MWh). It measures the emissions directly associated with power plant outputs      |
| Input Emission Rate        | Represents the amount of pollutant emissions per unit of fuel consumed (lb/MMBtu). This metric provides insight into the efficiency and environmental impact of fuel usage at power plants.              | 
| Non-baseload Emision Rate  | Represents the emissions rate for electricity generated above a plant’s minimum operational level (lb/MWh). Non-baseload emission rates focus on the variability of power generation, often reflecting emissions from peaking or cycling plants.              |

The information for the final codes of information used in the Shiny visualization is as follows:

| **Code**       | **Description**                                  | **Unit**     |
|-----------------|-------------------------------------------------|--------------|
| `SRCO2RTA`     | Subregion CO2 Output Emission Rate              | lb/MWh       |
| `SRNOXRTA`     | Subregion NOX Output Emission Rate              | lb/MWh       |
| `SRSO2RTA`     | Subregion SO2 Output Emission Rate              | lb/MWh       |
| `SRCH4RTA`     | Subregion CH4 Output Emission Rate              | lb/MWh       |
| `SRN2ORTA`     | Subregion N2O Output Emission Rate              | lb/MWh       |
| `SRC2ERTA`     | Subregion CO2eq Output Emission Rate            | lb/MWh       |
| `SRCO2NB`      | Subregion CO2 Non-Baseload Emission Rate        | lb/MWh       |
| `SRNOXNB`      | Subregion NOX Non-Baseload Emission Rate        | lb/MWh       |
| `SRSO2NB`      | Subregion SO2 Non-Baseload Emission Rate        | lb/MWh       |
| `SRCH4NB`      | Subregion CH4 Non-Baseload Emission Rate        | lb/MWh       |
| `SRN2ONB`      | Subregion N2O Non-Baseload Emission Rate        | lb/MWh       |
| `SRC2ENB`      | Subregion CO2eq Non-Baseload Emission Rate      | lb/MWh       |
| `SRCO2RA`      | Subregion CO2 Input Emission Rate               | lb/MMBtu     |
| `SRNOXRA`      | Subregion NOX Input Emission Rate               | lb/MMBtu     |
| `SRSO2RA`      | Subregion SO2 Input Emission Rate               | lb/MMBtu     |
| `SRCH4RA`      | Subregion CH4 Input Emission Rate               | lb/MMBtu     |
| `SRN2ORA`      | Subregion N2O Input Emission Rate               | lb/MMBtu     |
| `SRC2ERA`      | Subregion CO2eq Input Emission Rate             | lb/MMBtu     |
| `STCO2RTA`     | State CO2 Output Emission Rate                  | lb/MWh       |
| `STNOXRTA`     | State NOX Output Emission Rate                  | lb/MWh       |
| `STSO2RTA`     | State SO2 Output Emission Rate                  | lb/MWh       |
| `STCH4RTA`     | State CH4 Output Emission Rate                  | lb/MWh       |
| `STN2ORTA`     | State N2O Output Emission Rate                  | lb/MWh       |
| `STC2ERTA`     | State CO2eq Output Emission Rate                | lb/MWh       |
| `STCO2NB`      | State CO2 Non-Baseload Emission Rate            | lb/MWh       |
| `STNOXNB`      | State NOX Non-Baseload Emission Rate            | lb/MWh       |
| `STSO2NB`      | State SO2 Non-Baseload Emission Rate            | lb/MWh       |
| `STCH4NB`      | State CH4 Non-Baseload Emission Rate            | lb/MWh       |
| `STN2ONB`      | State N2O Non-Baseload Emission Rate            | lb/MWh       |
| `STC2ENB`      | State CO2eq Non-Baseload Emission Rate          | lb/MWh       |
| `STCO2RA`      | State CO2 Input Emission Rate                   | lb/MMBtu     |
| `STNOXRA`      | State NOX Input Emission Rate                   | lb/MMBtu     |
| `STSO2RA`      | State SO2 Input Emission Rate                   | lb/MMBtu     |
| `STCH4RA`      | State CH4 Input Emission Rate                   | lb/MMBtu     |
| `STN2ORA`      | State N2O Input Emission Rate                   | lb/MMBtu     |
| `STC2ERA`      | State CO2eq Input Emission Rate                 | lb/MMBtu     |

Additionally, the eGRID subregion acronyms are as follows:

| **Code** | **eGRID Subregion Name**       |
|----------|--------------------------------|
| AKGD     | ASCC Alaska Grid              |
| AKMS     | ASCC Miscellaneous            |
| AZNM     | WECC Southwest                |
| CAMX     | WECC California               |
| ERCT     | ERCOT All                     |
| FRCC     | FRCC All                      |
| HIMS     | HICC Miscellaneous            |
| HIOA     | HICC Oahu                     |
| MROE     | MRO East                      |
| MROW     | MRO West                      |
| NEWE     | NPCC New England              |
| NWPP     | WECC Northwest                |
| NYCW     | NPCC NYC/Westchester          |
| NYLI     | NPCC Long Island              |
| NYUP     | NPCC Upstate NY               |
| PRMS     | Puerto Rico Miscellaneous     |
| RFCE     | RFC East                      |
| RFCM     | RFC Michigan                  |
| RFCW     | RFC West                      |
| RMPA     | WECC Rockies                  |
| SPNO     | SPP North                     |
| SPSO     | SPP South                     |
| SRMV     | SERC Mississippi Valley       |
| SRMW     | SERC Midwest                  |
| SRSO     | SERC South                    |
| SRTV     | SERC Tennessee Valley         |
| SRVC     | SERC Virginia/Carolina        |

## Scripts and Code

There are three primary scripts contained in the repository, the global.R, server.R, and ui.R files necessary to build a Shiny app in RStudio. All three scripts must be present for the Shiny to appropriately render. The *ui.R* file dictates the structure of the interactive dashboard and builds the app interface. The *server.R* file processes user inputs, performs appropriate computations, and generates outputs. The *global.R* file provides a shared resource between the two files for intial data wrangling and setup.

## Submission Document

For a brief overview of the project, as well as the associated major findings and post mortem, course instructors may see the submitted document on Canvas.
