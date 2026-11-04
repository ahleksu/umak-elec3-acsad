# Assignment 3 Submission

## About us

- Group number: 5
- Section: IV-ACSAD
- Lab 3 client: A campus library reservation system

## Three estimates

Asia Pacific (Singapore), MySQL, OnDemand, 100% utilization, RDS Proxy No, Database Insights No.

| Option | Instance | Deployment | Nodes | Storage | Total monthly cost (USD) |
| --- | --- | --- | --- | --- | --- |
| A. Small and cheap | db.t4g.micro | Single-AZ | 1 | 20 GB, General Purpose SSD (gp3) | 21.01 |
| B. High availability | db.t4g.micro | Multi-AZ | 1 | 20 GB, General Purpose SSD (gp3) | 42.75 |
| C. Read scaling | db.t4g.micro | Single-AZ | 2 (primary and one read replica) | 20 GB, General Purpose SSD (gp3) | 42.02 |

Share link of our estimate: https://calculator.aws/#/estimate?id=4e42c6e548267c70e19174b66340a898678fb38c

## Recommendation

We recommend Option B, a Multi-AZ db.t4g.micro database, for our campus library reservation system. Our users are students and staff who reserve seats and books at all hours, especially during exam weeks, so an outage would stop them from booking and send them back to paper sign-ups. Downtime costs a library little money, but it hurts trust and creates queues at the desk, and Multi-AZ switches to a standby in another Availability Zone automatically if the primary fails. The read load is modest, mostly students checking availability, so one small instance can serve it and the read replica in Option C would add cost without protecting us from a failure. Option B costs USD 42.75 a month, about double Option A at USD 21.01 and only slightly more than Option C at USD 42.02, so the extra protection against downtime is worth the price.

## Question

Why is a Multi-AZ standby not the same as a read replica?

A Multi-AZ standby is a synchronized copy in a second Availability Zone that exists only for failover: it does not serve queries, and AWS promotes it automatically when the primary fails. A read replica is a separate DB instance that serves read queries to spread the load, but it is not an automatic failover target for high availability.

## Contribution

| GitHub username | What this groupmate did |
| --- | --- |
| MrBep | Built Option A in the AWS Pricing Calculator and recorded its monthly total |
| Rengokunn | Built Option B (Multi-AZ) and recorded its monthly total |
| klienfinity123 | Built Option C (Single-AZ with a read replica), saved the share link, and opened the Pull Request |
| stratterium | Wrote the recommendation and the Multi-AZ vs. read replica answer |
