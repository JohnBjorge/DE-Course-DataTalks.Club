## Week 1 Homework

Name: John Bjorge

Completed: 

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

Q5. It’s often helpful to be notified when something with your dataflow doesn’t work as planned. Choose one of the options below for creating email or slack notifications.

The hosted Prefect Cloud lets you avoid running your own server and has Automations that allow you to get notifications when certain events occur or don’t occur. 

Create a free forever Prefect Cloud account at app.prefect.cloud and connect your workspace to it following the steps in the UI when you sign up. 

Set up an Automation that will send yourself an email when a flow run completes. Run the deployment used in Q4 for the Green taxi data for April 2019. Check your email to see the notification.

Alternatively, use a Prefect Cloud Automation or a self-hosted Orion server Notification to get notifications in a Slack workspace via an incoming webhook. 

Join my temporary Slack workspace with [this link](https://join.slack.com/t/temp-notify/shared_invite/zt-1odklt4wh-hH~b89HN8MjMrPGEaOlxIw). 400 people can use this link and it expires in 90 days. 

In the Prefect Cloud UI create an [Automation](https://docs.prefect.io/ui/automations) or in the Prefect Orion UI create a [Notification](https://docs.prefect.io/ui/notifications/) to send a Slack message when a flow run enters a Completed state. Here is the Webhook URL to use: https://hooks.slack.com/services/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

Test the functionality.

Alternatively, you can grab the webhook URL from your own Slack workspace and Slack App that you create. 


How many rows were processed by the script?

- `125,268`
- `377,922`
- `728,390`
- `514,392`


## Question 6. Secrets

Prefect Secret blocks provide secure, encrypted storage in the database and obfuscation in the UI. Create a secret block in the UI that stores a fake 10-digit password to connect to a third-party service. Once you’ve created your block in the UI, how many characters are shown as asterisks (*) on the next page of the UI?

- 5
- 6
- 8
- 10


## Submitting the solutions

* Form for submitting: https://forms.gle/PY8mBEGXJ1RvmTM97
* You can submit your homework multiple times. In this case, only the last submission will be used. 

Deadline: 6 February (Monday), 22:00 CET


## Solution

We will publish the solution here