# STAFFTABLE ONLY #

# 1.) How many staff do we have in the company? #
SELECT Count(MatriculeNo) as Totalstaff
FROM stafftable;

# 2.) How many staff are younger than 30 years? #
SELECT Count(MatriculeNo) as Totalstaff
FROM stafftable
WHERE Age < 30;

# 3.) How many staff are between 30 and 25 years? #
SELECT Count(MatriculeNo) as Totalstaff
FROM stafftable
WHERE Age BETWEEN 25 AND 30;

# 4.) Select all the female staff and sort their age in descending order (from the oldest to the youngest) #
SELECT *
FROM stafftable
WHERE StaffSex = 'Female'
ORDER BY Age DESC;

# 5.) What is the Average age of Peter and Nina? #
SELECT AVG(Age)'Average_Age'
FROM Stafftable
WHERE StaffName IN ('Peter', 'Nina');

# CUSTOMERTABLE ONLY #

# 1.) How many customers do we have? #
SELECT COUNT(DISTINCT CustomerCode) AS TotalCustomers
FROM Customertable;

# 2.) How many customers are from Cameroon? #
SELECT COUNT(DISTINCT CustomerCode) AS CameroonianCustomers
FROM Customertable
WHERE CustomerCountry = 'Cameroon';

# 3.) How many customers are from Cameroon and are Males? #
SELECT COUNT(DISTINCT CustomerCode) AS CameroonianMaleCustomers
FROM Customertable
WHERE CustomerCountry = 'Cameroon' AND CustomerSex = 'Male';

# 4.) What are the First names and Last names of customers who come from Togo and USA? #
SELECT CustomerFirstName, CustomerLastName, CustomerCountry
FROM Customertable
WHERE CustomerCountry IN ('Togo', 'Usa')
ORDER BY CustomerCountry;

# 5.) Show the first 5 oldest customers and arrange the list in decreasing order of Age (Oldest to youngest) #
SELECT *
FROM Customertable
ORDER BY Age DESC
LIMIT 5;

# 6.) What is the average age of customers per country? #
SELECT CustomerCountry, AVG(Age)'Avg_Age_PerCountry'
FROM Customertable
GROUP BY CustomerCountry;

# JOINING TABLES #

# 1.) What is the total profit we made? #
Select SUM(Profit) AS TotalProfit
FROM Salestable;

# 2.) What is the total cost we incurred for these 03 countries "Cameroon","USA","Togo"? #
Select  CustomerCountry, Sum(Cost) AS TotalCost
From Salestable
JOIN Customertable
ON Salestable.CustomerCode = Customertable.CustomerCode
WHERE CustomerCountry IN ( 'Cameroon', 'Togo', 'USA')
GROUP BY CustomerCountry
ORDER BY TotalCost DESC;

# 3.) What is the total profit we made per country? #
SELECT CustomerCountry, Sum(Profit) AS TotalProfit
From Salestable
JOIN Customertable
ON Salestable.CustomerCode = Customertable.CustomerCode
GROUP BY CustomerCountry
ORDER BY TotalProfit DESC;

# 4.) What is the average profit we made per country? #
SELECT CustomerCountry, AVG(Profit) AS AverageProfit
From Salestable
JOIN Customertable
ON Salestable.CustomerCode = Customertable.CustomerCode
GROUP BY CustomerCountry
ORDER BY AverageProfit DESC;

# 5.) What is the total revenue per Staff? #
SELECT StaffName, SUM(Revenue) AS TotalRevenue
From Salestable
JOIN Stafftable
ON Salestable.StaffCode = Stafftable.MatriculeNo
GROUP BY StaffName
ORDER BY TotalRevenue DESC;

# 6.) Which countries made more than 100 sales transactions? Sort them in decreasing order (from biggest to smallest) #
SELECT CustomerCountry, COUNT(StaffCode) AS TotalTransactions
From salestable s
JOIN customertable c
ON s.CustomerCode = c.CustomerCode
GROUP BY CustomerCountry
HAVING TotalTransactions > 100
ORDER BY TotalTransactions DESC;

# 7.) What is the total profit made per country by the following staff "Emelda","Anita","Cynthia"? #
SELECT CustomerCountry,StaffName,SUM(Profit) AS TotalProfit
From salestable s 
JOIN customertable c
ON s.CustomerCode = c.CustomerCode 
JOIN stafftable st
ON st.MatriculeNo = s.StaffCode 
WHERE  StaFFName IN ( "Emelda","Anita","Cynthia")
GROUP BY StaffName, CustomerCountry
ORDER BY TotalProfit DESC
