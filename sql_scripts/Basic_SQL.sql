-- Count all records in the taxi_trips_2017 table
SELECT COUNT(*)
FROM taxi_trips_2017;

-- Display the first 3 records from the taxi_trips_2017 table
SELECT *
FROM taxi_trips_2017
LIMIT 3;

-- Count records with negative trip durations
SELECT COUNT(*)
FROM taxi_trips_2017
WHERE trip_duration < INTERVAL '0 seconds';

-- Count records with negative total amounts
SELECT COUNT(*)
FROM taxi_trips_2017
WHERE total_amount < 0;

-- Count records with negative trip distances
SELECT COUNT(*)
FROM taxi_trips_2017
WHERE trip_distance < 0;

-- Count records and find max, min, and distinct passenger counts for records with negative passenger counts
SELECT COUNT(*), MAX(passenger_count), MIN(passenger_count), DISTINCT passenger_count
FROM taxi_trips_2017
WHERE passenger_count < 0;

-- Count occurrences of each passenger count and display in descending order
SELECT passenger_count, COUNT(*) AS count
FROM taxi_trips_2017
GROUP BY passenger_count
ORDER BY count DESC;

-- Find the maximum and minimum passenger counts in the taxi_trips_2017 table
SELECT MAX(passenger_count), MIN(passenger_count)
FROM taxi_trips_2017;

-- Count records with passenger counts greater than 7
SELECT COUNT(passenger_count)
FROM taxi_trips_2017
WHERE passenger_count > 7;
