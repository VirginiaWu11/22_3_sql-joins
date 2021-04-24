-- write your queries here
-- Join the two tables so that every column and record appears, regardless of if there is not an owner_id. Your output should look like this:

SELECT * FROM owners o JOIN vehicles v ON o.id = v.owner_id;

-- Count the number of cars for each owner. Display the owners first_name, last_name and count of vehicles. The first_name should be ordered in ascending order. Your output should look like this:
SELECT o.first_name, o.last_name, COUNT(*) AS vehicles_count  FROM owners o JOIN vehicles v ON o.id = v.owner_id GROUP BY o.id ORDER BY o.first_name;

-- Count the number of cars for each owner and display the average price for each of the cars as integers. Display the owners first_name, last_name, average price and count of vehicles. The first_name should be ordered in descending order. Only display results with more than one vehicle and an average price greater than 10000. Your output should look like this:

SELECT o.first_name, o.last_name, CAST(AVG(v.price) AS INTEGER) AS average_price, COUNT(*) AS vehicles_count  
FROM owners o 
JOIN vehicles v 
ON o.id = v.owner_id 
GROUP BY o.id 
HAVING CAST(AVG(v.price) AS INTEGER)>10000 
AND COUNT(*) >1
ORDER BY o.first_name DESC;

-- another way to cast as integer
-- or use ROUND()
-- SELECT o.first_name, o.last_name, AVG(v.price)::INTEGER AS average_price, COUNT(*) AS vehicles_count  FROM owners o JOIN vehicles v ON o.id = v.owner_id GROUP BY o.id ORDER BY o.first_name DESC;