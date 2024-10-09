-- Data Exploration for the most busiest airport 2022

Select *
From modified_busiest_airports

-- Let's Re-Arrange By Rank To Know What We are Actually Working With

  Select *
  From modified_busiest_airports
  Order BY Rank ASC

--Cleaning Up Data For Proper Usuage


Select 
PARSENAME(REPLACE(Location,',','.'),1) As City
From modified_busiest_airports



Alter Table modified_busiest_airports
Add City nvarchar(50);

Update modified_busiest_airports
Set City= PARSENAME(REPLACE(Location,',','.'),1)

Sp_rename 'modified_busiest_airports.Lat','Latitude';

Sp_rename 'modified_busiest_airports.Long','Longitude';


Update modified_busiest_airports
Set Country=City,City=Country;

Select LTRIM(City) as City_Trim
from modified_busiest_airports

Alter Table modified_busiest_airports
Add City_Trim nvarchar(50);

Update modified_busiest_airports
Set City_Trim= LTRIM(City);


-- Now,after making the table more useable, let's remove duplicate values.
		                             		   

With modified_busiest_airportsCTE As
(Select *,ROW_NUMBER() Over(partition by Rank order by Rank) AS RowNumber
From modified_busiest_airports)
Delete From modified_busiest_airportsCTE
Where RowNumber > 1

  Select *
  From modified_busiest_airports
  Order BY Rank ASC

  -- Let's find out the number of Airports in the Country.

Select Country,COUNT(Distinct Airport) As [Number of Airport]
From modified_busiest_airports
Group By Country
Order By [Number of Airport]DESC

-- Let's know the most busy airports with the most passengers.

Select Country,City_Trim,MAX(Total_passengers) As MaxPassengersAtAirports
From modified_busiest_airports
Group by Country,City_Trim 
Order by MaxPassengersAtAirports Desc

Select Country,City_Trim,Airport,Total_passengers
From modified_busiest_airports

--Creating a Temp table to be able to further explore into our table with ease.

	Drop Table If Exists #modified_busiest_airports
	Create Table #modified_busiest_airports
	(MaxPassengersAtAirports int,
	Country varchar(50),
	City_Trim varchar(50)
	);

Insert into #modified_busiest_airports
Select Country,City_Trim,MAX(Total_passengers) As MaxPassengersAtAirports
From modified_busiest_airports
Group by Country,City_Trim 
Order by MaxPassengersAtAirports Desc

Select *
From #modified_busiest_airports
Order by MaxPassengersAtAirports Desc

