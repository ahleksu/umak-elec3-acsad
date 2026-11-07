# Assignment 3 Submission

<!--
How to use this template:

1. Copy this file to submissions/assignment-3/group-<number>/submission.md
2. Replace every <answer> with your group's answer. Delete the angle brackets too.
3. Write GitHub usernames, not full names or student numbers.
-->

## About us

- Group number: 2
- Section: 4-ACSAD
- Lab 3 client: Barangay Health Center

## Three estimates

Asia Pacific (Singapore), MySQL, OnDemand, 100% utilization, RDS Proxy No, Database Insights No.

| Option | Instance | Deployment | Nodes | Storage | Total monthly cost (USD) |
| --- | --- | --- | --- | --- | --- |
| A. Small and cheap | db.t4g.micro | Single-AZ | 1 | 20GB, gp3 | 20.01 |
| B. High availability | db.t4g.micro | Multi-AZ | 1 | 20GB, gp3 | 42.75 |
| C. Read scaling | db.t4g.micro | Single-AZ | 2 | 20GB, gp3 | 42.02 |

Share link of our estimate: https://calculator.aws/#/estimate?id=01e78c6c502f499840ef4f5b8aead748fa2dbc0a

## Recommendation

Five sentences. Which option fits our client, and why? Use the client's users, the cost of downtime for that client, and the read load.

For our Lab 3 client, Barangay Health Center, we recommend Option B (High Availability) using a Multi-AZ db.t4g.micro deployment. The application serves thousands of concurrent users who depend on uninterrupted uptime during operational hours. Because any unexpected database downtime results in immediate financial loss and disrupted user transactions, high availability is critical. Although the overall read load is moderate and does not require dedicated read replicas, having a passive standby in a second zone guarantees automatic failover. At approximately $42.02 per month, Option B justifies its cost by safeguarding business continuity and eliminating single points of failure.

## Question

Why is a Multi-AZ standby not the same as a read replica?

Multi-AZ only has two Availability Zones. It provides higher availability because if one Availability Zone fails, it utilizes the other one. However, the standby is not intended to handle regular read requests, while a read replica, on the other hand, is designed to improve read performance by allowing additional database instances to handle read queries.

## Contribution

| GitHub username | What this groupmate did |
| --- | --- |
| shinu-syr | navigated the the whole process, and contributed to answering the questions |
| eyakmwamwa | contributed by answering questions and assisted in navigating the process |
| carlcawas | the main navigator and contributed to answering the questions |
| mik4rin | assisted by doublechecking the navigated process if everything aligns and contributed with answering the question |


