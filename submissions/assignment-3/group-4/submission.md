# Assignment 3 Submission

<!--
How to use this template:

1. Copy this file to submissions/assignment-3/group-<number>/submission.md
2. Replace every <answer> with your group's answer. Delete the angle brackets too.
3. Write GitHub usernames, not full names or student numbers.
-->

## About us

- Group number: 4
- Section: IV-ACSAD
- Lab 3 client: A sari-sari store point-of-sale chain

## Three estimates

Asia Pacific (Singapore), MySQL, OnDemand, 100% utilization, RDS Proxy No, Database Insights No.

| Option | Instance | Deployment | Nodes | Storage | Total monthly cost (USD) |
| --- | --- | --- | --- | --- | --- |
| A. Small and cheap | `db.t4g.micro` | Single-AZ | 1 | 20 GB, General Purpose SSD (gp3) | 21.01 |
| B. High availability | `db.t4g.micro` | Multi-AZ | 1 | 20 GB, General Purpose SSD (gp3) | 42.75 |
| C. Read scaling | `db.t4g.micro` | Single-AZ | 2, the primary and one read replica | 20 GB, General Purpose SSD (gp3) | 42.02 |

Share link of our estimate: https://calculator.aws/#/estimate?id=1ddb0fbd06180184ebb8e3667bac7f9d4fd76e3d

## Recommendation

Five sentences. Which option fits our client, and why? Use the client's users, the cost of downtime for that client, and the read load.

We recommend Option B (High availability at USD 42.75 per month) for our Lab 3 client, a sari-sari store point-of-sale chain. The system's users are store cashiers, branch attendants, and store owners across multiple neighborhood locations who rely on the app throughout the day to ring up customer purchases and track inventory. Downtime is costly for this retail chain because a database outage stops checkout terminals across all branches from processing sales or checking stock, leading to lost transactions, customer delays, and error-prone manual paper logging. Option B's Multi-AZ deployment protects the chain against outages by keeping a standby database in a second Availability Zone (matching the `private-a` and `private-b` subnets in our Lab 3 VPC plan) and failing over automatically for just USD 21.74 more per month than Option A. Because a point-of-sale workload consists mainly of lightweight price lookups and frequent write transactions rather than heavy read queries, a single `db.t4g.micro` primary can easily handle the read load, making Option B far more useful than Option C's read replica at USD 42.02.

## Question

Why is a Multi-AZ standby not the same as a read replica?

A Multi-AZ standby is a synchronously replicated backup instance in a second Availability Zone that exists strictly for high availability and automatic failover; it cannot accept read queries from the application. In contrast, a read replica is an asynchronously replicated DB instance with its own endpoint that actively serves read-only traffic to offload the primary database, but it does not automatically fail over if the primary fails. In short, a Multi-AZ standby protects against downtime, while a read replica scales read capacity.

## Contribution

| GitHub username | What this groupmate did |
| --- | --- |
| chupapichuros | Configured the three RDS for MySQL estimates in the AWS Pricing Calculator, generated the share link, and prepared the submission file. |
| EvapeGT | Verified the calculator settings and monthly totals for Options A, B, and C against the assignment requirements. |
| Note-Program | Drafted the five-sentence client recommendation for the sari-sari store point-of-sale chain. |
| Steeshesh | Wrote and reviewed the explanation comparing a Multi-AZ standby and a read replica. |

