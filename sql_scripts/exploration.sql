-- Calculate the average fare amount
SELECT ROUND(AVG(fare_amount)::NUMERIC ,2) AS avg_fare
FROM taxi_trips_2017;

-- Calculate the total trip distance
SELECT ROUND(SUM(trip_distance)::NUMERIC, 2) AS total_distance_covered
FROM taxi_trips_2017;

-- Identify the longest and shortest trips
SELECT MAX(trip_duration) AS longest_trip, MIN(trip_duration) AS shortest_trip
FROM taxi_trips_2017
WHERE EXTRACT(EPOCH FROM trip_duration) > 0;

-- Check store and forward flags
SELECT 
  SUM(CASE WHEN store_and_fwd_flag = true THEN 1 ELSE 0 END) AS true_count,
  SUM(CASE WHEN store_and_fwd_flag = false THEN 1 ELSE 0 END) AS false_count
FROM taxi_trips_2017;

-- Calculate the total tip amount and average tip percentage
WITH TipSums AS (
  SELECT 
    CAST(SUM(tip_amount) AS numeric) AS total_tip_amount, 
    CAST(SUM(fare_amount) AS numeric) AS total_fare_amount
  FROM taxi_trips_2017
)
SELECT 
  ROUND(total_tip_amount, 2) AS total_tip_amount,
  ROUND((total_tip_amount / total_fare_amount) * 100, 2) AS avg_tip_percentage
FROM TipSums;

-- Count trips per hour
SELECT EXTRACT(HOUR FROM lpep_pickup_datetime) AS pickup_hour, COUNT(*) AS trip_count
FROM taxi_trips_2017
GROUP BY pickup_hour
ORDER BY trip_count DESC;

-- Calculate average tip percentage by payment type
SELECT payment_type_description, ROUND(AVG((tip_amount / fare_amount) * 100)::numeric, 2) AS avg_tip_percentage
FROM taxi_trips_2017
WHERE fare_amount > 0
GROUP BY payment_type_description;

-- Find common payment types
SELECT payment_type_description, COUNT(*) AS count
FROM taxi_trips_2017
WHERE fare_amount > 0
GROUP BY payment_type_description
ORDER BY count DESC;

-- Find common trip types and their counts
SELECT trip_type_description, COUNT(*) AS count
FROM taxi_trips_2017
WHERE fare_amount > 0 AND trip_type_description NOT IN ('Invalid', 'N/A')
GROUP BY trip_type_description
ORDER BY count DESC;

-- Count trips by month
SELECT EXTRACT(MONTH FROM lpep_pickup_datetime) AS month, COUNT(*) AS trip_count
FROM taxi_trips_2017
GROUP BY month
ORDER BY trip_count DESC;

-- Calculate the count of trips for each unique passenger count
SELECT passenger_count, COUNT(*) AS passenger_counts
FROM taxi_trips_2017
GROUP BY passenger_count
ORDER BY passenger_counts DESC;

-- Calculate average fare for different passenger counts
SELECT passenger_count, AVG(fare_amount) AS avg_fare
FROM taxi_trips_2017
GROUP BY passenger_count;

-- Find the best and worst pickup locations
WITH pickup_counts AS (
    SELECT pulocationid, COUNT(*) AS pickup_count
    FROM taxi_trips_2017
    GROUP BY pulocationid
)
(
    SELECT 'Top 10 Pickup Locations' AS category, pulocationid, pickup_count
    FROM pickup_counts
    ORDER BY pickup_count DESC
    LIMIT 10
)
UNION ALL
(
    SELECT 'Bottom 10 Pickup Locations' AS category, pulocationid, pickup_count
    FROM pickup_counts
    ORDER BY pickup_count
    LIMIT 10
);
