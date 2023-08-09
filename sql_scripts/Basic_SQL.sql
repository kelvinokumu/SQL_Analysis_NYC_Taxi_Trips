-- Count all records
SELECT COUNT(*)
FROM taxi_trips_2017;

-- Display first 3 records
SELECT *
FROM taxi_trips_2017
LIMIT 3;

SELECT COUNT(*)
FROM taxi_trips_2017
WHERE trip_duration < INTERVAL '0 seconds';

SELECT COUNT(*)
FROM taxi_trips_2017
WHERE total_amount < 0;

SELECT COUNT(*)
FROM taxi_trips_2017
WHERE trip_distance < 0;

SELECT COUNT(*), MAX(passenger_count), MIN(passenger_count), DISTINCT passenger_count
FROM taxi_trips_2017
WHERE passenger_count < 0;


SELECT passenger_count, COUNT(*) AS count
FROM taxi_trips_2017
GROUP BY passenger_count
ORDER BY count DESC;


SELECT MAX(passenger_count), MIN(passenger_count)
FROM taxi_trips_2017;

SELECT COUNT(passenger_count)
FROM taxi_trips_2017
WHERE passenger_count > 7;