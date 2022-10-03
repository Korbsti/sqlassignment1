/* Assignment 1 Submission
Date: 1/10/22
Group Member	Student Number
Sam Brown	        200550698
Andres Galeota	
Ushno Roylee
Jared Thompson 
Justin Chu 
*/

-- Tips - You can remove this section when submitting ****
-- Use comments to indicate the question number that each statement addresses.
-- See the format provided for Q1 - Q2 to format the remainder of your SQL script
-- Use proper SQL Standards when formatting your script
-- sql documentation -> https://dev.mysql.com/doc/refman/8.0/en/tutorial.html
-- sql commands + syntax -> https://www.w3schools.com/sql/default.asp 
-- github documentation -> https://docs.github.com/en/get-started/quickstart/hello-world 
-- github collab guide -> https://medium.com/@jonathanmines/the-ultimate-github-collaboration-guide-df816e98fb67
-- report -> https://docs.google.com/document/d/1-8Iqy60_41eKcWAEKXjuxYjTD5qO3fpzpJDxu6Aoo3E/edit
-- delete question after you've inserted code. explain rationale behind code 
-- ----- Replace this with a brief descriptive comment for each query. Explain the function & details of the command, don't just repeat the question.

-- Q1) Create a database for this assignment.
CREATE DATABASE assign1db;

-- Q2) Instruct MySQL Server to use the database you just created.
USE assign1db

-- Q3) In a separate SQL tab, open the barrie_weather.sql file provided. Under question 3, copy its
--contents into your assignment1 script, then run the commands to create the table (also
--called barrie_weather, and will be used to answer following questions) and then populate it
--with data using the provided insert statements.
-- here are the commands to do this, debating how to load it in without making it a pain in the ass

CREATE TABLE `barrie_weather` (
  `longitude` double DEFAULT NULL,
  `latitude` double DEFAULT NULL,
  `station_name` text,
  `climate_ID` int DEFAULT NULL,
  `date_time` text,
  `year` int DEFAULT NULL,
  `month` int DEFAULT NULL,
  `day` int DEFAULT NULL,
  `time` text,
  `temp` double DEFAULT NULL,
  `temp_flag` text,
  `dew_pt` double DEFAULT NULL,
  `dew_pt_flag` text,
  `rel_hum` int DEFAULT NULL,
  `rel_hum_flag` text,
  `wind_dir_10d` text,
  `wind_dir_flag` text,
  `wind_spd_kmh` int DEFAULT NULL,
  `wind_spd_flag` text,
  `visibility` text,
  `vis_flag` text,
  `pressure_kPa` double DEFAULT NULL,
  `pressure_flag` text,
  `hmdx` text,
  `hmdx_flag` text,
  `wind_chill` text,
  `wind_chill_flag` text,
  `weather` text
) ENGINE=InnoDB;

-- Q4) In the report only, explain how the provided CREATE TABLE statement could be improved.
--Please focus on the data types and parameters for this discussion.

-- https://docs.google.com/document/d/1-8Iqy60_41eKcWAEKXjuxYjTD5qO3fpzpJDxu6Aoo3E/edit

-- Q5) The provided INSERT statements in barrie_weather were generated automatically and load
-- data very slowly because of the way that the script’s commands have been structured. What
-- is it about the structure of this script that causes the script to run slowly? In the report only,
-- explain how you could restructure the commands if you were tasked with inserting the
-- same data into barrie_weather.

-- https://docs.google.com/document/d/1-8Iqy60_41eKcWAEKXjuxYjTD5qO3fpzpJDxu6Aoo3E/edit

-- Q6) Select all data for every hour of data where the temperature (temp) was greater than 26.5.
-- Provide an additional comment in your SQL script that states the number of rows returned.

-- Q7) Select the date_time, temp, pressure_kPA and wind_spd_kmh for every hour of data where
-- the temperature was 24 or less and the air pressure (pressure_kPa) was greater than 96.83.
-- Provide an additional comment in your SQL script that states the number of rows returned

-- Q8) Select the date and time (date_time), temperature (temp) and temperature flag (temp_flag)
-- columns for every hour where temperature data has been marked as missing using an ‘M’
-- value in the temp_flag column.
-- In the report, record the date and time.
-- Hint: remember that single quotes are required for text values.

-- Q9) Return the same results as in Question 8, except construct the query to return both ‘M’ and
-- ‘Missing’ values.
-- Note: There are a number of ways of doing this, please use LIKE

-----------------------------------------
-- Q10) Count (SELECT COUNT) the number of hours contained in this dataset, where the dew point
-- temperature (dew_pt) is greater than one.

# Andres Galeota
# Lakehead ID: 1183215 
# Georgian ID: 200550710

SELECT COUNT(time)  	#Counts from time collumn
FROM barrie_weather 	#takes data from database 
WHERE dew_pt > 1; 		#takes time values only when the dew_pt collumn is above 1

----------------------------------------

-- Q11) Count the number of hours that the wind was blowing (wind_spd_kmh is greater than 0)
-- and from a direction ranging between north and east (wind_dir_10d is between 0 and 9)

# Andres Galeota
# Lakehead ID: 1183215 
# Georgian ID: 200550710

SELECT COUNT(time)  	#Counts from time collumn
FROM barrie_weather 	#takes data from database 
WHERE wind_spd_kmh > 0  #takes data only if wind_spd_kmh is greater than 0
AND wind_dir_10d BETWEEN 0 AND 9 #also takes data if wind_dir_10d
-----------------------------------------

-- Q12)  In the report only, in Barrie what percent of the time are the conditions listed in Q11 true?
7585/15336 * 100 = 49.4587897757%
-----------------------------------------
-- Q13) Select all data for every hour of data where either the temperature (temp) is below freezing,
-- or wind chill (wind_chill) was below zero. Additionally, the wind speed flag (wind_spd_flag)
-- must indicate that there were no problems with the wind speed instrument (i.e. no M or
-- Missing values present)
-- BTW: an anemometer is an instrument that measures wind speed
# Q13

# Ushno Roylee
# Lakehead ID: 1183460
# Georgian ID: 200550726

# Select all rows from table barrie_weater
# it would then select from row names where, temp
# wind_chill is less than 0 or temp is less than 0
# it then checks if wind_spd_flag does NOT have an M inside of it
# if it doesnt then return that row 

SELECT *
	FROM barrie_weather
	WHERE (temp < 0
		OR wind_chill < 0)
                AND wind_spd_flag NOT LIKE '%M%'
-----------------------------------------

-- Q14) Fix the M vs Missing problem in the temperature flag field by using UPDATE to change any
-- instances of Missing values to just plain M.
# Q14

# Ushno Roylee
# Lakehead ID: 1183460
# Georgian ID: 200550726

# Update the table barrie_weather
# It then specifies that temp_flag will be equal to M 
# If only and if temp_flag starts with M
# With a like statement 


UPDATE barrie_weather
	SET temp_flag ='M'
		WHERE temp_flag LIKE 'M%';
-----------------------------------------

-- Q15) Use an update statement to change all ' ' values in the temp_flag column to NULL (no quotes,
-- just the letters N-U-L-L) this will change.
-- Hint: The values should end up looking like those in the humidex (hmdx) column.
-- FYI: The best way to store null data is using the NULL value. Look to the humidex (hmdx)
-- column for an example of this being implemented properly.

# Q15

# Ushno Roylee
# Lakehead ID: 1183460
# Georgian ID: 200550726

# Update the table barrie_weather
# It then specifies that temp_flag will be equal to NULL
# If only and if temp_flag is like ''
# With a like statement 


UPDATE barrie_weather
SET temp_flag = NULL
WHERE temp_flag LIKE '';

-----------------------------------------

