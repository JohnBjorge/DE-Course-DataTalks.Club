## Week 1 Homework

Name: John Bjorge

Completed: 2023-02-05

## Question 1. Load January 2020 data

### Answer

447,770 rows.

#### Explanation

I loaded the green taxi data to GCS and printed count of rows into terminal while doing so.

## Question 2. Scheduling with Cron

### Answer

Cron schedule should be `0 5 1 * *`. 

#### Explanation

Cron placeholders from left to right are minute, hour, day of the month, month of the year, day of the week.

## Question 3. Loading data to BigQuery 

### Answer

14,851,920 rows.

#### Explanation

Flow code processed 14,851,920 rows. Confirmed data made it to BQ and row count by querying table in Big Query.

## Question 4. Github Storage Block

### Answer

88,605 rows.

#### Explanation

Printed row count when deployed via GitHub.

## Question 5. Email or Slack notifications

### Answer

514,392 rows. 

#### Explanation

I went with the email notification option. Took a little bit to figure out prefect cloud vs orion usage. Setting up profiles helped keep things organized.

## Question 6. Secrets

### Answer

There are 8 asterisks.

#### Explanation

Self explanatory, made a Prefect Secret block in the UI.
