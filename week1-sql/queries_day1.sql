
SELECT
  taxi_id,
  trip_start_timestamp,
  trip_miles,
  fare
FROM
  `bigquery-public-data.chicago_taxi_trips.taxi_trips`
WHERE
  trip_miles > 10
LIMIT 20

SELECT
  EXTRACT(HOUR FROM trip_start_timestamp) AS hour_of_day,
  ROUND(AVG(fare), 2) AS avg_fare,
  ROUND(AVG(trip_miles), 2) AS avg_miles,
  COUNT(*) AS total_trips
FROM
  `bigquery-public-data.chicago_taxi_trips.taxi_trips`
WHERE
  fare > 0
  AND trip_miles > 0
GROUP BY
  hour_of_day
ORDER BY
  hour_of_day
LIMIT 24

SELECT
  EXTRACT(HOUR FROM trip_start_timestamp) AS hour_of_day,
  ROUND(AVG(fare), 2) AS avg_fare,
  ROUND(AVG(trip_miles), 2) AS avg_miles,
  COUNT(*) AS total_trips
FROM
  `bigquery-public-data.chicago_taxi_trips.taxi_trips`
WHERE
  fare > 0
  AND trip_miles > 0
GROUP BY
  hour_of_day
ORDER BY
  avg_miles DESC
LIMIT 5

SELECT
  EXTRACT(HOUR FROM trip_start_timestamp) AS hour_of_day,
  ROUND(AVG(fare), 2) AS avg_fare,
  ROUND(AVG(trip_miles), 2) AS avg_miles,
  ROUND(AVG(trip_seconds / 60), 1) AS avg_minutes,
  ROUND(AVG(fare / NULLIF(trip_miles, 0)), 2) AS fare_per_mile,
  COUNT(*) AS total_trips
FROM
  `bigquery-public-data.chicago_taxi_trips.taxi_trips`
WHERE
  fare > 0
  AND trip_miles > 0
GROUP BY
  hour_of_day
ORDER BY
  hour_of_day

SELECT
  EXTRACT(HOUR FROM trip_start_timestamp) AS hour_of_day,
  COUNT(*) AS total_trips,
  ROUND(AVG(fare / NULLIF(trip_miles,0)),2) AS fare_per_mile
FROM
  `bigquery-public-data.chicago_taxi_trips.taxi_trips`
WHERE
  fare > 0 AND trip_miles > 0
GROUP BY hour_of_day
ORDER BY hour_of_day

SELECT * FROM `bigquery-public-data.new_york_citibike.citibike_stations`
LIMIT 5


SELECT * FROM `bigquery-public-data.new_york_citibike.citibike_trips`
LIMIT 5

SELECT
  t.trip_id,
  t.tripduration,
  s1.name AS start_station_name,
  s2.name AS end_station_name
FROM
  `bigquery-public-data.new_york_citibike.citibike_trips` AS t
INNER JOIN
  `bigquery-public-data.new_york_citibike.citibike_stations` AS s1
ON
  CAST(t.start_station_id AS STRING) = s1.station_id
INNER JOIN
  `bigquery-public-data.new_york_citibike.citibike_stations` AS s2
ON
  CAST(t.end_station_id AS STRING) = s2.station_id
LIMIT 20


SELECT * FROM `bigquery-public-data.new_york_citibike.citibike_trips`
LIMIT 2

SELECT
  t.bikeid,
  t.starttime,
  t.tripduration,
  t.usertype,
  s1.name AS start_station_name,
  s1.capacity AS start_station_capacity,
  s2.name AS end_station_name,
  s2.capacity AS end_station_capacity
FROM
  `bigquery-public-data.new_york_citibike.citibike_trips` AS t
INNER JOIN
  `bigquery-public-data.new_york_citibike.citibike_stations` AS s1
ON
  CAST(t.start_station_id AS STRING) = s1.station_id
INNER JOIN
  `bigquery-public-data.new_york_citibike.citibike_stations` AS s2
ON
  CAST(t.end_station_id AS STRING) = s2.station_id
LIMIT 20



SELECT
  t.bikeid,
  t.starttime,
  t.tripduration,
  t.usertype,
  s1.name AS start_station_name,
  s1.capacity AS start_station_capacity
FROM
  `bigquery-public-data.new_york_citibike.citibike_trips` AS t
LEFT JOIN
  `bigquery-public-data.new_york_citibike.citibike_stations` AS s1
ON
  CAST(t.start_station_id AS STRING) = s1.station_id
LIMIT 20
