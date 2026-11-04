# Assignment 3 Submission

<!--
How to use this template:

1. Copy this file to submissions/assignment-3/group-<number>/submission.md
2. Replace every <answer> with your group's answer. Delete the angle brackets too.
3. Write GitHub usernames, not full names or student numbers.
-->

## About us

- Group number: 1
- Section: IV-ACSAD
- Lab 3 client: A school canteen ordering app

## Three estimates

Asia Pacific (Singapore), MySQL, OnDemand, 100% utilization, RDS Proxy No, Database Insights No.

| Option | Instance | Deployment | Nodes | Storage | Total monthly cost (USD) |
| --- | --- | --- | --- | --- | --- |
| A. Small and cheap | `db.t4g.micro` | Single-AZ | 1 | 20 GB, General Purpose SSD (gp3) | 21.01 |
| B. High availability | `db.t4g.micro` | Multi-AZ | 1 | 20 GB, General Purpose SSD (gp3) | 42.75 |
| C. Read scaling | `db.t4g.micro` | Single-AZ | 2, the primary and one read replica | 20 GB, General Purpose SSD (gp3) | 42.02 |

Share link of our estimate: https://calculator.aws/#/estimate?id=d1c26e20da63b498b024b962d239ded4421d40ca

## Recommendation

Five sentences. Which option fits our client, and why? Use the client's users, the cost of downtime for that client, and the read load.

For the client's user, our group choose Option B with High availability at USD 42.75 a month. Students and staff order during short breaks and lunch, so most of the app's traffic arrives in a few busy windows each school day. If the database fails during one of those windows, nobody can order until it recovers, so the canteen loses sales and has to fall back to slow counter orders while students wait in line. Multi-AZ keeps a standby in a second Availability Zone, which matches the private-a and private-b subnets in our Lab 3 plan, and fails over to it automatically, for USD 21.74 more a month than Option A. The read load is mostly menu browsing and order-status checks from one school, which a single db.t4g.micro should handle, so a read replica (Option C) would add cost without fixing the bigger risk, which is downtime.

## Question

Why is a Multi-AZ standby not the same as a read replica?

A Multi-AZ standby is only for failover. RDS copies every write to it synchronously in a second Availability Zone, but the application cannot send queries to it, and it takes over automatically only when the primary fails. A read replica is a separate DB instance that the application can query, so it takes read load off the primary. RDS copies data to it asynchronously, so it can fall a little behind the primary, and it does not take over on its own if the primary fails; someone has to promote it. So Multi-AZ improves availability, and a read replica improves read capacity.

## Contribution

| GitHub username | What this groupmate did |
| --- | --- |
| Jerothegreat | Built the three estimates in the AWS Pricing Calculator. |
| cess-O | Built the three estimates in the AWS Pricing Calculator. |
| Vnslv | Wrote the recommendation. |
| saintschalice | Wrote the answer to the Multi-AZ and read replica question. |
