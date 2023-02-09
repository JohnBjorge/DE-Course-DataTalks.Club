CREATE OR REPLACE EXTERNAL TABLE `ny-rides-jbjorge.zoomcamp_week_3.fhv_tripdata`
OPTIONS (
  format = 'CSV',
  uris = ['gs://dtc_data_lake_ny-rides-jbjorge/data/fhv/fhv_tripdata_2019-*.csv.gz']
);

CREATE OR REPLACE TABLE `ny-rides-jbjorge.zoomcamp_week_3.fhv_tripdata_nonpartitioned_nonclustered` AS
SELECT * FROM `ny-rides-jbjorge.zoomcamp_week_3.fhv_tripdata`;

SELECT count(*)
 FROM `ny-rides-jbjorge.zoomcamp_week_3.fhv_tripdata` limit 10;


SELECT distinct affiliated_base_number FROM `ny-rides-jbjorge.zoomcamp_week_3.fhv_tripdata`;

SELECT distinct affiliated_base_number FROM `ny-rides-jbjorge.zoomcamp_week_3.fhv_tripdata_nonpartitioned_nonclustered`;



SELECT count(*) 
FROM `ny-rides-jbjorge.zoomcamp_week_3.fhv_tripdata_nonpartitioned_nonclustered`
where PUlocationID is null and DOlocationID is null;