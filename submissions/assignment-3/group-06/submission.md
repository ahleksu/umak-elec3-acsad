# Assignment 3 Submission

## About us

- Group number: 06
- Section: ACSAD
- Lab 3 client: A dental clinic booking app

## Three estimates

Asia Pacific (Singapore), MySQL, OnDemand, 100% utilization, RDS Proxy No, Database Insights No.

| Option | Instance | Deployment | Nodes | Storage | Total monthly cost (USD) |
| --- | --- | --- | --- | --- | ---: |
| A. Small and cheap | `db.t4g.micro` | Single-AZ | 1 | 20 GB gp3 | 21.01 |
| B. High availability | `db.t4g.micro` | Multi-AZ | 1 | 20 GB gp3 | 42.75 |
| C. Read scaling | `db.t4g.micro` | Single-AZ | 2 | 20 GB gp3 per instance | 42.02 |

Share link of our estimate: https://calculator.aws/#/estimate?id=cf56689bce6bb73f6e9f492f0c9e1d765da49714

## Recommendation

Assuming the clinic has a modest number of staff and patients using the app and typical reads that one small instance can handle, Option A is a reasonable low-cost starting point at $21.01 per month. Appointment lookup and booking are important to patients and staff, so downtime could disrupt clinic operations, although the case provides no financial estimate of that impact. If the clinic cannot tolerate even brief service interruptions, Option B at $42.75 per month is preferable because Multi-AZ provides a standby for managed failover. Option C costs $42.02 per month and is useful only if read traffic is high enough to benefit from routing reads to a replica. With no evidence of heavy read load or a stated downtime tolerance, we recommend starting with Option A, monitoring demand, and choosing Option B if availability is more important than the additional cost.

## Question

A Multi-AZ standby is maintained for availability and failover; it does not serve read traffic while it is a standby. A read replica is a separate DB instance that can serve read queries to reduce load on the primary, and it may be promoted separately if needed. Therefore, a standby improves availability, while a read replica supports read scaling; they serve different purposes.

## Contribution

| GitHub username | What this groupmate did |
| --- | --- |
| amagpantaya12345923-gif | Group leader; coordinated the group |
| yellowboeing120 | Game tester and algorithm designer |
| Tlswlgus | Game developer |
| Bewoop | Documentation |
