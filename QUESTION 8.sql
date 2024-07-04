-- Create table
CREATE TABLE weather_data (
    City VARCHAR(50),
    Country VARCHAR(50),
    Season VARCHAR(50),
    Temperature_C DECIMAL(5, 2),
    Rainfall_mm DECIMAL(10, 2)
);

-- Insert data
INSERT INTO weather_data (City, Country, Season, Temperature_C, Rainfall_mm) VALUES
('Mumbai', 'India', 'Winter', 24.8, 5.9),
('Mumbai', 'India', 'Spring', 28.4, 16.2),
('Mumbai', 'India', 'Summer', 27.9, 1549.4),
('Mumbai', 'India', 'Fall', 27.6, 346.0),
('London', 'United Kingdom', 'Winter', 4.2, 207.7),
('London', 'United Kingdom', 'Spring', 8.3, 169.6),
('London', 'United Kingdom', 'Summer', 15.7, 157.0),
('London', 'United Kingdom', 'Fall', 10.4, 218.5),
('Cairo', 'Egypt', 'Winter', 13.6, 16.5),
('Cairo', 'Egypt', 'Spring', 20.7, 6.5),
('Cairo', 'Egypt', 'Summer', 27.7, 0.1),
('Cairo', 'Egypt', 'Fall', 22.2, 4.5);

-- Queries
-- a) All the temperature data
SELECT Temperature_C FROM weather_data;

-- b) All the cities, but without repetition
SELECT DISTINCT City FROM weather_data;

-- c) All the records for India
SELECT * FROM weather_data WHERE Country = 'India';

-- d) All the Fall records
SELECT * FROM weather_data WHERE Season = 'Fall';

-- e) The city, country, and season for which the average rainfall is between 200 and 400 millimeters
SELECT City, Country, Season
FROM weather_data
GROUP BY City, Country, Season
HAVING AVG(Rainfall_mm) BETWEEN 200 AND 400;

-- f) The city and country for which the average Fall temperature is above 20 degrees, in increasing temperature order
SELECT City, Country
FROM weather_data
WHERE Season = 'Fall'
GROUP BY City, Country
HAVING AVG(Temperature_C) > 20
ORDER BY AVG(Temperature_C) ASC;

-- g) The total annual rainfall for Cairo
SELECT SUM(Rainfall_mm) AS Total_Annual_Rainfall
FROM weather_data
WHERE City = 'Cairo';

-- h) The total rainfall for each season
SELECT Season, SUM(Rainfall_mm) AS Total_Rainfall
FROM weather_data
GROUP BY Season;
