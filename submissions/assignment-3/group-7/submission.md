# Assignment 3 Submission

## About us

- Group number: 7
- Section: IV-ACSAD
- Lab 3 client: A bakery delivery app

## Three estimates

Asia Pacific (Singapore), MySQL, OnDemand, 100% utilization, RDS Proxy No, Database Insights No.

| Option | Instance | Deployment | Nodes | Storage | Total monthly cost (USD) |
| --- | --- | --- | --- | --- | --- |
| A. Small and cheap | db.t4g.micro | Single-AZ | 1 | 20 GB, General Purpose SSD (gp3) | 39.26 |
| B. High availability | db.t4g.micro | Multi-AZ | 1 | 20 GB, General Purpose SSD (gp3) | 61.00 |
| C. Read scaling | db.t4g.micro | Single-AZ | 2 (primary and one read replica) | 20 GB, General Purpose SSD (gp3) | 78.52 |

Note: our Option A total is 39.26 in the calculator on the day we built the estimate. The assignment's example showed 21.01 when it was measured on October 30. We checked that our settings match the table above.

Share link of our estimate: https://drive.google.com/file/d/16Sx84sfEEuZG22_UcGhCqI54RZfGw782/view?usp=sharing

## Recommendation

We recommend Option B, Multi-AZ, at 61.00 USD a month for the bakery delivery app. Customers place orders and riders look up deliveries at all hours, so an outage means lost sales and bakery orders that are never fulfilled. Multi-AZ keeps a standby copy in a second Availability Zone and fails over automatically, so the app stays up if one zone has a problem. The app mostly writes new orders and reads one order at a time, so its read load is low, and the read replica in Option C costs 78.52 USD without protecting against an outage. Option A is cheapest at 39.26 USD, but one failure would take the whole app offline, so the extra 21.74 USD a month for B is worth paying for a client whose revenue depends on being available.

## Question

Why is a Multi-AZ standby not the same as a read replica?

A Multi-AZ standby is a synchronous copy kept only for failover: it cannot be queried, and AWS promotes it automatically if the primary fails, with the same endpoint. A read replica is an asynchronous copy with its own endpoint that your app can send read queries to in order to spread the load, but it does not fail over automatically and can lag behind the primary. So Multi-AZ protects availability, and a read replica adds read capacity.

## Contribution

| GitHub username | What this groupmate did |
| --- | --- |
| yoonice0393 | created and pushed the sumission.md in github |
| Sdjada | did the aws calculator |
| N0micon18 | created the submission.md |
| birdb3446 | Help create the submission.md |