# Question 1
```
SELECT COUNT(*) FROM `prefect-de-zoomcamp-376823.dezoomcamp.fhv-table`
```

# Question 2
```
SELECT COUNT(*) from (
  SELECT
    affiliated_base_number
  FROM
    `prefect-de-zoomcamp-376823.dezoomcamp.fhv-table`
  GROUP BY affiliated_base_number
);

SELECT COUNT(*) from (
  SELECT
    affiliated_base_number
  FROM
    `prefect-de-zoomcamp-376823.dezoomcamp.fhv-external-table`
  GROUP BY affiliated_base_number
);
```

# Question 3
```
SELECT
  COUNT(*)
FROM
  `prefect-de-zoomcamp-376823.dezoomcamp.fhv-table`
WHERE 
  PUlocationID IS NULL and DOlocationID IS NULL;
```


# Question 4
```
CREATE OR REPLACE TABLE `prefect-de-zoomcamp-376823.dezoomcamp.fhv-partitioned-table`
PARTITION BY DATE(pickup_datetime)
CLUSTER BY affiliated_base_number AS (
  SELECT * FROM `prefect-de-zoomcamp-376823.dezoomcamp.fhv-table`
);
```

# Question 5
```
SELECT DISTINCT Affiliated_base_number FROM `prefect-de-zoomcamp-376823.dezoomcamp.fhv-table`
WHERE
    pickup_datetime BETWEEN '2019-01-01' AND '2019-03-31';

SELECT DISTINCT Affiliated_base_number FROM `prefect-de-zoomcamp-376823.dezoomcamp.fhv-partitioned-table`
WHERE
    pickup_datetime BETWEEN '2019-01-01' AND '2019-03-31';


```
