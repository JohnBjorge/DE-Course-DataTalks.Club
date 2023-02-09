## Week 3 Homework

Name: John Bjorge

Completed: 2023-02-09

## Question 1:

### Answer

43,244,696 rows.
#### Explanation

```
select count(*)
from `ny-rides-jbjorge.zoomcamp_week_3.fhv_tripdata`;
```


## Question 2:

### Answer
0 MB for the External Table and 317.94MB for the BQ Table.

#### Explanation

Compared external vs native table estimates for data processing. 

```
create or replace external table `ny-rides-jbjorge.zoomcamp_week_3.fhv_tripdata`
options (
  format = 'CSV',
  uris = ['gs://dtc_data_lake_ny-rides-jbjorge/data/fhv/fhv_tripdata_2019-*.csv.gz']
);

create or replace table `ny-rides-jbjorge.zoomcamp_week_3.fhv_tripdata_nonpartitioned_nonclustered` AS
select * from `ny-rides-jbjorge.zoomcamp_week_3.fhv_tripdata`;

-- external table
select distinct affiliated_base_number 
from `ny-rides-jbjorge.zoomcamp_week_3.fhv_tripdata`;

-- native table
select distinct affiliated_base_number 
from `ny-rides-jbjorge.zoomcamp_week_3.fhv_tripdata_nonpartitioned_nonclustered`;
```

## Question 3:

### Answer

717,748 rows.

#### Explanation

```
select count(*) 
from `ny-rides-jbjorge.zoomcamp_week_3.fhv_tripdata_nonpartitioned_nonclustered`
where PUlocationID is null 
and DOlocationID is null;
```

## Question 4:

### Answer
What is the best strategy to optimize the table if query always filter by pickup_datetime and order by affiliated_base_number?
- Cluster on pickup_datetime Cluster on affiliated_base_number
- Partition by pickup_datetime Cluster on affiliated_base_number


#### Explanation

```
create or replace table `ny-rides-jbjorge.zoomcamp_week_3.fhv_tripdata_partitioned_clustered`
partition by date(pickup_datetime)
cluster by Affiliated_base_number as (
  select * 
  from `ny-rides-jbjorge.zoomcamp_week_3.fhv_tripdata_nonpartitioned_nonclustered`
);
```

## Question 5:

### Answer

647.87 MB for non-partitioned table and 23.06 MB for the partitioned table

#### Explanation

```
select distinct Affiliated_base_number
from `ny-rides-jbjorge.zoomcamp_week_3.fhv_tripdata_nonpartitioned_nonclustered`
where pickup_datetime between '2019-03-01' and '2019-03-31';

select distinct Affiliated_base_number
from `ny-rides-jbjorge.zoomcamp_week_3.fhv_tripdata_partitioned_clustered`
where pickup_datetime between '2019-03-01' and '2019-03-31';
```

## Question 6: 
Where is the data stored in the External Table you created?

### Answer

GCP Bucket

#### Explanation

Self-explanatory, table was created from data is in GCS.

## Question 7:

### Answer

False

#### Explanation

If dataset is small (say less than 1 GB), it doesn't necessarily make sense to cluster your data. You'll incur more metadata reads/maintenance than you'll benefit from performance wise.

## (Not required) Question 8:
A better format to store these files may be parquet. Create a data pipeline to download the gzip files and convert them into parquet. Upload the files to your GCP Bucket and create an External and BQ Table. 


Note: Column types for all files used in an External Table must have the same datatype. While an External Table may be created and shown in the side panel in Big Query, this will need to be validated by running a count query on the External Table to check if any errors occur. 

### Answer

See flow code in directory.

#### Explanation

See code ^^^ referenced above.