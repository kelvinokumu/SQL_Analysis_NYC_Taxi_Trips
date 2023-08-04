-- SELECT EXTRACT(HOUR FROM lpep_pickup_datetime) AS hour, COUNT(*) AS trip_count
-- FROM taxi_trips_2017
-- GROUP BY hour
-- ORDER BY trip_count DESC;

-- SELECT payment_type_description, AVG((tip_amount / fare_amount) * 100) AS avg_tip_percentage
-- FROM taxi_trips_2017
-- WHERE fare_amount > 0
-- GROUP BY payment_type_description;

-- SELECT EXTRACT(MONTH FROM lpep_pickup_datetime) AS month, COUNT(*) AS trip_count
-- FROM taxi_trips_2017
-- GROUP BY month
-- ORDER BY trip_count DESC;

-- SELECT passenger_count, COUNT(*) AS passenger_count
-- FROM taxi_trips_2017
-- GROUP BY passenger_count;

SELECT passenger_count, AVG(fare_amount) AS avg_fare
FROM taxi_trips_2017
GROUP BY passenger_count;
