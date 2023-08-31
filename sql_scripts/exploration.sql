-- Calculate Average Fare Amount
SELECT AVG(fare_amount) 
FROM taxi_trips_2017;

-- Calculate Total Trip Distance
SELECT SUM(trip_distance) 
FROM taxi_trips_2017;

-- Identify Longest and Shortest Trips
SELECT MAX(trip_duration) AS longest_trip, MIN(trip_duration) AS shortest_trip
FROM taxi_trips_2017;

-- Check Store and Forward Flags
SELECT COUNT(*) FROM taxi_trips_2017 WHERE store_and_fwd_flag = true;


-- Calculate Total Tip Amount and Average Tip Percentage
SELECT SUM(tip_amount) AS total_tip_amount,
      (SUM(tip_amount) / SUM(fare_amount)) * 100 AS avg_tip_percentage
FROM taxi_trips_2017;

-- Passenger count per hour
SELECT EXTRACT(HOUR FROM lpep_pickup_datetime) AS hour, COUNT(*) AS trip_count
FROM taxi_trips_2017
GROUP BY hour
ORDER BY trip_count DESC;

-- Average Tip Percentage by Payment Type
SELECT payment_type_description, AVG((tip_amount / fare_amount) * 100) AS avg_tip_percentage
FROM taxi_trips_2017
WHERE fare_amount > 0
GROUP BY payment_type_description;

-- Common Payment type
SELECT payment_type_description, COUNT(*) AS count
FROM taxi_trips_2017
WHERE fare_amount > 0
GROUP BY payment_type_description
ORDER BY count DESC;

-- Common Trip type Count
SELECT trip_type_description, COUNT(*) AS count
FROM taxi_trips_2017
WHERE fare_amount > 0
GROUP BY trip_type_description
ORDER BY count DESC;

-- Trip count by Month
SELECT EXTRACT(MONTH FROM lpep_pickup_datetime) AS month, COUNT(*) AS trip_count
FROM taxi_trips_2017
GROUP BY month
ORDER BY trip_count DESC;

-- calculates the count of trips for each unique passenger count
SELECT passenger_count, COUNT(*) AS passenger_counts
FROM taxi_trips_2017
GROUP BY passenger_count
ORDER BY passenger_counts DESC;

-- Average fare for different user count.
SELECT passenger_count, AVG(fare_amount) AS avg_fare
FROM taxi_trips_2017
GROUP BY passenger_count;

-- Best and Worst pickup locations
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

