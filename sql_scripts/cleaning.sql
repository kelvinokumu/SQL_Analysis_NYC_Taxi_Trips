-- -- Add a new BOOLEAN column to store the updated values temporarily
-- ALTER TABLE taxi_trips_2017 ADD COLUMN new_store_and_fwd_flag BOOLEAN;

-- -- Update the new BOOLEAN column using the CASE statement
-- UPDATE taxi_trips_2017
-- SET new_store_and_fwd_flag = 
--     CASE 
--         WHEN store_and_fwd_flag = 'N' THEN FALSE
--         WHEN store_and_fwd_flag = 'Y' THEN TRUE
--         ELSE NULL  -- If there are other values, set them to NULL or update them accordingly
--     END;

-- -- Drop the old character column
-- ALTER TABLE taxi_trips_2017 DROP COLUMN store_and_fwd_flag;

-- -- Rename the new BOOLEAN column to the original column name (optional)
-- ALTER TABLE taxi_trips_2017 RENAME COLUMN new_store_and_fwd_flag TO store_and_fwd_flag;

-- SELECT 
--     lpep_pickup_datetime,
--     lpep_dropoff_datetime,
--     lpep_dropoff_datetime - lpep_pickup_datetime AS trip_duration
-- FROM 
--     taxi_trips_2017
-- LIMIT 3;

-- -- Add a new column for trip_duration
-- ALTER TABLE taxi_trips_2017
-- ADD COLUMN trip_duration INTERVAL;

-- -- Calculate and update the trip_duration column using the existing data
-- UPDATE taxi_trips_2017
-- SET trip_duration = lpep_dropoff_datetime - lpep_pickup_datetime;

-- Get negative trip durations
-- SELECT COUNT(*)
-- FROM taxi_trips_2017
-- WHERE trip_duration <= INTERVAL '0 seconds';

-- SELECT COUNT(*)
-- FROM taxi_trips_2017
-- WHERE total_amount <= 0;

-- SELECT COUNT(*)
-- FROM taxi_trips_2017
-- WHERE passenger_count <= 0;

SELECT *
FROM taxi_trips_2017
LIMIT 5;

