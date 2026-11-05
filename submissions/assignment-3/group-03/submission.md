# Assignment 3 Submission

<!--
How to use this template:

1. Copy this file to submissions/assignment-3/group-<number>/submission.md
2. Replace every <answer> with your group's answer. Delete the angle brackets too.
3. Write GitHub usernames, not full names or student numbers.
-->

## About us

- Group number: 03
- Section: IV-ACSAD
- Lab 3 client: A jeepney fleet tracking service

## Three estimates

Asia Pacific (Singapore), MySQL, OnDemand, 100% utilization, RDS Proxy No, Database Insights No.

| Option | Instance | Deployment | Nodes | Storage | Total monthly cost (USD) |
| --- | --- | --- | --- | --- | --- |
| A. Small and cheap | db.t4g.micro | Single-AZ | 1 | 20 GB, General Purpose SSD (gp3) | 21.01 |
| B. High availability | db.t4g.micro | Multi-AZ | 1 | 20 GB, gp3 | 42.75 |
| C. Read scaling | db.t4g.micro | Single-AZ | 2, the primary and one read replica | 20 GB, gp3 | 42.02 |

Share link of our estimate: https://calculator.aws/#/estimate?id=ebd00260ef972ca30d059d95044b97009e49bad9

## Recommendation

Five sentences. Which option fits our client, and why? Use the client's users, the cost of downtime for that client, and the read load.

Our group would choose Option B to keep the jeepney tracking service dependable. Fleet operators and dispatchers rely on vehicle locations to coordinate trips. A standby database can take over if the main database fails, helping shorten interruptions. Although Option B costs more than Option A, we believe fewer disruptions justify the extra expense. Option C could help if location searches become heavy, but our current priority is availability.

## Question

Why is a Multi-AZ standby not the same as a read replica?

A Multi-AZ standby is a backup database that automatically takes over if the main database fails, but it does not handle read requests. A read replica handles read requests to reduce the main database’s workload, but its data may be slightly delayed.

## Contribution

| GitHub username | What this groupmate did |
| --- | --- |
| edjjff | Estimated option A, validated other options, generated share link, prepared for submission of pr and google forms |
| johnclefordricafranca | Estimated option B, and gave ideas for recommendation |
| LUZADA-SARAH | Estimated option C, and gave ideas for recommendation |
| reymarttskrt | Provided explanation for the difference of Multi-AZ and read replica | 