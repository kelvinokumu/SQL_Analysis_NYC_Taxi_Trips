-- Count the Number of Rows:
SELECT COUNT(*) FROM taxi_trips_2017;

-- Calculate Average Fare Amount
SELECT AVG(fare_amount) FROM taxi_trips_2017;

-- Common payment types
SELECT payment_type_description, COUNT(*) AS payment_count
FROM taxi_trips_2017
GROUP BY payment_type
ORDER BY count DESC;

-- Calculate Total Trip Distance
SELECT SUM(trip_distance) FROM taxi_trips_2017;

-- Identify Longest and Shortest Trips
SELECT MAX(trip_duration) AS longest_trip, MIN(trip_duration) AS shortest_trip
FROM taxi_trips_2017;

-- Check Store and Forward Flags
SELECT COUNT(*) FROM taxi_trips_2017 WHERE store_and_fwd_flag = true;

-- Calculate Total Tip Amount and Average Tip Percentage
SELECT SUM(tip_amount) AS total_tip_amount,
       (SUM(tip_amount) / SUM(fare_amount)) * 100 AS avg_tip_percentage
FROM taxi_trips_2017;

SELECT trip_type_description, COUNT(*) AS trip_count
FROM taxi_trips_2017
GROUP BY trip_type_description;



