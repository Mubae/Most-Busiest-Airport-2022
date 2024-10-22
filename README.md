# Most-Busiest Airport Data Analysis

### Project Objective

It is no longer news that the importance of air travel as a global connectivity and commerce can’t be belittled. This project aims to create awareness about airports around the world welcoming the most passengers and also to enlighten any travel lover out there who may intend to visit any of these countries someday.

### Data Sources

The Primary dataset used for this analysis is “most_busiest_airport.xlsx” file containing a detailed information about each airport, location and region for the year 2022.

### Data Tools

•	Microsoft SQL Server Management Studio – Data cleaning and Data Analysis.

### Data Description

This case study contains a single dataset and it comprises of;
* Rank: A unique identifier for each airport.
* Airport: The name of the airport.
* Location: The address of the airport.
* Latitude: This is the north-south position measured from the earth’s equator.
* Longitude: This is the east-west position measured from the prime meridian.
* Country: This is where the airport is located on the map.
* City: This is location of the airport in a country.
* IATA & ICAO Code: IATA codes are usually derived from the name of the airport or city it serves while ICAO codes are distributed by region are country. 
* Total Passengers: This is the number of people coming into the airport.



### Data Cleaning and Preparation

The dataset was properly cleaned and double checked to ensure data integrity and suitability for analysis. The following were the steps carried out to achieve this:

•	Removing duplicates from the table,

•	Adding up new columns for better understanding of the dataset:

              City, using:
              Select 
              PARSENAME(REPLACE(Location,',','.'),1) As City
              From modified_busiest_airports
              Alter Table modified_busiest_airports
              Add City nvarchar(50);
              Update modified_busiest_airports
              Set City= PARSENAME(REPLACE(Location,',','.'),1)

              Renaming “Lat” to “Latitude”, using:
              Sp_rename 'modified_busiest_airports.Lat','Latitude';
              
              Renaming “Long” to “Longitude”,using:
              Sp_rename 'modified_busiest_airports.Long','Longitude';
              
              To make a new added column to look well-arranged then we “left trim”, using:
              Select LTRIM(City) as Trimmed_City
              from modified_busiest_airports
              Alter Table modified_busiest_airports
              Add Trimmed_City nvarchar(50);
              Update modified_busiest_airports
              Set Trimmed_City= LTRIM(City);


### Exploratory Data Analysis

EDA was conducted on Microsoft SQL server was able to uncover the possible challenges airport staffs might face in terms of size of people visiting. It also shows the number of passengers visiting the most populated airports in a country, the busiest airports and the busiest in each of the most visited countries of the world. It also highlights the countries people love going to the most from the world.

### Results and Insights

1.	The most passengers entering into a country was achieved with the United States taking the lead.
2.	The research carried out shows that United States, United Arab Emirates, Turkey, United Kingdom, India, France, Netherland, Spain, Japan and Germany are the most visited countries.
3.	Europe was discovered to be the most travelled region for most passengers from all across the globe.
4.	Going forward this research shows that there is a whole lot of opportunities that can be tapped from the aviation industry globally. Talk of Hartsfield-Jackson Atlanta International Airport, who receives nearly 100 million Passengers a year according to the data provided in this report and has been serving more passengers annually than any other airport in the world in the last two (2) decades. This alone would do a lot of contribution to any economy of country. Now imagine, how many millions of passengers are coming into a country airport, not just that some are coming in to invest, some for tourism even the use of a country airline service alone. All these, will generate economic growth, provide jobs to many and on a long run alleviate poverty. So, the aviation industry is one to look into for any country as a means of economic growth and sustenance and should not be toyed with by any means.
