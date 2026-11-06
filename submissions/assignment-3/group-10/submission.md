# Assignment 3 Submission

<!--
How to use this template:

1. Copy this file to submissions/assignment-3/group-<number>/submission.md
2. Replace every <answer> with your group's answer. Delete the angle brackets too.
3. Write GitHub usernames, not full names or student numbers.
-->

## About us

- Group number: 10
- Section: ACSAD
- Lab 3 client: A print shop order portal

## Three estimates

Asia Pacific (Singapore), MySQL, OnDemand, 100% utilization, RDS Proxy No, Database Insights No.

| Option | Instance | Deployment | Nodes | Storage | Total monthly cost (USD) |
| --- | --- | --- | --- | --- | --- |
| A. Small and cheap | `db.t4g.micro` | Single-AZ | 1 | 20 GB, gp3 | `21.01 USD` |
| B. High availability | `db.t4g.micro` | Multi-AZ | 1   | 20 GB, gp3 | `42.75 USD` |
| C. Read scaling | `db.t4g.micro` | Single-AZ | 2 | 20 GB, gp3 | `42.02 USD` |

Share link of our estimate:

Small and Cheap: https://calculator.aws/#/estimate?id=19a49b2ad508feb905106be157e25e4b707f7a80 

High Availability: https://calculator.aws/#/estimate?id=21a4067ed4a475ac161b3d7b4cd2723c98d19262

Read Scaling: https://calculator.aws/#/estimate?id=67b0ddfe22f9ec0388259d69b51d05b54071efa8

## Recommendation

Five sentences. Which option fits our client, and why? Use the client's users, the cost of downtime for that client, and the read load.

Option B, at USD 42.75 a month, fits the client best. The portal is where customers place orders, so the database must stay available, and downtime means missed orders and late print jobs. Option B keeps a backup copy of the database in a separate location that takes over automatically, which matches the two-location layout of the network design, for USD 21.74 more than Option A. The read load is light, mostly customers checking order status and browsing the catalog, so Option C’s second copy for read traffic adds cost the client doesn’t need. Option A is the cheapest at USD 21.01, but one failure would take the whole portal offline, so B gives the client the most protection for the cost.

## Question

Why is a Multi-AZ standby not the same as a read replica?

A Multi-AZ standby is a synchronous copy that exists only for failover. It takes over automatically if the primary fails but serves no traffic in the meantime. A read replica is an asynchronous copy that serves read queries to take load off the primary, but it doesn’t take over automatically and can lag behind the primary’s latest writes.

## Contribution

| GitHub username | What this groupmate did |
| --- | --- |
| silicon-dioxide | main navigator of the entire calculation process |
| Kwin-Talattad | contributed by answering questions |
| santiagojohncarlop-blip | checked the activity proper |
| jmirandaa12345681 | contributed by answering questions |
