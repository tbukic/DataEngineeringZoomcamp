Note: Execute everything from folder `Week2`.

# Question 1. Load January 2020 data

```
python homework/parametrized_etl_web_to_gcs.py
```

# Question 2. Scheduling with Cron

```
prefect deployment build ./homework/parametrized_etl_web_to_gcs.py:etl_web_to_gcs_parent_flow -n hw_web_to_gcs --cron "0 5 1 * *" --timezone "UTC" -q 'default'
prefect deployment apply etl_web_to_gcs_parent_flow-deployment.yaml
```

# Question 3. Loading data to BigQuery

```
prefect deployment run etl-parent-flow/docker-flow -p "months=[2,3]" -p "year=2019" -p "color=yellow"
```