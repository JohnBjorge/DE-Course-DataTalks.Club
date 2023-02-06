## Week 1 Homework
Name: John Bjorge

Completed: 2023-01-21

## Question 1. Knowing docker tags

### Answer
--iidfile string

#### Explanation
I ran ```docker build --help``` giving an answer of ```--iidfile string```

## Question 2. Understanding docker first run 

### Answer
There are 3 python packages installed.

#### Explanation
I ran the following:

```
(base) jbjorge@de-zoomcamp:~$ docker run -it --entrypoint=bash python:3.9
Unable to find image 'python:3.9' locally
3.9: Pulling from library/python
bbeef03cda1f: Pull complete 
f049f75f014e: Pull complete 
56261d0e6b05: Pull complete 
9bd150679dbd: Pull complete 
5b282ee9da04: Pull complete 
03f027d5e312: Pull complete 
3c8304b923fa: Pull complete 
1f510f0937ac: Pull complete 
cb0f5bf32016: Pull complete 
Digest: sha256:4b7ee97f021e0d1f5749ea3ad6d1bae1ca15a9b42cdebcf40269502d54f56666
Status: Downloaded newer image for python:3.9
root@0c6f724b603b:/# pip list
Package    Version
---------- -------
pip        22.0.4
setuptools 58.1.0
wheel      0.38.4
```

## Question 3. Count records 

### Answer

20530 taxi trips on January 15.

#### Explanation

I define a taxi trip as having both a pickup and dropoff date of 2019-01-15. Query below:

```
select count(*) as count_taxi_trips
from green_taxi_trips 
where cast(lpep_pickup_datetime as date) = '2019-01-15'
and cast(lpep_dropoff_datetime as date) = '2019-01-15';
```

## Question 4. Largest trip for each day

### Answer

2019-01-15 was the day with the longest trip distance.

#### Explanation

I define a day based on the pickup time. Query below:

```
select cast(lpep_pickup_datetime as date) as pickup_date,
max(trip_distance) as longest_trip_distance
from green_taxi_trips 
group by cast(lpep_pickup_datetime as date)
order by max(trip_distance) desc
limit 1;
```

## Question 5. The number of passengers

### Answer
2: 1282 ; 3: 254

On 2019-01-01, 1282 trips had 2 passengers and 254 trips had 3 passengers.

#### Explanation

Assume count of trips is defined by any trip that started on 2019-01-01 regardless of the dropoff date. Query below:

```
select cast(lpep_pickup_datetime as date) as pickup_date,
count(*) as count_taxi_trips
from green_taxi_trips 
where cast(lpep_pickup_datetime as date) = '2019-01-01'
and passenger_count = 2
group by cast(lpep_pickup_datetime as date);

select cast(lpep_pickup_datetime as date) as pickup_date,
count(*) as count_taxi_trips
from green_taxi_trips 
where cast(lpep_pickup_datetime as date) = '2019-01-01'
and passenger_count = 3
group by cast(lpep_pickup_datetime as date);
```

## Question 6. Largest tip

### Answer

Long Island City/Queens Plaza 

#### Explanation

Got subset of taxi trips where pickup zone was Astoria, then grouped by drop off zone to find largest tip by drop off zone. Query below:

```
select taxi_zone_dropoff."Zone" as zone_dropoff,
max(green_taxi_trips.tip_amount) as max_tip
from green_taxi_trips 
left join taxi_zone taxi_zone_pickup
on green_taxi_trips."PULocationID" = taxi_zone_pickup."LocationID"
left join taxi_zone taxi_zone_dropoff
on green_taxi_trips."DOLocationID" = taxi_zone_dropoff."LocationID"
where taxi_zone_pickup."Zone" = 'Astoria'
group by taxi_zone_dropoff."Zone"
order by max(green_taxi_trips.tip_amount) desc
limit 1;
```
