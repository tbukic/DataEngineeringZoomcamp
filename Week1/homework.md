# Question 1. Knowing docker tags
```
docker build --help | grep "Write the image ID to the file"
```
# Question 2. Understanding docker first run
```
docker run -it python:3.9 bash
```
# Question 3. Count records

```
SELECT
	count(*)
FROM
	green_taxi_trips
WHERE
	lpep_pickup_datetime >=  make_timestamp(2019, 1, 15, 0, 0, 0) AND
	lpep_dropoff_datetime <  make_timestamp(2019, 1, 16, 0, 0, 0);
```
# Question 4. Largest trip for each day
```
SELECT
	lpep_pickup_datetime
FROM
	green_taxi_trips
ORDER BY trip_distance DESC
LIMIT 1;
```
# Question 5. The number of passengers

```
SELECT
	passenger_count, count(*)
FROM
	green_taxi_trips
WHERE
	lpep_pickup_datetime >=  make_timestamp(2019, 1, 1, 0, 0, 0) AND
	lpep_pickup_datetime <  make_timestamp(2019, 1, 2, 0, 0, 0) AND
	(passenger_count = 2 OR passenger_count = 3)
GROUP BY passenger_count;
```
# Question 6. Largest tip

```
SELECT
	zdo."Zone", max(tx."trip_distance")
FROM
	green_taxi_trips tx JOIN timezones zpu
		ON tx."PULocationID" = zpu."LocationID"
	JOIN timezones zdo
		on tx."DOLocationID" = zdo."LocationID"
GROUP BY zdo."Zone"
ORDER BY max(tx."trip_distance") DESC
LIMIT 5;
```