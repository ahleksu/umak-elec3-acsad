# Assignment 3 Submission

## About us

- Group number: 9
- Section: IV-ACSAD
- Lab 3 client: A Laundry Shop Pickup App

## Three estimates

Asia Pacific (Singapore), MySQL, OnDemand, 100% utilization, RDS Proxy No, Database Insights No.

| Option | Instance | Deployment | Nodes | Storage | Total monthly cost (USD) |
| --- | --- | --- | --- | --- | --- |
| A. Small and cheap | db.t4g.micro | Single-AZ | 1 | 20 GB gp3 | $21.01 |
| B. High availability | db.t4g.micro | Multi-AZ | 1 | 20 GB gp3 | $42.75 |
| C. Read scaling | db.t4g.micro | Single-AZ | 2 | 20 GB gp3 per instance | $42.02 |

Share link of our estimate: https://calculator.aws/#/estimate?id=b5ddc23003efe897dcc99971c495ed6a7e73bbfe

## Recommendation

For our Laundry Shop Pickup App, we recommend Option A, Small and Cheap, because it is the most affordable choice for a small business. Customers will use the app to check their laundry orders and pickup schedules, while the staff will use it to manage and update orders. Since the app is initially expected to have only a limited number of users, we think that one database instance can handle its normal read requests. Although downtime may temporarily affect the shop's order management and pickup scheduling, we think the business can accept this risk for now to save money. Overall, Option A is a practical starting choice because it provides the database resources our client needs at a lower monthly cost.

## Question

Why is a Multi-AZ standby not the same as a read replica?

A Multi-AZ standby and a read replica have different purposes. A Multi-AZ standby is used to keep the database available when the primary database experiences a failure. It can automatically take over to help reduce downtime, but it does not handle the application's normal read requests. On the other hand, a read replica is another database instance that can handle read requests and help reduce the workload of the primary database. In short, Multi-AZ is mainly for availability, while read replicas are mainly for improving read performance.

## Contribution

| GitHub username | What this groupmate did |
| --- | --- |
| Azores-Mea | Configured and recorded the Option A estimate. Reviewed the estimates. |
| rdanlogA12345581 | Wrote the recommendation and answered the question about Multi-AZ standby and read replicas. |
| WayneyYsrrael | Configured and recorded the Option B and Option C estimates. |
| klomol-jo | Reviewed the estimates and helped prepare the submission. |
